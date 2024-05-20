package com.woniu.dao.mapper;

import com.woniu.dao.entity.Gods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface GodsMapper {
	//分页查询
	@Select(value="select * from gods")
	public List<Gods> list();
	//更新商品
	public int updateGods(Gods gods);
	//删除商品
	@Delete(value="delete from gods where id=#{id}")
	public int delGods(Integer id);
	//根据主键查询商品
	@Select(value="select * from gods where id = #{id}")
	public Gods get(Integer id);
}
