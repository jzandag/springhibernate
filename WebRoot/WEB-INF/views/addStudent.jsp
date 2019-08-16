<%@include file="taglibs.jsp" %>
<%@include file="layout.jsp" %>

<div class="container">

	<div class="page-header">
		<h2>Add Student Data</h2>
	</div>
	
	<div class="row form-group has-feedback jumbotron">
		<form:form id="save-student" method="POST" action="/sdnext/save.html">
			
	   		<table>
			    <tr>
			    	<c:if test="${!empty stud}"> 
				        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
				        	<form:label for="id" path="id">ID:</form:label></div></td>
				        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8">
				        	<form:input class="form-control" path="id" value="${stud.id}" readonly="true" name="id" id="id"/>
				                
				        	</div></td>
			    	</c:if>
			        	
			    </tr>
			    <tr>
			        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<form:label class="control-label" for="first-name" path="firstName">First name:</form:label></div></td>
			        <td><div class="input-group col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<i id="fid" class="input-group-addon glyphicon glyphicon-user"></i>
			        	<form:input class="form-control" path="firstName" value="${stud.firstName}" name="firstname" id="firstname" placeholder="Enter first name..." onblur="return blank(\"fname\")"/>
			        	
			        	</div></td>
			        	<td><font id="fNameError" style="color: #990000;">${emailExistError}
       						</font></td> 
			    </tr>
			    <tr>
			        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<form:label for="last-name" path="lastName" >Last name:</form:label></div></td>
                    <td><div class="input-group col-lg-12 col-md-12 col-sm-12 col-xs-8" >
                   	 	<div class="input-group-addon"><i id="lid" class="glyphicon glyphicon-user"></i></div>
                    	<form:input class="form-control" path="lastName" value="${stud.lastName}" name="lastname" id="lastname" placeholder="Enter last name..." onblur="return blank(\"lname\")"/>
                    	</div></td>
                    <td><font id="lNameError" style="color: #990000;">${lnameExistError} 
       					</font></td> 
			    </tr>
			    <tr>
			        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<form:label for="email" path="email">Email:</form:label></div></td>
			        <td><div class="input-group col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<div class="input-group-addon"><i id="emailid" class="glyphicon glyphicon-envelope"></i></div>
			        	<form:input class="form-control" path="email" value="${stud.email}" name="email" id="email" placeholder="Enter email..." onblur="return blank(\"email\")"/>
			        	</div></td>
			        <td><font id="emailError" style="color: #990000;">${emailExistError} 
       					</font></td> 
			    </tr>
			    <tr>
			        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			        	<br/><form:label for="course" path="course">Course:</form:label></div></td>
			        <td><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
						<br/>
						  <form:select path="course">
						  		<form:option value="BS-IT">BS-IT</form:option>
						  		<form:option value="BS-CPE">BS-CPE</form:option>
						  		<form:option value="BS-CS">BS-CS</form:option>
						  </form:select>
			        	<!-- <form:input class="form-control"  path="course" value="${stud.course}" name="course" id="course" placeholder="Enter course..."/>-->
			        	</div></td>
			    </tr>
			    
			    <tr>
			      <td colspan="2"><div class="col-lg-12 col-md-12 col-sm-12 col-xs-8" >
			      	<br/><input onclick="return validate()" id="save" type="submit" value="Submit" />
			      	</div></td>
		      </tr>
			</table> 
		</form:form>
	</div>
	<br/>
	<!-- 
	  <c:if test="${!empty students}">
			<h2>List Students</h2>
		<table id="student" align="center" border="1">
			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Course</th>
				<th>Actions</th>
			</tr>
	
			<c:forEach items="${students}" var="stud">
				<tr>
					<td><c:out value="${stud.id}"/></td>
					<td><c:out value="${stud.firstName}"/></td>
					<td><c:out value="${stud.lastName}"/></td>
					<td><c:out value="${stud.email}"/></td>
					<td><c:out value="${stud.course}"/></td>
					<td align="center"><a href="edit.html?id=${stud.id}">Edit</a> | <a href="delete.html?id=${stud.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
			 -->
	<br />
	<hr color="black" size="1" align="center" width="100%" />
	<h6 align="center"><a href="index.html" >Main Menu</a> © 2018</h6>
</div>