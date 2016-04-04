package jb.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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
