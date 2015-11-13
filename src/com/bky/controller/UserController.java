package com.bky.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bky.model.PageBean;
import com.bky.model.User;
import com.bky.service.UserService;
import com.bky.util.FileNameUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService baseService;
	
//	public UserService getBaseService() {
//		return baseService;
//	}
//	@Autowired
//	public void setBaseService(UserService baseService) {
//		this.baseService = baseService;
//	}
	ObjectMapper mapper = new ObjectMapper();
	@SuppressWarnings("finally")
	@RequestMapping("/addInfo")
	@ResponseBody
	public String add(User add,HttpServletRequest request){
		String reply="";
		try {			
//			add.setName(new String(add.getName().getBytes("ISO-8859-1"), "utf-8"));
//			System.out.println(add.getId() + ":::::" + add.getName() + ":::::" + add.getAge()+".."+add.getEmail());
			reply = baseService.addInfo(add);
		} catch (Exception e) {
			e.printStackTrace();
			reply = "添加信息失败！具体异常信息：" + e.getMessage();
		} finally {			
			return reply;
		}
	}
	
	@RequestMapping(value = "/getAllUser", method = RequestMethod.GET)
	@ResponseBody
	public String getAddInfoAll(HttpServletRequest request) throws Exception, JsonMappingException, IOException{
			List<User> list = baseService.getAll();
//			System.out.println(list);
//			request.setAttribute("list", list);
		
			return mapper.writeValueAsString(list);
		
	}
	/**
	 * 分页查询对象列表
	 * @param request
	 * @return
	 * @throws Exception
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/getPageUser", method = RequestMethod.POST)
	@ResponseBody
	public String getAllByPage(String pageSize,String userName,HttpServletRequest request) throws Exception, JsonMappingException, IOException{
		if(pageSize==null) pageSize="1";
		int pageNum = Integer.parseInt(pageSize.trim());
		PageBean pager = baseService.getAllByPage(pageNum,userName);
		
		return mapper.writeValueAsString(pager);
		
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("delInfo")
	@ResponseBody
	public String del(User user,HttpServletRequest request){
		String str = "";
		try {			
			 str = baseService.delete(user.getId()+"");
		} catch (Exception e) {
			e.printStackTrace();
			str="删除信息失败！具体异常信息：" + e.getMessage();
		} finally {			
			return str;
		}
	}
	@RequestMapping("/getUserById")
	public String modify(String tid,HttpServletRequest request){
		try {			
			User add = baseService.findById(tid);
//			request.setAttribute("add", add);
			return mapper.writeValueAsString(add);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return null;
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("/updateUser")
	@ResponseBody
	public String update(User add,HttpServletRequest request){
		String reply="";
		try {
//			add.setName(new String(add.getName().getBytes("ISO-8859-1"), "utf-8"));
			reply = baseService.update(add);
		} catch (Exception e) {
			e.printStackTrace();
			reply="更新信息失败！具体异常信息：" + e.getMessage();
		} finally {			
			return reply;
		}
	}
	@SuppressWarnings("finally")
	@RequestMapping("/updateIcon")
	@ResponseBody
	public String updateIcon(@RequestParam(value = "file", required = false) MultipartFile file,String id,HttpServletRequest request){
		String reply="";
		String path=request.getSession().getServletContext().getRealPath("upload");
		//获取上传文件的名字
//		String oriFileName = file.getOriginalFilename(); 
		//重新起名
		String fileName = FileNameUtil.getName()+".jpg"; 
		User user = new User();
//		String requestUrl = request.getRequestURL().toString();
//		String location = requestUrl.substring(0, requestUrl.indexOf("aps"));
		user.setId(Integer.parseInt(id));
		user.setIcon(fileName);
		reply = baseService.updateIcon(user);
		
		try {
			if("success".equals(reply)){
				File targetFile = new File(path, fileName);  
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }  
		        
		        //保存  
		        try {  
		            file.transferTo(targetFile);  
		            reply="success";
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }  
			}
	//			add.setName(new String(add.getName().getBytes("ISO-8859-1"), "utf-8"));
			
		} catch (Exception e) {
			e.printStackTrace();
			reply="更新信息失败！具体异常信息：" + e.getMessage();
		} finally {			
			return reply;
		}
	}

}
