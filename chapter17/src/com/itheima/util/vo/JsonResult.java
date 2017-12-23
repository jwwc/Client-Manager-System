package com.itheima.util.vo;


/**
 * <p/> File Name             : JsonResult
 * <p/> Author                : watson
 * <p/> Create Date           : 2015/6/7 16:22
 * <p/> Description           :
 * <p/>
 * <p/>
 * <p/>
 * <p/> Reviewed By           :
 * <p/> Reviewed On           :
 * <p/> Version History       :
 * <p/> Modified By           :
 * <p/> Modified Date         :
 * <p/> Comments              :
 * <p/> CopyRight             :
 * <p/> *******************************************************************************************
 */
public class JsonResult {
    private boolean success;
    private String  info;
    private Object  data;

    public JsonResult(){
        this(true, null, null);
    }

    public JsonResult(boolean success){
        this(success, null, null);
    }

    public JsonResult(boolean success, String info){
        this(success, info, null);
    }

    public JsonResult(boolean success, String info, Object data){
        this.success = success;
        this.info = info;
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}