package com.sms.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sms.base.BaseDaoHibernate;
import com.sms.model.Student;


@Repository("employeeDao")
public class StudentDaoImpl extends BaseDaoHibernate implements StudentDao  {

	public StudentDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
		// TODO Auto-generated constructor stub
	}

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addStudent(Student stud) {
		sessionFactory.getCurrentSession().saveOrUpdate(stud);
	}

	@SuppressWarnings("unchecked")
	public List<Student> listStudent() {
		return (List<Student>) sessionFactory.getCurrentSession().createCriteria(Student.class).list();
	}

	public Student getStudent(int empid) {
		return (Student) sessionFactory.getCurrentSession().get(Student.class, empid);
	}

	public void deleteStudent(Student student) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Student WHERE id = ?").setParameter(0, student.getId()).executeUpdate();
	}

}
