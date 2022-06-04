<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
 <style>
    body{
      width: 600px;
      height: 500px;
      background-image: url("https://adsplus.vn/wp-content/uploads/2019/01/bann1.jpg");
      background-repeat: no-repeat;
	  background-attachment: fixed;
  	background-position: center;
 	 background-color: #c2e2e8;
 
    }
 </style>


<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	
<form:form modelAttribute="order_details" method="POST" action="/orders-details/create">
		<div class="card-body  " style="width: 450px; height: 250px; margin-top: 160px; margin-left: 470px;">		
			<div class="row pt-1"> 	 	
			<label class=" text-center text-danger fw-bold fs-5 mb-4 ">Create Orders</label>
				<div class="col-md-3 "><label>Orders_Id:</label></div>
				<div class="col-md-6 mt-2">															
					<form:input class="form-control "  path="orders"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row  pt-4"> 
				<div class="col-md-3 "><label>Product_Id:</label></div>
				<div class="col-md-6" >				
					<form:input class="form-control " path="product"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row  pt-4"> 
				<div class="col-md-3 "><label>Price:</label></div>
				<div class="col-md-6" >				
					<form:input class="form-control " path="price"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
			<div class="row  pt-4"> 
				<div class="col-md-3 "><label>Quantity:</label></div>
				<div class="col-md-6" >				
					<form:input class="form-control " path="quantity"/>
				</div>
				<div class="col-md-3"></div>
			</div>
			
		
				<div class="col-md-3"></div>
			</div>
			
			
			<div class="row">
				<div class="col-md-2"><button class="btn btn-outline-success mt-3 text-warning">Create</button></div>
				<div class="col-md-4"></div>
				<div class="col-md-6"></div>
				
			</div>
		</div>
		
		
</form:form>	
	
	
</body>
</html>