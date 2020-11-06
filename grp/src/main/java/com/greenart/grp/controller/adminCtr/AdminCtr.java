package com.greenart.grp.controller.adminCtr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/grp_admin")
public class AdminCtr {

	@RequestMapping("") // localhost:6789/grp/grp_damin
	public String grpAdmin() {
		return "grp_admin/grp_admin_main";
	}
	
}
