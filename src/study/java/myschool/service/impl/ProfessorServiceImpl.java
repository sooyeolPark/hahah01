package study.java.myschool.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import study.java.myschool.model.Professor;
import study.java.myschool.model.Student;
import study.java.myschool.service.ProfessorService;

public class ProfessorServiceImpl implements ProfessorService {
	
	private SqlSession session; 
	
	public ProfessorServiceImpl(SqlSession session) {
		this.session = session; 
		
	}
	
	

	@Override
	public Professor addProfessor(Professor params) throws NullPointerException, Exception {
		int row_count = session.insert("ProfessorMapper.add_professor", params);
		if (row_count ==0) {
			throw new NullPointerException();
		}
		
		return session.selectOne("ProfessorMapper.get_professor_item",params);
				
	}

	@Override
	public Professor editProfessor(Professor params) throws NullPointerException, Exception {
		
		int row_count = session.update("ProfessorMapper.edit_professor", params);
		if (row_count==0) {
			throw new NullPointerException();
		}
		return session.selectOne("ProfessorMapper.get_professor_item",params);
	}

	@Override
	public void deleteProfessor(Professor params) throws NullPointerException, Exception {
		
		//1) 학생 데이터 삭제
		Student stud = new Student();
		stud.setProfno(params.getProfno());  // 이부분 왜 stud에 들어가는지 이해안됨 
		session.delete("StudentMapper.remove_student_by_profno",stud);
		
		
		
		//2) 교수 데이터 삭제
		
		int row_count =	session.delete("ProfessorMapper.remove_professor_by_profno",params);
		
		if (row_count == 0) {
			throw new NullPointerException();

		}
	}
		
		

		
		


	@Override
	public Professor getProfessorItem(Professor params) throws NullPointerException, Exception {
		Professor item = session.selectOne("ProfessorMapper.get_professor_item",params);
		if(item==null) {
			throw new NullPointerException();
		}
		
		return item;
	}

	@Override
	public List<Professor> getProfessorList() throws NullPointerException, Exception {
		List<Professor> list = session.selectList("ProfessorMapper.get_professor_list",null);
		
		if(list ==null) {
			throw new NullPointerException();
		}
		
		return list;
	}



}
