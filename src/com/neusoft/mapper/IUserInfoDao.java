package com.neusoft.mapper;

import org.apache.tomcat.util.descriptor.web.LoginConfig;

import com.neusoft.domain.UserInfo;

public interface IUserInfoDao {
	int Login(UserInfo userInfo);
}
