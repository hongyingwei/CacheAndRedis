<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<!-- 引入CSS样式 -->
	<link rel="stylesheet" href="/static/css/qunit.css">
	<link rel="stylesheet" href="/static/css/bootstrap.min.css">
	<!-- JS -->
	<script src="/static/js/jquery.min.js" type="text/javascript"></script>
	<script src="/static/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/static/js/bootstrap-paginator.min.js"></script>
	<script src="/static/js/qunit.js"></script>
</head>

<body>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>序号</th>
						<th>商品名称</th>
						<th>价格</th>
						<th>描述</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		<div style="text-align: center;">
			<ul id='bp-3-element-test'></ul>
		</div>
	</div>
	<script type="text/javascript">
		//初始化数据，在进行分页查询时，数据会改变
		localPageSize = 10;//每页条数
		var currentPage = 1;//
		var totalPages = 1;
		$(function () {
			load_gods(1, localPageSize);
		});
		//加载商品(分页)
		load_gods = function (pageNum, pageSize) {
			$.ajax({
				url: "list",
				type: "post",
				data: {
					"pageNum": pageNum,
					"pageSize": pageSize
				},
				dataType: "json",
				success: function (data) {
					console.log(data);
					totalPages = data.pages;
					currentPage = pageNum;
					if (data.pages < 5) {
						numberOfPages = 5;
					} else {
						numberOfPages = data.pages;
					}
					var str = "";
					$("#tbody").empty();
					$.each(data.list, function (index, item) {
						str += '<tr id="id' + item.id + '">'
							+ '<th>' + (index + 1) + '</th>'
							+ '<th>' + item.godsName + '</th>'
							+ '<th>' + item.godsPrice + '</th>'
							+ '<th>' + item.godsDetail + '</th>'
							+ '<th><button class="btn btn-warning" '
							+ 'onclick="del(' + item.id + ')">删除</button>'
							+ '<button class="btn btn-info"'
							+ ' onclick="change(' + item.id + ')">修改</button></th>'
							+ '</tr>';
					});
					$("#tbody").append(str);
					initPager();
				}
			});
		}
		var initPager = function () {
			test("gods", function () {
				var element = $('#bp-3-element-test');
				var options = {
					bootstrapMajorVersion: 3,//版本
					currentPage: currentPage,//当前页数
					numberOfPages: numberOfPages,//导航条显示的页数
					totalPages: totalPages,//总页数
					itemTexts: function (type, page, current) {//自定义导航条显示
						switch (type) {
							case "first":
								return "首页";
							case "prev":
								return "上一页";
							case "next":
								return "下一页";
							case "last":
								return "末页";
							case "page":
								return page;
						}
					},
					//导航条单击事件，page是我们分页需要的
					onPageClicked: function (event, originalEvent, type, page) {
						load_gods(page, localPageSize);
					}
				}
				element.bootstrapPaginator(options);
			})
		};
		//修改
		var change = function (id) {
			window.location = "/toChange/" + id;
		}
		//删除
		var del = function (id) {
			$.ajax({
				url: "del/" + id,
				type: "post",
				dataType: "json",
				success: function (data) {
					if (data.code == "0") {
						alert("删除成功");
						window.location = "/listPage";
					}
				}
			})
		}
	</script>
</body>

</html>