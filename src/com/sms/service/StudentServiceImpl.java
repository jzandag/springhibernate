package com.sms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sms.base.BaseServiceImpl;
import com.sms.dao.StudentDao;
import com.sms.model.Student;

@Service("studentService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class StudentServiceImpl extends BaseServiceImpl implements StudentService  {

	@Autowired
	private StudentDao employeeDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addStudent(Student stud) {
		employeeDao.addStudent(stud);
	}
	
	public List<Student> listStudentss() {
		return employeeDao.listStudent();
	}

	public Student getStudent(int id) {
		return employeeDao.getStudent(id);
	}
	
	public void deleteStudent(Student employee) {
		employeeDao.deleteStudent(employee);
	}

}
