package com.ppcxy.cyfm.filestore.upload.support.utils;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

import java.io.*;
import java.util.Collection;
import java.util.Enumeration;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;

/**
 * 文件上传、打包工具类
 */
public class PackageZipUtils {
    
    public static Boolean zip(Collection<File> files, String destFilePath, String baseDir) {
        
        File zipFile = new File(destFilePath);
        
        FileOutputStream fos = null;
        CheckedOutputStream cos = null;
        ZipOutputStream zos = null;
        
        try {
            
            fos = new FileOutputStream(zipFile);
            cos = new CheckedOutputStream(fos, new CRC32());
            zos = new ZipOutputStream(cos);
            
            System.setProperty("sun.zip.encoding", System.getProperty("sun.jnu.encoding"));
            zos.setEncoding(System.getProperty("sun.jnu.encoding"));
            
            ZipOutputStream finalZos = zos;
            
            files.forEach(f -> {
                compressbyType(f, finalZos, baseDir);
            });
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            IOUtils.closeQuietly(zos);
            IOUtils.closeQuietly(cos);
            IOUtils.closeQuietly(fos);
        }
        
        return true;
    }
    
    public static void zip(String srcFilePath, String destFilePath, String baseDir) {
        
        File src = new File(srcFilePath);
        
        if (!src.exists()) {
            throw new RuntimeException(srcFilePath + "不存在");
        }
        
        File zipFile = new File(destFilePath);
        
        FileOutputStream fos = null;
        CheckedOutputStream cos = null;
        ZipOutputStream zos = null;
        try {
            
            fos = new FileOutputStream(zipFile);
            cos = new CheckedOutputStream(fos, new CRC32());
            zos = new ZipOutputStream(cos);
            
            compressbyType(src, zos, baseDir);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(zos);
            IOUtils.closeQuietly(cos);
            IOUtils.closeQuietly(fos);
        }
        
    }
    
    
    private static void compressbyType(File src, ZipOutputStream zos, String baseDir) {
        
        if (!src.exists()) {
            return;
        }
        
        if (src.isFile()) {
            compressFile(src, zos, baseDir, false);
        } else if (src.isDirectory()) {
            compressDir(src, zos, baseDir);
        }
    }
    
    
    /**
     * 压缩文件
     */
    
    private static void compressFile(File file, ZipOutputStream zos, String baseDir, Boolean closeZos) {
        
        if (!file.exists()) {
            return;
        }
        
        if (StringUtils.isNotBlank(baseDir) && !baseDir.endsWith("/") && !baseDir.endsWith("\\")) {
            baseDir += File.separator;
            
        }
        
        FileInputStream is = null;
        
        try {
            is = new FileInputStream(file);
            
            ZipEntry entry = new ZipEntry(baseDir + file.getName());
            zos.putNextEntry(entry);
            
            
            IOUtils.copy(is, zos);
        } catch (IOException e) {
            /// no oper
        } finally {
            IOUtils.closeQuietly(is);
            if (closeZos) {
                IOUtils.closeQuietly(zos);
            }
            
        }
        
    }
    
    
    /**
     * 压缩文件夹
     */
    
    private static void compressDir(File dir, ZipOutputStream zos, String baseDir) {
        
        if (!dir.exists()) {
            return;
        }
        
        File[] files = dir.listFiles();
        
        if (files.length == 0) {
            
            try {
                zos.putNextEntry(new ZipEntry(baseDir + dir.getName() + File.separator));
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        }
        
        for (File file : files) {
            compressbyType(file, zos, baseDir + dir.getName() + File.separator);
        }
    }
    
    
    /**
     * 解压缩
     *
     * @param srcFile 压缩包
     * @param dest    解压路径
     * @throws Exception
     */
    public static void unzip(File srcFile, String dest) throws IOException {
        
        if (!srcFile.exists()) {
            throw new RuntimeException(srcFile.getPath() + "所指文件不存在");
        }
        
        ZipFile zipFile = new ZipFile(srcFile);
        Enumeration entries = zipFile.getEntries();
        
        ZipEntry entry = null;
        
        while (entries.hasMoreElements()) {
            
            entry = (ZipEntry) entries.nextElement();
            //System.out.println("解压" + entry.getName());
            
            if (entry.isDirectory()) {
                String dirPath = dest + File.separator + entry.getName();
                File dir = new File(dirPath);
                dir.mkdirs();
            } else {
                // 表示文件
                File file = new File(dest + File.separator + entry.getName());
                
                if (!file.exists()) {
                    String parentPath = file.getParent();
                    File parentDir = new File(parentPath);
                    parentDir.mkdirs();
                }
                
                file.createNewFile();
                
                // 将压缩文件内容写入到这个文件中
                InputStream is = null;
                FileOutputStream fos = null;
                is = zipFile.getInputStream(entry);
                fos = new FileOutputStream(file);
                
                IOUtils.copy(is, fos);
                
                IOUtils.closeQuietly(is);
                IOUtils.closeQuietly(fos);
            }
            
        }
        
    }
}
