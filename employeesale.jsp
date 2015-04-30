<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>edit sales/deals</title>
</head>

<body>
Find a sale
<FORM action="employeesale.jsp" method="get">
sale name:<input type="text" name="name" value=""><br>
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
									
			String statement = "select * from sales_deals where event_name = ?";	
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
					<TH>Name</TH>
					<TH>start</TH>
					<TH>end</TH>
					<TH>product</TH>
					
				</TR>
			<TR>
					<TD> <%= results.getString(i) %> </TD>
					<TD> <%= results.getString(i+1) %> </TD>
					<TD> <%= results.getString(i+2) %> </TD>
					<TD> <%= results.getString(i+3) %> </TD>
					<TD> <%= results.getString(i+4) %> </TD>
					
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
<FORM action="employeesale.jsp" method="get">
name: <input type="text" name="salename" value=""><br>
ID: <input type="text" name="ID" value=""><br>
<input type="submit" value="Enter">
</form>
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String salename = request.getParameter("salename");
	String ID = request.getParameter("ID");
	java.sql.PreparedStatement state = null;
	Integer updateQuery =0;
	
	if (salename!=null && ID != null){
		if (salename!="" && ID != ""){
	
try{


	 
	String update = "update sales_deals set event_name = ? where event_id = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	state = conn.prepareStatement(update);
	state.setString(1, salename);
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
change sale start date
<FORM action="employeesale.jsp" method="get">
 Start Date: <input type="date" name="start" value=""><br>
 ID: <input type="text" name="ID" value=""><br>
<input type="submit" value="Go">
</form>

<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String start = request.getParameter("start");
	String ID1= request.getParameter("ID");
	java.sql.PreparedStatement statem = null;
	Integer updateQuery1 =0;
	
	if (start!=null && ID1 != null){
		if (start!="" && ID1 != ""){
	
try{


	 
	String update1 = "update sales_deals set start_date = ? where event_id = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	statem = conn.prepareStatement(update1);
	statem.setString(1, start);
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

change sale end date
<FORM action="employeesale.jsp" method="get">
End Date: <input type="date" name="ends" value=""><br>
ID: <input type="text" name="ID" value=""><br>
<input type="submit" value="Do it">
</form>
<%	

Class.forName("com.mysql.jdbc.Driver");
	
			
	String ends = request.getParameter("ends");
	String ID2= request.getParameter("ID");
	java.sql.PreparedStatement stateme = null;
	Integer updateQuery2 =0;
	
	if (ends!=null && ID2 != null){
		if (ends!="" && ID2 != ""){
	
try{


	 
	String update2 = "update sales_deals set end_date = ? where event_id = ?";
	
	java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
	
	stateme = conn.prepareStatement(update2);
	stateme.setString(1, ends);
	stateme.setString(2, ID);

		updateQuery2 = stateme.executeUpdate();
                            
							if (updateQuery2 != 0) { 
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

</body>

</html>