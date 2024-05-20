<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="utf-8">
		<title>修改商品</title>
	</head>

	<body>
		<input type="hidden" name="id" value="${gods.id }" id="id">
		<div class="form-group">
			<label for="name">商品名称</label>
			<input type="text" class="form-control" id="godsName" placeholder="请输入商品名称" value="${gods.godsName }">
		</div>
		<div class="form-group">
			<label for="name">价格</label>
			<input type="text" class="form-control" id="godsPrice" placeholder="请输入商品价格" value="${gods.godsPrice }">
		</div>
		<div class="form-group">
			<label for="name">描述</label>
			<input type="text" class="form-control" id="godsDetail" placeholder="请输入商品详情" value="${gods.godsDetail }">
		</div>
		<button type="button" class="btn btn-default" onclick="return submit()">提交</button>
	</body>
	<script src="/static/js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//表单提交
		function submit() {
			var godsName = $("#godsName").val();
			var godsPrice = $("#godsPrice").val();
			var godsDetail = $("#godsDetail").val();
			if (godsName == null || godsName == "") {
				alert("商品名称不能为空");
				return false;
			}
			if (godsPrice == null || godsPrice == "") {
				alert("商品价格不能为空");
				return false;
			}
			if (godsDetail == null || godsDetail == "") {
				alert("商品描述不能为空");
				return false;
			}
			console.log(godsDetail);
			$.ajax({
				url: "/change",
				// 			contentType: "application/json; charset=utf-8",
				data: {
					"godsName": godsName,
					"godsPrice": godsPrice,
					"godsDetail": godsDetail,
					"id": $("#id").val()
				},
				dataType: "json",
				type: "post",
				success: function (data) {
					if (data.code == '0') {
						window.location = '/listPage';
					}
					return false;
				}
			})
		}
	</script>

	</html>