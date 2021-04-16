package service;

import java.util.*;

import emp.session.empRepository;
import model.EmpVO;

public class EmpService {
	
	private static EmpService service;
	
	private EmpService() {}
	public static EmpService getInstance(){
		if( service == null) service = new EmpService();
		return service;
	}
	private empRepository repo = new empRepository();//세션 클래스

	public List<HashMap> selectEmp(){
		return repo.selectEmp();	
	}

}