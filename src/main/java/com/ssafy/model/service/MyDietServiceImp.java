package com.ssafy.model.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dao.MyDietDAO;
import com.ssafy.model.dto.MyDiet;
import com.ssafy.model.dto.MyDietException;

@Service
public class MyDietServiceImp implements MyDietService {
	
	@Autowired
	private MyDietDAO dao;
	@Override
	public MyDiet search(int dno) {
		try {
			MyDiet MyDiet = dao.search(dno);
			if(MyDiet == null) {
				throw new MyDietException("등록되지 않은 식품입니다.");
			} else {
				return MyDiet;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new MyDietException();
		}
	}

	@Override
	public List<MyDiet> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new MyDietException();
		}
	}
	
	@Override
	public void insert(MyDiet mydiet, HttpServletRequest request) {
		try {
			dao.insert(mydiet);
			request.setAttribute("msg", "내 식품에 추가되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "추가 중 오류가 발생하였습니다.");
			throw new MyDietException("추가 중 오류가 발생하였습니다.");
		}
	}
	

	@Override
	public void delete(int dno, HttpServletRequest request) {
		try {
			dao.delete(dno);
			request.setAttribute("msg", "내 식품이 삭제되었습니다!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "삭제 중 오류가 발생하였습니다.");
			throw new MyDietException("삭제 중 오류가 발생하였습니다.");
		}
	}
	
	
	
}
