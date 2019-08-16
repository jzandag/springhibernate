package com.sms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sms.base.BaseController;
import com.sms.bean.StudentBean;
import com.sms.model.Student;
import com.sms.service.StudentService;


@Controller
public class SpringController extends BaseController {
	
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveEmployee(@ModelAttribute("command") StudentBean studentBean, BindingResult result) {
		Student stud = prepareModel(studentBean);
		studentService.addStudent(stud);
		return "students";
	}

	@RequestMapping(value="/students", method = RequestMethod.GET)
	public String listEmployees(HttpServletRequest request, ModelMap model) {
		
		model.put("students",  prepareListofBean(studentService.listStudentss()));
		return "student";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addEmployee(@ModelAttribute("command")  StudentBean employeeBean, ModelMap model, BindingResult result) {
		model.put("students",  prepareListofBean(studentService.listStudentss()));
		return "addStudent";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String welcome() {
		return "index";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String editEmployee(@ModelAttribute("command") StudentBean studentBean, ModelMap model,BindingResult result) {
		studentService.deleteStudent(prepareModel(studentBean));

		model.put("stud", null);
		model.put("students",  prepareListofBean(studentService.listStudentss()));
		return "student";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String deleteEmployee(@ModelAttribute("command")  StudentBean studentBean,ModelMap model, BindingResult result) {
		
		model.put("stud", prepareEmployeeBean(studentService.getStudent(studentBean.getId())));
		model.put("students",  prepareListofBean(studentService.listStudentss()));
		return "addStudent";
	}
	
	private Student prepareModel(StudentBean studentBean){
		Student stud = new Student();
		stud.setId(studentBean.getId());
		stud.setFirstName(studentBean.getFirstName());
		stud.setLastName(studentBean.getLastName());
		stud.setEmail(studentBean.getEmail());
		stud.setCourse(studentBean.getCourse());
		studentBean.setId(null);
		return stud;
	}
	
	private List<StudentBean> prepareListofBean(List<Student> students){
		List<StudentBean> beans = null;
		if(students != null && !students.isEmpty()){
			beans = new ArrayList<StudentBean>();
			StudentBean bean = null;
			for(Student stud : students){
				bean = new StudentBean();
				bean.setId(stud.getId());
				bean.setFirstName(stud.getFirstName());
				bean.setLastName(stud.getLastName());
				bean.setEmail(stud.getEmail());
				bean.setCourse(stud.getCourse());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private StudentBean prepareEmployeeBean(Student stud){
		StudentBean bean = new StudentBean();
		bean.setId(stud.getId());
		bean.setFirstName(stud.getFirstName());
		bean.setLastName(stud.getLastName());
		bean.setEmail(stud.getEmail());
		bean.setCourse(stud.getCourse());
		return bean;
	}
}
