<%@ include file="/WEB-INF/views/include.jsp"%>
<html>

<head>
	
	<title>Delhoyo Webapp</title>
	<!-- META JS and CSS -->
	<%@ include file="/WEB-INF/views/common/metajscss.jsp"%>
	
	 <!-- Table CSS -->
	 <link href="<%=request.getContextPath()%>/resources/css/table.css" rel="stylesheet">

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
            <li class="breadcrumb-item active">List of contacts</li>
        </ol>

        <!-- Intro Content -->
        <div class="row">
	        
            <div class="col-lg-12">
            <form action="<spring:url value ="/contact/add"/>">
			    <input type="submit" value="Add a contact!" />
			</form>
			<br>
			
			<c:if test="${success }"><span class ="success"> Your contact has been successfully saved!</span></c:if>		
            <table class="tg">
			  <tr>
			    <th class="tg-9hbo">Id</th>
			    <th class="tg-9hbo">First Name</th>
			    <th class="tg-9hbo">Last name</th>
			    <th class="tg-9hbo">Address</th>
			    <th class="tg-9hbo">Email</th>
			    <th class="tg-9hbo">Phone</th>
			    <th class="tg-9hbo">Actions</th>
			  </tr>
                <c:forEach items="${contacts}" var="contact">
					<c:if test="${not empty contacts}">
					<tr>
						<td class="tg-yw4l"><i><c:out value="${contact.contact_id}" /></i></td>
						<td class="tg-yw4l"><c:out value="${contact.firstname}" /></td>
						<td class="tg-yw4l"><c:out value="${contact.lastname}" /></td>
						<td class="tg-yw4l"><c:out value="${contact.address}" /></td>
						<td class="tg-yw4l"><c:out value="${contact.email}" /></td>
						<td class="tg-yw4l"><c:out value="${contact.phone}" /></td>
						<td class="tg-yw4l"><a href="<c:url value="/contact/${contact.contact_id}"/>">Update</a>
											<a href="<c:url value="/contact/delete/${contact.contact_id}"/>">Delete</a></td>
					</tr>			
					</c:if>
				</c:forEach>
			</table>
			<br>		
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    
    
	<!-- Footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>
</html>
