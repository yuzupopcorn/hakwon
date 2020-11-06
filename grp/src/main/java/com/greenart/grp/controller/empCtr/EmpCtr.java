package com.greenart.grp.controller.empCtr;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.greenart.grp.model.ComVO;
import com.greenart.grp.model.EmpVO;
import com.greenart.grp.paging.Pager;
import com.greenart.grp.service.comSrv.ComSrv;
import com.greenart.grp.service.empSrv.EmpSrv;
import com.greenart.grp.service.idNregSrv.IDnRegSrv;

@Controller
@RequestMapping("/employee")
public class EmpCtr {
	
	@Autowired
	EmpSrv eSrv;
	
	@Autowired
	IDnRegSrv irSrv;
	
	@Autowired
	ComSrv cSrv;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping("/grp_employee_list") //GET, POST 상관없이 동작
	public ModelAndView empList(
			@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "emp_name") String searchOpt,
			@RequestParam(defaultValue = "") String words) { 
		ModelAndView mav = new ModelAndView(); //데이터도 받고 화면도 받고

		int count = eSrv.getEmpCount(searchOpt, words);
		/******************************************************/
		Pager pager = new Pager(count, curPage);
		
		int start = pager.getPageBegin(); //0~10 -> 11~20
		int end = pager.getPageEnd();
		/*******************************************************/
		
		List<EmpVO> list = eSrv.getEmpList(start,end,searchOpt, words);
		
		mav.addObject("list", list); // "변수", 값
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		/*****************************시작*****************************/
		
		mav.addObject("start", start); //게시물 개수 자를 시잒번호
		mav.addObject("end", end); //게시물 자를 끝 번호
		
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage()); // 계산할 때 필요
		mav.addObject("totalPage", pager.getTotPage());
		
		//페이지 번호를 클릭했을 때 css active클래스 처리
		mav.addObject("selected", pager.getCurPage());
		
		/*************************************************************/
		
		mav.setViewName("grp_employee/grp_employee_list");
		return mav;
	}
	
	@RequestMapping(value="/grp_employee_delete", method = RequestMethod.POST)
	@ResponseBody
	public String grpEmpDelete(@RequestParam int eid) {
		eSrv.setEmpDelete(eid);
		return "success";
	}
	
	@RequestMapping(value="/grp_employee_head_change", method = RequestMethod.POST)
	@ResponseBody
	public String empHeadChange(@RequestParam String empHead, @RequestParam int empID) {
		eSrv.setEmpHeadChange(empHead, empID);
		return"success";
	}
	
	@RequestMapping(value="/grp_employee_confirm_change", method = RequestMethod.POST)
	@ResponseBody
	public String empConfirmChange(@RequestParam String empConfirm, @RequestParam int empID) {
		eSrv.setEmpConfirmChange(empConfirm, empID);
		return"success";
	}
	
	@RequestMapping(value="/grp_employee_auth_change", method = RequestMethod.POST)
	@ResponseBody
	public String empAuthChange(@RequestParam String empAuth, @RequestParam int empID) {
		eSrv.setEmpAuthChange(empAuth, empID);
		return"success";
	}
	
	@RequestMapping(value="/grp_employee_register", method = RequestMethod.GET)
	public ModelAndView grpEmpReg(HttpSession session) {
		String sessionNum = (String) session.getAttribute("empNum");
		
		EmpVO evo = eSrv.getEmpOne(sessionNum);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("empOne", evo);
		mav.setViewName("grp_employee/grp_employee_register");
		return mav;
	}
	

	@RequestMapping(value = "/grp_register", method = RequestMethod.GET)
	public ModelAndView getGrpRegister() {
		ComVO cvo = cSrv.getCompany();
		ModelAndView mav = new ModelAndView();
		mav.addObject("comName", cvo.getComName());
		mav.addObject("comSubName", cvo.getComSubName());
		mav.setViewName("grp_register");
		return mav;
	}
	
	@RequestMapping(value = "/grp_register", method = RequestMethod.POST)
	public String setGrpRegister(@ModelAttribute EmpVO evo) {
		/*사원번호 만들기 : 입사년도 + 부서코드 + 직급코드 + pk */
		int enterYear = Integer.parseInt(evo.getEmpEnter().substring(0, 4));
		String bCode = evo.getEmpBuseoCode();
		String gCode = evo.getEmpGradeCode();
		
		String eNum = enterYear + bCode + gCode;  
		evo.setEmpNum(eNum);
//		System.out.println(evo.getEmpNum());
		
		/*//사원번호 만들기*/
		
		/* 호봉 : empStep = 현재년도(hYear) - 입사년도(enterYear) */
		Calendar cal = Calendar.getInstance();
		int hYear = cal.get(Calendar.YEAR);
		int eStep = (hYear - enterYear) +1;
		evo.setEmpStep(eStep);
		/*//호봉 */
		
		/*필수 사원 정보 입력*/
		irSrv.setEmpRegister(evo);
		/*필수 사원 정보 입력*/
		
		return "redirect:/grp_login";
	}
	
	@RequestMapping(value = "/grp_admin_register", method = RequestMethod.POST)
	public String setGrpRegister(@ModelAttribute EmpVO evo, MultipartFile file) {
		/*사원번호 만들기 : 입사년도 + 부서코드 + 직급코드 + pk */
		int enterYear = Integer.parseInt(evo.getEmpEnter().substring(0, 4));
		String bCode = evo.getEmpBuseoCode();
		String gCode = evo.getEmpGradeCode();
		
		String eNum = enterYear + bCode + gCode;  
		evo.setEmpNum(eNum);
		
		/*//사원번호 만들기*/
		
		/*선택 사원 정보 입력*/
		
		eSrv.setEmpRegOthers(evo);
		irSrv.setEmpRegister(evo);
		/*선택 사원 정보 입력*/
		/*파일 업로드*/
		
		/*파일 업로드*/
		
		return "redirect:/employee/grp_employee_list";
	}
	
	@RequestMapping(value="/grp_employee_delete_all", method = RequestMethod.POST)
	@ResponseBody
	public String grpEmpDeleteAll(@RequestParam (value = "chkArr[]") List<String> chkArr) {
		//System.out.println(chkArr);
		
		int eid;
		for(String list : chkArr) {
			eid = Integer.parseInt(list);
			eSrv.setEmpDeleteAll(eid);
		}
		return "success";
	}
	
}
