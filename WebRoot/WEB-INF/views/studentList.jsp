<%@include file="taglibs.jsp" %>
<%@include file="layout.jsp" %>

	
<style>
	body{
		background: url("public/image/nice.jpg");
				background-attachment: fixed;
				background-size: 300px 100px;
			}
	#student {
			    font-family: "Times New Roman", Times, serif;
			    font-size: medium;
			    border-collapse: collapse;
			    width: 40%;
			    border: solid 2px black;
			    background-color: #f2f2f2;
			}
			#student td, #student th {
			    border: 1px solid #ddd;
			    padding: 5px;
			}
			
			#student tr{
				color: #000000;
			}
			
			#student tr:nth-child(even){background-color: #bfbfbf;}
			
			#student tr:hover {background-color: #e6e6ff;}
			
			#student th {
				text-align: center;
			    padding-top: 12px;
			    padding-bottom: 12px;
			    text-align: left;
			    background-color: #003366;
			    color: white;
			}
			.bg{
				 height: 90%;
				background-position: center;
			    background-repeat: no-repeat;
			    background-size: cover;
			}
			.jumbotron{
				background-image: url("public/image/matrix.jpg");
				color: #00bf30;
			}
			
</style>
		
<div class="container bg">
	<div class="page-header jumbotron">
	<h1 align="center">Student Database</h1>
	</div>
	<h3 align="center"><a href="add.html">Add Student</a></h3>
	
	<div class="table-rover jumbotron">
		<c:if test="${!empty students}">
			<table class="table table-hover" align="center" border="1">
				<thead>
					<tr class="active">
						<th>ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Course</th>
						<th colspan="2"	>Options</th>
					</tr>
				</thead>
		
				<c:forEach items="${students}" var="student">
					
					<tr class="info">
						<td><c:out value="${student.id}"/></td>
						<td><c:out value="${student.firstName}"/></td>
						<td><c:out value="${student.lastName}"/></td>
						<td><c:out value="${student.email}"/></td>
						<td><c:out value="${student.course}"/></td>
						<td align="center"><a href="edit.html?id=${student.id}">Edit</a> | <a href="delete.html?id=${student.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	
	<hr color="rgb(120, 120, 120)" size="3" align="center" width="120%" />
	<h5 style="background-color: white;" align="center"><a href="index.html" >Home</a> © 2018</h5>
	 
</div>