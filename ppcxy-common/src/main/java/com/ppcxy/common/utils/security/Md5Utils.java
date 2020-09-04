package com.ppcxy.common.utils.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

public class Md5Utils {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(Md5Utils.class);
    
    
    private static byte[] md5(byte[] bytes) {
        MessageDigest algorithm;
        try {
            algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(bytes);
            byte[] messageDigest = algorithm.digest();
            return messageDigest;
        } catch (Exception e) {
            LOGGER.error("MD5 Error...", e);
        }
        
        return null;
    }
    
    
    private static final String toHex(byte hash[]) {
        if (hash == null) {
            return null;
        }
        StringBuffer buf = new StringBuffer(hash.length * 2);
        int i;
        
        for (i = 0; i < hash.length; i++) {
            if ((hash[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString(hash[i] & 0xff, 16));
        }
        return buf.toString();
    }
    
    public static String hash(String s) {
        return hash(s.getBytes());
    }
    
    public static String hash(byte[] bytes) {
        try {
            return new String(toHex(md5(bytes)).getBytes("UTF-8"), "UTF-8");
        } catch (Exception e) {
            LOGGER.error("not supported charset...{}", e);
            return new String(bytes);
        }
    }
    
    
}
