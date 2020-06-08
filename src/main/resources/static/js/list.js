$(document).ready(function () {
    $('#demolist button').on('click', function () {
      var txt= ($(this).text());
      var function_name = $(this).attr('value');
//      alert("클릭된 버튼은 <"+txt+"> 입니다."); //for check
//		alert(function_name);  //for check

      if(txt=="js stub  "){
    	  function_name = function_name+".js"
    	  location.href = "/fileDownload/"+function_name;
    	  
      }else if(txt=="java skeleton  "){
    	  function_name = function_name+".java"
    	  location.href = "/fileDownload/"+function_name;
      }else if(txt=="Delete   "){
    	  var link = "/deletefunc/"+function_name
    	  $.ajax({
    			contentType: "application/json",
    			url : link,
    				type : 'POST',		
    				success : function(result) {
    					var res = eval("("+result+")");
    					if (res.success == "true") {
    						alert("result success!");
    						 location.href = "http://localhost:8080/service/list";
    					} else {
    						alert("result fail");
    					}
    				},
    			failure : function() {
    					alert("req_fail");
    					}
    				});
      }else if(txt=="Edit   "){
    	  location.href = "http://localhost:8080/editfunc/"+function_name;
      }
      
      
    });
  });