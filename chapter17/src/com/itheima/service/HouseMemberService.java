package com.itheima.service;

import java.util.List;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.po.HouseMember;
import com.itheima.po.HouseMemberSearcher;
import com.itheima.po.Page;


/**
 * description 成员业务接口
 * @author yuxin fan
 *
 */
public interface HouseMemberService {
	
	/**
	 * description 分页查询成员信息
	 * @param record
	 * @return
	 */
	public List<HouseMember> searchPage(HouseMemberSearcher searcher);
	
	/**
	 * description 跳转展示户主对应的家庭成员信息
	 * @param record
	 * @return
	 */
    List<HouseMember> listMembers(HouseMasterSearcher houseMastersearcher);
    
	/**
	 * description 根据id更改成员信息
	 * @param record
	 * @return
	 */
    Integer updateByPrimaryKeySelective(HouseMember houseMember);
    
    
	/**
	 * description 根据id查询
	 * @param record
	 * @return
	 */
    HouseMember getById(Long id);
    
	/**
	 * description 根据户主id以及户主标识查询对应子表户主信息
	 * @param record
	 * @return
	 */
    HouseMember getByMasterFlag(Long masterId);
    
	/**
	 * description 新增成员信息
	 * @param record
	 * @return
	 */
    Integer  insert(HouseMember houseMember);
    
	/**
	 * description 根据户主id删除成员信息
	 * @param record
	 * @return
	 */
    Integer  deleteByHouseMasterId(Long  houseMasterId);
    
	/**
	 * description 根据id删除成员信息
	 * @param record
	 * @return
	 */
    Integer  deleteByMemberId(Long  MemberId);
    
	/**
	 * description 获取所有成员信息
	 * @param record
	 * @return
	 */
    List<HouseMember>  listAll();
    
    /**
     * 根据生日查询对应户主
     * @param searcher
     * @return
     */
    List<HouseMember> queryByBirthday(HouseMasterSearcher searcher);
    
    

}
