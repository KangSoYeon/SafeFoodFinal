package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodException;

@Service
public class FoodServiceImp implements FoodService {
	
	@Autowired
	private FoodDAO dao;
	@Override
	public Food search(String code) {
		try {
			Food food = dao.search(code);
			if(food == null) {
				throw new FoodException("등록되지 않은 식품입니다.");
			} else {
				return food;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}
	@Override
	public List<Food> searchAllName(String name) {
		System.out.println("name...."+name);
		try {
			return dao.searchAllName(name);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAllMaker(String maker) {
		try {
			return dao.searchAllMaker(maker);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAllMaterial(String material) {
		try {
			return dao.searchAllMaterial(material);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

}
