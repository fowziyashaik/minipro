<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New User Registration</title>
</head>
<body>
    <%
    String usertype=request.getParameter("usertype");
    String userid=request.getParameter("userid");
    String fullname=request.getParameter("fullname");
    String gender=request.getParameter("gender");
    String email=request.getParameter("emailid");
    String grievancemsg=request.getParameter("grievance");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=null;
        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","admin");
        if(conn==null){
            out.print("Connection Error");
        }else{
            String query="INSERT INTO grievance VALUES(NULL,?,?,?,?,?,?);";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1,usertype);
            ps.setString(2,userid);
            ps.setString(3,fullname);
            ps.setString(4,gender);
            ps.setString(5,email);
            ps.setString(6,grievancemsg);
            ps.executeUpdate();
            ps.close();
            conn.close();
            response.sendRedirect("home.html");
        }
        }
    
        catch(Exception e){
            out.print("Error: "+e.getMessage());
        }    
        
        %>
</body>
</html>