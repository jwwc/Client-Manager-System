package com.itheima.dao;

import java.util.List;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;

public interface HouseMasterMapper {
    int deleteByPrimaryKey(Long id);

    int insert(HouseMaster record);

    int insertSelective(HouseMaster record);

    HouseMaster selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(HouseMaster record);

    int updateByPrimaryKey(HouseMaster record);
    
    List<HouseMaster> searchPage(HouseMasterSearcher searcher);
    
    List<HouseMaster> listAll();            
    
}