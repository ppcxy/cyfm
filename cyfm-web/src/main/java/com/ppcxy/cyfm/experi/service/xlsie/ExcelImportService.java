package com.ppcxy.cyfm.experi.service.xlsie;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ppcxy.common.utils.FileCharset;
import com.ppcxy.cyfm.sys.entity.user.User;
import org.apache.commons.io.IOUtils;
import org.apache.commons.io.LineIterator;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.AopContext;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * <p>Date: 13-2-4 下午3:01
 * <p>Version: 1.0
 */
@Service
public class ExcelImportService {

    private final Logger log = LoggerFactory.getLogger(ExcelImportService.class);

    private int batchSize = 1000; //批处理大小
    private int pageSize = 1000;//查询时每页大小


    /**
     * 导出文件的最大大小 超过这个大小会压缩
     */
    private final int MAX_EXPORT_FILE_SIZE = 10 * 1024 * 1024; //10MB



    private final String storePath = "upload/excel";
    private final String EXPORT_FILENAME_PREFIX = "excel";

  
    /**
     * 如果主键冲突 覆盖，否则新增
     *
     * @param dataList
     */
    public void doBatchSave(final List<Map<String,Object>> dataList) {
        for (Map<String,Object> data : dataList) {
            System.out.println(data);
            //处理数据导入，根据名称判断重复，重复的做更新
        }
    }

    /**
     * csv格式
     *
     * @param user
     * @param is
     */
    @Async
    public void importCvs(final User user,String infoType ,final InputStream is) {
        String[] columns = new ExcelImportColumnsHandler(infoType).getColumns();
       
        
        ExcelImportService proxy = ((ExcelImportService) AopContext.currentProxy());
        BufferedInputStream bis = null;
        try {
            long beginTime = System.currentTimeMillis();

            bis = new BufferedInputStream(is);
            String encoding = FileCharset.getCharset(bis);

            LineIterator iterator = IOUtils.lineIterator(bis, encoding);

            String separator = ",";
            int totalSize = 0; //总大小

            final List<Map<String,Object>> dataList = Lists.newArrayList();

            if (iterator.hasNext()) {
                iterator.nextLine();//跳过第一行标题
            }

            while (iterator.hasNext()) {

                totalSize++;

                String line = iterator.nextLine();
                String[] dataArray = StringUtils.split(line, separator);
    
                if(dataArray.length!= columns.length){
                    continue;
                }
                
                Map<String, Object> data = Maps.newHashMap();
                for (int i = 0; i < columns.length; i++) {
                    data.put(columns[i], dataArray[i]);
                }
    
                dataList.add(data);

                if (totalSize % batchSize == 0) {
                    try {
                        proxy.doBatchSave(dataList);
                    } catch (Exception e) {
                    
                    }
                    dataList.clear();
                }
            }

            if (dataList.size() > 0) {
                proxy.doBatchSave(dataList);
            }

            long endTime = System.currentTimeMillis();

            Map<String, Object> context = Maps.newHashMap();
            context.put("seconds", (endTime - beginTime) / 1000);
        } catch (Exception e) {
            log.error("excel import error", e);
            Map<String, Object> context = Maps.newHashMap();
            context.put("error", e.getMessage());
        } finally {
            IOUtils.closeQuietly(bis);
        }
    }
    
    
    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
    
    @Async
    public void importExcel2007(final User user,String infoType, final InputStream is) {
        final List<Map<String,Object>> dataList = Lists.newArrayList();
        ExcelImportColumnsHandler excelImportColumnsHandler = new ExcelImportColumnsHandler(infoType);
        String[] columns = excelImportColumnsHandler.getColumns();
    
        try {
            Workbook workbook = WorkbookFactory.create(is); //这种方式 Excel 2003/2007/2010 都是可以处理的
            int sheetCount = workbook.getNumberOfSheets();  //Sheet的数量
            //遍历每个Sheet
            for (int s = 0; s < sheetCount; s++) {
                Sheet sheet = workbook.getSheetAt(s);
                int rowCount = sheet.getPhysicalNumberOfRows(); //获取总行数
                //遍历每一行
                for (int r = 1; r < rowCount; r++) {
                   
                    Row row = sheet.getRow(r);
                    if(row==null) continue;
    
                    Map<String, Object> data = Maps.newHashMap();
                    
                    int cellCount = row.getPhysicalNumberOfCells(); //获取总列数
                    //遍历每一列
                    for (int c = 0; c < cellCount; c++) {
                        Cell cell = row.getCell(c);
                        int cellType = cell.getCellType();
                        String cellValue = "";
                        switch(cellType) {
                            case Cell.CELL_TYPE_STRING: //文本
                                cellValue = cell.getStringCellValue();
                                break;
                            case Cell.CELL_TYPE_NUMERIC: //数字、日期
                                if(DateUtil.isCellDateFormatted(cell)) {
                                    cellValue = fmt.format(cell.getDateCellValue()); //日期型
                                }
                                else {
                                    cellValue = String.valueOf(cell.getNumericCellValue()); //数字
                                }
                                break;
                            case Cell.CELL_TYPE_BOOLEAN: //布尔型
                                cellValue = String.valueOf(cell.getBooleanCellValue());
                                break;
                            case Cell.CELL_TYPE_BLANK: //空白
                                cellValue = cell.getStringCellValue();
                                break;
                            case Cell.CELL_TYPE_ERROR: //错误
                                cellValue = "错误";
                                break;
                            case Cell.CELL_TYPE_FORMULA: //公式
                                cellValue = "错误";
                                break;
                            default:
                                cellValue = "错误";
                        }                                                                 
                        data.put(columns[c], cellValue.trim());
                    }
                    dataList.add(data);
                }
    
                if (dataList.size() > 0) {
                    excelImportColumnsHandler.saveDatas(dataList);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        }
    }

}
