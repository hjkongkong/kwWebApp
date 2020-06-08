<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="../resources/plugins/jquery/jquery.min.js"></script>
<%@include file="include/meta.jsp"%>
<body class="hold-transition sidebar-mini">
	<script type="text/javascript" src="../resources/js/serviceAdd.js"></script>
	<div class="wrapper">
		<!-- Navbar -->
		<%@include file="include/navbar.jsp"%>

		<!-- Main Sidebar Container -->
		<%@include file="include/sidebar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Project Add</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Project Add</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- bacis information card -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">Basic Information</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-remove"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label for="getF_name"> Function name</label> <input type="text"
											id="getF_name" class="form-control" placeholder="java 함수 이름">
									</div>
									<!-- /.form-group -->
									<!--  항목 추가 시 주석 삭제
                 <div class="form-group">
                	<label for="input--">제목</label>
                	<input type="text" id="input--" class="form-control">
              	</div>
              	-->
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<label for="getURL">URL</label> <input type="text"
											id="getURL" class="form-control" placeholder="/API URL">
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-3">
									<div class="form-group">
										<label for="getC_T">content-type</label>
										<select id="getC_T" class="form-control select2" style="width: 100%;">
											<option selected="selected">application/json</option>
											<option>application/x-www-form-urlencoded</option>
										</select>	
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<label for="getType">통신타입</label>
										 <select id="getType" class="form-control select2" style="width: 100%;">
											<option selected="selected">POST</option>
											<option>GET</option>
											<option>PUT</option>
											<option>DELETE</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->

					<!-- input data card -숨김 -->
					<div class="card card-default" style="display:none">
						<div class="card-header">
							<h3 class="card-title">Input Data(Request)</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-remove"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="row">
								<div class="col-md-2">
									<div class="form-group">
										<label for="inputEntityName">Entity Name</label> <input
											type="text" id="inputEntityName" class="form-control">
									</div>
									<!-- /.form-group -->

								</div>
								<!-- /.col -->

								<div class="col-md-2">
									<div class="form-group">
										<label>Entity Type</label> <select
											class="form-control custom-select">
											<option selected="selected">단수</option>
											<option>복수</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-2">
									<div class="form-group">
										<label for="inputFieldName">Field Name</label> <input
											type="text" id="inputFieldName" class="form-control">
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-2">
									<div class="form-group">
										<label>DataType</label> <select
											class="form-control custom-select">
											<option selected="selected">String</option>
											<option>Alaska</option>
											<option>California</option>
											<option>Delaware</option>
											<option>Tennessee</option>
											<option>Texas</option>
											<option>Washington</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-2">
									<div class="form-group">
										<label for="inputDatalen">Data length</label> <input
											type="number" id="inputDatalen" class="form-control">
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-2">
									<div class="form-group">
										<label>Null</label> <select class="form-control custom-select">
											<option selected="selected">가능</option>
											<option>불가능</option>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

							</div>
							<!-- /.row -->
							<div id="test_list">
								<!-- test를 위한 문항 -->
							</div>
							<div class="row">
								<div class="col-12">
									<input type="submit" value="입력란 추가"
										class="btn btn-info float-right" id="entityAdd">
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.card-body -->

					</div>
					<!-- /.card -->







					<!--  table data 반응형 -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Input Data(Request)-Table</h3>

									<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-remove"></i>
								</button>
							</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table id="table_test" class="table table-hover">
										<colgroup>	
											<col width="45%"/>
											<col width="45%"/>
											
											<col width="10%"/>
										</colgroup>
										<thead>
											<tr>
												<th>data Key</th>
												<th>data ID</th>
												
												<th></th>
											</tr>
										</thead>
										<tbody id="tbody_test">
											<tr>
												<td> <input type="text" class="form-control" placeholder="key">  </td>
												<td> <input type="text" class="form-control" placeholder="ID">  </td>
												
												<td> <button type="button" class="btn btn-primary" id="add_tbody"> 
													<i class='fa fa-plus'></i> </button>
												</td>
											</tr>											
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- /.row -->
					<!-- 끝 -->


					<!-- 오/완 나눌 때 사용 -->
					<div class="row">
						<!-- /.col (left) -->
						<!-- /.col (right) -->
					</div>
					<!-- /.row -->

				</div>
				<!-- /.container-fluid -->
				<div class="row">
					<div class="col-12">
						<a href="#" class="btn btn-secondary">Cancel</a> <input
							type="submit" value="Create new Porject"
							class="btn btn-success float-right" id="CreateButton"name='CreateButton'>
					</div>
				</div>

			</section>
			<!-- /.content -->
			<br>
		</div>
		<!-- /.content-wrapper -->


		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>Title</h5>
				<p>Sidebar content</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main Footer -->
		<%@include file="include/footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<%@include file="include/script.jsp"%>
</body>
</html>
