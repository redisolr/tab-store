package com.tab.test;

import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.junit.Test;

public class FastDFsClientTest {
	@Test
	public void testUpload() throws Exception{
		//加载配置为文件,配置文件中指定Trackerserver的位置
		ClientGlobal.init("D:\\develop\\eclipse\\project\\tabstore\\tab-manager-web\\src\\main\\resources\\fastdfs\\fdfs_client.conf");
		//创建一个TrackerClient对象
		TrackerClient trackerClient = new TrackerClient();
		//从TrackerClient 中获得TrackerServer对象
		TrackerServer trackerServer = trackerClient.getConnection();
		//生命一个StorageServer的应用,null
		StorageServer storageServer = null;
		//创建一个StorageClient对象.需要两个参数TrackerServer对象,StorageServer对象
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		//调用StoageClient对象upload方法上传图片,返回图片的url
		String[] strings = storageClient.upload_file("D:\\develop\\picture\\111.png", "png", null);
		for (String string : strings) {
			System.out.println(string);
		}
	}
}
