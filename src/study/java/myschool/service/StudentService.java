package study.java.myschool.service;

import java.util.List;

import study.java.myschool.model.Student;

public interface StudentService {
	//학과 정보를 새로 저장하고 저장된 정보를 조회하여 리턴한다. 
	public Student addStudent(Student params)
		throws NullPointerException,Exception;
	
	public Student editStudent(Student params)
			throws NullPointerException,Exception;
	
	public void deleteStudent(Student params)
			throws NullPointerException,Exception;

	public Student getStudentItem(Student params)
			throws NullPointerException,Exception;

	public  List<Student> getStudentList()
			throws NullPointerException,Exception;

}
