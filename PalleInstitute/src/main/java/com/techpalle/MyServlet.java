package com.techpalle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techpalle.bean.Student;
import com.techpalle.bean.User;
import com.techpalle.model.Dao;

@WebServlet("/")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = request.getServletPath();
		switch(path) {
		case "/reg":registerUser(request,response);
			break;
		case "/log": validateUser(request,response);
			break;
		case "/studenthome":
			String action = request.getParameter("action");
			switch(action) {
			case "Add Student": addStudent(request,response);
				break;
			case "Display": displayStudentData(request,response);
				break;
			case "Update": updateStudentData(request,response);
				break;
			case "Delete": deleteStudent(request,response);
				break;		
			}
			break;
		case "/savestudent": saveStudentDetails(request,response);
			break;
		case "/showstudentdatatoupdate": showStudentDataToUpdate(request,response);
			break;
		case "/updatestudentdata": updatestudentdata(request,response);
			break;
		case "/studentdatadelete": studentDataToDelete(request,response);
		break;
		}
	}
	

	private void studentDataToDelete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String mobileStr = request.getParameter("txtMobile");

	    if (mobileStr == null || mobileStr.trim().isEmpty()) {
	        request.setAttribute("message", "Please enter a valid mobile number.");
	        RequestDispatcher rd = request.getRequestDispatcher("Delete.jsp");
	        try {
	            rd.forward(request, response);
	        } catch (ServletException | IOException e) {
	            e.printStackTrace();
	        }
	        return;
	    }

	    try {
	        Long mobile = Long.parseLong(mobileStr);
	        Student s = new Student(mobile);
	        Dao d = new Dao();
	        Student s1 = d.deleteData(s);  // Assuming deleteData returns a Student object

	        if (s1 != null) {
	            request.setAttribute("message", "Student data deleted successfully.");
	        } else {
	            request.setAttribute("message", "Invalid mobile number. No student found.");
	        }

	        RequestDispatcher rd = request.getRequestDispatcher("Delete.jsp");
	        rd.forward(request, response);

	    } catch (NumberFormatException e) {
	        request.setAttribute("message", "Invalid mobile number format.");
	        RequestDispatcher rd = request.getRequestDispatcher("Delete.jsp");
	        try {
	            rd.forward(request, response);
	        } catch (ServletException | IOException ex) {
	            ex.printStackTrace();
	        }
	    } catch (ServletException | IOException e) {
	        e.printStackTrace();
	    }
		
	}
	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			response.sendRedirect("Delete.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void updatestudentdata(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("txtName");
		int age = Integer.parseInt(request.getParameter("txtAge"));
		long mobile = Long.parseLong(request.getParameter("txtMobile"));
		String address = request.getParameter("txtAddress");
		String email = request.getParameter("txtEmail");
		String course = request.getParameter("txtCourse");
		Student s = new Student(name, age, mobile, address, email, course);
		Dao d = new Dao();
		d.updateStudentData(s);
		request.setAttribute("message", "Updated Successfully");
		RequestDispatcher rd = request.getRequestDispatcher("Update.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void showStudentDataToUpdate(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		long mobile = Long.parseLong(request.getParameter("txtMobile"));
		Student s = new Student(mobile);
		Dao d = new Dao();
		Student s1 = d.showDataToUpdate(s);
		if(s1!=null) {
		request.setAttribute("student data", s1);
		RequestDispatcher rd = request.getRequestDispatcher("Update.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else {
			request.setAttribute("student data", "Invalid mobile Number");
			RequestDispatcher rd = request.getRequestDispatcher("Update.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	private void updateStudentData(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			response.sendRedirect("Update.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void displayStudentData(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		Dao d = new Dao();
		d.getData();
		ArrayList<Student> alist = d.getData();
		request.setAttribute("student list", alist);
		RequestDispatcher rd = request.getRequestDispatcher("Display.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void saveStudentDetails(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("txtName");
		int age = Integer.parseInt(request.getParameter("txtAge"));
		long mobile = Long.parseLong(request.getParameter("txtMobile"));
		String address = request.getParameter("txtAddress");
		String email = request.getParameter("txtEmail");
		String course = request.getParameter("txtCourse");
		Student s = new Student(name,age,mobile,address,email,course);
		Dao d = new Dao();
		boolean isDataPresent = d.insertStudent(s);
		if(isDataPresent) {
			request.setAttribute("message", "Mobile number or email is already exist");
			RequestDispatcher rd = request.getRequestDispatcher("StudentForm.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(!isDataPresent) {
			try {
				response.sendRedirect("StudentForm.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
				
		
		
	}
	private void addStudent(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			response.sendRedirect("StudentForm.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void validateUser(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String username = request.getParameter("txtUserName");
		String password = request.getParameter("txtPassword");
		User u = new User(username,password);
		Dao d = new Dao();
		boolean isDataPresent = d.validUser(u);
		if(isDataPresent) {
			try {
				response.sendRedirect("Home.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			request.setAttribute("message", "User doesnot exist");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}		
	}
	private void registerUser(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("txtName");
		String email = request.getParameter("txtEmail");
		String password = request.getParameter("txtPassword");
		User u = new User(name,email,password);
		Dao d = new Dao();
		boolean isDataInserted = d.insert(u);
		response.setContentType("text/html");
		PrintWriter out;
		try {
			out = response.getWriter();
			if(isDataInserted) {				
				response.sendRedirect("Login.jsp");			
			}
			else {
				request.setAttribute("message", "Email id is already exist");
				RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
}
