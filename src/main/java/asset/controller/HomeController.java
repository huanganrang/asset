package asset.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.util.MatrixToImageWriter;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;


/**
 * @author yanghui
 * 首页controller
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private AssetBaseServiceI service;

	 @RequestMapping("/index")
	 public String index(HttpServletRequest request) {
	        return "assets/index";
	 }
	 
	 @RequestMapping("/getQ")
	 public void getQ(HttpServletRequest request,HttpServletResponse response) {
		 String idStr = request.getParameter("id");
		 if(StringUtils.isBlank(idStr)){
			 throw new IllegalArgumentException("param error");
		 }
		 try {
			AssetBaseInfo baseInfo = service.getAssetBaseInfo(Integer.parseInt(idStr));
			if(null == baseInfo){
				 throw new IllegalArgumentException("param error");
			}
			String serial = baseInfo.getAssetSerial();
			String bornDate = baseInfo.getAssetBornDate();
			String beginDate = baseInfo.getAssetBeginDate();
			
			Map<EncodeHintType, Object> hints = new HashMap<EncodeHintType, Object>();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            hints.put(EncodeHintType.MARGIN, 0);
            BitMatrix bitMatrix = new MultiFormatWriter().encode(serial+","+bornDate+","+beginDate, BarcodeFormat.QR_CODE, 100, 100, hints);
            int[] rec = bitMatrix.getEnclosingRectangle();  
            int resWidth = rec[2] + 1;  
            int resHeight = rec[3] + 1;  
            BitMatrix resMatrix = new BitMatrix(resWidth, resHeight);  
            resMatrix.clear();  
            for (int i = 0; i < resWidth; i++) {  
                for (int j = 0; j < resHeight; j++) {  
                    if (bitMatrix.get(i + rec[0], j + rec[1])) { 
                         resMatrix.set(i, j); 
                    } 
                }  
            }  
            
            
            MatrixToImageWriter.writeToStream(bitMatrix, "png", response.getOutputStream());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
