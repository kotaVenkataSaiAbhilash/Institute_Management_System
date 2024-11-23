package com.techpalle.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.techpalle.bean.Student;
import com.techpalle.bean.User;

public class Dao {
	String driverClass = "com.mysql.cj.jdbc.Driver";
	Connection con = null;
	PreparedStatement ps = null;
	Statement st = null;
	String url = "jdbc:mysql://localhost:3306/PalleInstitute";
	String user = "root";
	String password ="1533475@Abhi";
	String insertQuery = "insert into user(name,email,password) values (?,?,?);";
	String tableData = "select*from user;";
	String studentTableData="select*from student;";
	String insertStudentData = "insert into student(name,age,mobile,address,email,course) values(?,?,?,?,?,?);";
	boolean isDataInserted = true;
	public boolean insert(User u) {
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url,user,password);
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from user;");
			while(rs.next()) {
				if(u.getEmail().equals(rs.getString("email"))) {
					isDataInserted = false;
					break;
				}
			}
			if(isDataInserted==true) {
				ps = con.prepareStatement(insertQuery);
				ps.setString(1,u.getName());
				ps.setString(2,u.getEmail());
				ps.setString(3,u.getPassword());
				ps.executeUpdate();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}try {
				
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return isDataInserted;
	}
	public boolean validUser(User u) {
		boolean isDataPresent=false;
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url,user,password);
			st = con.createStatement();
			st.executeQuery(tableData);
			ResultSet rs = st.executeQuery(tableData);
			while(rs.next()) {
				if(u.getEmail().equals(rs.getString("email"))&& u.getPassword().equals(rs.getString("password"))) {
					isDataPresent = true;
					break;
					
				}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isDataPresent;
	}
	public boolean insertStudent(Student s) {
		boolean isDataPresent=false;
		// TODO Auto-generated method stub
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url,user,password);
			st = con.createStatement();
			ResultSet rs = st.executeQuery(studentTableData);
			while(rs.next()) {
				if(rs.getLong("mobile")==s.getMobile()|| rs.getString("email").equals(s.getEmail())) {
					isDataPresent=true;
					break;
					
				}
			}
			if(!isDataPresent) {
				ps = con.prepareStatement(insertStudentData);
				ps.setString(1, s.getName());
				ps.setInt(2,s.getAge());
				ps.setLong(3,s.getMobile());
				ps.setString(4,s.getAddress());
				ps.setString(5,s.getEmail());
				ps.setString(6,s.getCourse());
				ps.executeUpdate();
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isDataPresent;
		
		
	}
	public ArrayList<Student> getData() {
		// TODO Auto-generated method stub
		ArrayList<Student> al = new ArrayList<Student>();
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url,user,password);
			st=con.createStatement();
			ResultSet rs = st.executeQuery("select*from student;");
			while(rs.next()) {
				int sid = rs.getInt("sid");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				long mobile = rs.getLong("mobile");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String course = rs.getString("course");
				Student s = new Student(sid, name, age, mobile, address, email, course);	
				al.add(s);						
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		
	}
	public Student showDataToUpdate(Student s1) {
		// TODO Auto-generated method stub
		Student s = null;
		try {
			Class.forName(driverClass);
			con = DriverManager.getConnection(url,user,password);
			ps = con.prepareStatement("select * from student where mobile = ?;");
			ps.setLong(1, s1.getMobile());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				int age=rs.getInt("age");
				long mobile = rs.getLong("mobile");
				String address = rs.getString("address");
				String email = rs.getString("email");
				String course = rs.getString("course");
				s = new Student(name, age, mobile, address, email, course);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
		
		
	}
	public void updateStudentData(Student s) {
		// TODO Auto-generated method stub
		try {
			Class.forName(driverClass);
			con=DriverManager.getConnection(url, user, password);
			ps = con.prepareStatement("update student set name = ?, age = ?, mobile=?,address=?,email=?, course=? where mobile=?");
			ps.setString(1, s.getName());
			ps.setInt(2, s.getAge());
			ps.setLong(3, s.getMobile());
			ps.setString(4, s.getAddress());
			ps.setString(5, s.getEmail());
			ps.setString(6, s.getCourse());
			ps.setLong(7, s.getMobile());
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public Student deleteData(Student s) {
		try {
	        Class.forName(driverClass);
	        con = DriverManager.getConnection(url, user, password);
	        ps = con.prepareStatement("DELETE FROM student WHERE mobile = ?");
	        ps.setLong(1, s.getMobile());
	        ps.executeUpdate();
	        
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return s;
	}


}
