package com.tao.springboot.controller;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import com.tao.springboot.Message;
import com.tao.springboot.entity.Admin;
import com.tao.springboot.service.AdminService;
import com.tao.springboot.service.RoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @Author: JiantaoYan
 * @Description:
 * @Date: 20:53 2018/11/27
 */
@Controller("mainController")
@RequestMapping("/admin/")
public class MainController extends BaseController{

    @Resource(name = "adminServiceImpl")
    private AdminService adminService;

    @Resource(name = "roleServiceImpl")
    private RoleService roleService;


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(String username, String password, ModelMap model) throws Exception {
        return "/admin/login";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap model) throws Exception {
        Admin admin = adminService.getCurrent();
        model.addAttribute("admin", admin);
        return "/admin/index";
    }

    @ResponseBody
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public Message checkLogin(String captcha, String username, String password, HttpServletRequest request) {

        HttpSession session = request.getSession();
        String kaptchaKey = com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;
        String kaptchaValue = (String) session.getAttribute(kaptchaKey);

        if (kaptchaValue == null || captcha == null) {
            return Message.error("请输入验证码");
        } else {
            kaptchaValue = kaptchaValue.toLowerCase();
            captcha = captcha.toLowerCase();
            if (kaptchaValue.equals(captcha) == false) {
                return Message.error("验证码错误");
            }
        }

        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username, DigestUtils.md5DigestAsHex(password.getBytes()));
            Subject currentUser = SecurityUtils.getSubject();
            currentUser.login(token);
        } catch (Exception e) {
            String exceptionType = e.toString();
            return Message.error(exceptionType);
        }
        return Message.success("登录成功");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(RedirectAttributes redirectAttributes) {
        SecurityUtils.getSubject().logout();
        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return "redirect:/admin/index.jhtml";
    }

    @RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
    public String unauthorized(ModelMap model) throws Exception {
        return "/admin/unauthorized";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(ModelMap model) throws Exception {
        return "/admin/welcome";
    }

    @RequestMapping(value = "/captcha", method = { RequestMethod.GET, RequestMethod.POST })
    public void image(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String pragma = new StringBuffer().append("yB").append("-").append("der").append("ewoP").reverse().toString();
        String value = new StringBuffer().append("ten").append(".").append("xxp").append("ohs").reverse().toString();
        response.addHeader(pragma, value);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");

        ServletOutputStream servletOutputStream = null;
        try {
            Producer captchaProducer = getCaptchaProducer();
            String captchaText = captchaProducer.createText();
            BufferedImage bufferedImage = captchaProducer.createImage(captchaText);
            servletOutputStream = response.getOutputStream();
            ImageIO.write(bufferedImage, "jpg", servletOutputStream);

            HttpSession session = request.getSession();
            String kaptchaKey = com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;
            session.setAttribute(kaptchaKey, captchaText);

            servletOutputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(servletOutputStream);
        }
    }

    private Producer getCaptchaProducer() {
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        Properties properties = new Properties();
        properties.setProperty("kaptcha.border", "yes");
        properties.setProperty("kaptcha.border.color", "105,179,90");
        properties.setProperty("kaptcha.textproducer.font.color", "blue");
        properties.setProperty("kaptcha.image.width", "125");
        properties.setProperty("kaptcha.image.height", "45");
        properties.setProperty("kaptcha.textproducer.char.length", "4");
        properties.setProperty("kaptcha.textproducer.font.names", "宋体,楷体,微软雅黑");
        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }

}
