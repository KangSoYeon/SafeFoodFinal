package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Cart;

@Mapper
public interface CartDAO {
	public List<Cart> search(String id);
	public List<Cart> searchAll();
	public void insert(Cart cart);
	public void delete(int cno);
}
