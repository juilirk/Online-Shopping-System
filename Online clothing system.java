package com.services;

import java.sql.*;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import commons.Initializer;

import java.util.Properties;


import java.lang.String;

public class DatabaseService {

    public static Connection conn;
    
	//Email Acount Details****************************
    static String SMTP_HOST_NAME = "smtp.gmail.com";
    static int SMTP_HOST_PORT = 465;
    static String SMTP_AUTH_USER = "florists.app@gmail.com"; //email id of sender
	static String SMTP_AUTH_PWD  = "florists@123";//password of sender
    //************************************************
   
	static String PROJECT_PATH = "E:/ProjectWorkspace/OnlineClothStore/";
	static String DRIVER="com.mysql.jdbc.Driver";
	static String CONNECTION_URL="jdbc:mysql://localhost:3306/cloth_store_db";
	static String USERNAME="root";
	static String PASSWORD="root";
	
	static {
		try {
            Initializer.initializeResources(PROJECT_PATH, DRIVER, CONNECTION_URL, USERNAME, PASSWORD);
			conn = Initializer.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
	  }
	
    public static int exeDML(String sql)
	{
		int d=0;
		try
		{
			Statement st=conn.createStatement();
			d=st.executeUpdate(sql);
		
		}
		catch(Exception e)
		{
			System.out.println("Excute DML Error");
			e.printStackTrace();
		}
		
		return d;
	}
	
	public static ResultSet getData(String sql)
	{
	
		ResultSet rs=null;
		Statement st;
		try
		{
			st=conn.createStatement();
			rs=st.executeQuery(sql);
		}
		catch(Exception e)
		{
			System.out.println("Excute rs Error");
			e.printStackTrace();
		}
		
		return rs;
	}
    
    
    /**
     * Method to insert a new user into database
     *
     * @param username
     * @param password
     * @param firstName
     * @param lastName
     * @param email
      * @return
     * @throws SQLException
     */
    public boolean registerUser(String id, String username, String password, String firstName, String lastName, String email, String contact) throws SQLException {
        boolean result = false;
        PreparedStatement pstmt = conn.prepareStatement("insert into user(user_id,username,password,first_name,last_name,email,contact) values(?,?,?,?,?,?,?)");
        pstmt.setString(1, id);
        pstmt.setString(2, username);
        pstmt.setString(3, password);
        pstmt.setString(4, firstName);
        pstmt.setString(5, lastName);
        pstmt.setString(6, email);
        pstmt.setString(7, contact);
      
        if (pstmt.executeUpdate() == 1) {
            result = true;
        }
        pstmt.close();

        return result;
    }

    /**
     * Method to validate if username already exists or not.
     *
     * @param username
     * @return
     */
    public boolean validUserName(String username) {
        boolean result = false;
        Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select username from user";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                if (username.equals(rset.getString("username"))) {
                    result = true;
                    break;
                }
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * Method to check login credentials of user
     *
     * @param username
     * @param password
     * @return
     */
    public boolean validateUser(String username, String password,String role) {
        boolean result = false;
        Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select username,password from student where role='"+role+"'";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                if ((username.equals(rset.getString("username"))) && (password.equals(rset.getString("password")))) {
                    result = true;
                    break;
                }
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public static String getNextId(String columnName, String tableName) {
        String result = "";
        Statement stmt;
        try {
            stmt = conn.createStatement();
            String sql = "select MAX("+columnName+")+1 from "+tableName+"";
            System.out.println(sql);
            //ResultSet rset = DatabaseService.getData(sql);
            ResultSet rset = stmt.executeQuery(sql);
    		if(rset.next())
    		{
    			result=rset.getString(1);
    		}
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


	public static String getUserId(String username) {
		// TODO Auto-generated method stub
		String user_id=null;
		Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select id from user where username='"+username+"'";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                	user_id = rset.getString("id");
                    break;
                }
        
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
		return user_id;
	}
	

	public static void sendEmail(String subject,String mssg,String emailid)
	{
		try
		{
		  Properties props = new Properties();
		
		  props.put("mail.transport.protocol", "smtps");
		  props.put("mail.smtps.host", SMTP_HOST_NAME);
		  props.put("mail.smtps.auth", "true");
		  props.put("mail.smtps.quitwait", "false");
		
		  Session mailSession = Session.getDefaultInstance(props);
		  mailSession.setDebug(true);
		  Transport transport = mailSession.getTransport();
		
		  MimeMessage message = new MimeMessage(mailSession);
		  message.setSubject(subject);
		  message.setContent(mssg, "text/plain");
		
		  message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));
		
		  transport.connect(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);
		
		  transport.sendMessage(message,message.getRecipients(Message.RecipientType.TO));
		  transport.close();
	  
		}
		catch(Exception ert)
		{
			System.out.println("\n Email Sending Error\n ");
			ert.printStackTrace();
		}
	}


	public static Integer resetPassword(String user_id, String newPassword) {
		// TODO Auto-generated method stub
		int result = 0;
		String sql = "update user set password='"+newPassword+"' where id="+user_id+"";
		System.out.println(sql);
		result = DatabaseService.exeDML(sql);
		
		return result;
	}


	public static String getEmail(String username) {
		// TODO Auto-generated method stub
		String email=null;
		Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select email from user where username='"+username+"'";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                	email = rset.getString("email");
                    break;
                }
        
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
		return email;
	}
	
	public static String getCategoryName(int category_id) {
		// TODO Auto-generated method stub
		String name=null;
		Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select category_name from category where category_id="+category_id+" ";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                	name = rset.getString("category_name");
                    break;
                }
        
        stmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
		return name;
	}


	public boolean validateUser(String username, String password) {
		// TODO Auto-generated method stub
		boolean result = false;
        Statement stmt;
        try {
            stmt = conn.createStatement();

            String strSelect = "select user_id,username,password from user";
            ResultSet rset = stmt.executeQuery(strSelect);
            while (rset.next()) {
                if ((username.equals(rset.getString("username"))) && (password.equals(rset.getString("password")))) {
                    result = true;
                    break;
                }
            }
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
	}
}
