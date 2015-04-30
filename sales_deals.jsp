<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<html>
   <head>
      <title>deals/sales</title>
   </head>
   <body>
   Currently Active sales
	<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtait", "root", "");
		java.sql.Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select event_name, start_date from sales_deals where end_date is null;");
		ResultSetMetaData rsmd = rs.getMetaData();
			int columns = rsmd.getColumnCount();
			%><table>
			   <tr>
			<%		
         	for(int i = 1; i <= columns; i++)
            {
		%>
				<th><%=rsmd.getColumnLabel(i) + "" %></th>
		<%
			}
		%>	
			</tr>
		<%
			rs.beforeFirst();
			
			%>	
			</p>
			<%
			while(rs.next())
			{
		%>
			<tr>
		<%
				for(int i = 1; i <= columns; i++)
				{
		%>
				<td><%=rs.getString(i) + ""%></td>
		<%
				}
		%>
			</tr>
	<%
				}
		} 
		catch(Exception e)
		{
			%>
				<font size="+2" color="red"></b>	
				<p>We have some sort of problem.  Aborting mission.</p>
			<%
		}
		%>
	
				   </body>
</html>