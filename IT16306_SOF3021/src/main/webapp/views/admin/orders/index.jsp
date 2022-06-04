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
<form action="/orders/delete">
<input type="text" name="id" id="id" hidden>
</form>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>User_id</th>
				<th>CreatedDate</th>
				<th>Address</th>				
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="od">
			<tr>
				<td class="id">${ od.id }</td>
				<td class="user_id">${ od.user_id.id }</td>
				<td class="created_date">${ od.created_date }</td>
				<td class="address">${ od.address }</td>

				<td>
					<button type="button" class="btn btn-outline-primary update">Update</button>
				</td>
				
				<td>
					<button type="button" class="btn btn-outline-danger delete">Delete</button>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="row">
		<ul class="pagination">
		<li class="page-item"><a class="page-link" href="/orders/index?p=${data.number<=0?0:data.number -1}">Previous</a></li>
	 	<c:forEach var="i" begin="0" end="${ data.totalPages<=0?0:data.totalPages-1 }">
		
		</c:forEach>
		 <li class="page-item"><a class="page-link" href="/orders/index?p=${data.number +1}">Next</a></li>
	
		</ul>				
	</div> 
	<!-- Modal -->
<div class="modal fade update-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-danger fw-bold fs-4" id="exampleModalLabel">Update_Modal</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="/orders/update" method="POST" >
       
    	 <label class="form-label">Id</label>     
       	 	 <input class="form-control" type="text" name="id" id="id" readonly="readonly">
     	
      		 
      	 <label  class="form-label">CreatedDate</label> 
      		 <input class="form-control" type="date" name="created_date" id="created_date">
      		 
      	<label  class="form-label">Address</label> 
      		 <input class="form-control" type="text" name="address" id="address">
      	
      	<label  class="form-label" >User_id</label> 
   			<select name="user_id">
				<c:forEach var="item" items="${accounts }">
				<option value="${item.id }" >${item.id}</option>
				</c:forEach>
			</select> 
  		
       <div class="row"> <button class="btn btn-outline-success mt-3">Update</button></div>
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
			var id =$(this).closest("tr").find(".id").text();
			$("#exampleModal").find("#id").val(id);
			
			var user_id=$(this).closest("tr").find(".user_id").text();
			$("#exampleModal").find("#user_id").val(user_id);
			
			var created_date=$(this).closest("tr").find(".created_date").text();
			$("exampleModal").find("#created_date").val(created_date);
			
			var address=$(this).closest("tr").find(".address").text();
			$("#exampleModal").find("#address").val(address);
			
  			$("#exampleModal").modal("show");
		})
		$(document).on("click",".delete",function(){
			var id=$(this).closest("tr").find(".id").text();
			var conf=confirm("Bạn có muốn xóa không");
			if(conf==true){
				document.location="/orders/delete?id="+id;
				alert("Xóa thành công")
			}
		})
	})
	
	</script>
</body>
</html>