package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.model.dto.Food;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;

import io.swagger.annotations.ApiOperation;

@RestController
public class MainRestController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FoodService foodService;

	@ExceptionHandler
	public ResponseEntity<Map<String, Object>> handle(Exception e) {
		e.printStackTrace();
		return handleFail(e.getMessage(), HttpStatus.OK);
	}

	@GetMapping("/foodNutritionInfo/{fcode}")
	@ApiOperation("영양정보 출력을 위한 기능")
	private ResponseEntity<Map<String, Object>> nutrition(@PathVariable String fcode) {
		Food food = foodService.search(fcode);
		return handleSuccess(food);
	}
	
	public ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "ok");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	public ResponseEntity<Map<String, Object>> handleFail(Object data, HttpStatus status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("state", "fail");
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
}
