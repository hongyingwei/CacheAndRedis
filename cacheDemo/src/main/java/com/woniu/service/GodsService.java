package com.woniu.service;

import com.github.pagehelper.PageInfo;
import com.woniu.dao.entity.Gods;

public interface GodsService {
	//查询商品列表(分页)
	public PageInfo<?> list(Integer pageNum, Integer pageSize);
	//更新商品
	public int updateGods(Gods gods);
	//删除商品
	public int deleteGods(Integer id);
	//获取商品信息
	public Gods get(Integer id);
}
