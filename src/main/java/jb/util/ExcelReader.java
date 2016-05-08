package jb.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import asset.model.AssetBaseInfo;

public class ExcelReader {
	
	
	
	public void writeExcel(List<String> mapList,String file) throws IOException {
		
		XSSFWorkbook xs=new XSSFWorkbook();
		XSSFSheet sheet=xs.createSheet("对账");
		XSSFRow row=sheet.createRow((short)0);
		short i = 0;
		String[] titles = new String[]{"IT验收编号","存放地点","使用部门","IT验收编号","存放地点","使用部门"};
		for(String title: titles){
			row.createCell(i).setCellValue(title); 
			i++;
		}
		short j = 1;
		for(String line : mapList){					
			row = sheet.createRow(j);
			i = 0;
			String[] split = line.split("###");
			if(null != split && split.length == 6){
				for(String value:split){
					row.createCell(i).setCellValue(value); 
					i++;
				}
				j++;
			}
		}
		FileOutputStream stream = null;
		try {
			stream =  new FileOutputStream(new File(file));
			xs.write(stream);
			stream.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(null != stream){
				stream.close();
			}
		}
	}
	
	
	 public List<Map<String,String>> readXlsx(InputStream is) throws IOException {
	        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
	        List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	        // Read the Sheet
//	        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
	            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
	            if (xssfSheet == null) {
//	                continue;
	            	throw new IllegalArgumentException("param error");
	            }
	            // Read the Row
	            for (int rowNum = 5; rowNum <= xssfSheet.getLastRowNum()-5; rowNum++) {
	                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
	                if (xssfRow != null) {
	                	Map<String,String> map= new HashMap<String,String>();
	                	
//	                    int total =  xssfRow.getPhysicalNumberOfCells();
	                    XSSFCell number = xssfRow.getCell(1);
	                    XSSFCell useDepartment = xssfRow.getCell(6);
	                    XSSFCell address = xssfRow.getCell(24);
	                  
	                    map.put("number", getValue(number));
	                    map.put("useDepartment", getValue(useDepartment));
	                    map.put("address", getValue(address));
	                    list.add(map);
	                }
	            }
//	        }
	        return list;
	    }

	    /**
	     * Read the Excel 2003-2007
	     * @param path the path of the Excel
	     * @return
	     * @throws IOException
	     */
	    public List<Map<String,String>> readXls(InputStream is) throws IOException {
	        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
	        List<Map<String,String>> list = new ArrayList<Map<String,String>>();
	        // Read the Sheet
//	        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
	            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
	            if (hssfSheet == null) {
//	                continue;
	            	throw new IllegalArgumentException("param error");
	            }
	            // Read the Row
	            for (int rowNum = 4; rowNum <= hssfSheet.getLastRowNum()-5; rowNum++) {
	                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
	                if (hssfRow != null) {
	                	Map<String,String> map= new HashMap<String,String>();
	                    HSSFCell number = hssfRow.getCell(1);
	                    HSSFCell useDepartment = hssfRow.getCell(6);
	                    HSSFCell address = hssfRow.getCell(24);
	                    map.put("number", getValue(number));
	                    map.put("useDepartment", getValue(useDepartment));
	                    map.put("address", getValue(address));
	                    list.add(map);
//	                    list.add(student);
	                }
	            }
//	        }
	        return list;
	    }
	    
