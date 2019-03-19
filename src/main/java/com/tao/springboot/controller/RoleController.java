/*
 * 
 * 
 * 
 */
package com.tao.springboot.controller;

import com.tao.springboot.Message;
import com.tao.springboot.Pageable;
import com.tao.springboot.entity.Role;
import com.tao.springboot.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;

/**
 * Controller - 角色
 * 
 * 
 * 
 */
@Controller("adminRoleController")
@RequestMapping("/admin/role")
public class RoleController extends BaseController {

	@Resource(name = "roleServiceImpl")
	private RoleService roleService;

	/**
	 * 添加
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add() {
		return "/admin/role/add";
	}

	/**
	 * 保存
	 * @throws Exception
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Role role, RedirectAttributes redirectAttributes) throws Exception {
		role.setIsSystem(false);
		roleService.save(role);
		return "redirect:list.jhtml";
	}

	/**
	 * 编辑
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(String id, ModelMap model) throws Exception {
		model.addAttribute("role", roleService.findById(id));
		return "/admin/role/edit";
	}

	/**
	 * 更新
	 * @throws Exception
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Role role, RedirectAttributes redirectAttributes) throws Exception {

//		Role pRole = roleService.find(role.getId());
//		if (pRole == null || pRole.getIsSystem()) {
//			return ERROR_VIEW;
//		}
		roleService.update(role);
		return "redirect:list.jhtml";
	}

	/**
	 * 列表
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Pageable pageable, ModelMap model) throws Exception {
		model.addAttribute("page", roleService.findPage(pageable));
		return "/admin/role/list";
	}

	/**
	 * 删除
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Message delete(String[] ids) throws Exception {
		roleService.delete(ids);
		return SUCCESS_MESSAGE;
	}

}