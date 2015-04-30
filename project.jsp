<%@page language="java" import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<html>
   <head>
      <title>Long & McQuade</title>
   </head>
   	
</form>
   <body>
   <script type = "text/javascript">

// Note: Like all Javascript password scripts, this is hopelessly insecure as the user can see 
//the valid usernames/passwords and the redirect url simply with View Source.  
// And the user can obtain another three tries simply by refreshing the page.  


var count = 2;
function validate() {
var un = document.myform.username.value;
var pw = document.myform.pword.value;
var validc = false;

var unArrayc = ["Philip", "George", "Sarah", "Michael", "mtait"];  // as many as you like - no comma after final entry
var pwArrayc = ["Password1", "Password2", "Password3", "Password4", "gr3h2"];  // the corresponding passwords;

var unArraye = ["Matt"];
var pwArraye = ["gr3h2"];






for (var i=0; i <unArrayc.length; i++) {
if ((un == unArrayc[i]) && (pw == pwArrayc[i])) {
validc = true;
break;
}
}

if (validc) {
alert ("Login was successful");
window.location = "http://localhost:8080/customerpage.jsp";
return false;
}

for (var i=0; i <unArraye.length; i++) {
if ((un == unArraye[i]) && (pw == pwArraye[i])) {
valide = true;
break;
}
}

if (valide)  {
alert ("Login was successful");
window.location = "http://localhost:8080/employeepage.jsp";
return false;
}

var t = " tries";
if (count == 1) {t = " try"}

if (count >= 1) {
alert ("Invalid username and/or password.  You have " + count + t + " left.");
document.myform.username.value = "";
document.myform.pword.value = "";
setTimeout("document.myform.username.focus()", 25);
setTimeout("document.myform.username.select()", 25);
count --;
}

else {
alert ("Still incorrect! You have no more tries left!");
document.myform.username.value = "No more tries allowed!";
document.myform.pword.value = "";
document.myform.username.disabled = true;
document.myform.pword.disabled = true;
return false;
}

}

</script>

<form name = "myform">
<p>ENTER USER NAME <input type="text" name="username"> ENTER PASSWORD <input type="password" name="pword">
<input type="button" value="Check In" name="Submit" onclick= "validate()">
</p>

</form>
			</body>
		
</html>

