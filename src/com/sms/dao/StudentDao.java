package com.sms.dao;

import java.util.List;

import com.sms.base.BaseDao;
import com.sms.model.Student;


public interface StudentDao extends BaseDao {
	
	public void addStudent(Student stud);

	public List<Student> listStudent();
	
	public Student getStudent(int id);
	
	public void deleteStudent(Student stud);
}
