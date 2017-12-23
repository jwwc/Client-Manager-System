package com.itheima.service;

import java.util.List;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;


/**
 * description 户主业务接口
 * @author yuxin fan
 *
 */
public interface HouseMasterManager {
	
	/**
	 * description 分页查询户信息
	 * @param record
	 * @return
	 */
    List<HouseMaster> searchPage(HouseMasterSearcher searcher);
	
	/**
	 * description 插入户主信息
	 * @param record
	 * @return
	 */
    int insertSelective(HouseMaster record);
    
    
	/**
	 * description 根据主键查询
	 * @param record
	 * @return
	 */
    HouseMaster selectByPrimaryKey(Long id);
    
    
	/**
	 * description 更新业户主信息
	 * @param record
	 * @return
	 */
    int updateByPrimaryKeySelective(HouseMaster record);
    
	/**
	 * description  查询所有户主
	 * @param record
	 * @return
	 */
    List<HouseMaster> listAll();
    
	/**
	 * description  删除对象
	 * @param record
	 * @return
	 */
    Integer deleteById(Long id);
    


}
