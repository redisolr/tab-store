package com.tab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tab.mapper.TbItemDescMapper;
import com.tab.pojo.TbItemDesc;
import com.tab.service.ItemDescService;
@Service
public class ItemDescServiceImpl implements ItemDescService {
	@Autowired
	private TbItemDescMapper tbItemDescMapper;
	@Override
	public TbItemDesc geTbItemDescById(Long itemId) {
		
		TbItemDesc tbItemDesc = tbItemDescMapper.selectByPrimaryKey(itemId);
		return tbItemDesc;
	}

}
