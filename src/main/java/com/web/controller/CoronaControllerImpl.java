package com.web.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.service.CoronaService;

@Controller
public class CoronaControllerImpl implements CoronaController {

	public CoronaControllerImpl() {
	}

	@Resource(name = "coronaService")
	private CoronaService coronaService;

	// PC 페이지로 이동
	@Override
	@RequestMapping(value = "pindex.do", method = RequestMethod.GET)
	public String pindex(HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());

		List<?> list = coronaService.selectCorona();

		request.setAttribute("list", list);
		request.setAttribute("year", dateStr.substring(0, 4));
		request.setAttribute("month", dateStr.substring(4, 6));
		request.setAttribute("date", dateStr.substring(6, 8));

		return "corona";
	}

	// 모바일 페이지로 이동
	@Override
	@RequestMapping(value = "mindex.do", method = RequestMethod.GET)
	public String mindex(HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());

		List<?> list = coronaService.selectCorona();

		request.setAttribute("list", list);
		request.setAttribute("year", dateStr.substring(0, 4));
		request.setAttribute("month", dateStr.substring(4, 6));
		request.setAttribute("date", dateStr.substring(6, 8));

		return "mindex";
	}

	// 코로나 페이지 이동
	@Override
	@RequestMapping(value = "/corona.do", method = RequestMethod.GET)
	public String corona(HttpServletRequest request) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());

		List<?> list = coronaService.selectCorona();

		request.setAttribute("list", list);
		request.setAttribute("year", dateStr.substring(0, 4));
		request.setAttribute("month", dateStr.substring(4, 6));
		request.setAttribute("date", dateStr.substring(6, 8));

		return "corona";
	}

	// 코로나 데이터 업데이트 배치
	@Override
	@SuppressWarnings("all")
	@RequestMapping(value = "/coronaupdate.do", method = RequestMethod.GET)
	public String insertCoronaBatch() {

		String rtn = "";
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

					int executeRtn = coronaService.insertCorona(resultMap);

					if (executeRtn < 1) {
//						new Exception("CORONA INSERT ERROR");
						rtn = "error";
					} else {
						rtn = "successdata";
					}
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return rtn;

	}

	// 코로나 데이터
	@Override
	@RequestMapping(value = "/coronadata.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String coronaData(HttpServletRequest request, @RequestParam String value) {
		URL url;
		String line = null;
		StringBuilder sb = new StringBuilder();

		HttpHeaders resHeaders = new HttpHeaders();
		resHeaders.add("Content-Type", "application/json;charset=UTF-8");

		try {
			url = new URL("https://www.safekorea.go.kr/idsiSFK/bbs/user/selectBbsView.do");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Referer",
					"https://www.safekorea.go.kr/idsiSFK/neo/sfk/cs/sfc/dis/disasterMsgView.jsp?menuSeq=679");
			conn.setRequestProperty("User-Agent",
					"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36");

			String body = "{\"bbs_searchInfo\":{\"pageIndex\":\"1\",\"pageUnit\":\"10\",\"pageSize\":\"10\",\"firstIndex\":\"1\",\"lastIndex\":\"1\",\"recordCountPerPage\":\"10\",\"bbs_no\":\"63\",\"bbs_ordr\":\""
					+ value + "\",\"opCode\":\"2\"}}";

			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(body);
			os.flush();

			BufferedReader br = null;

			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

			JSONObject jo = new JSONObject(sb.toString());
			JSONObject bbsObject = new JSONObject(jo.get("bbsMap").toString());

			HashMap<String, Object> hMap = new HashMap<String, Object>();

			ArrayList<HashMap<String, Object>> aList = new ArrayList<HashMap<String, Object>>();

			hMap.put("content", bbsObject.get("cn"));
			hMap.put("time", bbsObject.get("sj"));
			hMap.put("content_no", bbsObject.get("bbs_ordr"));
			hMap.put("content_gb", bbsObject.get("bbs_no"));
			hMap.put("content_send_time", bbsObject.get("frst_regist_dt"));

			aList.add(hMap);

			os.close();
			br.close();

			request.setAttribute("list", aList);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "coronadata";

	}

}