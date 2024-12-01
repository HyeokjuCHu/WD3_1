package org.example.springcrudpro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class SubjectDAO {

    private static final String SUBJECT_INSERT =
            "INSERT INTO subjects (category, code, name, englishRatio, credits, classNum, professor, classTime, classRoom, grade, profP) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SUBJECT_LIST =
            "SELECT * FROM subjects";
    private static final String SUBJECT_BY_ID =
            "SELECT * FROM subjects WHERE id = ?";
    private static final String SUBJECT_UPDATE =
            "UPDATE subjects SET category = ?, code = ?, name = ?, englishRatio = ?, credits = ?, classNum = ?, professor = ?, classTime = ?, classRoom = ?, grade = ?, profP = ? WHERE id = ?";
    private static final String SUBJECT_DELETE =
            "DELETE FROM subjects WHERE id = ?";
    private static final String SUBJECT_SEARCH =
            "SELECT * FROM subjects WHERE name LIKE ? OR professor LIKE ?";

    @Autowired
    private JdbcTemplate template;

    // 전체 과목 조회
    public List<SubjectVO> getAllSubjects() {
        return template.query(SUBJECT_LIST, (rs, rowNum) -> {
            SubjectVO subject = new SubjectVO();
            subject.setId(rs.getInt("id"));
            subject.setCategory(rs.getString("category"));
            subject.setCode(rs.getString("code"));
            subject.setName(rs.getString("name"));
            subject.setEnglishRatio(rs.getInt("englishRatio"));
            subject.setCredits(rs.getInt("credits"));
            subject.setClassNum(rs.getString("classNum"));
            subject.setProfessor(rs.getString("professor"));
            subject.setClassTime(rs.getString("classTime"));
            subject.setClassRoom(rs.getString("classRoom"));
            subject.setGrade(rs.getString("grade"));
            subject.setProfP(rs.getString("profP"));
            return subject;
        });
    }


    public int insertSubject(SubjectVO vo) {
        return template.update(SUBJECT_INSERT,
                vo.getCategory(), vo.getCode(), vo.getName(), vo.getEnglishRatio(),
                vo.getCredits(), vo.getClassNum(), vo.getProfessor(), vo.getClassTime(),
                vo.getClassRoom(), vo.getGrade(), vo.getProfP());
    }

    public SubjectVO getSubjectById(int id) {
        return template.queryForObject(SUBJECT_BY_ID, new Object[]{id}, (rs, rowNum) -> {
            SubjectVO subject = new SubjectVO();
            subject.setId(rs.getInt("id"));
            subject.setCategory(rs.getString("category"));
            subject.setCode(rs.getString("code"));
            subject.setName(rs.getString("name"));
            subject.setEnglishRatio(rs.getInt("englishRatio"));
            subject.setCredits(rs.getInt("credits"));
            subject.setClassNum(rs.getString("classNum"));
            subject.setProfessor(rs.getString("professor"));
            subject.setClassTime(rs.getString("classTime"));
            subject.setClassRoom(rs.getString("classRoom"));
            subject.setGrade(rs.getString("grade"));
            subject.setProfP(rs.getString("profP"));
            return subject;
        });
    }

    public int updateSubject(SubjectVO vo) {
        return template.update(SUBJECT_UPDATE,
                vo.getCategory(), vo.getCode(), vo.getName(), vo.getEnglishRatio(),
                vo.getCredits(), vo.getClassNum(), vo.getProfessor(), vo.getClassTime(),
                vo.getClassRoom(), vo.getGrade(), vo.getProfP(), vo.getId());
    }

    public int deleteSubject(int id) {
        return template.update(SUBJECT_DELETE, id);
    }

    public List<SubjectVO> searchSubjects(String search) {
        return template.query(SUBJECT_SEARCH, new Object[]{"%" + search + "%", "%" + search + "%"}, (rs, rowNum) -> {
            SubjectVO subject = new SubjectVO();
            subject.setId(rs.getInt("id"));
            subject.setCategory(rs.getString("category"));
            subject.setCode(rs.getString("code"));
            subject.setName(rs.getString("name"));
            subject.setEnglishRatio(rs.getInt("englishRatio"));
            subject.setCredits(rs.getInt("credits"));
            subject.setClassNum(rs.getString("classNum"));
            subject.setProfessor(rs.getString("professor"));
            subject.setClassTime(rs.getString("classTime"));
            subject.setClassRoom(rs.getString("classRoom"));
            subject.setGrade(rs.getString("grade"));
            subject.setProfP(rs.getString("profP"));
            return subject;
        });
    }
}
