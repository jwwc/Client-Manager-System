package com.itheima.controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ServletContextAware;



public class BaseController  implements ServletContextAware {
    public final Logger logger = LoggerFactory.getLogger(getClass().getName());

    public static final String MESSAGES_KEY = "successMsg";
    public static final String ERROR_KEY = "errorMsg";

    private ServletContext servletContext;

   

    @SuppressWarnings("unchecked")
	public void saveMessage(HttpServletRequest request, String msg) {
        List<String> messages = (List<String>) request.getSession().getAttribute(MESSAGES_KEY);

        if (messages == null) {
            messages = new ArrayList<String>();
        }

        messages.add(msg);
        request.getSession().setAttribute(MESSAGES_KEY, messages);
    }

    
    
    
    public ServletContext getServletContext() {
        return servletContext;
    }



    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
