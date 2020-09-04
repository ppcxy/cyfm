package com.ppcxy.common.utils;

import java.lang.management.ManagementFactory;

public class JvmPidUtils {
    public static String getPid() {
        String pid = ManagementFactory.getRuntimeMXBean().getName();
        int indexOf = pid.indexOf('@');
        if (indexOf > 0) {
            pid = pid.substring(0, indexOf);
        }
        
        return pid;
    }
}
