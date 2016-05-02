package asset.controller;

import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.util.Constants;
import jb.util.CookieUtils;
import jb.util.ExcelReader;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetDic;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;
import asset.service.AssetDicServiceI;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/ledger")
public class LedgerDetailController {
	
	
	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	@Autowired
	private AssetDicServiceI assetDicService;
	

	
	@RequestMapping("/detail")
	public String toasset(HttpServletRequest request,HttpServletResponse response) {
		setColumns(request,response);
		try {
			//默认属性
			Map<String,String> baseAttrMap = assetDicService.getAssetDicMap(1);
			request.setAttribute("baseAttrMap", baseAttrMap);
			String columns = "";
			String base = CookieUtils.getCookie(request, Constants.column_base);
			String ext = CookieUtils.getCookie(request, Constants.column_ext);
			if(StringUtils.isBlank(base) && StringUtils.isBlank(ext)){
				//默认选中的属性
				Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				columns = properties.getProperty("search.result.columns");
			}else{
				columns = URLDecoder.decode(base,"utf-8");
				if(StringUtils.isNotBlank(ext)){
					columns =columns+","+URLDecoder.decode(ext,"utf-8");
				}
			}
			request.setAttribute("hcolumns", columns);
			
			//其他属性
			Map<String, List<AssetAttr>> attrByCate = assetBaseService.getAllAttrByCate();
			request.setAttribute("attrMap", attrByCate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/assets/ledger_detail";
	}
	
	@RequestMapping("/property/{assetId}")
	public String ledgerPro(HttpServletRequest request, @PathVariable String assetId) {
		request.setAttribute("assetId", assetId);
		return "/assets/ledger_pro";
	}
	

	@RequestMapping("/toAdd")
	public String toAdd(HttpServletRequest request) {
		return "/assets/ledger_toadd";
	}
	
	
	@RequestMapping("/getItNumber")
	@ResponseBody
	public String getItNumber(HttpServletRequest request) {
		String ownership = request.getParameter("ownership");
		try {
			if(StringUtils.isBlank(ownership)){
				throw new IllegalArgumentException("param error");
			}
			Map<String, String> dicMap = assetDicService.getAssetDicMap(100);
			if(dicMap.containsKey(ownership)){
				Integer value = Integer.parseInt(dicMap.get(ownership))+1;
				String init = value.toString();
				StringBuilder sb = new StringBuilder();
				if(init.length()<8){
					for(int i = 0;i<8-init.length();i++){
						 sb.append("0");
					}
				}
				return ownership+sb.toString()+value;
			}else{
				AssetDic dic = new AssetDic();
				dic.setDicKey(ownership);
				dic.setDicValue("1");
				dic.setDicType(100);
				assetDicService.saveOrUpdate(dic);
				return ownership + "00000001";
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("/add")
	public String ledgerAdd(HttpServletRequest request) {
		try {
			String typeStr = request.getParameter("type");
			if(StringUtils.isBlank(typeStr)){
				throw new IllegalArgumentException("param error");
			}
			Integer type = Integer.parseInt(typeStr);
			List<AssetDic> list = assetDicService.getAssetDic(type);
			if(CollectionUtils.isEmpty(list)){
				throw new IllegalArgumentException("字典表没有录入相应的设备小类");
			}
			request.setAttribute("type", type);
			AssetDic assetDic = list.get(0);
			String key = assetDic.getDicValue();
			//类别
			if(key.contains(",")){
				request.setAttribute("cate", key.split(",")[1]);
			}else{
				request.setAttribute("cate", key);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/assets/ledger_add";
	}
	
	
	@RequestMapping("/addPro")
	@ResponseBody
	public DataGrid addPro(HttpServletRequest request) {
		DataGrid dataGrid = new DataGrid();
		try {
			String cate = request.getParameter("cate");
			String type = request.getParameter("type");
			if(StringUtils.isBlank(cate) || StringUtils.isBlank(type)){
				throw new IllegalArgumentException("param error");
			}
			String cateValue = "";
			if(cate.contains(",")){
				cateValue = cate.split(",")[0];
				cate = cate.split(",")[1];
			}else{
				cateValue = cate;
			}
			List<AssetAttr> attrList = assetBaseService.getAssetAttr(cate);
			if(CollectionUtils.isEmpty(attrList)){
				throw new IllegalArgumentException("param error");
			}
			JSONArray resultArray = new JSONArray();
			//获取第一个设备归属对应的设备编号
			Map<String, String> itNumberMap = assetDicService.getAssetDicMap(100);
			
			//获取设备归属
			List<AssetDic> ownership = assetDicService.getAssetDic(101);
			
			JSONObject options = new JSONObject();
			options.put("data", ownership);
			options.put("valueField", "dicValue");
			options.put("textField", "dicValue");
			JSONObject editor = new JSONObject();
			editor.put("type", "combobox");
			editor.put("options", options);
			
			JSONObject ownershipJson = new JSONObject();
			ownershipJson.put("name", "设备归属");
			ownershipJson.put("value", ownership.get(0).getDicValue());
			ownershipJson.put("key", "");
			ownershipJson.put("editor", editor);
			resultArray.add(ownershipJson);
			
			LinkedHashMap<String,String> dicMap = assetDicService.getAssetDicMap(1);
			List<AssetDic> list = assetDicService.getAssetDic(Integer.parseInt(type));
			
			for(Map.Entry<String, String> entry:dicMap.entrySet()){
				String key = entry.getKey();
				String value = "";
				String name = dicMap.get(key);
				JSONObject json = new JSONObject();
				if("assetItNumber".equals(key)){
					
					String init = Integer.parseInt(itNumberMap.get("A"))+1+"";
					StringBuilder sb = new StringBuilder();
					if(init.length()<8){
						for(int i = 0;i<8-init.length();i++){
							 sb.append("0");
						}
					}
					value = "A" + sb.toString() + init;
				}else if("assetType".equals(key)){
					JSONObject typeEditor = new JSONObject();
					typeEditor.put("type", "combobox");
					JSONObject typeJson = new JSONObject();
					typeJson.put("data", list);
					typeJson.put("valueField", "dicValue");
					typeJson.put("textField", "dicKey");
					typeEditor.put("options", typeJson);
					json.put("editor", typeEditor);
					value = cateValue;
				}else{
					
					if(name.equals("设备名称")){
					    JSONObject typeEditor = new JSONObject();
					    typeEditor.put("type", "validatebox");
					    JSONObject opJson = new JSONObject();
					    opJson.put("required", true);
					    typeEditor.put("options", opJson);
						json.put("editor", typeEditor);
					}else if(name.contains("日期")){
						json.put("editor", "datebox");
					}else{
						json.put("editor", "text");
					}
				}
				
				json.put("name", name);
				json.put("value", value);
				json.put("key", key);
				json.put("flag", "base");
			
				resultArray.add(json);
			}
			
			for(AssetAttr ext:attrList){
				JSONObject json = new JSONObject();
				String attrName = ext.getAttrName();
				json.put("name", attrName);
				json.put("value", "");
				json.put("key", ext.getAttrId());
				json.put("flag", "ext");
				if(attrName.contains("日期")){
					json.put("editor", "datebox");
				}else{
					json.put("editor", "text");
				}
				
				
				resultArray.add(json);
			}
			dataGrid.setRows(resultArray);
			dataGrid.setTotal(Long.valueOf(resultArray.size()));
			return dataGrid;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	private void setColumns(HttpServletRequest request,HttpServletResponse response){
		String baseids = request.getParameter("baseids");
		String attrids = request.getParameter("attrids");
		try {
		if(StringUtils.isNotBlank(baseids)){
				CookieUtils.saveCookie(response, Constants.column_base, URLEncoder.encode(baseids,"utf-8"));
		}else{
			baseids = URLDecoder.decode(CookieUtils.getCookie(request,  Constants.column_base),"utf-8");
		}
		if(StringUtils.isNotBlank(attrids)){
				CookieUtils.saveCookie(response, Constants.column_ext, URLEncoder.encode(attrids,"utf-8"));
		}else{
			attrids = URLDecoder.decode(CookieUtils.getCookie(request,  Constants.column_ext),"utf-8");
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		StringBuilder columns = new StringBuilder("[[");
		try {
		
			if(StringUtils.isNotBlank(attrids)){
				String[] attrIdsArray = attrids.split(",");
				if(!ArrayUtils.isEmpty(attrIdsArray)){
					Map<String, String> attrMap = assetBaseService.getAllAttr();
					//获取扩展属性信息
					for(String attrId:attrIdsArray){
						if(attrMap.containsKey(attrId)){
							String attrName = attrMap.get(attrId);
							String column = "{field:'"+attrName+"',title:'"+attrName+"'},";
							columns.append(column);
						}
					}
				}
			}
			
			//默认情况 显示所有的基本信息
//			if(columns.length() == 2){
			Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
			//默认选中的属性
			if(StringUtils.isBlank(baseids)){
				Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				baseids = properties.getProperty("search.result.columns");
			}
			for(Map.Entry<String, String> entry:dicMap.entrySet()){
					String column = "";
					String[] baseIdsArray = baseids.split(",");
					//只显示这些列
					boolean hidden = true;
					for(String baseId:baseIdsArray){
						if(baseId.equals(entry.getKey())){
							hidden = false;
							break;
						}
					}
					if(hidden){
						column = "{field:'"+entry.getKey()+"',title:'"+entry.getValue()+"',hidden:'true'},";
					}else{
						column = "{field:'"+entry.getKey()+"',title:'"+entry.getValue()+"'},";
					}
					columns.append(column);
			}
			request.setAttribute("columns", columns.deleteCharAt(columns.length()-1)+"]]");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	private JSONArray parseBase(AssetBaseInfo info) throws Exception{
		JSONArray resultArray = new JSONArray();
		Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
		JSONObject infoJson = JSONObject.parseObject(JSON.toJSONString(info));
		Iterator<String> iterator = infoJson.keySet().iterator();
		while(iterator.hasNext()){
			String key = iterator.next();
			String value = infoJson.getString(key);
			JSONObject json = new JSONObject();
			if(dicMap.containsKey(key)){
				json.put("name", dicMap.get(key));
				json.put("value", value);
				json.put("key", key);
				json.put("flag", "base");
				if(!"assetItNumber".equals(key)){
					json.put("editor", "text");
				}
				resultArray.add(json);
			}
		}
		return resultArray;
	}
	
	@RequestMapping("/pro")
	@ResponseBody
	public DataGrid ledgerDataPro(HttpServletRequest request, PageHelper ph) {
		DataGrid dataGrid = new DataGrid();
		String assetId = request.getParameter("assetId");
		try {
				if(StringUtils.isBlank(assetId)){
					throw new IllegalArgumentException("param error");
				}
				String rulesStr = request.getParameter("assetId");
				AssetInfo assetInfo = assetBaseService.getAssetInfo(Integer.parseInt(rulesStr));
				if(null == assetInfo){
					throw new IllegalArgumentException("param error");
				}
				AssetBaseInfo info = assetInfo.getBaseInfo();
				List<AssetExtInfo> extList = assetInfo.getExtList();
				JSONArray resultArray = parseBase(info);
				if(CollectionUtils.isNotEmpty(extList)){
					for(AssetExtInfo ext:extList){
						JSONObject json = new JSONObject();
						json.put("name", ext.getAssetAttrName());
						json.put("value", ext.getAssetAttrValue());
						json.put("key", ext.getAssetAttrId());
						json.put("flag", "ext");
						json.put("editor", "text");
						resultArray.add(json);
					}
				}
				dataGrid.setRows(resultArray);
				dataGrid.setTotal(Long.valueOf(resultArray.size()));
				return dataGrid;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	@RequestMapping("/import")
	@ResponseBody
	public Json importLedger(HttpServletRequest request) {
		Json j = new Json();
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        MultipartFile multipartFile = multipartRequest.getFile("file");
	        String name = multipartFile.getOriginalFilename();
	        InputStream inputStream = multipartFile.getInputStream();
	        ExcelReader reader = new ExcelReader();
	        List<AssetBaseInfo> assetList = null;
	        if(name.endsWith("xls")){
	        	assetList = reader.readXls2BaseInfo(inputStream);
	        }else{
	        	assetList = reader.readXls2BaseInfo(inputStream);
	        }
	        
	        if(CollectionUtils.isNotEmpty(assetList)){
	        	for(AssetBaseInfo baseinfo:assetList){
	        		baseinfo.setAssetType("");
	        		assetBaseService.add(baseinfo);        		
	        	}
	        }
	       
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
			j.setMsg("出错了");
		} 
		return j;
	}
	
	@RequestMapping("/data")
	@ResponseBody
	public DataGrid ledgerData(HttpServletRequest request, PageHelper ph) {
		DataGrid dataGrid = new DataGrid();
		List<AssetInfo> assetList = null;
		try {
			
			String rulesStr = request.getParameter("filterRules");
			HashMap<String,String> baseMap = new HashMap<String,String>();
			
			String checkNumber = request.getParameter("checkNumber");
			if(StringUtils.isNotBlank(checkNumber)){
				baseMap.put("checkNumber", checkNumber);
			}
			
			HashMap<String,String> extMap = new HashMap<String,String>();
			if(StringUtils.isNotBlank(rulesStr)){
				JSONArray rules = JSONArray.parseArray(rulesStr);
				Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
				for(int i = 0;i<rules.size();i++){
					JSONObject jsonObject = rules.getJSONObject(i);
					
					
					String field = jsonObject.getString("field");
					String value = jsonObject.getString("value");
//					jsonObject.getString("op");
					if(dicMap.containsKey(field)){
						baseMap.put(field, value);
					}else{
						extMap.put(field, value);
					}
				}
			}
			if(extMap.size() > 0){
				assetList = assetBaseService.getAssetList(baseMap,extMap,ph);	
			}else{
				assetList = assetBaseService.getAssetList(baseMap,ph);	
			}
			if(null != assetList && assetList.size() > 0){
				JSONArray rows = new JSONArray();
				for(AssetInfo asset:assetList){
					AssetBaseInfo baseInfo = asset.getBaseInfo();
					JSONObject json;
					if(null != baseInfo){
						json = JSON.parseObject(JSON.toJSONString(baseInfo));
					}else{
						json = new JSONObject();
					}
					
					List<AssetExtInfo> extList = asset.getExtList();
					
					if(null != extList && extList.size() > 0){
						for(AssetExtInfo extInfo:extList){
							String attrName = extInfo.getAssetAttrName();
							String attrValue = extInfo.getAssetAttrValue();
							json.put(attrName, attrValue);
						}
					}
					rows.add(json);
				}
				
				dataGrid.setRows(rows);
				if(extMap.size() > 0){
					
				}else{
					dataGrid.setTotal(assetBaseService.countAsset(baseMap));	
				}
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	@RequestMapping("/toHigh")
	public String toHigh(HttpServletRequest request) {
		try {
			//默认属性
			Map<String,String> baseAttrMap = assetDicService.getAssetDicMap(1);
			request.setAttribute("baseAttrMap", baseAttrMap);
			String columns = "";
			String base = CookieUtils.getCookie(request, Constants.column_base);
			String ext = CookieUtils.getCookie(request, Constants.column_ext);
			if(StringUtils.isBlank(base) && StringUtils.isBlank(ext)){
				//默认选中的属性
				Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				columns = properties.getProperty("search.result.columns");
			}else{
				columns = URLDecoder.decode(base,"utf-8");
				if(StringUtils.isNotBlank(ext)){
					columns =columns+","+URLDecoder.decode(ext,"utf-8");
				}
			}
			request.setAttribute("columns", columns);
			
			//其他属性
			Map<String, List<AssetAttr>> attrByCate = assetBaseService.getAllAttrByCate();
			request.setAttribute("attrMap", attrByCate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/assets/ledger_high";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Json updateAsset(HttpServletRequest request) {
		Json j = new Json();
		try {
			String assetId = request.getParameter("assetId");
			if(StringUtils.isBlank(assetId)){
				throw new IllegalArgumentException("param error");
			}
			//变更的基本信息
			String base = request.getParameter("b");
			Map<String,String> paramMap = new HashMap<String,String>();
			if(StringUtils.isNotBlank(base)){
				String[] bases = base.split(",");
				for(String param:bases){
					String[] params = param.split(":");
					if(params.length == 2){
						paramMap.put(params[0], params[1]);
					}else{
						paramMap.put(params[0], "");
					}
				}
				AssetBaseInfo baseInfo = new AssetBaseInfo();
				BeanUtils.populate(baseInfo, paramMap);
				baseInfo.setAssetId(Integer.parseInt(assetId));
				assetBaseService.updateAssetById(baseInfo);
			    }
				//变更的扩展信息
				String ext = request.getParameter("e");
				if(StringUtils.isNotBlank(ext)){
					String[] exts = ext.split(",");
					for(String param:exts){
						String[] params = param.split(":");
						AssetExtInfo extInfo = new AssetExtInfo();
						extInfo.setAssetId(Integer.parseInt(assetId));
						if(params.length == 2){
							extInfo.setAssetAttrId(Integer.parseInt(params[0]));
							extInfo.setAssetAttrValue(params[1]);
						}else{
							extInfo.setAssetAttrId(Integer.parseInt(params[0]));
							extInfo.setAssetAttrValue("");
						}
						assetBaseService.updateAssetExtById(extInfo);
					}
				}
				j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
	
	
	@RequestMapping("/save")
	@ResponseBody
	public Json saveAsset(HttpServletRequest request) {
		Json j = new Json();
		try {
			//基本信息
			String base = request.getParameter("b");
			String cate = request.getParameter("c");
			if(StringUtils.isBlank(base) || StringUtils.isBlank(cate)){
				throw new IllegalArgumentException("param error");
			}
			Map<String,String> paramMap = new HashMap<String,String>();
				String[] bases = base.split(",");
				for(String param:bases){
					String[] params = param.split(":");
					if(params.length == 2){
						paramMap.put(params[0], params[1]);
					}else{
						paramMap.put(params[0], "");
					}
				}
				AssetBaseInfo baseInfo = new AssetBaseInfo();
				BeanUtils.populate(baseInfo, paramMap);
				baseInfo.setAssetCate(cate);
				baseInfo.setAssetStatus("1");
				baseInfo.setAssetAddTime(new Date());
//				SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
//				baseInfo.setAssetAddUser(sessionInfo.getId());
				if(StringUtils.isEmpty(baseInfo.getAssetStockStatus())){
					baseInfo.setAssetStockStatus("入库");
				}
				baseInfo.setAssetArriveDate(DateFormatUtils.format(Calendar.getInstance(), "yyyy-MM-dd"));
				Integer assetId = assetBaseService.add(baseInfo);
				
				//扩展信息
				String ext = request.getParameter("e");
				if(StringUtils.isNotBlank(ext)){
					String[] exts = ext.split(",");
					for(String param:exts){
						String[] params = param.split(":");
						AssetExtInfo extInfo = new AssetExtInfo();
						extInfo.setAssetId(assetId);
						if(params.length == 3){
							extInfo.setAssetAttrId(Integer.parseInt(params[0]));
							extInfo.setAssetAttrName(params[1]);
							extInfo.setAssetAttrValue(params[2]);
							
						}else{
							extInfo.setAssetAttrId(Integer.parseInt(params[0]));
							extInfo.setAssetAttrName(params[1]);
							extInfo.setAssetAttrValue("");
						}
						extInfo.setAssetStatus((byte)1);
						assetBaseService.addExtInfo(extInfo);
					}
				}
				j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
}
