<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

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

<title>Insert title here</title>
</head>
<body>
<form:form	modelAttribute="products" method="POST"	action="/products/create/">
		<div class="card-body border border-bottom-0 " style="width: 500px; height: 450px;margin-left: 440px; margin-top: 80px">	
		
			<div class="row p-5">
			<label class="text-danger fw-bold fs-5 text-center mb-2"> Create Product</label>	
				<div class="row mt-2">
					<div class="col-sm-3 m-2"><label >Name:</label></div>
					<div class="col-sm-8 mt-2">					
						<form:input class="form-control" path="name" />
					</div>
					<div class="col-sm-1"></div>
				</div>
				
				<div class="row">
					<div class="col-sm-3 m-2"><label>Image:</label></div>
					<div class="col-sm-8 mt-2">						
						<form:input class="form-control" type="text" path="image" />
					</div>
					<div class="col-sm-1"></div>
				</div>
				
				<div class="row">				
					<div class="col-sm-3 m-2"><label>Price:</label></div>
					<div class="col-sm-8 mt-2">						
						<form:input  class="form-control" path="price" />
					</div>
					<div class="col-sm-1"></div>
				</div>	
					
				<div class="row">
					
					<div class="col-sm-3 m-2"><label>CreatedDate:</label></div>
						<div class="col-sm-8 mt-2">										
							<form:input type="date"  class="form-control" path="created_date" />
						</div>
					<div class="col-sm-1"></div>
				</div>
				
				<div class="row"> 					
					<div class="col-sm-3 m-2"><label>Available:</label></div>
					<div  class="col-sm-8 mt-2">						
						<form:input class="form-control" path="available" />
					</div>	
					<div class="col-sm-1"></div>
				</div>
				
				<div class = "row">					
					<div class="col-sm-3 m-2"><label>Category_id:</label></div>
					<div class="col-sm-8 mt-2">						
						<form:select path="categories_id">
						<form:options items="${category}"/>
						</form:select>
					</div>
					<div class="col-sm-1"></div>
				</div>
				
				<div class = "row">
					<div class="col-sm-2"><button class="btn btn-outline-success text-black mt-2 ">Create</button></div>
					<div class="col-sm-10"></div>

				</div>
			</div>
			
		</div>
		
	</form:form>
</body>
</html>