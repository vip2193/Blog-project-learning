package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.service.BlogService;

@Controller
public class IndexController {
	
	@RequestMapping(value = {"index.do"})
	public String index(){
		return "index";
	}
	
	//图片上传 
	@RequestMapping("uploadImg.do")
	@ResponseBody
	public Map<String, Object> uploadImg(MultipartFile file) {
		Map<String, Object> map = new HashMap<>();
		//设置一个随机的图片名称
		String imgName = UUID.randomUUID().toString();
		//获取文件名
		String fileName = file.getOriginalFilename();
		//获取图片的后缀
		String lastName = fileName.substring(fileName.lastIndexOf("."));
		//保存文件
		try {
			file.transferTo(new File("D:/upload/img/" + imgName + lastName));
			map.put("success",1);//上传成功
			map.put("message","上传成功");
			map.put("url", imgName + lastName);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success",0);//上传失败
			map.put("message","上传失败,图片不能超过10M");
		}
		return map;
	}
	
	//图片上传 
	@RequestMapping("uploadMdImg.do")
	@ResponseBody
	public  Map<String, Object> editormdPic(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file) throws Exception{
		Map<String, Object> map = new HashMap<>();
		//设置一个随机的图片名称
		String imgName = UUID.randomUUID().toString();
		//获取文件名
		String fileName = file.getOriginalFilename();
		//获取图片的后缀
		String lastName = fileName.substring(fileName.lastIndexOf("."));
		//保存文件
		try {
			file.transferTo(new File("D:/upload/img/" + imgName + lastName));
			map.put("success",1);//上传成功
			map.put("message","上传成功");
			map.put("url", "/pic/" +imgName + lastName);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success",0);//上传失败
			map.put("message","上传失败,图片不能超过10M");
		}
		return map;
	}
		
	
	@RequestMapping("test.do")
	public String test(){
		return "test";
	}
}
