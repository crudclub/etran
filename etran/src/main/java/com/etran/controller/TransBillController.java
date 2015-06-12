package com.etran.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.etran.common.constants.Constants;
import com.etran.entity.TransBill;
import com.etran.service.TransBillService;

@RestController
public class TransBillController {
	
	private static Logger log = LoggerFactory.getLogger(TransBillController.class);
	
	 private String rows;//每页显示的记录数  
     
     private String page;//当前第几页  
     
	@Autowired
	private TransBillService transBillService;
	
	
	@RequestMapping(value="/add",produces="text/html;charset=utf-8" )
	public String add(HttpServletRequest req,HttpServletResponse resp) throws IllegalAccessException, InvocationTargetException {
		Map<String, String[]> parameterMap = req.getParameterMap();
		TransBill bill = new TransBill();
		BeanUtils.copyProperties(bill, parameterMap);
		transBillService.saveTransBill(bill);
//		JSONObject result = new JSONObject();
//		result.put("result", "1");
		return "1";
	}
	
	@RequestMapping("/deleteBill")
	public String delete(HttpServletRequest req,HttpServletResponse resp)
	{
		JSONObject jsonObject =  (JSONObject) req.getAttribute(Constants.JSONPARAMS);
		long id = Long.parseLong(jsonObject.getString("id"));
		
		transBillService.deleteBill(id);
		return "1";
	}
	
	@RequestMapping("/addNewBill")
	public String addNewBill(HttpServletRequest req,HttpServletResponse resp)
	{
		JSONObject jsonObject =  (JSONObject) req.getAttribute(Constants.JSONPARAMS);
		String goodsArray = jsonObject.getString("goods");
//		for(int i=0;i<goodsArray.size();i++)
//		{
//			JSONObject jbject = (JSONObject) goodsArray.get(i);
//			System.out.println(jbject.toString());
//		}
		
		return "1";
	}
	
	
	@RequestMapping("/showBill" )
	public String showBill(HttpServletRequest req,HttpServletResponse resp)
	{
		JSONObject jsonObject =  (JSONObject) req.getAttribute(Constants.JSONPARAMS);
		this.page = jsonObject.getString("page");
		this.rows = jsonObject.getString("rows");
		 //当前页  
        int intPage = Integer.parseInt((page == null || page == "0") ? "1":page);  
        //每页显示条数  
        int pageSize = Integer.parseInt((rows == null || rows == "0") ? "10":rows);  
        //每页的开始记录  第一页为0  第二页为1  
         int pageNumber = intPage - 1;  
        String sortType = "auto";
        Page<TransBill> page = 	transBillService.getTransBill(pageNumber,  pageSize, sortType); 
        JSONObject result = new JSONObject();
        result.put("total",  page.getTotalElements());
        List<TransBill> transBillList =  page.getContent();
        JSONArray array = new JSONArray();
      
        for(TransBill transBill:transBillList)
        {
        	array.add(transBill);
        }
        result.put("rows", array);
		return result.toString();
	}


	public String getRows() {
		return rows;
	}


	public void setRows(String rows) {
		this.rows = rows;
	}


	public String getPage() {
		return page;
	}


	public void setPage(String page) {
		this.page = page;
	}
	

}
