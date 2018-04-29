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
    
 <header>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">

                <!-- Slide Three - Set the background image for this slide in the line below -->
                <div class="carousel-item" style="background-image: url('<%=request.getContextPath()%>/resources/images/groefnia_3.jpg')">
                    <div class="carousel-caption d-none d-md-block">
                        <h3 style="color:#000000">Learn Programming</h3>
                        <p style="color:#000000">SpringMVC, frontend, Postgresql...</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </header>

    <!-- Page Content -->
    <div class="container">

        <h1 class="my-4">Welcome to DelHoyo webpage!</h1>

        <!-- /.row -->
       
        <!-- /.row -->

        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-6">
                <h2>Modern Business Features</h2>
                <p>The Modern Business template by Start Bootstrap includes:</p>
                <ul>
                    <li><strong>Bootstrap v4</strong>
                    </li>
                    <li>jQuery</li>
                    <li>Font Awesome</li>
                    <li>Working contact form with validation</li>
                    <li>Unstyled page elements for easy customization</li>
                </ul>
                <p>Consult this template in the Other Pages section</p>
            </div>
            <div class="col-lg-6">
                <img class="img-fluid rounded" src="<%=request.getContextPath()%>/resources/images/technologies.jpg" alt="">
            </div>
        </div>
        <!-- /.row -->

        <hr>

<!--         Call to Action Section
        <div class="row mb-4">
            <div class="col-md-8">
                <p>This webpage was built using SpringMVC</p>
            </div>
            <div class="col-md-4">
                <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
            </div>
        </div>
         -->
        <div class="row">
         <h2>Table of contacts with CRUD functionalities</h2>
         <div class="col-lg-12">
            <form action="<spring:url value ="/contact/add"/>">
			    <input type="submit" value="Add a contact!" />
			</form>
			<br>

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
        
        
        
         <div class="row">
            <div class="col-lg-6">
                <h2>REST Service to create contacts</h2>
                <p>Call the service (using Postman or similar) defined in /ws/contact with the following POST body (application/xml)</p>
                    <xmp>
                    <contact>
						<firstname>Silvan</firstname>
						<lastname>Wyden</lastname>
						<address>Überlandstrasse 10</address>
						<email>silvan.wyden@braintecgroup.com</email>
						<phone>+41 (0)44 552 01 20</phone>
                    </contact>
                    </xmp>
            </div>
        </div>

    </div>
    
    
    
    
    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <div class="container">
        <P class="m-0 text-center text-white">The time on the server is ${serverTime}<br></P>
        <p class="m-0 text-center text-white">2017</p>
        </div>
    </footer>
</body>
</html>
