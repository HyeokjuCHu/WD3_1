package org.example.springcrudpro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
            subjects = subjectDAO.searchSubjects(search);
        } else {
            subjects = subjectDAO.getAllSubjects();
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
    public String write_ok(
            @RequestParam("category") String category,
            @RequestParam("code") String code,
            @RequestParam("name") String name,
            @RequestParam("englishRatio") int englishRatio,
            @RequestParam("credits") int credits,
            @RequestParam("classNum") String classNum,
            @RequestParam("professor") String professor,
            @RequestParam("classTime") String classTime,
            @RequestParam("classRoom") String classRoom,
            @RequestParam("grade") String grade,
            @RequestParam("profP") String profP
    ) {
        SubjectVO subjectVO = new SubjectVO();
        subjectVO.setCategory(category);
        subjectVO.setCode(code);
        subjectVO.setName(name);
        subjectVO.setEnglishRatio(englishRatio);
        subjectVO.setCredits(credits);
        subjectVO.setClassNum(classNum);
        subjectVO.setProfessor(professor);
        subjectVO.setClassTime(classTime);
        subjectVO.setClassRoom(classRoom);
        subjectVO.setGrade(grade);
        subjectVO.setProfP(profP);

        int i = subjectDAO.insertSubject(subjectVO);
        if (i == 0) {
            System.out.println("데이터 추가 실패");
        } else {
            System.out.println("데이터 추가 성공");
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
    public String editSubject(@ModelAttribute("subject") SubjectVO subjectVO) {
        // 수정된 과목 정보를 데이터베이스에 반영
        int result = subjectDAO.updateSubject(subjectVO);
        if (result == 0) {
            System.out.println("데이터 수정 실패");
        } else {
            System.out.println("데이터 수정 성공");
        }
        return "redirect:/list";
    }

    @RequestMapping(value = "/delete_ok", method = RequestMethod.GET)
    public String delete(@RequestParam("id") int id) {
        subjectDAO.deleteSubject(id);
        return "redirect:/list";
    }
}
