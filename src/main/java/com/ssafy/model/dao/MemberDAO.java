package com.ssafy.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.model.dto.Member;

@Mapper
public interface MemberDAO {
	public Member search(String id);

	public List<Member> searchAll();

	public void insert(Member member);

	public void update(Member member);

	public void delete(String id);
}
