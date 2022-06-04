<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html>
<html>
<head>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

	<script src="/IT16306_SOF3021/js/bootstrap.min.js"> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/IT16306_SOF3021/js/popper.min.js"> </script>

<meta charset="utf-8">

 <style>
    body{
      width: 600px;
      height: 500px;
      background-image: url("https://img4.thuthuatphanmem.vn/uploads/2020/12/25/banner-blue-don-gian_060828356.jpg");
      background-repeat: no-repeat;
	  background-attachment: fixed;
  	background-position: center;
 	 background-color: #c2e2e8;
 
    }
 </style>

<title>Insert title here</title>
</head>
<body>
<form:form
		modelAttribute="category"
		method="POST"
		action="/categories/create/">
		<div class="card-body  border border-light " style="width: 450px; height: 250px; margin-top: 160px; margin-left: 470px;">
		
			<div class="row  pt-4">
			<label class=" text-center text-danger fw-bold fs-5 ">Create Categories</label>
				<div class="col-md-3 "></div>
				<div class="col-md-6 mt-4" >
					<label>Name</label>
					<form:input class="form-control mt-2" path="name"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-4"><button class="btn btn-outline-success mt-3 text-light">Create</button></div>
				<div class="col-md-5"></div>
				
			</div>
		</div>
		
		
</form:form>
</body>
</html>