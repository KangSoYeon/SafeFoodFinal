package com.ssafy.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.MyDiet;

public interface MyDietService {
	public MyDiet search(int dno);

	public List<MyDiet> searchAll();

	public void insert(MyDiet mydiet, HttpServletRequest request);

	public void delete(int dno, HttpServletRequest request);
}
