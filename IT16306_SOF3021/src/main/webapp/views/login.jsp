<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form action="/login" method="post">
		<div>
			<label>Email</label>
			<input type="email" name="email" />
		</div>
		<br>
		<div>
			<label>Password</label>
			<input type="password" name="password" />
		</div>
		<button>Submit</button>
		${email}
		${password}
	</form>
</body>
</html>