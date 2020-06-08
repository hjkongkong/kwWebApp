package com.exapmle.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exapmle.data.entity.Basic;
import com.exapmle.data.entity.ReqTable;
import com.exapmle.repository.BasicRepository;
import com.exapmle.repository.ReqTableRepository;
import com.exapmle.service.BasicService;

import net.sf.json.JSONArray;

@Controller
public class APIController {
	
	@Autowired
	private BasicService basicService;
	
	@Autowired
	private BasicRepository BasicRepo;
	
	@Autowired
	private ReqTableRepository RTRepo;
	
	@RequestMapping(value = "/table/tabledataSend", method = RequestMethod.POST) //file add, edit-ajax2
	public @ResponseBody String tableList(@RequestBody String dataArrayToSend) throws Exception {
		System.out.println("APIController -  tabledataSend");
		String result_page = "{\"success\":\"false\"}";
		
		List<ReqTable> rtList = new ArrayList<ReqTable>();
		ReqTable rt;

		List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
		resultMap = JSONArray.fromObject(dataArrayToSend);
		String functionName = null;
		String URL = null;
		String ct = null;
		String type = null;
		String itemObj_String = "";	
		
		
		for (Map<String, Object> map : resultMap) {
			if(map.get("funcName")==null) {
				itemObj_String +=  "	itemObj."+map.get("key")+" = document.getElementById(\""+map.get("dataID")+"\").value;\r\n";

			}else {
				functionName = map.get("funcName").toString();
				URL = map.get("URL").toString();
				ct = map.get("ct").toString();
				type = map.get("type").toString();
			}
		}
		
		for(Map<String, Object> map : resultMap) {
			if(map.get("funcName")==null) {
				rt = new ReqTable();
				rt.setDataKey(map.get("key").toString());
				rt.setDataID(map.get("dataID").toString());
				rt.setfunctionName(functionName);
				rtList.add(rt);	
			}
				
		}
		
		
	    //DataBase insert
	    System.out.println("Data insert");
	    //중복체크
	    Basic dup_check = basicService.findByfunctionName(functionName);
	    if(dup_check!=null) {//중복이라면
	    	System.out.println("API Controll tableList() duplication");
	    	return result_page = "{\"success\":\"duplication\"}";
	    }
	    
	    //basic database insert
	    Basic basic = new Basic(functionName,URL,ct,type);
	    Basic saveBasic = BasicRepo.save(basic);
	    System.out.println("ReqTable saveAll");
	    Iterable<ReqTable> saveRt = RTRepo.saveAll(rtList);
	    
		
		
		//make file
		System.out.println("Make java, js file");
		String java_skeleton = 
				"/*\r\n" + 
				" * import your package \r\n" + 
				" * */\r\n"+
				"@RestController\r\n" + 
				"public class kwWebApp {\r\n" + 
				"\r\n" + 
				"  @RequestMapping(value = \""+URL+"\",method = RequestMethod."+type+")\r\n" + 
				"  public @ResponseBody String "+functionName+"(@RequestBody String dataArrayToSend) {\r\n" + 
				"			List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();\r\n"+
				"			resultMap = JSONArray.fromObject(dataArrayToSend);\r\n" + 
				"			/*\r\n" + 
				"			 * write your function\r\n" + 
				"			 * */\r\n" + 
				"	 return \"{\\\"success\\\":\\\"true\\\"}\";"+
				"  }\r\n" + 
				"\r\n" + 
				"}\r\n" + 
				"";
		
		
		BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\spring\\data\\"+functionName+".java"));

	    writer.write(java_skeleton); 
	    writer.close();
	    
	    String js_Stub = 
	    		"function makeyourfunction(){\r\n" + 
	    		"	var dataArrayToSend = new Array();\r\n" + 
	    		"	var itemObj = new Object();\r\n" + 
	    		"	\r\n" + 
	    		"	/*\r\n" + 
	    		"	*  //input your data in object\r\n" + 
	    		"	*/\r\n" + 
	    		itemObj_String+
	    		"	dataArrayToSend.push(itemObj);\r\n" + 
	    		"	$.ajax({\r\n" + 
	    		"		contentType : \""+ct+"\",\r\n" +
	    		"		url : \""+ URL +"\",\r\n" + 
	    		"		type : '"+ type +"',		\r\n" + 
	    		"		success : function(result) {\r\n" + 
	    		"		\r\n" + 
	    		"			var res = eval(\"(\"+result+\")\");\r\n" + 
	    		"			\r\n" + 
	    		"			if(res.success == \"true\") {\r\n" + 
	    		"				alert(\"success!\");\r\n" + 
	    		"				\r\n" + 
	    		"			} else if(res.success == \"false\") {\r\n" + 
	    		"				alert(\"fail\");\r\n" + 
	    		"			}\r\n" + 
	    		"			\r\n" + 
	    		"		},\r\n" + 
	    		"		failure : function() {\r\n" + 
	    		"			alert(\"request fail\");\r\n" + 
	    		"		},data : JSON.stringify(dataArrayToSend)\r\n" + 
	    		"	});\r\n" + 
	    		"\r\n" + 
	    		"}\r\n" + 
	    		"";
	    
	    BufferedWriter writer2 = new BufferedWriter(new FileWriter("C:\\spring\\data\\"+functionName+".js"));

	    writer2.write(js_Stub); 
	    writer2.close();
	    
	    
	    result_page = "{\"success\":\"true\"}";
   
		return result_page;
	}
	
		
	
