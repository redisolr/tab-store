package com.tab.search.activemq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class MyMessageListener implements MessageListener{

	@Override
	public void onMessage(Message message) {
		//接收到消息，做业务处理
		if (message instanceof TextMessage) {
			TextMessage textMessage = (TextMessage) message;
			String text = "";
			try {
				text = textMessage.getText();
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(text);
		}
		
	}

}
