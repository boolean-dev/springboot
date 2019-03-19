/*
 * 
 * 
 * 
 */
package com.tao.springboot.shiro;

import freemarker.core.Environment;
import freemarker.template.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component("hasPermissionTag")
public class HasPermissionTag implements TemplateDirectiveModel {

	private static final String VARIABLE_NAME = "name";
	
	@Override
	@SuppressWarnings("rawtypes")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
			throws TemplateException, IOException {
		TemplateScalarModel model = (TemplateScalarModel) params.get(VARIABLE_NAME);
		String name = model.getAsString();
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser != null && currentUser.isPermitted(name)){
			body.render(env.getOut());
		}
	}
}