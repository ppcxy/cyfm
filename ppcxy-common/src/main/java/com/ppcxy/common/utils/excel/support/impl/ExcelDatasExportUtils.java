package com.ppcxy.common.utils.excel.support.impl;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ppcxy.common.entity.AbstractEntity;
import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.spring.SpringContextHolder;
import com.ppcxy.common.utils.excel.model.DataColumn;
import com.ppcxy.common.utils.excel.support.ExcelDataAbstract;
import com.ppcxy.manage.maintain.notification.support.NotificationApi;
import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springside.modules.utils.Collections3;
import org.springside.modules.utils.Reflections;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class ExcelDatasExportUtils<T extends AbstractEntity> extends ExcelDataAbstract {
    
    private final List<DataColumn> columns = Lists.newArrayList();
    
    public ExcelDatasExportUtils() {
    }
    
    public ExcelDatasExportUtils(Class<T> dataClass) {
        this.columns.addAll(initColumns(dataClass));
    }
    
    
    /**
     * 设置数据列信息
     *
     * @param dataColumns
     */
    public void setColumns(List<DataColumn> dataColumns) {
        columns.addAll(dataColumns);
    }
    
    /**
     * 获取数据列信息
     *
     * @param dataColumn
     */
    public void setColumn(DataColumn dataColumn) {
        columns.add(dataColumn);
    }
    
    
    public String exportTableDatas(String sheetName, List<T> datas, final String username, final String contextRootPath) {
        
        String resultUrl = null;
        
        String fileName = generateFilename(username, contextRootPath, "xlsx");
        File file = new File(fileName);
        BufferedOutputStream out = null;
        SXSSFWorkbook wb = null;
        try {
            long beginTime = System.currentTimeMillis();
            wb = new SXSSFWorkbook(rowAccessWindowSize);
            wb.setCompressTempFiles(true);//生成的临时文件将进行gzip压缩
            
            SXSSFSheet sheet = wb.createSheet("【" + sheetName + "】");
            sheet.trackAllColumnsForAutoSizing();
            
            Row headerRow = sheet.createRow(0);
            
            //设置表头
            for (int i = 0; i < columns.size(); i++) {
                Cell idHeaderCell = headerRow.createCell(i);
                idHeaderCell.setCellValue(columns.get(i).getTitle() + "[" + columns.get(i).getColumnName() + "]");
            }
            
            this.currentSheet = sheet;
            additionalDataForBean(datas);
            
            //设定冻结表头
            sheet.createFreezePane(0, 1, 0, 1);
            //for (int i = 0; i < columnNames.size(); i++) {
            //    sheet.autoSizeColumn(i); //调整第一列宽度
            //}
            
            out = new BufferedOutputStream(new FileOutputStream(file));
            wb.write(out);
            
            IOUtils.closeQuietly(out);
            
            if (needCompress(file)) {
                fileName = compressAndDeleteOriginal(fileName);
            }
            
            long endTime = System.currentTimeMillis();
            
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("seconds", (endTime - beginTime) / 1000);
            context.put("url", fileName.replace(contextRootPath, ""));
            SpringContextHolder.getBean(NotificationApi.class).notify(username, "excelExportSuccess", context);
            
            
            resultUrl = fileName.replace(contextRootPath, "");
        } catch (Exception e) {
            e.printStackTrace();
            IOUtils.closeQuietly(out);
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("error", e.getMessage());
            SpringContextHolder.getBean(NotificationApi.class).notify(username, "excelExportError", context);
            throw new BaseException("导出过程发生错误:" + e.getMessage(), e);
        } finally {
            // 清除本工作簿备份在磁盘上的临时文件
            wb.dispose();
        }
        return resultUrl;
    }
    
    
    private BufferedOutputStream out = null;
    private SXSSFWorkbook wb = null;
    private File file = null;
    private int totalRows = 1; //统计总行数
    private long beginTime = System.currentTimeMillis();
    private String sheetName = null;
    private String contextRootPath = null;
    private String username = null;
    private int rowAccessWindowSize = 200; //内存中保留的行数，超出后会写到磁盘
    
    private SXSSFSheet currentSheet;
    
    public void ready(String sheetName, final String username, final String contextRootPath) {
        this.sheetName = sheetName;
        this.username = username;
        this.contextRootPath = contextRootPath;
        
        //拼装出filename
        //创建导出文件
        file = new File(generateFilename(username, contextRootPath, "xlsx"));
        
        try {
            //创建workbook
            wb = new SXSSFWorkbook(rowAccessWindowSize);
            //生成的临时文件将进行gzip压缩
            wb.setCompressTempFiles(true);
            
            //创建sheet
            SXSSFSheet sheet = wb.createSheet("【" + sheetName + "】");
            //设置所有类自适应宽度
            sheet.trackAllColumnsForAutoSizing();
            
            //创建表头标题行
            Row headerRow = sheet.createRow(0);
            //设置表头标题行内容
            for (int i = 0; i < columns.size(); i++) {
                Cell idHeaderCell = headerRow.createCell(i);
                idHeaderCell.setCellValue(columns.get(i).getTitle() + "[" + columns.get(i).getColumnName() + "]");
            }
            
            //设定冻结表头
            sheet.createFreezePane(0, 1, 0, 1);
            //自适应宽度
            //for (int i = 0; i < columnNames.size(); i++) {
            //    sheet.autoSizeColumn(i); //调整第一列宽度
            //}
            this.currentSheet = sheet;
        } catch (Exception e) {
            IOUtils.closeQuietly(out);
            // 清除本工作簿备份在磁盘上的临时文件
            wb.dispose();
            
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("error", e.getMessage());
            notification("excelExportError", context);
            throw new BaseException("导出过程发生错误:" + e.getMessage(), e);
            
        }
    }
    
    public void additionalDataForMap(List<Map<String, Object>> datas) {
        for (Map<String, Object> data : datas) {
            Row row = currentSheet.createRow(totalRows);
            //根据反射取得导出数据
            for (int i = 0; i < columns.size(); i++) {
                Cell cell = row.createCell(i);
                Object cellValue = data.get(columns.get(i).getColumnName());
                setterCellValue(cell, cellValue);
            }
            totalRows++;
        }
    }
    
    public void additionalDataForBean(List<T> datas) {
        for (T data : datas) {
            Row row = currentSheet.createRow(totalRows);
            //根据反射取得导出数据
            for (int i = 0; i < columns.size(); i++) {
                Cell cell = row.createCell(i);
                Object cellValue = Reflections.getFieldValue(data, columns.get(i).getColumnName());
                if (cellValue == null) {
                    continue;
                }
                //对于导出配置中明确是关联类型的单独处理
                if (cellValue instanceof Collection) {
                    List ids = Collections3.extractToList((Collection) cellValue, "id");
                    
                    if (columns.get(i).getRefColumnName() != null && !"id".equals(columns.get(i).getRefColumnName())) {
                        Object fieldValue = Reflections.getFieldValue(data, columns.get(i).getRefColumnName());
                        for (int i1 = 0; i1 < ids.size(); i1++) {
                            String newVal = ids.get(i1).toString() + ";" + fieldValue;
                            ids.set(i1, newVal);
                        }
                        
                    }
                    cell.setCellValue(Collections3.convertToString(ids, ","));
                } else if (columns.get(i).getRefColumnName() != null) {
                    String id = Reflections.getFieldValue(cellValue, "id").toString();
                    String value = Reflections.getFieldValue(cellValue, columns.get(i).getRefColumnName()).toString();
                    cell.setCellValue(id + ";" + value);
                } else {
                    setterCellValue(cell, cellValue);
                }
                
            }
            totalRows++;
        }
    }
    
    public void complete() {
        String fileName = file.getName();
        try {
            out = new BufferedOutputStream(new FileOutputStream(file));
            wb.write(out);
            
            if (needCompress(file)) {
                fileName = compressAndDeleteOriginal(file.getName());
            }
            
            long endTime = System.currentTimeMillis();
            
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("seconds", (endTime - beginTime) / 1000);
            context.put("url", fileName.replace(contextRootPath, ""));
            notification("excelExportSuccess", context);
        } catch (Exception e) {
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("error", e.getMessage());
            notification("excelExportError", context);
            throw new BaseException("导出过程发生错误:" + e.getMessage(), e);
        } finally {
            IOUtils.closeQuietly(out);
            // 清除本工作簿备份在磁盘上的临时文件
            wb.dispose();
        }
    }
    
    
    public void notification(String template, Map<String, Object> context) {
        
        SpringContextHolder.getBean(NotificationApi.class).notify(username, template, context);
    }
    
    public String exportTableDatasForMap(String sheetName, List<Map<String, Object>> datas, final String username, final String contextRootPath) {
        if (columns.size() == 0) {
            return "error";
        }
        
        String resultUrl = null;
        
        String fileName = generateFilename(username, contextRootPath, "xlsx");
        File file = new File(fileName);
        BufferedOutputStream out = null;
        SXSSFWorkbook wb = null;
        try {
            long beginTime = System.currentTimeMillis();
            wb = new SXSSFWorkbook(rowAccessWindowSize);
            wb.setCompressTempFiles(true);//生成的临时文件将进行gzip压缩
            
            
            SXSSFSheet sheet = wb.createSheet("【" + sheetName + "】");
            sheet.trackAllColumnsForAutoSizing();
            
            Row headerRow = sheet.createRow(0);
            
            //设置表头
            for (int i = 0; i < columns.size(); i++) {
                Cell idHeaderCell = headerRow.createCell(i);
                idHeaderCell.setCellValue(columns.get(i).getTitle() + "[" + columns.get(i).getColumnName() + "]");
            }
            
            this.currentSheet = sheet;
            additionalDataForMap(datas);
            
            //设定冻结表头
            sheet.createFreezePane(0, 1, 0, 1);
            //for (int i = 0; i < columnNames.size(); i++) {
            //    sheet.autoSizeColumn(i); //调整第一列宽度
            //}
            
            out = new BufferedOutputStream(new FileOutputStream(file));
            wb.write(out);
            
            IOUtils.closeQuietly(out);
            
            if (needCompress(file)) {
                fileName = compressAndDeleteOriginal(fileName);
            }
            
            long endTime = System.currentTimeMillis();
            
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("seconds", (endTime - beginTime) / 1000);
            context.put("url", fileName.replace(contextRootPath, ""));
            SpringContextHolder.getBean(NotificationApi.class).notify(username, "excelExportSuccess", context);
            
            
            resultUrl = fileName.replace(contextRootPath, "");
        } catch (Exception e) {
            IOUtils.closeQuietly(out);
            Map<String, Object> context = Maps.newHashMap();
            context.put("model", sheetName);
            context.put("error", e.getMessage());
            SpringContextHolder.getBean(NotificationApi.class).notify(username, "excelExportError", context);
            throw new BaseException("导出过程发生错误:" + e.getMessage(), e);
        } finally {
            // 清除本工作簿备份在磁盘上的临时文件
            wb.dispose();
        }
        return resultUrl;
    }
    
    
    public static void main(String[] args) throws FileNotFoundException {
    
    }
}
