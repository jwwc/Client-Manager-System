package com.itheima.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.po.HouseMaster;
import com.itheima.po.HouseMasterSearcher;
import com.itheima.po.HouseMember;
import com.itheima.po.Page;
import com.itheima.service.HouseMasterManager;
import com.itheima.service.HouseMemberService;




@Controller
@RequestMapping("/houseMasterManage/houseMasterController")
public class HouseMasterController extends BaseController{
	
	public HouseMasterController(){
		
	}

	@Autowired
	HouseMasterManager houseMasterManager;
	
	@Autowired
	HouseMemberService houseMemberService;
	
	/**
	 * @description 初始化分页查询户主信息
	 * @param payFlowSearcher
	 * @url    /houseMasterManage/houseMasterController/list
	 * @return
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.GET,RequestMethod.POST })
		public ModelAndView list(@ModelAttribute(value = "houseMasterSearcher")
	                                     HouseMasterSearcher houseMasterSearcher,HttpServletRequest request) {
		
		String  beginDate=houseMasterSearcher.getBeginDate();
		if(beginDate!=null && beginDate.length()>0){
			String  month=beginDate.substring(5, 7);
			String  day= beginDate.substring(8,10);
			houseMasterSearcher.setMonth(month);
			houseMasterSearcher.setDay(day);
		}
		List<HouseMaster> responseList=houseMasterManager.searchPage(houseMasterSearcher);
		
		
		//分页
		String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
		Page page=new Page(Integer.valueOf(pageNum),responseList.size());
		List<HouseMaster> resultList=new ArrayList<>();
		int responseSize=responseList.size();
		int sizePerPage=responseSize-((page.getCurrentPage()-1)*page.getPageSize());   //每页应该显示记录数
		if(sizePerPage>10){
			sizePerPage=10;
		}
		for(int i=0;i<sizePerPage;i++){
			resultList.add(responseList.get((page.getCurrentPage()-1)*10+i));
		}		
		return new ModelAndView("housemaster_list")
			              .addObject("houseMasterSearcher", houseMasterSearcher)
			              .addObject("houseMasterList", houseMasterManager.listAll())
			              .addObject("page", page)
				          .addObject("resultList", resultList);
		}	

	/**
	 * @Description:跳转到新增或修改页面   
	 * @url  /houseMasterManage/houseMasterController/manage
	 * @author fanxinyu
	 * @date: 2017年11月18日 下午14:20:12  
	 */ 
	@RequestMapping(value = "/manage", method = { RequestMethod.GET,RequestMethod.POST })                    
	public ModelAndView manageHouseMaster(@RequestParam(value = "houseMasterId", required = false) Long houseMasterId,
			HttpServletRequest request){
        HouseMaster houseMaster;
    	List<HouseMaster> houseMasterList=houseMasterManager.listAll();
        if (houseMasterId != null) {
        	//修改 户主信息
        	houseMaster = houseMasterManager.selectByPrimaryKey(houseMasterId);
        	 return new ModelAndView("housemaster_manage")
		        			 .addObject("houseMasterList", houseMasterList)
		                     .addObject("houseMaster", houseMaster);
                   
        } 
        else { 
        	//新增 户主信息
        	houseMaster = new HouseMaster();
        	 return new ModelAndView("housemaster_manage")
        			 .addObject("houseMasterList", houseMasterList)
                     .addObject("houseMaster", houseMaster);
        }
	}
	
	/**
	 * 
	 * @description 新增或者修改户主信息
	 * @url /houseMasterManage/houseMasterController/save
	 * @param request
	 * @throws InterruptedException 
	 */
 	@RequestMapping(value = "/save",method ={ RequestMethod.GET,RequestMethod.POST })
    public String saveHouseMaster(@ModelAttribute(value = "houseMaster") HouseMaster houseMaster,HttpServletRequest request) throws InterruptedException {
 		
 		Long houseMasterId=houseMaster.getId();
        HouseMember houseMember=new HouseMember();
        boolean isAdd = (houseMasterId==null);
		if (isAdd) // 新增户主信息
		{  
				Integer insertRows=houseMasterManager.insertSelective(houseMaster);
				if (insertRows>0) {
					houseMember.setName(houseMaster.getName());
					houseMember.setBelongHouseId(houseMaster.getId());
					houseMember.setRelationship("本人");
					houseMember.setSex(houseMaster.getSex());
					houseMember.setBirthday(houseMaster.getBirthday());
					houseMember.setTelephone(houseMaster.getTelephone());
					houseMember.setMemo(houseMaster.getMemo());
					houseMember.setBirthdayFlag("0");  //默认生日“否”
					houseMember.setMasterFlag("1");     //标识为“户主"
					
					houseMemberService.insert(houseMember);  //插入子表
					saveMessage(request, "成功新增户主信息");
				} else {
					saveMessage(request, "新增户主信息失败！");
				}
		} else // 修改户主信息
		{
				Integer updateRows = houseMasterManager.updateByPrimaryKeySelective(houseMaster);
				if(updateRows>0){
					houseMember=houseMemberService.getByMasterFlag(houseMaster.getId());
					//字段同步更新
					houseMember.setName(houseMaster.getName());
					houseMember.setSex(houseMaster.getSex());
					houseMember.setBirthday(houseMaster.getBirthday());
					houseMember.setTelephone(houseMaster.getTelephone());
					houseMember.setMemo(houseMaster.getMemo());
					houseMemberService.updateByPrimaryKeySelective(houseMember);  //修改对应子表信息
					saveMessage(request, "修改户主信息成功！");
				}
					saveMessage(request, "修改户主信息失败！");
				}
		Thread.currentThread().sleep(1000);
        return "redirect:/houseMasterManage/houseMasterController/list";
    }
 	
