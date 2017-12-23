package com.itheima.util.vo;


import java.util.ArrayList;
import java.util.List;

/**
 * <p/> File Name             : Page
 * <p/> Author                : watson
 * <p/> Create Date           : 2015/6/7 16:00
 * <p/> Description           : 与具体ORM实现无关的分页参数及查询结果封装,所有序号从1开始
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
public class Page<T> {
    //-- 公共变量 --//
    public static final String ASC = "asc";
    public static final String DESC = "desc";

    public static final int FIRST_PAGE = 1;

    //-- 分页参数 --//
    protected int pageNo = FIRST_PAGE;
    protected int pageSize = 1;
    protected boolean autoCount = true;

    //排序条件:升序降序按照下划线隔开,不同排序条件之间以#隔开 birthday_asc#name_desc
    private String sortKeyValueJoint;

    //-- 返回结果 --//
    protected List<T> result = new ArrayList<>();
    protected long totalCount = -1;

    public Page() {
    }

    public Page(int pageNo) {
        this.pageSize = 10;
        this.pageNo = pageNo;
    }

    public Page(int pageNo,int pageSize) {
        this.pageSize = pageSize;
        this.pageNo = pageNo;
    }

    //-- 分页参数访问函数 --//

    /**
     * 获得当前页的页号,序号从1开始,默认为1.
     */
    public int getPageNo() {
        return pageNo;
    }

    /**
     * 设置当前页的页号,序号从1开始,低于1时自动调整为1.
     */
    public void setPageNo(final int pageNo) {
        this.pageNo = pageNo;

        if (pageNo < 1) {
            this.pageNo = 1;
        }
    }

    /**
     * 返回Page对象自身的setPageNo函数,可用于连续设置。
     */
    public Page<T> pageNo(final int thePageNo) {
        setPageNo(thePageNo);
        return this;
    }

    /**
     * 获得每页显示条数
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置每页的记录数量.
     */
    public void setPageSize(final int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 返回Page对象自身的setPageSize函数,可用于连续设置。
     */
    public Page<T> pageSize(final int thePageSize) {
        setPageSize(thePageSize);
        return this;
    }

    /**
     * 根据pageNo和pageSize计算当前页第一条记录在总结果集中的位置,序号从1开始.
     */
    public int getFirst() {
//        int first = ((pageNo - 1) * pageSize) + 1;
//        return first == 0 ? 1 : first;
//        int first = ((pageNo - 1) * pageSize) + 1;
        return ((pageNo - 1) * pageSize);

    }

    /**
     * 根据pageNo和pageSize计算当前页最后一条记录在总结果集中的位置,序号从1开始.
     */
    public int getLast() {
        int last = ((pageNo) * pageSize);
        return last > totalCount ? (int) totalCount : last;
    }

    /**
     * 获得查询对象时是否先自动执行count查询获取总记录数, 默认为false.
     */
    public boolean isAutoCount() {
        return autoCount;
    }

    /**
     * 设置查询对象时是否自动先执行count查询获取总记录数.
     */
    public void setAutoCount(final boolean autoCount) {
        this.autoCount = autoCount;
    }

    /**
     * 返回Page对象自身的setAutoCount函数,可用于连续设置。
     */
    public Page<T> autoCount(final boolean theAutoCount) {
        setAutoCount(theAutoCount);
        return this;
    }

    //-- 访问查询结果函数 --//

    /**
     * 获得页内的记录列表.
     */
    public List<T> getResult() {
        if (result == null) return new ArrayList<T>();
        return result;
    }

    /**
     * 设置页内的记录列表.
     */
    public void setResult(final List<T> result) {
        this.result = result;
    }

    /**
     * 获得总记录数, 默认值为-1.
     */
    public long getTotalCount() {
        return totalCount;
    }

    /**
     * 设置总记录数.
     */
    public void setTotalCount(final long totalCount) {
        this.totalCount = totalCount;
    }

    /**
     * 根据pageSize与totalCount计算总页数, 默认值为-1.
     */
    public long getTotalPages() {
        if (totalCount < 0) {
            return -1;
        }

        long count = totalCount / pageSize;
        if (totalCount % pageSize > 0) {
            count++;
        }
        return count;
    }

    /**
     * 是否还有下一页.
     */
    public boolean isHasNext() {
        return (pageNo + 1 <= getTotalPages());
    }

    /**
     * 取得下页的页号, 序号从1开始.
     * 当前页为尾页时仍返回尾页序号.
     */
    public int getNextPage() {
        if (isHasNext()) {
            return pageNo + 1;
        } else {
            return pageNo;
        }
    }

    /**
     * 是否还有上一页.
     */
    public boolean isHasPre() {
        return (pageNo - 1 >= 1);
    }

    /**
     * 取得上页的页号, 序号从1开始.
     * 当前页为首页时返回首页序号.
     */
    public int getPrePage() {
        if (isHasPre()) {
            return pageNo - 1;
        } else {
            return pageNo;
        }
    }

    public int getFirstPage() {
        return FIRST_PAGE;
    }

    public int getLastPage() {
        int totalPage = (int) (totalCount / pageSize);
        totalPage = totalCount % pageSize > 0 ? totalPage + 1 : totalPage;
        return totalPage == 0 ? 1 : totalPage;
    }

    public String getSortKeyValueJoint() {
        return sortKeyValueJoint;
    }

    public void setSortKeyValueJoint(String sortKeyValueJoint) {
        this.sortKeyValueJoint = sortKeyValueJoint;
    }
}
