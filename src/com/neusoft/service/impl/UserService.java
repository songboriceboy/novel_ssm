package com.neusoft.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neusoft.domain.UserInfo;
import com.neusoft.mapper.IUserInfoDao;
import com.neusoft.service.IUserService;
@Service
public class UserService implements IUserService{
	@Autowired
	IUserInfoDao iid;
	@Override
	public int Login(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return iid.Login(userInfo);
	}

}
