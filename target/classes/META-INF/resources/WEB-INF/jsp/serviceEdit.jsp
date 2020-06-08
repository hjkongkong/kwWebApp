<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<script src="../resources/plugins/jquery/jquery.min.js"></script>
<%@include file="include/meta.jsp"%>
<body class="hold-transition sidebar-mini">
	<script type="text/javascript" src="../resources/js/serviceEdit.js"></script>
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
							<h1>Project Edit</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Project Edit</li>
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
						<c:forEach items="${basic}" var="basic">
						<div class="card-body">
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label for="getF_name"> Function name</label> <input type="text"
											id="getF_name" class="form-control"value="${basic.functionName}" disabled="true">
											<!--  aria-disabled="true" -->
									</div>
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<label for="getURL">URL</label> <input type="text"
											id="getURL" class="form-control" value="${basic.url}" placeholder="/API URL">
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
								<div class="col-md-3">
									<div class="form-group">
										<label for="getC_T">content-type</label>
										<select id="getC_T" class="form-control select2" style="width: 100%;">
											 <c:if test="${basic.contentType eq 'application/json' }">
												 <option selected="selected">application/json</option>
												<option >application/x-www-form-urlencoded</option> 
											 </c:if>
											 <c:if test="${basic.contentType eq 'application/x-www-form-urlencoded' }">
												 <option >application/json</option>
												<option selected="selected">application/x-www-form-urlencoded</option> 
											 </c:if>
											
											
										</select>	
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->

								<div class="col-md-3">
									<div class="form-group">
										<label for="getType">통신타입</label>
										 <select id="getType" class="form-control select2" style="width: 100%;">
										 	<c:if test="${basic.type eq 'POST'}">
												<option selected="selected">POST</option>
												<option>GET</option>
												<option>PUT</option>
												<option>DELETE</option> 
											 </c:if>
											 <c:if test="${basic.type eq 'GET'}">
												<option>POST</option>
												<option selected="selected">GET</option>
												<option>PUT</option>
												<option>DELETE</option> 
											 </c:if>
											 <c:if test="${basic.type eq 'PUT'}">
												<option>POST</option>
												<option>GET</option>
												<option selected="selected">PUT</option>
												<option>DELETE</option> 
											 </c:if>
											 <c:if test="${basic.type eq 'DELETE'}">
												<option>POST</option>
												<option>GET</option>
												<option>PUT</option>
												<option selected="selected">DELETE</option> 
											 </c:if>
										</select>
									</div>
									<!-- /.form-group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						</c:forEach>
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
										<c:forEach items="${rtlist}" var="rtlist" varStatus="status">
										<tbody id="tbody_test">
											<tr>
											<c:choose>
												<c:when test="${status.first}">
													<td> <input type="text" class="form-control" placeholder="key"value="${rtlist.dataKey}">  </td>
													<td> <input type="text" class="form-control" placeholder="ID"value="${rtlist.dataID}">  </td>
												
													<td> <button type="button" class="btn btn-primary" id="add_tbody"> 
														<i class='fa fa-plus'></i> </button>
													</td>
												</c:when>
												<c:otherwise>
													<td> <input type="text" class="form-control" placeholder="key"value="${rtlist.dataKey}">  </td>
													<td> <input type="text" class="form-control" placeholder="ID"value="${rtlist.dataID}">  </td>
												
													<td> <button type="button" name='delRow' class='btn btn-danger'> 
														<i class='fa fa-minus'></i> </button>
													</td>
												</c:otherwise>
											</c:choose>
											</tr>											
										</tbody>
										</c:forEach>
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
						<a href="http://localhost:8080/service/list" class="btn btn-secondary">Cancel</a> <input
							type="submit" value="Edit Project"
							class="btn btn-success float-right" id="EditButton"name='EditButton'>
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
