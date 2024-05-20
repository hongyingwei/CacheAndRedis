package com.woniu.controller;

import com.github.pagehelper.PageInfo;
import com.woniu.dao.entity.Gods;
import com.woniu.service.GodsService;
import com.woniu.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GodsController extends BaseController {
	@Autowired
	private GodsService godsService;

	//分页列表查询
	@ResponseBody
	@RequestMapping("list")
	public PageInfo<?> list(Integer pageNum, Integer pageSize, ModelMap model) {
		PageInfo<?> list = godsService.list(pageNum, pageSize);
		return list;
	}

	//入口
	@RequestMapping("listPage")
	public String listPage() {
		return "/gods";
	}

	//到修改页面
	@RequestMapping("toChange/{id}")
	public String toChange(@PathVariable Integer id, ModelMap model) {
		Gods gods = godsService.get(id);
		model.put("gods", gods);
		return "/updateGods";
	}
	//修改数据
	@ResponseBody
	@RequestMapping("change")
	public Result change(Gods gods) {
		System.out.println(gods);
		int updateGods = godsService.updateGods(gods);
		if(updateGods==0) {
			return error();
		}
		return ok();
	}
	//删除数据
	@ResponseBody
	@RequestMapping("del/{id}")
	public Result del(@PathVariable Integer id) {
		int deleteGods = godsService.deleteGods(id);
		if(deleteGods==0) {
			return error();
		}
		return ok();
	}

}
