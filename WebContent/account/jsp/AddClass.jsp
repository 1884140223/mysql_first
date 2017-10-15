<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级增加页面</title>
<script type="text/javascript" src="<%=path %>/js/jquery-1.12.4.js"></script>
</head>
<body>
	<center>
		<form>
			<div>
				<label>id</label>
				<input type="text" id="id" />
			</div>
			<div>
				<label>code</label>
				<input type="text" id="code" />
			</div>
			<div>
				<label>password</label>
				<input type="password" id="password" />
			</div>
			<div>
				<label>文理科</label>
				<input type="text" id="lei" />
			</div>
			<div>
				<label>人数</label>
				<input type="text" id="number" />
			</div>
			<div>
				<label>班主任</label>
				<input type="text" id="teacher" />
			</div>
			<input type="button" value="保存" onclick="addSave();" />
		</form>
	</center>
		<script type="text/javascript">
		function addSave(){
			var datas = {"flag":"1", "id":$('#id').val(), 
					"code":$('#code').val(), "password":$('#password').val(), 
					"lei":$('#lei').val(), "number":$('#number').val(), "teacher":$('#teacher').val()};
			$.ajax({
				url:'<%= path%>/ClassRoomServlet',
				type:'post',
				dataType:'json', 
				data:datas,
				success:success_function,
				error:error_function
			});
			function success_function(datas){
				if("0" == datas){
					var datas ={"flag":"0"};
					$.ajax({
						url:'<%= path%>/ClassRoomServlet',
						type:'post',
						dataType:'json', 
						data:datas,
						success:success_function,
						error:error_function
					});
					function success_function(datas){
						if("0" == datas){
							location.href="<%= path%>/classroom.jsp";
							alert("新增成功！");
						}else{
							alert("新增失败！");
						}
					}	
					function error_function(){
						alert("新增错误！");
					}
				}else{
					alert("新增失败！");
				}
			}
			function error_function(){
				alert("新增错误！");
			}
			return;
		}
	</script>
</body>
</html>