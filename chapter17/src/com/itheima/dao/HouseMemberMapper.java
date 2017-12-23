package com.itheima.dao;


import java.util.List;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.po.HouseMember;
import com.itheima.po.HouseMemberSearcher;

public interface HouseMemberMapper {
    int deleteByPrimaryKey(Long id);
    
    int deleteByHouseMasterId(Long houseMasterId);
    
    int deleteByMemberId(Long MemberId);

    int insert(HouseMember record);

    int insertSelective(HouseMember record);

    HouseMember selectByPrimaryKey(Long id);
    
    HouseMember getByMasterFlag(Long masterId);

    int updateByPrimaryKeySelective(HouseMember record);

    int updateByPrimaryKey(HouseMember record);
     
    List<HouseMember> listMembersByBirthday(HouseMasterSearcher searcher);    
    
    List<HouseMember> listMembers(Long masterId); 
    
    List<HouseMember>searchPage(HouseMemberSearcher searcher);
    
    List<HouseMember> listAll();
    
    /**
     * 根据生日查询对应户主
     * @param searcher
     * @return
     */
    List<HouseMember> queryByBirthday(HouseMasterSearcher searcher);
}