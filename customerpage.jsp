<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<html>
   <head>
      <title>Customer Page</title>
   </head>
   <body>
   
	<FORM action="customerpage.jsp" method="get">
	email :<input type="text" name="email" value=""><br>
	
	<input type="submit" value="Submit">
	
		
</FORM>

      <% 
			String email = request.getParameter("email");
			
			
				
			Class.forName("com.mysql.jdbc.Driver");
			
			java.sql.PreparedStatement stmt = null;
			
			
			if (email!=null)
				{
				
				if(email!="")
			{	
			
			 try
		 {
									
			String statement = "select * from customers where email1 = ?";	
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
			stmt = conn.prepareStatement(statement);
			stmt.setString(1, email);
							
				ResultSet results = stmt.executeQuery();
				
                 int i = 1;           
				while (results.next()){			  
			  %>
                 <table border  ="1">
				 <TR>
					
					<TH>first_name</TH>
					<TH>last_name</TH>
					<TH>email</TH>
					<TH>alt email</TH>
					<TH>phone #</TH>
					<TH>alt phone #</TH>
					<TH>date of last purchase</TH>
					<TH># of rentals</TH>
			</TR>
			
			<TR>
					<TD> <%= results.getString(i) %> </TD>
					<TD> <%= results.getString(i+1) %> </TD>
					<TD> <%= results.getString(i+2) %> </TD>
					<TD> <%= results.getString(i+3) %> </TD>
					<TD> <%= results.getString(i+4) %> </TD>
					<TD> <%= results.getString(i+5) %> </TD>
					<TD> <%= results.getString(i+6) %> </TD>
					<TD> <%= results.getString(i+7) %> </TD>
		    </TR>
				</table>
		 <% %>  
		 
	
	
	
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
		
		
		<FORM action="customerpage.jsp" method="get">
	email :<input type="text" name="email" value=""><br>
	alt_email :<input type="text" name="email2" value=""><br>
	phone : <input type="text" name="phone1" value=""><br>
	alt_phone :<input type="text" name="phone2" value =""><br>
	<input type="Submit" value="Update">
	
	</FORM>	  
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String email1 = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	java.sql.PreparedStatement state = null;
	Integer updateQuery =0;
	
	if (email1!=null && email2!=null && phone1!=null && phone2!=null){
		if (email1!="" && email2!="" && phone1!="" && phone2!=""){
	
try{


	 
	String update = "update customers set email2 = ?, phone_number1 = ?, phone_number2 = ? where email1 = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	state = conn.prepareStatement(update);
	state.setString(1, email2);
	state.setString(2, phone1);
	state.setString(3, phone2);
	state.setString(4, email);

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
		<a href="http://localhost:8080/sales_deals.jsp">check out the deals page!</a>
		<a href="http://localhost:8080/cusproducts.jsp">here's what we have available</a>
		
			</body>
</html>