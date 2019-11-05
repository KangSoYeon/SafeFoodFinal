package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Food;
@Mapper
public interface FoodDAO {
	public Food search(String code) ;

	public List<Food> searchAll() ;
	public List<Food> searchAllName(String name) ;
	public List<Food> searchAllMaker(String maker) ;
	public List<Food> searchAllMaterial(String material) ;

}
