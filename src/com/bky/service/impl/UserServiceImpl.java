package com.bky.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bky.dao.UserDao;
import com.bky.model.PageBean;
import com.bky.model.User;
import com.bky.service.UserService;

@Service("baseService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao addMapper;

//	public UserDao getAddMapper() {
//		return addMapper;
//	}
//	@Autowired
//	public void setAddMapper(UserDao addMapper) {
//		this.addMapper = addMapper;
//	}

	@Override
	public String addInfo(User addInfo) {
		if (addMapper.insert(addInfo) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}
	@Override
	public List<User> getAll() {
		return addMapper.getAll();
	}
	@Override
	public String delete(String id) {
		if (addMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}
	@Override
	public User findById(String id) {
		return addMapper.selectByPrimaryKey(id);
	}
	@Override
	public String update(User addInfo) {
		if (addMapper.updateByPrimaryKeySelective(addInfo) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	@Override
	public PageBean getAllByPage(int pageNum,String userName) {
		int pageSize =4;
		int recordCount = addMapper.getPageCount(userName);
		int start = (pageNum-1)*pageSize;
		List<User> recordList = addMapper.getUserByPage(start,pageSize,userName);
		PageBean pager = new PageBean(pageNum, pageSize, recordList, recordCount);
		return pager;
	}
	@Override
	public String updateIcon(User user) {
		if (addMapper.updateIcon(user) == 1) {
			return "success";
		}
		return "faild";
	}
	

}
