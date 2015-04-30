<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 

<html>
<head>
<title>products</title>
</head>

<body>
<FORM action="products.jsp" method="get">
product name:<input type="text" name="name" value=""><br>
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
									
			String statement = "select * from product where product = ?";	
			java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
			stmt = conn.prepareStatement(statement);
			stmt.setString(1, name);
							
				ResultSet results = stmt.executeQuery();
				
                 int i = 1;           
				while (results.next()){			  
			  %>
			  
			  <table border = "1">
			  <TR>
					
					<TH>ID</TH>
					<TH>Price</TH>
					<TH>Product</TH>
					<TH>amount</TH>
					<TH>rental_id</TH>
					<TH>rented</TH>
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
		
		Change sale name
<FORM action="products.jsp" method="get">
price: <input type="text" name="price" value=""><br>
ID: <input type="text" name="ID" value=""><br>
<input type="submit" value="Enter">
</form>
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String price = request.getParameter("price");
	String ID = request.getParameter("ID");
	java.sql.PreparedStatement state = null;
	Integer updateQuery =0;
	
	if (price!=null && ID != null){
		if (price!="" && ID != ""){
	
try{


	 
	String update = "update product set price = ? where ID = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	state = conn.prepareStatement(update);
	state.setString(1, price);
	state.setString(2, ID);

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
		
		Change product amount
<FORM action="products.jsp" method="get">
amount: <input type="text" name="amount" value=""><br>
ID: <input type="text" name="ID" value=""><br>
<input type="submit" value="Do It">
</form>
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String amount = request.getParameter("price");
	String ID1 = request.getParameter("ID");
	java.sql.PreparedStatement statem = null;
	Integer updateQuery1 =0;
	
	if (amount!=null && ID1 != null){
		if (amount!="" && ID1 != ""){
	
try{


	 
	String update1 = "update product set amount = ? where ID = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	statem = conn.prepareStatement(update1);
	statem.setString(1, amount);
	statem.setString(2, ID1);

		updateQuery1 = statem.executeUpdate();
                            
							if (updateQuery1 != 0) { 
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


<a href="http://localhost:8080/vendor.jsp">out of a product? contact the vendor!</a>
</body>

</html>