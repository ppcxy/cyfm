//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package org.springframework.aop.support;

import org.springframework.aop.*;
import org.springframework.core.BridgeMethodResolver;
import org.springframework.util.Assert;
import org.springframework.util.ClassUtils;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;

public abstract class AopUtils {
    public AopUtils() {
    }

    public static boolean isAopProxy(Object object) {
        return object instanceof SpringProxy && (Proxy.isProxyClass(object.getClass()) || ClassUtils.isCglibProxyClass(object.getClass()));
    }

    /** old version support **/
    public static boolean isCglibProxyClass(Class classsClass) {
        return ClassUtils.isCglibProxyClass(classsClass);
    }

    public static boolean isJdkDynamicProxy(Object object) {
        return object instanceof SpringProxy && Proxy.isProxyClass(object.getClass());
    }

    public static boolean isCglibProxy(Object object) {
        return object instanceof SpringProxy && ClassUtils.isCglibProxy(object);
    }

    public static Class<?> getTargetClass(Object candidate) {
        Assert.notNull(candidate, "Candidate object must not be null");
        Class result = null;
        if (candidate instanceof TargetClassAware) {
            result = ((TargetClassAware) candidate).getTargetClass();
        }

        if (result == null) {
            result = isCglibProxy(candidate) ? candidate.getClass().getSuperclass() : candidate.getClass();
        }

        return result;
    }

    public static boolean isEqualsMethod(Method method) {
        return ReflectionUtils.isEqualsMethod(method);
    }

    public static boolean isHashCodeMethod(Method method) {
        return ReflectionUtils.isHashCodeMethod(method);
    }

    public static boolean isToStringMethod(Method method) {
        return ReflectionUtils.isToStringMethod(method);
    }

    public static boolean isFinalizeMethod(Method method) {
        return method != null && method.getName().equals("finalize") && method.getParameterTypes().length == 0;
    }
    /** old version support **/
    public static Method selectInvocableMethod(Method method, Class<?> targetClass) {
        return getMostSpecificMethod(method, targetClass);
    }

    public static Method getMostSpecificMethod(Method method, Class<?> targetClass) {
        Method resolvedMethod = ClassUtils.getMostSpecificMethod(method, targetClass);
        return BridgeMethodResolver.findBridgedMethod(resolvedMethod);
    }

    public static boolean canApply(Pointcut pc, Class<?> targetClass) {
        return canApply(pc, targetClass, false);
    }

    public static boolean canApply(Pointcut pc, Class<?> targetClass, boolean hasIntroductions) {
        Assert.notNull(pc, "Pointcut must not be null");
        if (!pc.getClassFilter().matches(targetClass)) {
            return false;
        } else {
            MethodMatcher methodMatcher = pc.getMethodMatcher();
            IntroductionAwareMethodMatcher introductionAwareMethodMatcher = null;
            if (methodMatcher instanceof IntroductionAwareMethodMatcher) {
                introductionAwareMethodMatcher = (IntroductionAwareMethodMatcher) methodMatcher;
            }

            LinkedHashSet classes = new LinkedHashSet(ClassUtils.getAllInterfacesForClassAsSet(targetClass));
            classes.add(targetClass);
            Iterator var6 = classes.iterator();

            while (var6.hasNext()) {
                Class clazz = (Class) var6.next();
                Method[] methods = clazz.getMethods();
                Method[] var9 = methods;
                int var10 = methods.length;

                for (int var11 = 0; var11 < var10; ++var11) {
                    Method method = var9[var11];
                    if (introductionAwareMethodMatcher != null && introductionAwareMethodMatcher.matches(method, targetClass, hasIntroductions) || methodMatcher.matches(method, targetClass)) {
                        return true;
                    }
                }
            }

            return false;
        }
    }

    public static boolean canApply(Advisor advisor, Class<?> targetClass) {
        return canApply(advisor, targetClass, false);
    }

    public static boolean canApply(Advisor advisor, Class<?> targetClass, boolean hasIntroductions) {
        if (advisor instanceof IntroductionAdvisor) {
            return ((IntroductionAdvisor) advisor).getClassFilter().matches(targetClass);
        } else if (advisor instanceof PointcutAdvisor) {
            PointcutAdvisor pca = (PointcutAdvisor) advisor;
            return canApply(pca.getPointcut(), targetClass, hasIntroductions);
        } else {
            return true;
        }
    }

    public static List<Advisor> findAdvisorsThatCanApply(List<Advisor> candidateAdvisors, Class<?> clazz) {
        if (candidateAdvisors.isEmpty()) {
            return candidateAdvisors;
        } else {
            LinkedList eligibleAdvisors = new LinkedList();
            Iterator hasIntroductions = candidateAdvisors.iterator();

            while (hasIntroductions.hasNext()) {
                Advisor candidate = (Advisor) hasIntroductions.next();
                if (candidate instanceof IntroductionAdvisor && canApply(candidate, clazz)) {
                    eligibleAdvisors.add(candidate);
                }
            }

            boolean hasIntroductions1 = !eligibleAdvisors.isEmpty();
            Iterator candidate2 = candidateAdvisors.iterator();

            while (candidate2.hasNext()) {
                Advisor candidate1 = (Advisor) candidate2.next();
                if (!(candidate1 instanceof IntroductionAdvisor) && canApply(candidate1, clazz, hasIntroductions1)) {
                    eligibleAdvisors.add(candidate1);
                }
            }

            return eligibleAdvisors;
        }
    }

    public static Object invokeJoinpointUsingReflection(Object target, Method method, Object[] args) throws Throwable {
        try {
            ReflectionUtils.makeAccessible(method);
            return method.invoke(target, args);
        } catch (InvocationTargetException var4) {
            throw var4.getTargetException();
        } catch (IllegalArgumentException var5) {
            throw new AopInvocationException("AOP configuration seems to be invalid: tried calling method [" + method + "] on target [" + target + "]", var5);
        } catch (IllegalAccessException var6) {
            throw new AopInvocationException("Could not access method [" + method + "]", var6);
        }
    }
}
