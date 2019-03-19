package com.tao.springboot.controller;

import javax.annotation.Resource;

import com.tao.springboot.entity.Role;
import com.tao.springboot.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tao.springboot.Message;
import com.tao.springboot.Pageable;
import com.tao.springboot.entity.Admin;
import com.tao.springboot.service.AdminService;

import java.util.ArrayList;
import java.util.List;

/**
 * AdminController-管理员
 * @version: v1.0
 * @Description: 管理员
 * @author: yanjiantao
 * @date: 2018-12-03 09:54:02
 */
@Controller("adminAdminController")
@RequestMapping("/admin/admin")
public class AdminController extends BaseController {

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Resource(name = "roleServiceImpl")
	private RoleService roleService;
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) throws Exception {
		model.addAttribute("roles", roleService.findAll());
		return "/admin/admin/add";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public Object save(ModelMap model,Admin admin, String[] ids) throws Exception {
		admin.buildId();
		admin.setIsLocked(false);
		admin.setLoginFailureCount(0);
		admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
		adminService.save(admin,ids);
		return "redirect:list.jhtml";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(ModelMap model,String id) throws Exception {
		Admin admin = adminService.findById(id);
		Admin user = adminService.getCurrent();
		model.addAttribute("admin", admin);
		model.addAttribute("user", user);
		List<String> ids = new ArrayList<>();
		for(Role role : adminService.findRoles(admin.getId())){
			ids.add(role.getId());
		}
		model.addAttribute("ids", ids);
		model.addAttribute("roles", roleService.findAll());
		return "/admin/admin/edit";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ModelMap model,Admin admin,String[] ids) throws Exception {
        if(admin.getPassword()!=null&&admin.getPassword()!=""){
            admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
        }
        adminService.update(admin,ids);
        return "redirect:list.jhtml";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(ModelMap model,Pageable pageable) throws Exception {
		model.addAttribute("page", adminService.findPage(pageable));
		return "/admin/admin/list";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(ModelMap model,String id) throws Exception {
		Admin admin = adminService.findById(id);
		model.addAttribute("admin", admin);
		return "/admin/admin/view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Message delete(String[] ids) throws Exception {
		int i = adminService.delete(ids);
		if(i > 0){
			return SUCCESS_MESSAGE;
		}else{
			return SUCCESS_MESSAGE;
		}
	}

    @ResponseBody
    @RequestMapping(value = "/checkUsername", method = RequestMethod.GET)
    public boolean checkUsername(String username) throws Exception {
        Admin admin = adminService.findByUsername(username);
        if(admin == null){
            return true;
        }else{
            return false;
        }
    }
		
}