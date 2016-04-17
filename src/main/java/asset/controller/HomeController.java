package asset.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


/**
 * @author yanghui
 * 首页controller
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {

	 @RequestMapping("/index")
	 public String index(HttpServletRequest request) {
	        return "assets/index";
	 }
	
	
	 @RequestMapping("/home")
	 public String home(HttpServletRequest request) {
	        return "home";
	 }
	 
	 @RequestMapping("/export")
	 public void export(HttpServletRequest request,HttpServletResponse response) throws Exception {
		 String name = request.getParameter("txtName");
		 String rows = request.getParameter("rows");
		 String columns = request.getParameter("columns");
		 XSSFWorkbook xs=new XSSFWorkbook();
		 XSSFSheet sheet=xs.createSheet(name);
		 XSSFRow row=sheet.createRow((short)0);
			
		 JSONArray array = JSONArray.parseArray(columns);
		 array = array.getJSONArray(0);
		 int number = 0;
		 List<String> namesList = new ArrayList<String>();
		 for(int i = 0,j = array.size();i<j;i++){
			 JSONObject json = array.getJSONObject(i);
			 if(json.containsKey("hidden")){
				 continue;
			 }
			 if(!json.containsKey("title")){
				 continue;
			 }
			row.createCell(number).setCellValue(json.getString("title")); 
			number++; 
			namesList.add(json.getString("field"));
		 }
		 JSONArray rowsArray = JSONArray.parseArray(rows);
		 for(int m = 0;m<rowsArray.size();m++){
			 row = sheet.createRow(m+1);
			 JSONObject jsonObject = rowsArray.getJSONObject(m);
			 for(int n = 0;n<namesList.size();n++){
				 String field = namesList.get(n);
				 if(jsonObject.containsKey(field))
						row.createCell(n).setCellValue(jsonObject.getString(field));
					else{
						row.createCell(n).setCellValue("");
					}
			 }
		 }
		 	String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			String downFileName = name+"_"+DateFormatUtils.format(new Date(), "yyyyMMdd")+".xlsx";
			String inlineType = "attachment"; // 是否内联附件
			response.setHeader("Content-Disposition", inlineType
			    + ";filename=\"" + downFileName + "\"");
			OutputStream out = null;
			try {
				out = response.getOutputStream();
				xs.write(out);
			} catch (IOException e) {			
			} finally {			
				if (out != null)
					out.flush();
				if (out != null)
					out.close();			
			}	
		
		 
	 }
	 
}
