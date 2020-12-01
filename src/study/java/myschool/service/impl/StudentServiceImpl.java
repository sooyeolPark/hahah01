package study.java.myschool.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import study.java.myschool.model.Student;
import study.java.myschool.service.StudentService;

public class StudentServiceImpl implements StudentService {

	private SqlSession session;

	public StudentServiceImpl(SqlSession session) {
		this.session = session;

	}

	@Override
	public Student addStudent(Student params) throws NullPointerException, Exception {
		int row_count = session.insert("StudentMapper.add_student", params);
		if (row_count == 0) {
			throw new NullPointerException();
		}

		return session.selectOne("StudentMapper.get_student_item", params);

	}

	@Override
	public Student editStudent(Student params) throws NullPointerException, Exception {

		int row_count = session.update("StudentMapper.edit_student", params);
		if (row_count == 0) {
			throw new NullPointerException();
		}
		return session.selectOne("StudentMapper.get_student_item", params);
	}

	@Override
	public void deleteStudent(Student params) throws NullPointerException, Exception {

		int row_count = session.delete("StudentMapper.remove_student_by_studno", params);
		if (row_count == 0) {
			throw new NullPointerException();

		}
	}

	@Override
	public Student getStudentItem(Student params) throws NullPointerException, Exception {
		Student item = session.selectOne("StudentMapper.get_student_item", params);
		if (item == null) {
			throw new NullPointerException();
		}

		return item;
	}

	@Override
	public List<Student> getStudentList() throws NullPointerException, Exception {
		List<Student> list = session.selectList("StudentMapper.get_student_list", null);

		if (list == null) {
			throw new NullPointerException();
		}

		return list;
	}

}
