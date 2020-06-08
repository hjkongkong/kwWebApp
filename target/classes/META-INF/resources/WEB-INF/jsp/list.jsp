<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<script src="../resources/plugins/jquery/jquery.min.js"></script>
<%@include file="include/meta.jsp"%>
<body class="hold-transition sidebar-mini">
	<script type="text/javascript" src="../resources/js/list.js"></script>
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
							<h1>Project List</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Project list</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Projects</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse" data-toggle="tooltip"
								title="Collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove" data-toggle="tooltip" title="Remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body p-0">
						<table class="table table-striped projects">
							<thead>
								<tr>
									<th style="width: 1%">NO.</th>
									<th style="width: 20%">Function Name</th>
									<th style="width: 20%">URL</th>
									<th style="width: 30%">content-type</th>
									<th style="width: 9%" class="text-center">통신</th>
									<th style="width: 20%"></th>
								</tr>
							</thead>
							<c:forEach items="${list}" var="emp">
							<tbody>

								<tr>
									<td>#</td>
									<td>${emp.functionName}</td>
									<td>${emp.url}
									</td>
									<td class="project_progress">
										${emp.contentType} 
									</td>
									<td class="project-state">
										<c:choose>
											<c:when test="${emp.type eq 'POST'}">
												<span class="badge badge-success">POST</span></td>
											</c:when>
											<c:when test="${emp.type eq 'GET'}">
												<span class="badge badge-primary">GET</span></td>
											</c:when>
											<c:when test="${emp.type eq 'DELETE'}">
												<span class="badge badge-danger">DELETE</span></td>
											</c:when>
											<c:when test="${emp.type eq 'PUT'}">
												<span class="badge badge-info">PUT</span></td>
											</c:when>		
										</c:choose>
										<!-- <span class="badge badge-success">${emp.type}</span></td> -->
									<td class="project-actions text-left">

										<div class="btn-group">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown" id="mystatus">Action</button>
				
											<div class="dropdown-menu" id="demolist">
												<button class="dropdown-item" type="button" value=${emp.functionName}>js stub <i class="fas fa-download"> </i></button>
												<button class="dropdown-item" type="button" value=${emp.functionName}>java skeleton <i class="fas fa-download"> </i></button> 
												<div class="dropdown-divider"></div>
												<button class="dropdown-item" type="button" value=${emp.functionName}>Edit  <i class="fas fa-edit"> </i></button>
												<button class="dropdown-item" type="button" value=${emp.functionName}>Delete  <i class="fas fa-trash-alt"> </i></button>
											</div>
											
										</div>

									</td>
								</tr>

							</tbody>
							</c:forEach>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
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
