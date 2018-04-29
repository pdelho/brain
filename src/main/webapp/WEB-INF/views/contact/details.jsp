<%@ include file="/WEB-INF/views/include.jsp"%>
<html>

<head>
	
	<title>Delhoyo Webapp</title>
	<!-- META JS and CSS -->
	<%@ include file="/WEB-INF/views/common/metajscss.jsp"%>
	
	<!-- Form CSS -->
	<link href="<%=request.getContextPath()%>/resources/css/form.css" rel="stylesheet">

</head>



<body>
	
	<!-- Navigation -->
    <%@ include file="/WEB-INF/views/common/navbar.jsp"%>
    
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <h1 class="mt-4 mb-3">List of Contacts </h1>

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a  href="<spring:url value ="/"/>">Home</a>
            </li>
            <li class="breadcrumb-item active"><a href="<spring:url value ="/contacts"/>">List of contacts</a></li>
        </ol>

        <!-- Intro Content -->
        <div class="row">
	        <spring:url value="/contact" var="postUpdateeUrl" />
	        <form:form method="POST" action="${postUpdateeUrl}" commandName="contactForm">
	         
	         	<form:input type="hidden" path="contact_id" value="${contact.contact_id}"  />
	         
	            <label for="title">First name</label>
	            <form:errors path="firstname" cssClass="error"/>
		        <p align ="right"><form:input type="text" path="firstname" placeholder="First Name"/></p>
		        
		        <label for="title">Last name</label>
		        <form:errors path="lastname" cssClass="error"/>
		        <p align ="right"><form:input type="text" path="lastname" placeholder="Last Name"/></p>
		        
		        <label for="title">Address</label>
		        <p align ="right"><form:input type="text" path="address" placeholder="Street, number"/></p>
		        
		        <label for="title">Email</label>
		        <form:errors path="email" cssClass="error"/>
		        <p align ="right"><form:input type="text" path="email" placeholder="email@example.com"/></p>
		        
		        <label for="title">Phone</label>
		        <p align ="right"><form:input type="text" path="phone" placeholder="+ 1 1234-1234"/></p>
	         	
	         	<input class="btn btn-primary" type="submit" value="Submit" />
		        <small>or press <strong>enter</strong></small>
	         
	         </form:form>
	        
	        
        	<%-- <form action="${postUpdateeUrl}" method="post">
        		<input type="hidden" name="contact_id" value="${contact.contact_id}"  />
        	
	            <label for="title">First Name</label>
		        <p align ="right"><input type="text" name="firstname" value="${contact.firstname}"  /></p>
		        
		        <label for="title">Last Name</label>
		        <p align ="right"><input type="text" name="lastname" value="${contact.lastname}"  /></p>
		        
		        <label for="title">Address</label>
		        <p align ="right"><input type="text" name="address" value="${contact.address}"  /></p>
		        
		        <label for="title">Email</label>
		        <p align ="right"><input type="text" name="email" value="${contact.email}"  /></p>
		        
		        <label for="title">Phone</label>
		        <p align ="right"><input type="text" name="phone" value="${contact.phone}"  /></p>
		       
		          <input class="btn btn-primary" type="submit" value="Update your information" />
		          <small>or press <strong>enter</strong></small>
		    </form>   --%>
            
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>
