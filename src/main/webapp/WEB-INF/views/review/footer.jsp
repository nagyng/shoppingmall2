<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->  
    
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/event/vendor/bootstrap/js/bootstrap.min.js"></script> 
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/event/vendor/metisMenu/metisMenu.min.js"></script> 
    <!-- DataTables JavaScript -->
    <script src="/resources/event/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/event/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/event/vendor/datatables-responsive/dataTables.responsive.js"></script> 
    <!-- Custom Theme JavaScript -->
    <script src="/resources/event/dist/js/sb-admin-2.js"></script> 
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true,	//반응형 사용
            "paging": false,
            "ordering": false,
            "info": false,
            "searching": false
        });
        $(".sidebar-nav")		//모바일에서 새로고침 시 메뉴 자동 펼침 막기 
        	.attr("class","sidebar-nav navbar-collapse collapse")
        	.attr("aria-expanded",'false')
        	.attr("style","height:1px");
    });
    </script>
</body>
</html>