	//list-js, java file download	
	@RequestMapping(value = "/fileDownload/{fileName}")//file download
	public @ResponseBody String fileDownload(HttpServletResponse response, HttpServletRequest request, @PathVariable String fileName) throws Exception {
		String  result_page = "{\"success\":\"false\"}";
		System.out.println("APIController - file download");
		String path = "C:\\spring\\data\\"+fileName;
		File file = new File(path);
		
		FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
		
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //File Encodeing
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){// Browser check. fileName encoding 
	            downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
	        }else{
	            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	        }
	        
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	            servletOutputStream.write(b, 0, data);
	        }
	 
	        servletOutputStream.flush();
	        
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{ //The specified file cannot be found.
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	            	System.out.println("ERROR :: APIController fileDownload()");
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
		
		
		return result_page;
	}
	
	
	
	@RequestMapping(value = "/deletefunc/{funcName}")//file delete or file edit-ajax1
	public @ResponseBody String deletefunc(HttpServletResponse response, HttpServletRequest request, @PathVariable String funcName) throws Exception {
		String result_page = "{\"success\":\"false\"}";
		System.out.println("APIController - deletefunc"); //delete data
		
		BasicRepo.deleteByFunctionName(funcName);
		RTRepo.deleteByFunctionName(funcName);
		result_page = "{\"success\":\"true\"}";
		return result_page;
	}
	
	
	
	@RequestMapping(value = "/editfunc/{funcName}")
	public String editfunc(Model model, @PathVariable String funcName) throws Exception {
		System.out.println("APIController - editfunc"); //edit data page
		//Basic b = basicService.findByfunctionName(funcName);
		List<Basic> basic = new ArrayList<Basic>();
		basic.add(basicService.findByfunctionName(funcName)); //<c:forEach> 사용을 위해 list에 넣어줌
		List<ReqTable> rtlist = new ArrayList<ReqTable>();
		rtlist =  basicService.rtfindByfunctionName(funcName);
		
		
		model.addAttribute("basic", basic);
		model.addAttribute("rtlist", rtlist);
		

		//for check rtlist
//		String ck_func,ck_id,ck_key;
//		for (ReqTable rt: rtlist) {
//			ck_func = rt.getfunctionName();
//			ck_id = rt.getDataID();
//			ck_key = rt.getDataKey();
//			System.out.println("function name : "+ck_func);
//			System.out.println("data id : "+ck_id);
//			System.out.println("data key : "+ck_key);
//			System.out.println();
//		}

		
		return "serviceEdit";
	}
	
	
	
}





