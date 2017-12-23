package com.itheima.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itheima.dao.HouseMasterMapper;
import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.service.HouseMasterManager;



/**
 * description 户主业务层
 * @author yuxin fan
 *
 */
@Service("houseMasterManager")
public class HouseMasterManagerImpl implements HouseMasterManager{
	
private final Logger   LOGGER        = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HouseMasterMapper  houseMasterMapper;

	@Override
	public int insertSelective(HouseMaster record) {
		LOGGER.info("=============插入户主信息请求对象:houseMaster:"+record);
		Integer insertRecords=houseMasterMapper.insertSelective(record);
		if(insertRecords!=0){
			LOGGER.info("=============成功插入户主信息,插入条数::"+insertRecords);
			return insertRecords;
		}else{
			LOGGER.error("=============成功插入户主信息出错");
			return insertRecords;
		}
	}

	@Override
	public HouseMaster selectByPrimaryKey(Long id) {
		if(id==null){
			LOGGER.error("=============根据id查询户主信息id为空");
			return null;
		}
		HouseMaster houseMaster=houseMasterMapper.selectByPrimaryKey(id);
		LOGGER.info("=============根据id查询户主信息返回对象:houseMaster:"+houseMaster);
		return houseMaster;
	}

	@Override
	public int updateByPrimaryKeySelective(HouseMaster record) {
		LOGGER.info("=============更新户主信息请求对象:houseMaster:"+record);
		Integer updateRecords=houseMasterMapper.updateByPrimaryKey(record);
		if(updateRecords!=0){
			LOGGER.info("=============成功更新户主信息,更新条数::"+updateRecords);
			return updateRecords;
		}else{
			LOGGER.error("=============更新户主信息出错");
			return updateRecords;
		}
	}

	@Override
	public List<HouseMaster> searchPage(HouseMasterSearcher searcher) {
		LOGGER.info("=============分页查询户主信息请求对象:houseMaster:"+searcher);
		List<HouseMaster> houseMasterList=houseMasterMapper.searchPage(searcher);
		LOGGER.info("=============分页查询户主信息结束，查询条数:"+houseMasterList.size());
		return houseMasterList;
		
	}

	@Override
	public List<HouseMaster> listAll() {
		LOGGER.info("=============查询所有户主信息请求对象List开始");
		List<HouseMaster> houseMasterList=houseMasterMapper.listAll();
		LOGGER.info("=============查询所有户主信息List结束，查询条数:"+houseMasterList.size());
		return houseMasterList;
		
	}

	@Override
	public Integer deleteById(Long id) {
		LOGGER.info("=============根据id删除户主请求id:"+id);
		Integer affectRows=houseMasterMapper.deleteByPrimaryKey(id);
		LOGGER.info("=============根据id删除户主结束，影响条数:"+affectRows);
		return affectRows;
	}

}