	    public List<AssetBaseInfo> readXlsx2BaseInfo(InputStream is) throws IOException {
	        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
	        List<AssetBaseInfo> list = new ArrayList<AssetBaseInfo>();
	        // Read the Sheet
//	        for (int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++) {
	            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
	            if (xssfSheet == null) {
//	                continue;
	            	throw new IllegalArgumentException("param error");
	            }
	            // Read the Row
	            for (int rowNum = 2; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
	                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
	                if (xssfRow != null) {
	                	//类别
	                	XSSFCell cate = xssfRow.getCell(0);
	                	//名称
	                	XSSFCell assetName = xssfRow.getCell(1);
	                	//出厂编号
	                	XSSFCell assetSerial = xssfRow.getCell(2);
	                	//生产期
	                    XSSFCell assetBornDate = xssfRow.getCell(3);
	                    //IT验收编号
	                    XSSFCell assetItNumber = xssfRow.getCell(4);
	                    //业务线条归属
	                    XSSFCell  assetBusiness = xssfRow.getCell(5);
	                    //采购执行编码
	                    XSSFCell  assetBuyCode = xssfRow.getCell(6);
	                    //固定资产编码
	                    XSSFCell  assetNumber = xssfRow.getCell(7);
	                    //设备状态
	                    XSSFCell  assetDeviceStatus = xssfRow.getCell(8);
	                    //在库状态
	                    XSSFCell assetStockStatus = xssfRow.getCell(9);
	                    
	                    //到货入库日期
	                    XSSFCell assetArriveDate = xssfRow.getCell(10);
	                    
	                    //领用部门
	                    XSSFCell assetUseDepartment = xssfRow.getCell(11);
	                    //领用人
	                    XSSFCell assetUser = xssfRow.getCell(12);
	                    //领用日期
	                    XSSFCell assetUseDate = xssfRow.getCell(13);
	                    //备注1
	                    XSSFCell assetRemark = xssfRow.getCell(14);
	                    //操作系统类型
	                    XSSFCell ostype = xssfRow.getCell(16);
	                    
	                    //mac地址
	                    XSSFCell mac = xssfRow.getCell(17);
	                    //保修截止日期
	                    XSSFCell assetRepairDate = xssfRow.getCell(18);
	                    //备注2
	                    XSSFCell assetRemark2 = xssfRow.getCell(19);
	                    
	                    //备注4
	                    XSSFCell assetRemark4 = xssfRow.getCell(20);
	                    //验收合格日期
	                    XSSFCell assetCheckDate = xssfRow.getCell(21);
	                    //发票号
	                    XSSFCell assetInvoice = xssfRow.getCell(22);
	                    //备注3
	                    XSSFCell assetRemark3 = xssfRow.getCell(23);
	                    
	                	AssetBaseInfo baseInfo = new AssetBaseInfo();
	                	baseInfo.setAssetModel("无");
	                	baseInfo.setAssetStatus("1");
	                	baseInfo.setAssetCate(getValue(cate));
	                	baseInfo.setAssetStockStatus(getValue(assetStockStatus));
	                	baseInfo.setAssetBusiness(getValue(assetBusiness));
	                	baseInfo.setAssetType(getValue(cate));
	                    baseInfo.setAssetNumber(getValue(assetNumber));
	                    baseInfo.setAssetItNumber(getValue(assetItNumber));
	                    baseInfo.setAssetName(getValue(assetName));
//	                    baseInfo.setAssetDeviceLocation(assetDeviceLocation);
	                    baseInfo.setAssetUser(getValue(assetUser));
	                    baseInfo.setAssetArriveDate(getValue(assetArriveDate));
	                    baseInfo.setAssetBornDate(getValue(assetBornDate));
	                    
	                    baseInfo.setAssetInvoice(getValue(assetInvoice));
	                    baseInfo.setAssetCheckDate(getValue(assetCheckDate));
	                    baseInfo.setAssetRemark2(getValue(assetRemark2));
	                    baseInfo.setAssetRemark(getValue(assetRemark));
	                    baseInfo.setAssetRepairDate(getValue(assetRepairDate));
	                    
	                    baseInfo.setAssetUseDate(getValue(assetUseDate));
	                    baseInfo.setAssetUseDepartment(getValue(assetUseDepartment));
	                    
	                    baseInfo.setAssetSerial(getValue(assetSerial));
	                    baseInfo.setAssetDeviceStatus(getValue(assetDeviceStatus));
	                    
	                    list.add(baseInfo);
	                }
	            }
//	        }
	        return list;
	    }
	    
