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
        <h1 class="mt-4 mb-3">Contacts</h1>

        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a  href="<spring:url value ="/"/>">Home</a>
            </li>
            <li class="breadcrumb-item active"><a href="<spring:url value ="/contacts"/>">List of contacts</a></li>
        </ol>

        <!-- Intro Content -->
        <div class="row">
	        <spring:url value="/contact" var="userActionUrl" />
	         <form:form method="POST" action="${userActionUrl}" commandName="contactForm">
	         
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
            
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    
    
	<!-- Footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>
