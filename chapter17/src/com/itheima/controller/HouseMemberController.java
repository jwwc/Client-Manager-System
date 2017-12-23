package com.itheima.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.po.HouseMember;
import com.itheima.po.HouseMemberSearcher;
import com.itheima.po.Page;
import com.itheima.service.HouseMasterManager;
import com.itheima.service.HouseMemberService;

@Controller
@RequestMapping("/houseMemberManage/houseMemberController")
public class HouseMemberController extends BaseController{
	
	@Autowired
	HouseMemberService houseMemberService;
	
	@Autowired
	HouseMasterManager houseMasterManager;
	
	/**
	 * @description 分页查询成员信息
	 * @param houseMasterSearcher
	 * @url    /houseMemberManage/houseMemberController/list
	 * @return
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.GET,RequestMethod.POST })
		public ModelAndView listAPHandle(@ModelAttribute(value = "houseMemberSearcher")
	                                     HouseMemberSearcher houseMemberSearcher,HttpServletRequest request) {
		
		List<HouseMaster> houseMasterList=houseMasterManager.listAll();
		List<HouseMember> responseList=houseMemberService.searchPage(houseMemberSearcher);
		
		String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
		Page page=new Page(Integer.valueOf(pageNum),responseList.size());
		List<HouseMember> resultList=new ArrayList<>();
		int responseSize=responseList.size();
		int sizePerPage=responseSize-((page.getCurrentPage()-1)*page.getPageSize());   //每页应该显示记录数
		if(sizePerPage>10){
			sizePerPage=10;
		}
		for(int i=0;i<sizePerPage;i++){
			resultList.add(responseList.get((page.getCurrentPage()-1)*10+i));
		}
		return new ModelAndView("housemember_index")
			              .addObject("houseMemberSearcher", houseMemberSearcher)
			              .addObject("houseMasterList", houseMasterList)
			              .addObject("page", page)
				          .addObject("resultList", resultList);
		}	
	
	/**
	 *  跳转查看成员信息
	 * @param houseMasterId
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/listMembers", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView listMembers(@RequestParam(value = "houseMasterId", required = false) Long houseMasterId,
			                                           @RequestParam(value = "beginDate", required = false) String beginDate,
			                                           HttpServletRequest request) {
   
		
		HouseMasterSearcher houseMasterSearcher=new HouseMasterSearcher();
		houseMasterSearcher.setId(houseMasterId);
		if(beginDate!=null && beginDate.length()>0){
			String  month=beginDate.substring(5, 7);
			String  day= beginDate.substring(8,10);
			
			houseMasterSearcher.setMonth(month);
			houseMasterSearcher.setDay(day);
		}
    
		List<HouseMember> responseList=houseMemberService.listMembers(houseMasterSearcher);
		
		String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
		Page page=new Page(Integer.valueOf(pageNum),responseList.size());
		List<HouseMember> resultList=new ArrayList<>();
		int responseSize=responseList.size();
		int sizePerPage=responseSize-((page.getCurrentPage()-1)*page.getPageSize());   //每页应该显示记录数
		if(sizePerPage>10){
			sizePerPage=10;
		}
		for(int i=0;i<sizePerPage;i++){
			resultList.add(responseList.get((page.getCurrentPage()-1)*10+i));
		}
		return new ModelAndView("housemember_list")
						.addObject("page", page)
		                 .addObject("resultList", resultList);
}	
	
	/**
	 * @Description:跳转到新增或修改页面   
	 * @url  /houseMemberManage/houseMemberController/manage
	 * @author fanxinyu
	 * @date: 2017年11月18日 下午14:20:12
	 */
	@RequestMapping(value = "/manage", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView manageHouseMaster(@RequestParam(value = "houseMemberId", required = false) Long houseMemberId,
			HttpServletRequest request){
        HouseMember houseMember;
    	List<HouseMaster> houseMasterList=houseMasterManager.listAll();
        if (houseMemberId != null) {
        	//修改 成员信息
        	houseMember = houseMemberService.getById(houseMemberId);
        	 return new ModelAndView("housemember_manage")
        			 		   .addObject("houseMasterList", houseMasterList)
                               .addObject("houseMember", houseMember);
                   
        } 
        else { 
        	//新增 成员信息
        	houseMember = new HouseMember();
        	 return new ModelAndView("housemember_manage")
        			 .addObject("houseMasterList", houseMasterList)
                     .addObject("houseMember", houseMember);
        }
	}
	
	
	/**
	 * 
	 * @description 保存或修改成员信息
	 * @url /houseMemberManage/houseMemberController/save
	 * @param request
	 * @throws InterruptedException 
	 */
	@RequestMapping(value = "/save",method ={ RequestMethod.GET,RequestMethod.POST })
    public String saveHouseMaster(@ModelAttribute(value = "houseMember") HouseMember houseMember,HttpServletRequest request) throws InterruptedException {
        Long houseMemberId=houseMember.getId();
        boolean isAdd = (houseMemberId==null);
		if (isAdd) // 新增成员信息
		{
			//添加成员所属户主姓名,地址信息
			List<HouseMaster> houseMasterList=houseMasterManager.listAll();
			for(HouseMaster houseMaster:houseMasterList){
				if(houseMaster.getId().equals(houseMember.getBelongHouseId())){
					houseMember.setMasterName(houseMaster.getName());
					houseMember.setMasterFlag("0");
					houseMember.setBirthdayFlag("0");
				}
			}
			
			Integer insertRows=houseMemberService.insert(houseMember);
				if (insertRows>0) {
					saveMessage(request, "成功新增成员信息");
				} else {
					saveMessage(request, "新增成员信息失败！");
				}
		} else // 修改成员信息
		{
				Integer updateRows = houseMemberService.updateByPrimaryKeySelective(houseMember);
				if(updateRows>0){
					saveMessage(request, "修改成员信息成功！");
				}else{
					saveMessage(request, "修改成员信息失败！");
				}
				}
		Thread.currentThread().sleep(1000);
        return "redirect:/houseMemberManage/houseMemberController/list";
    }
	
	/**
	 * 
	 * @description 删除成员信息
	 * @url  /houseMemberManage/houseMemberController/delete
	 * @param payFlowId
	 * @param request
	 */
	@RequestMapping(value ="/delete")
	public String delete(@RequestParam(value = "houseMemberId") Long houseMemberId,	HttpServletRequest request) {
		
		logger.info("====================根据成员id删除个别成员信息，请求houseMemberId:"+houseMemberId);
		Integer affectRows=houseMemberService.deleteByMemberId(houseMemberId);
		saveMessage(request, "删除个别成员信息成功！，影响条数:"+affectRows);
	       return "redirect:/houseMemberManage/houseMemberController/list";
	}	
	
	
	/**
	 * 
	 * @description 号码排重校验
	 * @url  /houseMemberManage/houseMemberController/telephoneCheck
	 * @param payFlowId
	 * @param request
	 */
	@RequestMapping(value ="/check")
	public String telephoneCheck(@RequestParam(value = "telephone") String telephone,	HttpServletRequest request) {
		List<HouseMember> memberList=houseMemberService.listAll();
		Boolean existFlag = false;
		for(HouseMember houseMember: memberList){
			if(houseMember.getTelephone().equals(telephone)){
				existFlag = true;
				break;
			}
		}
		if(existFlag)
		      return "fail";
		else
			return "success";
	}
	}	
 		
