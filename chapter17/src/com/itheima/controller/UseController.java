package com.itheima.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UseController {
	
	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/user/login.action", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, 
                                                          HttpSession session) {

		if(usercode.equals("cake") && password.equals("abc1234")){		
			return "redirect:/user/list.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	/**
	 *  客户列表
	 */
	@RequestMapping(value = "/user/list.action", method = { RequestMethod.GET,RequestMethod.POST })
	public String list() {
	
		return "login_main";
	}	
	
	@RequestMapping(value = "/user/loginjpg", method = { RequestMethod.GET,RequestMethod.POST })
	public String listMainJpg() {
		
		return "login_jpg";
	}	

}
