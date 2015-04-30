<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<html>
   <head>
      <title>Employee Page</title>
   </head>
   <body>
   
	<FORM action="employeepage.jsp" method="get">
	ID :<input type="text" name="ID" value=""><br>
	
	<input type="submit" value="Submit">
	
		
</FORM>

      <% 
			String ID = request.getParameter("ID");
			
			
				
			Class.forName("com.mysql.jdbc.Driver");
			
			java.sql.PreparedStatement stmt = null;
			
			
			if (ID!=null)
				{
				
				if(ID!="")
			{	
			
			 try
		 {
									
			String statement = "select * from employee where ID = ?";	
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
			stmt = conn.prepareStatement(statement);
			stmt.setString(1, ID);
							
				ResultSet results = stmt.executeQuery();
				
                 int i = 1;           
				while (results.next()){			  
			  %>
                 <table border  ="1">
			<TR>
					<TH>ID</TH>
					<TH>first_name</TH>
					<TH>last_name</TH>
					<TH>hire_date</TH>
					<TH>left_date</TH>
					<TH>title</TH>
					<TH>email</TH>
			</TR>		
				 
			<TR>
					<TD> <%= results.getString(i) %> </TD>
					<TD> <%= results.getString(i+1) %> </TD>
					<TD> <%= results.getString(i+2) %> </TD>
					<TD> <%= results.getString(i+3) %> </TD>
					<TD> <%= results.getString(i+4) %> </TD>
					<TD> <%= results.getString(i+5) %> </TD>
					<TD> <%= results.getString(i+6) %> </TD>
		    </TR>
				</table>
		  
              <%
			  }//end while
			
		} //end try
		
		
		
		catch(Exception e)
			{
			%>
				<font size="+2" color="red"></b>	
				<p>We have some sort of problem.  Aborting mission.</p>
				
			<%
			
			}//end catch
			
			}//end if
			
				}//end if
		
		%>	
		
		<FORM action="employeepage.jsp" method="get">
	ID :<input type="text" name="ID1" value=""><br>
	title :<input type="text" name="title" value=""><br>
	
	Left Date :<input type="date" name="left_date" value =""><br>
	<input type="Submit" value="Update">
	
	</FORM>	  
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String ID1 = request.getParameter("ID1");
	String title = request.getParameter("title");
	
	String left_date = request.getParameter("left_date");
	java.sql.PreparedStatement state = null;
	Integer updateQuery =0;
	
	if (ID1!=null && title!=null && left_date!=null){
		if (ID1!="" && title!="" && left_date!=""){
	
try{


	 
	String update = "update employee set title = ?, left_date = ? where ID = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	state = conn.prepareStatement(update);
	state.setString(1, title);
	state.setString(2, left_date);
	state.setString(3, ID1);
	

		updateQuery = state.executeUpdate();
                            
							if (updateQuery != 0) { 
			  %>
                   <br>
                   <TABLE style="background-color: #E3E4FA;" 
                   WIDTH="30%" border="1">
                      <tr><th>Data is inserted successfully 
                    in database.</th></tr>
                   </table>
				   <%
				   }//end if
				   }//end try
				   catch(Exception e)
			{
			%>
				<font size="+2" color="red"></b>	
				<p>We have some sort of problem.  Aborting mission.</p>
			<%
			}//end catch
				   }//end if 
				   }//end if
				   
			
		
		
		%>
		<a href="http://localhost:8080/employeesale.jsp">edit the sales here.</a>
		<a href="http://localhost:8080/products.jsp">edit the products here.</a>
			</body>
</html>