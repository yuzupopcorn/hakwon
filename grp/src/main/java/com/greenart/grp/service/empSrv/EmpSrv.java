package com.greenart.grp.service.empSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greenart.grp.model.EmpVO;
import com.greenart.grp.repository.empDao.EmpDao;

@Service
public class EmpSrv {
	
	@Autowired
	EmpDao eDao;
	
	public List<EmpVO> getEmpList(int start, int end, String searchOpt, String words) {
		return eDao.getEmpList(start, end, searchOpt, words);
	}
	
	public int getEmpCount(String searchOpt, String words) {
		return eDao.getEmpCount(searchOpt, words);
	}
	
	public void setEmpDelete(int eid) {
		eDao.setEmpDelete(eid);
	}
	
	public void setEmpDeleteAll(int eid) {
		eDao.setEmpDeleteAll(eid);
	}
	
	public void setEmpHeadChange(String empHead, int empID) {
		eDao.setEmpHeadChange(empHead, empID);
	}
	
	public void setEmpConfirmChange(String empConfirm, int empID) {
		eDao.setEmpConfirmChange(empConfirm, empID);
	}
	
	public void setEmpAuthChange(String empAuth, int empID) {
		eDao.setEmpAuthChange(empAuth, empID);
	}
	
	public EmpVO getEmpOne(String sessionNum) {
		return eDao.getEmpOne(sessionNum);
	}
	
	public void setEmpRegOthers(EmpVO evo) {
		eDao.setEmpRegOthers(evo);
	}

}
