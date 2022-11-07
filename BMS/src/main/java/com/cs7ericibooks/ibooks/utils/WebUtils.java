package com.cs7ericibooks.ibooks.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.util.Map;

public class WebUtils {

    /**
     * 把 map 中的值 注入到对应的 JavaBean 属性中
     * @param value
     * @param bean
     * @param <T>
     * @return
     */
    public static <T> T copyParamToBean(Map value, T bean){


        /*
        把所有请求的参数都注入到 user 对象中
         */
        try {
            System.out.println("注入之前" + bean);
            BeanUtils.populate(bean,value);
            System.out.println("注入之后" + bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }


    /**
     * 将 字符串转换为 int  类型数据
     * @param strInt
     * @param defaultValue
     * @return
     */
    public static int parseInt(String strInt,int defaultValue){

        try {
            if (strInt != null) {
                return Integer.parseInt(strInt);
            } else {
                return defaultValue;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return defaultValue;
    }
}
