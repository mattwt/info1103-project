<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 

<html>
<head>
<title>vendors</title>
</head>

<body>

find a vendor by name
<FORM action="vendor.jsp" method="get">
vendor name:<input type="text" name="name" value=""><br>
<input type="submit" value="Submit">
</form>
 <% 
			String name = request.getParameter("name");
			
			
				
			Class.forName("com.mysql.jdbc.Driver");
			
			java.sql.PreparedStatement stmt = null;
			
			
			if (name!=null)
				{
				
				if(name!="")
			{	
			
			 try
		 {
									
			String statement = "select * from vendors where name = ?";	
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
			stmt = conn.prepareStatement(statement);
			stmt.setString(1, name);
							
				ResultSet results = stmt.executeQuery();
				
                 int i = 1;           
				while (results.next()){			  
			  %>
			  
			  <table border = "1">
			  <TR>
					
					<TH>Name</TH>
					<TH>product</TH>
					<TH>price</TH>
					<TH>phone</TH>
					<TH>address</TH>
					<TH>email</TH>
				</TR>
			<TR>
					<TD> <%= results.getString(i) %> </TD>
					<TD> <%= results.getString(i+1) %> </TD>
					<TD> <%= results.getString(i+2) %> </TD>
					<TD> <%= results.getString(i+3) %> </TD>
					<TD> <%= results.getString(i+4) %> </TD>
					<TD> <%= results.getString(i+5) %> </TD>
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
		
		find a vendor by product
<FORM action="vendor.jsp" method="get">
product name:<input type="text" name="product" value=""><br>
<input type="submit" value="Enter">
</form>
 <% 
			String product = request.getParameter("product");
			
			
				
			Class.forName("com.mysql.jdbc.Driver");
			
			java.sql.PreparedStatement stmts = null;
			
			
			if (product!=null)
				{
				
				if(product!="")
			{	
			
			 try
		 {
									
			String statements = "select * from vendors where product = ?";	
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
			stmts = conn.prepareStatement(statements);
			stmts.setString(1, product);
							
				ResultSet result = stmts.executeQuery();
				
                 int i = 1;           
				while (result.next()){			  
			  %>
			  
			  <table border = "1">
			  <TR>
					
					<TH>Name</TH>
					<TH>product</TH>
					<TH>price</TH>
					<TH>phone</TH>
					<TH>address</TH>
					<TH>email</TH>
				</TR>
			<TR>
					<TD> <%= result.getString(i) %> </TD>
					<TD> <%= result.getString(i+1) %> </TD>
					<TD> <%= result.getString(i+2) %> </TD>
					<TD> <%= result.getString(i+3) %> </TD>
					<TD> <%= result.getString(i+4) %> </TD>
					<TD> <%= result.getString(i+5) %> </TD>
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
		
		
		</body>
		</html>