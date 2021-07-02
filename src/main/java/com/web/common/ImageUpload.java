package com.web.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ImageUpload {

	@RequestMapping(value = "/imageupload.do", method = RequestMethod.POST, produces = "text/plain")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req) throws IOException {

		req.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("imageUpload");

		UUID randomString = UUID.randomUUID();
		String getFile = req.getFile("file").getOriginalFilename();
		int index = getFile.lastIndexOf(".");
		String name = getFile.substring(0, index);
		String ext = getFile.substring(index, getFile.length());
		String reName = name + "_" + randomString + ext;
		File reFile = new File(path, reName);
		req.getFile("file").transferTo(reFile);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload" + "/" + reName);
		response.getWriter().close();
	}


}
