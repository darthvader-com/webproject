package com.web.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ImageUpload {

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping(value = "/imageupload.do", method = RequestMethod.POST, produces = "text/plain")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req,
			MultipartFile file) throws IOException {

		if (!new File(uploadPath).exists()) {
			new File(uploadPath).mkdirs();
		}

		req.setCharacterEncoding("utf-8");

		UUID randomString = UUID.randomUUID();
		String getFile = req.getFile("file").getOriginalFilename();
		int index = getFile.lastIndexOf(".");
		String name = getFile.substring(0, index);
		String ext = getFile.substring(index, getFile.length());
		String reName = name + "_" + randomString + ext;

		File target = new File(uploadPath, reName);

		try {
			FileCopyUtils.copy(file.getBytes(), target);

			response.setCharacterEncoding("utf-8");
			response.getWriter().print("/img" + "/" + reName);
			response.getWriter().close();

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

	}

}
