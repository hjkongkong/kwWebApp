$(function() {
	$("#entityAdd").click(function() {
		var tmp = "";
		tmp = tmp + "<li> It is Test </li>";

		$("#test_list").append(tmp);
	})
})

$(function() {
	$('.select2').select2()// Initialize Select2 Elements

	$('.select2bs4').select2({// Initialize Select2 Elements
		theme : 'bootstrap4'
	})
})

var rowCount = 1;
$(function() {
	$("#add_tbody")
			.click(
					function() {

						var rowItem = "<tr>"
						rowItem += "<td> <input type='text' class='form-control' placeholder='key'> </td>"
						
						rowItem += "<td> <input type='text' class='form-control' placeholder='ID'> </td>"
						rowItem += "<td> <button type='button' name='delRow' class='btn btn-danger'> "
								+ "<i class='fa fa-minus'></i> </button> </td>"
						rowItem += "</tr>"
						$('#table_test').append(rowItem);
						rowCount++;
					});
});

$(document).on("click", "button[name=delRow]", function() {
	var trHtml = $(this).parent().parent();
	trHtml.remove(); // tr 테그 삭제
	rowCount--;
});

$(function() {
	$("#CreateButton").click(function() {
		var dataArrayToSend = new Array();
		var itemObj=new Object();
		var nullCheck = 0;
		

		itemObj.funcName = document.getElementById("getF_name").value;
		itemObj.URL = document.getElementById("getURL").value;
		itemObj.ct = document.getElementById("getC_T").value;
		itemObj.type = document.getElementById("getType").value;
		
		if(itemObj.funcName.length <= 0 || itemObj.URL.length <= 0) { nullCheck = 1; }
		
		dataArrayToSend.push(itemObj);
		
		$("#tbody_test tr").each(function() {

			itemObj = new Object();// Object 동적할당
			var cellItem = $(this).find(":input");
			itemObj.key = cellItem.eq(0).val();
			itemObj.dataID = cellItem.eq(1).val();
			
			if (!itemObj.key) {
				alert("비어있는 Data의 key값이 있습니다.");
				nullCheck = 1;
				itemObj = new Object();
			} else {
				dataArrayToSend.push(itemObj);
			}

		});

		if (nullCheck > 0) {
			alert("비어있는 값이 있습니다.");
		} else {
//			console.log(dataArrayToSend);// console test
//			alert(JSON.stringify(dataArrayToSend));// alert test

			$.ajax({
				contentType : "application/json",
				url : "../table/tabledataSend",
				type : 'POST',
				success : function(result) {
					var res = eval("("+result+")");
					
					if (res.success == "true") {
						alert("result success!");
						location.href = "http://localhost:8080/service/list";
					} else if(res.success == "duplication") {
						alert("함수 이름이 중복됩니다. 다른 이름의 함수를 생성해주세요.");
					}else{alert("result fail");}
				},
				failure : function() {
					alert("req_fail");
				},
				data : JSON.stringify(dataArrayToSend)
			});
		}

	});

});
