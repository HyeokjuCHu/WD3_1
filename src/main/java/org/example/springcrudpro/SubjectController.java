package org.example.springcrudpro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class SubjectController {

    @Autowired
    SubjectDAO subjectDAO;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@RequestParam(value = "search", required = false) String search, Model model) {
        List<SubjectVO> subjects;

        if (search != null && !search.isEmpty()) {
            subjects = subjectDAO.searchSubjects(search); // 검색 기능 추가
        } else {
            subjects = subjectDAO.getAllSubjects(); // 모든 과목 조회
        }

        model.addAttribute("subjects", subjects);
        return "list";
    }


    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(@RequestParam("id") int id, Model model) {
        SubjectVO subject = subjectDAO.getSubjectById(id);
        model.addAttribute("subject", subject);
        return "view";
    }


    @RequestMapping(value = "/write_ok", method = RequestMethod.POST)
    public String write_ok(SubjectVO subjectVO) {
        int i = subjectDAO.insertSubject(subjectVO);
        if (i == 0) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공!!!");
        }
        return "redirect:/list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editForm(@RequestParam("id") int id, Model model) {
        SubjectVO subject = subjectDAO.getSubjectById(id);
        model.addAttribute("subject", subject);
        return "edit";
    }


    @RequestMapping(value = "/edit_ok", method = RequestMethod.POST)
    public String editSubject(SubjectVO subjectVO) {
        int i = subjectDAO.updateSubject(subjectVO);
        if (i == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공!!!");
        }
        return "redirect:/list";
    }

    @RequestMapping(value = "/delete_ok", method = RequestMethod.GET)
    public String delete(@RequestParam("id") int id) {
        subjectDAO.deleteSubject(id);
        return "redirect:/list";
    }
}
