package com.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.common.SHA256;
import com.web.model.Tuser;
import com.web.service.MainService;

@Controller
public class MainControllerImpl implements MainController {

	public MainControllerImpl() {
	}

	@Resource(name = "mainService")
	private MainService mainService;

	// 로그인 세션 생성
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam HashMap<String, String> hMap) {
		try {
			Tuser user = new Tuser();
			user.setUserId(hMap.get("id"));
			user.setUserPwd(SHA256.input(hMap.get("pwd")));

			List<?> list = mainService.selectLogin(user);

			if (list.size() > 0) {
				session = request.getSession();
				session.setAttribute("user", list);
			} else {
				return "loginfail";
			}

		} catch (NoSuchAlgorithmException e) {
			System.err.println(e.getMessage());
		}
		return "redirect:/";
	}

	// 로그아웃 세션 파기
	@Override
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (session.getAttribute("user") != null) {
			session.invalidate();
		}

		return "redirect:/";
	}

	// 회원가입 페이지 이동
	@Override
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}

	// 회원가입
	@Override
	@RequestMapping(value = "/signupgo.do", method = RequestMethod.POST)
	public String signupgo(@RequestParam HashMap<String, String> hMap) {

		String page = "";

		Tuser tuser = new Tuser();
		try {
			tuser.setUserId(hMap.get("userId"));
			tuser.setUserPwd(SHA256.input(hMap.get("userPwd")));
			tuser.setUserName(hMap.get("userName"));
			tuser.setEmail(hMap.get("email"));

			int executeRtn = mainService.saveSignupgo(tuser);

			System.out.println(executeRtn);

			if (executeRtn > 0) {
				page = "signupsuccess";
			} else
				page = "signupfail";

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return page;
	}

	// 보관함 페이지 이동
	@Override
	@RequestMapping(value = "/inventory.do", method = RequestMethod.GET)
	public String inventory(HttpServletRequest request, @RequestParam HashMap<String, String> hMap) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "needlogin";
		} else {
			List<?> list = mainService.selectInventory(hMap.get("userNo"));
			request.setAttribute("itemList", list);
			return "inventory";
		}
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/enchant.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String enchant(HttpServletRequest request, @RequestParam HashMap<String, String> hMap) {
		int enchantValue = (int) (Math.random() * 100) + 1;
		String resultRtn = "";
		if (1 <= enchantValue && enchantValue <= 50) {
			int executeRtn = mainService.updateEnchant(hMap);
			if (executeRtn > 0) {
				resultRtn = "success";
			}
		} else
			resultRtn = "fail";
		return resultRtn;
	}

	// 테스트용
	@Override
	@RequestMapping(value = "/corona.do", method = RequestMethod.GET)
	public String corona(HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());

		List<?> list = mainService.selectCorona();

		request.setAttribute("list", list);
		request.setAttribute("year", dateStr.substring(0, 4));
		request.setAttribute("month", dateStr.substring(4, 6));
		request.setAttribute("date", dateStr.substring(6, 8));

		return "corona";
	}

	@SuppressWarnings("all")
	@Override
	@RequestMapping(value = "/coronatest.do", method = RequestMethod.GET)
	public void insertCoronaBatch() {

		final String SERVICE_KEY = "q%2FFm6LYch%2F0g182SfkDmDHy403n2UcokdweYJvJ1NIbyAK23zccxMDUin4AbuZT0yKWpYfh%2F135f4DMl4HB5wA%3D%3D";
		final String CORONA_URL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?";
		BufferedReader br = null;
		ArrayList<HashMap<String, Object>> list = null;

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());

		try {
			URL url = new URL(CORONA_URL + "serviceKey=" + SERVICE_KEY + "&pageNo=1&numOfRows=19&startCreateDt="
					+ dateStr + "&endCreateDt=" + dateStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			int responseCode = conn.getResponseCode();

			if (responseCode == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

				String xml = IOUtils.toString(br);

				JSONObject jp = XML.toJSONObject(xml);

				String str = jp.toString();

				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(str, new TypeReference<Map<String, Object>>() {
				});

				Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
				Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
				Map<String, Object> items = null;
				List<Map<String, Object>> itemList = null;

				items = (Map<String, Object>) body.get("items");
				itemList = (List<Map<String, Object>>) items.get("item");

				list = new ArrayList<HashMap<String, Object>>();
				HashMap<String, Object> resultMap = null;

				for (int i = itemList.size() - 1; i >= 0; i--) {
					resultMap = new HashMap<String, Object>();
					resultMap.put("city", itemList.get(i).get("gubun")); // 도시
					resultMap.put("incDec", itemList.get(i).get("incDec")); // 전일대비증감
					resultMap.put("deathCnt", itemList.get(i).get("deathCnt")); // 사망자
					resultMap.put("isolClearCnt", itemList.get(i).get("isolClearCnt")); // 격리해제
					resultMap.put("isolIngCnt", itemList.get(i).get("isolIngCnt")); // 격리중
					resultMap.put("defCnt", itemList.get(i).get("defCnt")); // 확진자
					resultMap.put("stdDay", itemList.get(i).get("stdDay")); // 기준일시
					resultMap.put("overFlowCnt", itemList.get(i).get("overFlowCnt")); // 해외유입감염
					resultMap.put("localOccCnt", itemList.get(i).get("localOccCnt")); // 지역감염

					int executeRtn = mainService.insertCorona(resultMap);

					if (executeRtn < 1) {
						new Exception("CORONA INSERT ERROR");
					} else {
						System.out.println("CORONA INSERT SUCCESS");
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}

/*
 * 
 * 
 * final String SERVICE_KEY =
 * "q%2FFm6LYch%2F0g182SfkDmDHy403n2UcokdweYJvJ1NIbyAK23zccxMDUin4AbuZT0yKWpYfh%2F135f4DMl4HB5wA%3D%3D";
 * final String CORONA_URL =
 * "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?";
 * BufferedReader br = null; ArrayList<HashMap<String, Object>> list = null;
 * 
 * SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); String dateStr =
 * sdf.format(new Date());
 * 
 * try { URL url = new URL(CORONA_URL + "serviceKey=" + SERVICE_KEY +
 * "&pageNo=1&numOfRows=19&startCreateDt=" + dateStr + "&endCreateDt=" +
 * dateStr); HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 * int responseCode = conn.getResponseCode();
 * 
 * if (responseCode == HttpURLConnection.HTTP_OK) { br = new BufferedReader(new
 * InputStreamReader(conn.getInputStream()));
 * 
 * String xml = IOUtils.toString(br);
 * 
 * JSONObject jp = XML.toJSONObject(xml);
 * 
 * String str = jp.toString();
 * 
 * ObjectMapper objectMapper = new ObjectMapper(); Map<String, Object> map = new
 * HashMap<String, Object>(); map = objectMapper.readValue(str, new
 * TypeReference<Map<String, Object>>() { });
 * 
 * Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
 * Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
 * Map<String, Object> items = null; List<Map<String, Object>> itemList = null;
 * 
 * items = (Map<String, Object>) body.get("items"); itemList = (List<Map<String,
 * Object>>) items.get("item");
 * 
 * // System.out.println(items.toString()); //
 * System.out.println(itemList.toString()); // list = new
 * ArrayList<HashMap<String, Object>>(); HashMap<String, Object> resultMap =
 * null;
 * 
 * for (int i = itemList.size() - 1; i >= 0; i--) { resultMap = new
 * HashMap<String, Object>(); resultMap.put("city",
 * itemList.get(i).get("gubun")); resultMap.put("incDec",
 * itemList.get(i).get("incDec")); resultMap.put("deathCnt",
 * itemList.get(i).get("deathCnt")); resultMap.put("isolClearCnt",
 * itemList.get(i).get("isolClearCnt")); resultMap.put("defCnt",
 * itemList.get(i).get("defCnt")); //
 * System.out.println(itemList.get(i).get("gubun") + "-> " +
 * itemList.get(i).get("incDec") + "명"); //
 * System.out.println(itemList.get(i).get("gubun") + "-> " +
 * itemList.get(i).get("incDec") + "명");
 * 
 * list.add(resultMap); }
 * 
 * // JSONObject jo = (JSONObject) jp.parse(br); //
 * System.out.println(jo.toString()); // JSONArray jArray = (JSONArray)
 * jo.get("data");
 * 
 * // for (int i = 0; i < jArray.size(); i++) { // JSONObject o = (JSONObject)
 * jArray.get(i); // // map.put("division", (String) o.get("구분")); //
 * map.put("no", (String) o.get("노선번호")); // map.put("ssid", (String)
 * o.get("서비스세트식별자(SSID)")); // map.put("installNo", (String) o.get("설치대수")); //
 * map.put("dueDate", (String) o.get("설치완료일")); // map.put("name", (String)
 * o.get("운수사명")); // map.put("garage", (String) o.get("차고지")); //
 * map.put("agency", (String) o.get("통신사")); // // list.add(map); // } }
 * 
 * request.setAttribute("list", list); request.setAttribute("year",
 * dateStr.substring(0, 4)); request.setAttribute("month", dateStr.substring(4,
 * 6)); request.setAttribute("date", dateStr.substring(6, 8));
 * 
 * } catch (Exception e) { System.out.println(e.getMessage()); }
 * 
 * return "corona";
 * 
 */