	/**
	 * 
	 * @description 删除对象
	 * @url  houseMasterManage/houseMasterController/delete
	 * @param houseMasterId
	 * @param request
	 */
	@RequestMapping(value ="/delete")
	public String delete(@RequestParam(value = "houseMasterId") Long houseMasterId,	HttpServletRequest request) {
		
		Integer masterAffectRows=houseMasterManager.deleteById(houseMasterId);
		Integer memberAffectRows=houseMemberService.deleteByHouseMasterId(houseMasterId);
	     return "redirect:/houseMasterManage/houseMasterController/list";
	}	
	
	
	/**
	 * @description  根据生日查询所有人但只展示户主信息
	 * @param payFlowSearcher
	 * @url    /houseMasterManage/houseMasterController/list
	 * @return
	 */
	@RequestMapping(value = "/queryByBirthday", method = { RequestMethod.GET,RequestMethod.POST })
		public ModelAndView queryByBirthday(@ModelAttribute(value = "houseMasterSearcher")
	                                 HouseMasterSearcher houseMasterSearcher,HttpServletRequest request) {
		
		String  beginDate=houseMasterSearcher.getBeginDate();
		if(beginDate!=null && beginDate.length()>0){
			String  month=beginDate.substring(5, 7);
			String  day= beginDate.substring(8,10);
			houseMasterSearcher.setMonth(month);
			houseMasterSearcher.setDay(day);
		}else{
			List<HouseMaster> responseList=houseMasterManager.searchPage(houseMasterSearcher);
			
			//分页
			String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
			Page page=new Page(Integer.valueOf(pageNum),responseList.size());
			List<HouseMaster> resultList=new ArrayList<>();
			int responseSize=responseList.size();
			int sizePerPage=responseSize-((page.getCurrentPage()-1)*page.getPageSize());   //每页应该显示记录数
			if(sizePerPage>10){
				sizePerPage=10;
			}
			for(int i=0;i<sizePerPage;i++){
				resultList.add(responseList.get((page.getCurrentPage()-1)*10+i));
			}		
			return new ModelAndView("housemaster_list")
		              .addObject("houseMasterSearcher", houseMasterSearcher)
		              .addObject("houseMasterList", houseMasterManager.listAll())
		              .addObject("page", page)
			          .addObject("resultList", resultList);
		}
		
		//查询出符合条件所有过生日的人，包括户主
		List<HouseMember> allList=houseMemberService.queryByBirthday(houseMasterSearcher);
		List<Long> belongHouseIdList=new ArrayList<>();
		
		for(HouseMember houseMember:allList){
			if(!belongHouseIdList.contains(houseMember.getBelongHouseId())){
				belongHouseIdList.add(houseMember.getBelongHouseId());
			}
		} //至此得到所有不重复的户主id
		
		List<HouseMaster> masterList=new ArrayList<>();
		for(int i=0;i<belongHouseIdList.size();i++){
			HouseMaster master=houseMasterManager.selectByPrimaryKey(belongHouseIdList.get(i));
			masterList.add(master);
		}  //得到所有过生日的人所属的户主
		
		
		//分页
		String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
		Page page=new Page(Integer.valueOf(pageNum),masterList.size());
		List<HouseMaster> resultList=new ArrayList<>();
		int responseSize=masterList.size();
		int sizePerPage=responseSize-((page.getCurrentPage()-1)*page.getPageSize());   //每页应该显示记录数
		if(sizePerPage>10){
			sizePerPage=10;
		}
		for(int i=0;i<sizePerPage;i++){
			resultList.add(masterList.get((page.getCurrentPage()-1)*10+i));
		}		
		return new ModelAndView("housemaster_list")
			              .addObject("houseMasterSearcher", houseMasterSearcher)
			              .addObject("houseMasterList", houseMasterManager.listAll())
			              .addObject("page", page)
				          .addObject("resultList", resultList);
		}	
	

}
