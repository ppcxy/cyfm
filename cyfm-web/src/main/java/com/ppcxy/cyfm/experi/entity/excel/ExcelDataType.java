package com.ppcxy.cyfm.experi.entity.excel;

/**
 * <p>Date: 13-7-12 下午8:55
 * <p>Version: 1.0
 */
public enum ExcelDataType {
    
    csv("CSV"),
    excel2007("Excel 2007");
    
    private final String info;
    
    private ExcelDataType(final String info) {
        this.info = info;
    }
    
    public String getInfo() {
        return info;
    }
}
