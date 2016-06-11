package asset.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Json;
import jb.util.ExcelReader;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	
	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	@RequestMapping("/toaccount")
	public String toaccount(HttpServletRequest request) {
		return "assets/account";
	}

	@RequestMapping("/upload")
	@ResponseBody
	public Json upload(HttpServletRequest request) {
		
		Json j = new Json();
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        MultipartFile multipartFile = multipartRequest.getFile("file");
	        String name = multipartFile.getOriginalFilename();
	        InputStream inputStream = multipartFile.getInputStream();
	        ExcelReader reader = new ExcelReader();
	        List<Map<String, String>> mapList = null;
	        if(name.endsWith("xls")){
	        	mapList = reader.readXls(inputStream);
	        }else{
	        	mapList = reader.readXlsx(inputStream);
	        }
	        
	        if(CollectionUtils.isNotEmpty(mapList)){
	        	List<String> rows = new ArrayList<String>();
	        	for(Map<String,String> map:mapList){
	        		String itNumber = map.get("number");
	        		String useDepartment = map.get("useDepartment");
	        		
	        		if(StringUtils.isNotBlank(itNumber)){
	        			boolean need = false;
	        			AssetBaseInfo baseInfo = assetBaseService.getAssetBaseInfoByItNumber(itNumber);
	        			String aud = "";
	        			String ain = "";
	        			String adl = "";
	        			if(null != baseInfo){
	        				 aud = baseInfo.getAssetUseDepartment();
	        				 adl = baseInfo.getAssetDeviceLocation();
	        				 if(!useDepartment.equals(aud)){
	        					 need = true;
	        				 }
	        			}else{
	        				need = true;
	        			}
	        			if(need){
	        				rows.add(ain+"###"+aud+"###"+itNumber+"###"+useDepartment);
	        			}
	        		}
	        	}
	        	
	        	//写文件
	        	Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				String file = properties.getProperty("count.file.path","uploadfiles");
				String suffix = name.substring(name.lastIndexOf("."));
				name = name.substring(0,name.lastIndexOf("."));
				Date date = new Date();
				String fileName = request.getSession().getServletContext().getRealPath("/")+File.separator+date.getTime()+suffix;
	        	reader.writeExcel(rows, fileName);
	        	j.setMsg(date.getTime()+suffix);
	        	
	        }
	       
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
	
	
	@RequestMapping("/download")
	public void download(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String fileName = request.getParameter("fileName");
		Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
		String file = properties.getProperty("count.file.path","uploadfiles");
		String mimetype = "application/x-msdownload";
		response.setContentType(mimetype);
		String inlineType = "attachment"; // 是否内联附件
		
		response.setHeader("Content-Disposition", inlineType
		    + ";filename=\"" + fileName + "\"");
		OutputStream out = null;
		try {
			out = response.getOutputStream();
			// 循环取出流中的数据
	        byte[] b = new byte[100];
	        int len;
	        InputStream inStream = new FileInputStream(new File(request.getSession().getServletContext().getRealPath("/")+File.separator+fileName));
            while ((len = inStream.read(b)) > 0)
                response.getOutputStream().write(b, 0, len);
            inStream.close();
		} catch (IOException e) {			
		} finally {			
			if (out != null)
				out.flush();
			if (out != null)
				out.close();			
		}	
	}
	
}
