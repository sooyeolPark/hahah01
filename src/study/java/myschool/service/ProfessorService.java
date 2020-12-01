package study.java.myschool.service;

import java.util.List;

import study.java.myschool.model.Professor;

public interface ProfessorService {
	//학과 정보를 새로 저장하고 저장된 정보를 조회하여 리턴한다. 
	public Professor addProfessor(Professor params)
		throws NullPointerException,Exception;
	
	public Professor editProfessor(Professor params)
			throws NullPointerException,Exception;
	
	public void deleteProfessor(Professor params)
			throws NullPointerException,Exception;

	public Professor getProfessorItem(Professor params)
			throws NullPointerException,Exception;

	public  List<Professor> getProfessorList()
			throws NullPointerException,Exception;

}
