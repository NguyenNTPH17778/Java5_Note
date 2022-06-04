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
 <form action="/admin/accounts/delete">
<input type="text" name="id" id="id" hidden> 
</form >

	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Fullname</th>
				<th>Username</th>
				<th>Email</th>
				<th>Photo</th>
				<th>Activated</th>
				<th>Role</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ data.content }" var="acc">
			<tr>
				<td id="id">${ acc.id }</td>
				<td id="fullname">${ acc.fullname }</td>
				<td id="username">${ acc.username }</td>
				<td id="email">${ acc.email }</td>
				<td id="photo">
					<img src="${ acc.photo }" />
				</td>
				<td id="activated">${ acc.activated == 0 ? "Not Active" : "Active" }</td>
				<td id="role">${ acc.admin == 1 ? "Admin" : "Member" }</td>
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
	
		<li class="page-item"><a class="page-link" href="/admin/accounts/index?p=${data.number<=0?0:data.number -1}">Previous</a></li>
		<c:forEach var="i" begin="0" end="${ data.totalPages<=0?0:data.totalPages-1 }">
			<li class="page-item">
				<a class="page-link"
					href="/admin/accounts/index?page=${ i }">
					${ i + 1 }
				</a>
			</li>  
		</c:forEach>  
				 <li class="page-item"><a class="page-link" href="/admin/accounts/index?p=${data.number +1}">Next</a></li>
	
		</ul>				
	</div> 
	
	<!-- Modal -->	
<div class="modal fade update-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-danger fw-bold" id="exampleModalLabel">Update_Modal</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <form action="/admin/accounts/update" method="POST" >
    	 <label class="form-label">Id</label>     
       	 	 <input class="form-control" type="text" name="id" id="id" readonly="readonly">
      	
      	<label  class="form-label">FullName</label> 
      		 <input class="form-control" type="text" name="fullname" id="fullname">
      		 
  		 <label  class="form-label">UserName</label> 
      		 <input class="form-control" type="text" name="username" id="username">
      		 
   		 <label  class="form-label">Email</label> 
      		 <input class="form-control" type="text" name="email" id="email">
      		 
   		 <label  class="form-label">Photo</label> 
      		 <input class="form-control" type="text" name="photo" id="photo">
      		 
   		 <label  class="form-label">Activated</label> 
      		 <select name = "activated" id = "activated" class="form-select" >
      		 	<option selected="selected" value="0">Actived</option>
      		 	<option value="1">NonActived</option>      		 
      		 </select>
      		 
   		<div class="row">  <label  class="form-label" >Role</label> </div>
   			 <label>Member</label>
      		 <input type="radio" name="admin" id="member" value="0">
      		 <label>Admin</label>
      		 <input  type="radio" name="admin" id="admin" value="1" >
       
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
			var id=$(this).closest("tr").find("#id").text();
			$("#exampleModal").find("#id").val(id);
			
			var fullname=$(this).closest("tr").find("#fullname").text();
			$("#exampleModal").find("#fullname").val(fullname);
			
			var username=$(this).closest("tr").find("#username").text();
			$("#exampleModal").find("#username").val(username);
			
			var email=$(this).closest("tr").find("#email").text();
			$("#exampleModal").find("#email").val(email);
			
			var photo=$(this).closest("tr").find("#photo").text();
			$("exampleModal").find("#photo").val(photo);
			
			var activated=$(this).closest("tr").find("#activated").text();
			$("#exampleMpdal").find("#activated").val(activated);
			
			var role = $(this).closest("tr").find("#role").text();
			$("#exampleModal").find("#member").val(0);
			$("#exampleModal").find("#admin").val(1);
  			$("#exampleModal").modal("show");
		})
		$(document).on("click",".delete",function(){
			var id=$(this).closest("tr").find("#id").text();
			var conf=confirm("Bạn có muốn xóa không");
			if(conf){
				document.location="/admin/accounts/delete?id="+id;
				alert("Xóa thành công")
	
			}
		})
	})

	
	</script>
</body>
</html>