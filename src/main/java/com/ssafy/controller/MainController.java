package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.MemberException;
import com.ssafy.model.dto.MyDiet;
import com.ssafy.model.service.MemberService;
import com.ssafy.model.service.MyDietService;
import com.ssafy.model.dto.Cart;
import com.ssafy.model.dto.Food;
import com.ssafy.model.service.CartService;
import com.ssafy.model.service.FoodService;

/**
 * Servlet implementation class MainServlet
 */
@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private MyDietService mydietService;
	@Autowired
	private CartService cartService;
	

	@ExceptionHandler
	public ModelAndView handle(Exception e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("ErrorHandler");
		return mav;
	}
	
	@GetMapping("detailform.do")
	public String detailform(HttpServletRequest request) {
		String code = request.getParameter("code");
		Food food = foodService.search(code);
		request.setAttribute("food", food);
		if(getId(request)!=null) {
			String id = getId(request);
			Member member = memberService.search(id);
			request.setAttribute("member", member);
		}
		return "detail";
	}
	@GetMapping("loginform.do")
	public String loginform() {
		return "login";
	}

	@GetMapping("signUpform.do")
	public String signUpform() {
		return "signUp";
	}

	@GetMapping("meminfo.do")
	public String memInfo(HttpServletRequest request) {
		String id = getId(request);
		System.out.println("흐하하하 " + id);
		Member mem = memberService.search(id);
		request.setAttribute("member", mem);
		return "memberInfo";
	}

	@GetMapping("findpasswordForm.do")
	public String findpasswordForm() {
		return "findPassword";
	}

	@PostMapping("delete.do")
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("mem_id");
		memberService.delete(id);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.jsp";
	}

	@PostMapping("update.do")
	private String update(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("mem_id");
		String pw = request.getParameter("mem_pw");
		String name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		String address = request.getParameter("mem_address");
		String phone = request.getParameter("mem_phone");
		int du = request.getParameter("mem_du") == null ? 0 : 1;
		int cong = request.getParameter("mem_cong") == null ? 0 : 1;
		int milk = request.getParameter("mem_milk") == null ? 0 : 1;
		int crab = request.getParameter("mem_crab") == null ? 0 : 1;
		int shi = request.getParameter("mem_shi") == null ? 0 : 1;
		int tu = request.getParameter("mem_tu") == null ? 0 : 1;
		int sal = request.getParameter("mem_sal") == null ? 0 : 1;
		int suk = request.getParameter("mem_suk") == null ? 0 : 1;
		int cow = request.getParameter("mem_cow") == null ? 0 : 1;
		int chi = request.getParameter("mem_chi") == null ? 0 : 1;
		int pig = request.getParameter("mem_pig") == null ? 0 : 1;
		int peach = request.getParameter("mem_peach") == null ? 0 : 1;
		int mind = request.getParameter("mem_mind") == null ? 0 : 1;
		int egg = request.getParameter("mem_egg") == null ? 0 : 1;

		Member member = new Member(id, pw, name, email, address, phone, du, cong, milk, crab, shi, tu, sal, suk, cow,
				chi, pig, peach, mind, egg);
		memberService.update(member);
		String pid = getId(request);
		request.setAttribute("member", memberService.search(pid));
		return "redirect:index.do";
	}

	@PostMapping("sign.do")
	private String sign(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		if(id==null) {
			throw new MemberException("아이디를 입력해주세요");
		}
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		int du = request.getParameter("du") == null ? 0 : 1;
		int cong = request.getParameter("cong") == null ? 0 : 1;
		int milk = request.getParameter("milk") == null ? 0 : 1;
		int crab = request.getParameter("crab") == null ? 0 : 1;
		int shi = request.getParameter("shi") == null ? 0 : 1;
		int tu = request.getParameter("tu") == null ? 0 : 1;
		int sal = request.getParameter("sal") == null ? 0 : 1;
		int suk = request.getParameter("suk") == null ? 0 : 1;
		int cow = request.getParameter("cow") == null ? 0 : 1;
		int chi = request.getParameter("chi") == null ? 0 : 1;
		int pig = request.getParameter("pig") == null ? 0 : 1;
		int peach = request.getParameter("peach") == null ? 0 : 1;
		int mind = request.getParameter("mind") == null ? 0 : 1;
		int egg = request.getParameter("egg") == null ? 0 : 1;

		Member member = new Member(id, pw, name, email, address, phone, du, cong, milk, crab, shi, tu, sal, suk, cow,
				chi, pig, peach, mind, egg);
		memberService.insert(member);
		return "redirect:index.do";
	}

	@GetMapping("logout.do")
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.do";
	}
	@GetMapping("expect.do")
	private String expect(HttpServletRequest request, HttpServletResponse response) {
		String id = getId(request);
		List<Cart> carts = cartService.search(id); //3. 예상 섭취 내역
		
		//1.영양정보별로 더해서 리스트	예상 섭취 영양성분
		double[] nut = new double[10];
		for(int i=0; i<carts.size(); i++) {
			Food f = carts.get(i).getFood();
			nut[0] += f.getSupportpereat();
			nut[1] += f.getCalory();
			nut[2] += f.getCarbo();
			nut[3] += f.getProtein();
			nut[4] += f.getFat();
			nut[5] += f.getSugar();
			nut[6] += f.getNatrium();
			nut[7] += f.getChole();
			nut[8] += f.getFattyacid();
			nut[9] += f.getTransfat();
		}
		for (int i = 0; i < nut.length; i++) {
			nut[i] = Double.parseDouble(String.format("%.1f", nut[i]));
		}
		
		
		//2. 이름별, 수량 더해서 리스트		섭취 내역
		HashMap<String, Integer> totalEat = new HashMap<>();
		for(int i=0; i<carts.size(); i++) {
			Cart nc = carts.get(i);
			String name = nc.getFood().getName();
			int amount = nc.getAmount();
			if(!totalEat.containsKey(name)) { //없으면
				totalEat.put(name, amount);
			}else { //이미 있으면 
				int temp = totalEat.get(name);
				totalEat.replace(name, temp+amount);
			}
		}
		
		List<String[]> arr = new LinkedList<>();
		Iterator<String> keys = totalEat.keySet().iterator();
		int index = 0;
        while( keys.hasNext() ){
            String key = keys.next();
            arr.add(index++, new String[]{key,String.valueOf(totalEat.get(key))});
//            System.out.println( String.format("키 : %s, 값 : %s", key, map.get(key)) );
        }

        for (String[] strings : arr) {
			System.out.println(Arrays.toString(strings));
		}
		request.setAttribute("n1", nut);
		request.setAttribute("n2", arr);
		request.setAttribute("n3", carts);
		
		return "cart";
	}
	@PostMapping("login.do")
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idsave = request.getParameter("idsave");
		String referer = request.getParameter("referer");

		Cookie cookie = new Cookie("id", id);
		if (idsave != null) {
			cookie.setMaxAge(10000000);
		} else {
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		try {
			memberService.login(id, pw);
			addToSession(request, "id", id);
			if (referer != null) {
				return referer;
			} else {
				return "redirect:index.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "login";
		}
	}

	@PostMapping("findpassword.do")
	private String findpw(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		try {
			Member member = memberService.search(id);
			if (member != null) {
				request.setAttribute("findpw", member);
				return "findPassword";
			} else {
				return "findPasswordForm.do";
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "findPassword";
		}
	}

	@PostMapping("search.do")
	private String searchAllFood(HttpServletRequest request, HttpServletResponse response) {
		String option = request.getParameter("droplist");
		String searchbar = request.getParameter("searchbar");
		List<Food> list = null;

		request.setAttribute("droplist", option);
		request.setAttribute("searchbar", searchbar);
		if (option.equals("1")) {
			list = foodService.searchAllName(searchbar);
		} else if (option.equals("2")) {
			list = foodService.searchAllMaker(searchbar);
		} else if (option.equals("3")) {
			list = foodService.searchAllMaterial(searchbar);
		} else {
			list = foodService.searchAll();
		}
		Collections.sort(list);
		request.setAttribute("list", list);
		return "index";
	}

	private String searchFood(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		return "main.jsp#portfolioModal1";
	}

	@GetMapping("index.do")
	private String listFood(HttpServletRequest request, HttpServletResponse response) {
		
		List<Food> list = foodService.searchAll();
		System.out.println(list);
		Collections.sort(list);

		request.setAttribute("list", list);
		return "index";
	}
	
	
	//mydiet에 추가, 추가 버튼
	@PostMapping("addmydiet.do")
	private String addCart(HttpServletRequest request, HttpServletResponse response) {

		String amount = request.getParameter("cnt"); //추가 수량 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String current = format.format(time);
		
		MyDiet mydiet = new MyDiet();
		String code = request.getParameter("Fcode");
		String id = getId(request);
		int cnt = Integer.parseInt(amount);
		
		if(id==null) {
			request.setAttribute("msg", "로그인을 해주세요.");
		}else if(cnt>0 && code != null && current != null && id != null) {
			mydiet.setCode(code);
			mydiet.setRegdate(current);
			mydiet.setAmount(cnt);
			mydiet.setId(id);
			mydietService.insert(mydiet, request); //추가하기
			request.setAttribute("msg", "성공적으로  추가 되었습니다.");
		}else {
			request.setAttribute("msg", "추가 중 오류가 발생하였습니다.");
		}
		
		return "redirect:detailform.do?code="+code;
	}
	
	
	//카트 추가 , 찜버튼 
	@PostMapping("addcart.do")
	private String addMydiet(HttpServletRequest request, HttpServletResponse response) {
		
		String amount = request.getParameter("cnt"); //추가 수량 가져오기
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String current = format.format(time);
		
		Cart cart = new Cart();
		String code = request.getParameter("Fcode");
		String id = getId(request);
		int cnt = Integer.parseInt(amount);
		
		if(id==null) {
			request.setAttribute("msg", "로그인을 해주세요.");
		}else if(cnt>0 && code != null && current != null && id != null) {
			cart.setCode(code);
			cart.setRegdate(current);
			cart.setAmount(cnt);
			cart.setId(id);
			cartService.insert(cart, request); //추가하기
			request.setAttribute("msg", "성공적으로  추가 되었습니다.");
		}else {
			request.setAttribute("msg", "추가 중 오류가 발생하였습니다.");
		}
		
		return "redirect:detailform.do?code="+code;
	}
	
	

	public void addToSession(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	public String getId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("id");
	}
	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String url = "index.do";
	 * String action = request.getServletPath(); try { if(action!=null) {
	 * if(action.endsWith("searchFood.do")) { //제품 클릭시 모달.. 실패 url =
	 * searchFood(request, response); } else
	 * if(action.endsWith("foodNutritionInfo.do")) { url =
	 * nutrition(request,response); }
	 * 
	 * } }catch (Exception e) { e.printStackTrace(); request.setAttribute("msg",
	 * e.getMessage()); url = "ErrorHandler.jsp"; } if(url.startsWith("{")) {
	 * response.setContentType("application/json;charset=utf-8");
	 * response.getWriter().append(url); }else if(url.startsWith("redirect")) {
	 * response.sendRedirect(url.substring(url.indexOf(":")+1)); }else {
	 * request.getRequestDispatcher(url).forward(request, response); } }
	 */

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
