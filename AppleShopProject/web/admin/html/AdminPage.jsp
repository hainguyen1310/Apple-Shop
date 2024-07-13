<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "jakarta.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="admin/assets/bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="admin/assets/js/jquery-ui/jquery-ui-1.10.1.custom.min.css" rel="stylesheet">
        <link href="admin/assets/css/bootstrap-reset.css" rel="stylesheet">
        <link href="admin/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
        <link href="admin/assets/js/jvector-map/jquery-jvectormap-1.2.2.css" rel="stylesheet">
        <link href="admin/assets/css/clndr.css" rel="stylesheet">
        <!--clock css-->
        <link href="admin/assets/js/css3clock/css/style.css" rel="stylesheet">
        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="admin/assets/js/morris-chart/morris.css">
        <!-- Custom styles for this template -->
        <link href="admin/assets/css/style.css" rel="stylesheet">
        <link href="admin/assets/css/style-responsive.css" rel="stylesheet"/>
    </head>
    <body>
        <%
        String username = null;

        if (session != null) {
            username = (String) session.getAttribute("username");
        }
        
        if (username == null) {
            response.sendRedirect("LoginPage.jsp");
            return;
        }
        %>
        <section id="container">
            <jsp:include page="Header.jsp" /> 
            <jsp:include page="MenuLeft.jsp" /> 
            <!--main content start-->
            <div>
                <jsp:include page="${bodyPage}"/>
            </div>
            <!--main content end-->
            <!--right sidebar start-->
            <jsp:include page="MenuRight.jsp" /> 
            <!--right sidebar end-->
        </section>
        <script src="admin/assets/js/jquery.js"></script>
        <script src="admin/assets/js/jquery-ui/jquery-ui-1.10.1.custom.min.js"></script>
        <script src="admin/assets/bs3/js/bootstrap.min.js"></script>
        <script src="admin/assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="admin/assets/js/jquery.scrollTo.min.js"></script>
        <script src="admin/assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
        <script src="admin/assets/js/jquery.nicescroll.js"></script>
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
        <script src="admin/assets/js/skycons/skycons.js"></script>
        <script src="admin/assets/js/jquery.scrollTo/jquery.scrollTo.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="admin/assets/js/calendar/clndr.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
        <script src="admin/assets/js/calendar/moment-2.2.1.js"></script>
        <script src="admin/assets/js/evnt.calendar.init.js"></script>
        <script src="admin/assets/js/jvector-map/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="admin/assets/js/jvector-map/jquery-jvectormap-us-lcc-en.js"></script>
        <script src="admin/assets/js/gauge/gauge.js"></script>
        <!--clock init-->
        <script src="admin/assets/js/css3clock/js/css3clock.js"></script>
        <!--Easy Pie Chart-->
        <script src="admin/assets/js/easypiechart/jquery.easypiechart.js"></script>
        <!--Sparkline Chart-->
        <script src="admin/assets/js/sparkline/jquery.sparkline.js"></script>
        <script src="admin/assets/js/morris-chart/raphael-min.js"></script>
        <!--common script init for all pages-->
        <script src="admin/assets/js/scripts.js"></script>
    </body>
</html>
