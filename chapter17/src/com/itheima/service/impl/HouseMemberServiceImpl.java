package com.itheima.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itheima.dao.HouseMemberMapper;
import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.po.HouseMember;
import com.itheima.po.HouseMemberSearcher;
import com.itheima.po.Page;
import com.itheima.service.HouseMemberService;


@Service("houseMemberService")
public class HouseMemberServiceImpl implements HouseMemberService{
	private final Logger   LOGGER        = LoggerFactory.getLogger(getClass());
	
	@Autowired
	HouseMemberMapper houseMemberMapperer;
	
	/**
	 * 分页查询成员信息
	 * @param record
	 * @return
	 */
	@Override
	public List<HouseMember> searchPage(HouseMemberSearcher searcher) {
		LOGGER.info("=============分页查询成员信息请求对象:searcher:"+searcher);
		List<HouseMember> houseMasterList=houseMemberMapperer.searchPage(searcher);
		LOGGER.info("=============分页查询成员信息结束，查询条数:"+houseMasterList.size());
		return houseMasterList;
		
	}
	@Override
	public List<HouseMember> listMembers(HouseMasterSearcher houseMasterSearcher) {
		LOGGER.info("=============跳转查询某个户主对应所有家庭成员信息请求对象:"+houseMasterSearcher);
		List<HouseMember> birthdayList=houseMemberMapperer.listMembersByBirthday(houseMasterSearcher);  //所有过生日的人
		List<HouseMember> houseMembeList=houseMemberMapperer.listMembers(houseMasterSearcher.getId());  //某个户主所对应的所有家庭成员
		
		//标记过生日的成员包括户主
		for(HouseMember member:houseMembeList){
			for(HouseMember birthdayMember:birthdayList){
				if(member.getId()==birthdayMember.getId() && houseMasterSearcher.getMonth()!=null && houseMasterSearcher.getMonth()!=""){
					member.setBirthdayFlag("1");    //生日标记
				}
			}
		}
		LOGGER.info("=============跳转查询某个户主对应所有家庭成员信息结束，查询条数:"+houseMembeList.size()+",其中,过生日的人共有"+birthdayList.size()+"个");
		return houseMembeList;
	}

	@Override
	public Integer updateByPrimaryKeySelective(HouseMember houseMember) {
		LOGGER.info("=============根据id更改成员信息请求id:"+houseMember.getId());
		Integer affectRows=houseMemberMapperer.updateByPrimaryKeySelective(houseMember);
		LOGGER.info("=============根据id更改成员信息结束，影响条数:"+affectRows);
		return affectRows;
	}

	@Override
	public HouseMember getById(Long id) {
		LOGGER.info("=============根据id查询成员信息请求id:"+id);
		HouseMember houseMember=houseMemberMapperer.selectByPrimaryKey(id);
		LOGGER.info("=============据id查询成员信息返回对象:"+houseMember);
		return houseMember;
	}

	@Override
	public Integer insert(HouseMember houseMember) {
		LOGGER.info("=============新增成员信息请求对象:"+houseMember);
		Integer affectRows=houseMemberMapperer.insert(houseMember);
		if(affectRows>0){
			LOGGER.info("=============新增成员信息成功，影响条数:"+affectRows);
		}
		return affectRows;
	}

	@Override
	public Integer deleteByHouseMasterId(Long houseMasterId) {
		LOGGER.info("=============根据id删除户主对应所有成员信息,户主id:"+houseMasterId);
		Integer affectRows=houseMemberMapperer.deleteByHouseMasterId(houseMasterId);
		LOGGER.info("=============据id删除户主对应所有成员信息结束，影响条数:"+affectRows);
		return affectRows;
	}
	@Override
	public Integer deleteByMemberId(Long MemberId) {
		LOGGER.info("=============根据id删除个别成员信息,成员id:"+MemberId);
		Integer affectRows=houseMemberMapperer.deleteByMemberId(MemberId);
		LOGGER.info("=============根据id删除个别成员信息结束，影响条数:"+affectRows);
		return affectRows;
	}
	@Override
	public HouseMember getByMasterFlag(Long masterId) {
		LOGGER.info("=============根据户主id以及户主标识查询对应子表户主信息请求masterId:"+masterId);
		HouseMember houseMember=houseMemberMapperer.getByMasterFlag(masterId);
		LOGGER.info("=============根据户主id以及户主标识查询对应子表户主信息返回对象:"+houseMember);
		return houseMember;
	}
	@Override
	public List<HouseMember> listAll() {
		LOGGER.info("=============查询所有成员及户主信息开始");
		List<HouseMember> list=houseMemberMapperer.listAll();
		LOGGER.info("=============查询所有成员及户主信息结束，查询条数:"+list.size());
		return list;
	}
	@Override
	public List<HouseMember> queryByBirthday(HouseMasterSearcher searcher) {
		LOGGER.info("=============据生日查询对应户主开始");
		List<HouseMember> list=houseMemberMapperer.queryByBirthday(searcher);
		LOGGER.info("=============据生日查询对应户主结束，查询条数:"+list.size());
		return list;
	}
	
	

}
