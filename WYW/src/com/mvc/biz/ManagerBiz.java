package com.mvc.biz;

import java.util.List;

import com.mvc.dao.UserDataDao;
import com.mvc.dto.UserDataDto;

public class ManagerBiz {
	
	private UserDataDao dao = new UserDataDao();
	
	
	public List<UserDataDto> selectAllNotice(){
		
		List<UserDataDto> res = dao.selectAllNotice();
		
		return res;
	}
	
	public UserDataDto selectOneNotice(int boardno) {
		
		UserDataDto dto = dao.selectOneNotice(boardno);
		
		return dto;
	}
	
	public boolean insertNotice(UserDataDto dto) {
		
		int res = dao.insertNotice(dto);
		
		return (res>0)?true:false;
	}
	
	public boolean updateNotice(UserDataDto dto) {
		
		int res = dao.updateNotice(dto);
		
		return (res>0)?true:false;
	}

	public boolean deleteNotice(int boardno) {
		
		int res = dao.deleteNotice(boardno);
		
		return (res>0)?true:false;
	}

	
	public List<UserDataDto> selectAllMember(){
		
		List<UserDataDto> res = dao.selectAll();
		
		return res;
	}
	
	
	public List<UserDataDto> selectSearchMembers(String select, String findtextbox){
		
		List<UserDataDto> res = dao.selectSearchMembers(select, findtextbox);
		
		return res;
	}
}
