package com.tab.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tab.common.FastDFSClient;
import com.tab.common.pojo.PictureResult;
import com.tab.common.utils.JsonUtils;

@Controller
public class PictureController {
	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;

	@RequestMapping("/pic/upload")
	@ResponseBody
	public String  uploadFile(MultipartFile uploadFile) {
		try {
			FastDFSClient fastDFSClient = new FastDFSClient("classpath:fastdfs/fdfs_client.conf");
			// 取扩展名
			String oldName = uploadFile.getOriginalFilename();
			String extName = oldName.substring(oldName.lastIndexOf(".") + 1);
			// 上传图片
			String url = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
			// 拼接上服务器地址
			url = IMAGE_SERVER_URL + url;
			// 创建返回的对象
			PictureResult result = new PictureResult();
			result.setError(0);
			result.setUrl(url);
			return JsonUtils.objectToJson(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			PictureResult result = new PictureResult();
			result.setError(1);
			result.setMessage("上传文件失败");
			return JsonUtils.objectToJson(result);
		}
	}
}
