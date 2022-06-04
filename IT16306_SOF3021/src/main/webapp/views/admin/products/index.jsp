<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
       uri="http://java.sun.com/jsp/jstl/core" %>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<script src="/IT16306_SOF3021/js/bootstrap.min.js"> </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/IT16306_SOF3021/js/popper.min.js"> </script>
</head>
<body>
 <form action="/products/delete">
<input type="text" name="id" id="id" hidden> 
</form >

	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Image</th>
				<th>Price</th>
				<th>CreatedDate</th>
				<th>Available</th>
				<th>Categories_id</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="pr">
			<tr>
				<td class="id">${ pr.id }</td>
				<td class="name">${ pr.name }</td>
				<td class="image">${ pr.image }</td>
				<td class="price">${ pr.price }</td>
				<td class="created_date">${ pr.created_date }</td>
				<td class="available">${ pr.available }</td>
				<td class="category_id">${pr.category_id.id}</td>
				<td>
					<button type="button" id="update" class="btn btn-primary update">Update</button>
				</td>
				<td>
					<button type="button" class="btn btn-danger delete">Delete</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="pagination">
	
		<li class="page-item"><a class="page-link" href="/products/index?p=${data.number<=0?0:data.number -1}">Previous</a></li>
		<c:forEach var="i" begin="0" end="${ data.totalPages<=0?0:data.totalPages-1 }">
			<li class="page-item">
				<a class="page-link"
					href="/products/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>  
		</c:forEach>  
				 <li class="page-item"><a class="page-link" href="/products/index?p=${data.number +1}">Next</a></li>
	
		</ul>				
	</div> 
	
	<!-- Modal -->	
<div class="modal fade update-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-danger fw-bold" id="exampleModalLabel">Update_Products</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="/products/update" method="POST" >
    	 <label class="form-label">Id</label>     
       	 	 <input class="form-control" type="text" name="id" id="id" readonly="readonly">
      	
      	<label  class="form-label">Name</label> 
      		 <input class="form-control" type="text" name="name" id="name">
      		 
  		 <label  class="form-label">Image</label> 
      		 <input class="form-control" type="text" name="image" id="image">
      		 
   		 <label  class="form-label">Price</label> 
      		 <input class="form-control" type="text" name="price" id="price">			
      		 
   		 <label  class="form-label">CreatedDate</label> 
      		 <input class="form-control" type="date" name="created_date" id="created_date">
      		 
   		 <label  class="form-label">Activated</label> 
      		  <input class="form-control" type="text" name="available" id="available">
      		 
   		<label  class="form-label" >Category_id</label> 
   			<select name="categories_id">
				<c:forEach var="item" items="${category }">
				<option value="${item.id }" >${item.id}</option>
				</c:forEach>
			</select>
       
        <div class="row"><button class="btn btn-outline-success mt-2">Update</button></div>
       </form>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>
<!-- Jquery -->
	<script>
	$(document).ready(function(){
		$(document).on("click",".update",function(){
			var id=$(this).closest("tr").find(".id").text();
			$("#exampleModal").find("#id").val(id);
			
			var name=$(this).closest("tr").find(".name").text();
			$("#exampleModal").find("#name").val(name);
			
			var image=$(this).closest("tr").find(".image").text();
			$("#exampleModal").find("#image").val(image);
			
			var price=$(this).closest("tr").find(".price").text();
			$("#exampleModal").find("#price").val(price);
			
			var created_date=$(this).closest("tr").find(".created_date").text();
			$("exampleModal").find("#created_date").val(created_date);
			
			var activated=$(this).closest("tr").find(".activated").text();
			$("#exampleMpdal").find("#activated").val(activated);
			
			var available = $(this).closest("tr").find(".available").text();
			$("#exampleModal").find("#available").val(available);
			
			var categories_id= $(this).closest("tr").find(".category_id").text();
			$("#exampleModal").find("#category_id").val(categories_id);
			
  			$("#exampleModal").modal("show");
		})
		$(document).on("click",".delete",function(){
			var id=$(this).closest("tr").find(".id").text();
			var conf=confirm("Bạn có muốn xóa không");
			if(conf){
				document.location="/products/delete?id="+id;
				alert("Xóa thành công")
	
			}
		})
	})

	
	</script>
</body>
</html>