	    public List<AssetBaseInfo> readXls2BaseInfo(InputStream is) throws IOException {
	        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
	        List<AssetBaseInfo> list = new ArrayList<AssetBaseInfo>();
	        // Read the Sheet
//	        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
	            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
	            if (hssfSheet == null) {
//	                continue;
	            	throw new IllegalArgumentException("param error");
	            }
	            // Read the Row
	            for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
	                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
	                if (hssfRow != null) {
	                	//类别
	                	HSSFCell cate = hssfRow.getCell(0);
	                	//名称
	                	HSSFCell assetName = hssfRow.getCell(1);
	                	//出厂编号
	                	HSSFCell assetSerial = hssfRow.getCell(2);
	                	//生产期
	                    HSSFCell assetBornDate = hssfRow.getCell(3);
	                    //IT验收编号
	                    HSSFCell assetItNumber = hssfRow.getCell(4);
	                    //业务线条归属
	                    HSSFCell  assetBusiness = hssfRow.getCell(5);
	                    //采购执行编码
	                    HSSFCell  assetBuyCode = hssfRow.getCell(6);
	                    //固定资产编码
	                    HSSFCell  assetNumber = hssfRow.getCell(7);
	                    //设备状态
	                    HSSFCell  assetDeviceStatus = hssfRow.getCell(8);
	                    //在库状态
	                    HSSFCell assetStockStatus = hssfRow.getCell(9);
	                    
	                    //到货入库日期
	                    HSSFCell assetArriveDate = hssfRow.getCell(10);
	                    
	                    //领用部门
	                    HSSFCell assetUseDepartment = hssfRow.getCell(11);
	                    //领用人
	                    HSSFCell assetUser = hssfRow.getCell(12);
	                    //领用日期
	                    HSSFCell assetUseDate = hssfRow.getCell(13);
	                    //备注1
	                    HSSFCell assetRemark = hssfRow.getCell(14);
	                    //操作系统类型
	                    HSSFCell ostype = hssfRow.getCell(16);
	                    
	                    //mac地址
	                    HSSFCell mac = hssfRow.getCell(17);
	                    //保修截止日期
	                    HSSFCell assetRepairDate = hssfRow.getCell(18);
	                    //备注2
	                    HSSFCell assetRemark2 = hssfRow.getCell(19);
	                    
	                    //备注4
	                    HSSFCell assetRemark4 = hssfRow.getCell(20);
	                    //验收合格日期
	                    HSSFCell assetCheckDate = hssfRow.getCell(21);
	                    //发票号
	                    HSSFCell assetInvoice = hssfRow.getCell(22);
	                    //备注3
	                    HSSFCell assetRemark3 = hssfRow.getCell(23);
	                    
	                	AssetBaseInfo baseInfo = new AssetBaseInfo();
	                	baseInfo.setAssetStatus("1");
	                	baseInfo.setAssetModel("无");
	                	baseInfo.setAssetCate(getValue(cate));
	                	baseInfo.setAssetStockStatus(getValue(assetStockStatus));
	                	baseInfo.setAssetBusiness(getValue(assetBusiness));
	                	baseInfo.setAssetType(getValue(cate));
	                    baseInfo.setAssetNumber(getValue(assetNumber));
	                    baseInfo.setAssetItNumber(getValue(assetItNumber));
	                    baseInfo.setAssetName(getValue(assetName));
//	                    baseInfo.setAssetDeviceLocation(assetDeviceLocation);
	                    baseInfo.setAssetUser(getValue(assetUser));
	                    baseInfo.setAssetArriveDate(getValue(assetArriveDate));
	                    baseInfo.setAssetBornDate(getValue(assetBornDate));
	                    
	                    baseInfo.setAssetInvoice(getValue(assetInvoice));
	                    baseInfo.setAssetCheckDate(getValue(assetCheckDate));
	                    baseInfo.setAssetRemark2(getValue(assetRemark2));
	                    baseInfo.setAssetRemark(getValue(assetRemark));
	                    baseInfo.setAssetRepairDate(getValue(assetRepairDate));
	                    
	                    baseInfo.setAssetUseDate(getValue(assetUseDate));
	                    baseInfo.setAssetUseDepartment(getValue(assetUseDepartment));
	                    
	                    baseInfo.setAssetSerial(getValue(assetSerial));
	                    baseInfo.setAssetDeviceStatus(getValue(assetDeviceStatus));
	                    
	                    list.add(baseInfo);
	                    list.add(baseInfo);
	                }
	            }
//	        }
	        return list;
	    }


	    @SuppressWarnings("static-access")
	    private String getValue(XSSFCell xssfRow) {
	        if (xssfRow.getCellType() == xssfRow.CELL_TYPE_BOOLEAN) {
	            return String.valueOf(xssfRow.getBooleanCellValue());
	        } else if (xssfRow.getCellType() == xssfRow.CELL_TYPE_NUMERIC) {
	            return String.valueOf(xssfRow.getNumericCellValue());
	        } else {
	            return String.valueOf(xssfRow.getStringCellValue());
	        }
	    }

	    @SuppressWarnings("static-access")
	    private String getValue(HSSFCell hssfCell) {
	        if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
	            return String.valueOf(hssfCell.getBooleanCellValue());
	        } else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
	            return String.valueOf(hssfCell.getNumericCellValue());
	        } else {
	            return String.valueOf(hssfCell.getStringCellValue());
	        }
	    }
	    
}
