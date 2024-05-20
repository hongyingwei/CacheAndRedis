package com.woniu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.woniu.dao.entity.Gods;
import com.woniu.dao.mapper.GodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GodsServiceImpl implements GodsService{
	@Autowired
	private GodsMapper godsMapper;
	@Override
	public PageInfo<Gods> list(Integer pageNum, Integer pageSize) {
        //设置分页，pageNum代表当前页，pageSize代表每页的记录数量
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<Gods> info = new PageInfo<>(godsMapper.list());
		return info;
	}
	@Override
	public int updateGods(Gods gods) {
		return godsMapper.updateGods(gods);
	}
	@Override
	public int deleteGods(Integer id) {
		return godsMapper.delGods(id);
	}
	@Override
	public Gods get(Integer id) {
		return godsMapper.get(id);
	}
}
