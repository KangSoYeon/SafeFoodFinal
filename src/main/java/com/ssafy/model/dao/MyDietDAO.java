package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.MyDiet;

@Mapper
public interface MyDietDAO {
	public MyDiet search(int dno);

	public List<MyDiet> searchAll();

	public void insert(MyDiet mydiet);

	public void delete(int dno);
}
