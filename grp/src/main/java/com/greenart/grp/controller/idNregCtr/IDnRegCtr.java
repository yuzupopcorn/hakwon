package com.greenart.grp.controller.idNregCtr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.greenart.grp.model.BuseoVO;
import com.greenart.grp.model.ComVO;
import com.greenart.grp.model.EmpVO;
import com.greenart.grp.model.GradeVO;
import com.greenart.grp.service.comSrv.ComSrv;
import com.greenart.grp.service.idNregSrv.IDnRegSrv;

@Controller
public class IDnRegCtr {
	
	@Autowired
	IDnRegSrv irSrv;
	
	@Autowired
	ComSrv cSrv;
	
	@RequestMapping(value ="", method = RequestMethod.GET)
	public ModelAndView grpMain() {
		ComVO cvo = cSrv.getCompany();
		ModelAndView mav = new ModelAndView();
		mav.addObject("comMainLogo", cvo.getComMainLogo());
		mav.addObject("comMainUp", cvo.getComMainUp());
		mav.addObject("comMainDown", cvo.getComMainDown());
		mav.addObject("comMenu", cvo.getComMenu());
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/grp_login", method = RequestMethod.GET)
	public ModelAndView getGrpLogin() {
		ComVO cvo = cSrv.getCompany();
		ModelAndView mav = new ModelAndView();
		mav.addObject("comName", cvo.getComName());
		mav.addObject("comSubName", cvo.getComSubName());
		mav.setViewName("grp_login");
		return mav;
	}
	
	@RequestMapping(value = "/grp_logout", method = RequestMethod.GET)
	public String getGrpLogout(HttpSession session) {
		irSrv.setLogout(session);
		return "redirect:/grp_login";
	}
	
	@RequestMapping(value = "/grp_login", method = RequestMethod.POST)
	public ModelAndView SetGrpLogin(@ModelAttribute EmpVO evo, HttpSession session) {
		// System.out.println(evo); // 전체를 담고 있는 객체의 시작 주소
		
		int result = irSrv.getEmpNumCheck(evo);
		ComVO cvo = cSrv.getCompany();
		int auth = cSrv.getCompany().getComAuth();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("comName", cvo.getComName());
		mav.addObject("comSubName", cvo.getComSubName());
		
		String msg;
		if(result > 0) {
			EmpVO vo = irSrv.getEmpInfo(evo);
			if(vo.getEmpAuth() > auth && vo.getEmpConfirm().equals("Y") ) {
				irSrv.setSession(evo, session);
				mav.setViewName("redirect:/grp_admin");
			}else if (vo.getEmpAuth() >= auth && vo.getEmpConfirm().equals("Y") ) {
				irSrv.setSession(evo, session);
				mav.setViewName("redirect:/");
			}else {
				msg = "접속 권한이 없습니다.\n 관리자에게 문의하세요";
				mav.addObject("msg",msg);
				mav.setViewName("grp_login");
			}
			// 관리자 -> 관리자 페이지
			
			// 적절한 권한 X -> 메인페이지
			
		}else {
			msg = "등록 된 사번이 아닙니다.";
			mav.addObject("msg",msg);
			mav.setViewName("grp_login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/grp_get_buseo", method = RequestMethod.POST)
	@ResponseBody
	public List<BuseoVO> grpGetBuseo() {
		List<BuseoVO> list = irSrv.grpGetBuseo();
		
		return list;
	}
	
	@RequestMapping(value = "/grp_get_grade", method = RequestMethod.POST)
	@ResponseBody
	public List<GradeVO> grpGetGrade() {
		List<GradeVO> list = irSrv.grpGetGrade();
		
		return list;
	}
	
	


}
