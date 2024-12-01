package org.example.springcrudpro;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import static java.sql.DriverManager.getConnection;

@Repository
public class SubjectDAO {
    private static final String SUBJECT_INSERT = "INSERT INTO subjects (category, code, name, englishRatio, credits, classNum, professor, classTime, classRoom, grade, profP) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SUBJECT_LIST = "SELECT * FROM subjects";

    @Autowired
    private JdbcTemplate template;

    public List<SubjectVO> getAllSubjects() {
        return template.query(SUBJECT_LIST, new BeanPropertyRowMapper<>(SubjectVO.class));
    }

    public int insertSubject(SubjectVO vo) {
        return template.update(SUBJECT_INSERT, vo.getCategory(), vo.getCode(), vo.getName(), vo.getEnglishRatio(),
                vo.getCredits(), vo.getClassNum(), vo.getProfessor(), vo.getClassTime(), vo.getClassRoom(),
                vo.getGrade(), vo.getProfP());
    }

    public SubjectVO getSubjectById(int id) {
        String sql = "SELECT * FROM subjects WHERE id = ?";
        return template.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper<>(SubjectVO.class));
    }

    public int updateSubject(SubjectVO vo) {
        String sql = "UPDATE subjects SET category = ?, code = ?, name = ?, englishRatio = ?, credits = ?, classNum = ?, professor = ?, classTime = ?, classRoom = ?, grade = ?, profP = ? WHERE id = ?";
        return template.update(sql, vo.getCategory(), vo.getCode(), vo.getName(), vo.getEnglishRatio(),
                vo.getCredits(), vo.getClassNum(), vo.getProfessor(), vo.getClassTime(), vo.getClassRoom(),
                vo.getGrade(), vo.getProfP(), vo.getId());
    }

    public int deleteSubject(int id) {
        String sql = "DELETE FROM subjects WHERE id = ?";
        return template.update(sql, id);
    }

    public List<SubjectVO> searchSubjects(String search) {
        List<SubjectVO> subjects = new ArrayList<>();
        String sql = "SELECT * FROM subjects WHERE name LIKE ? OR professor LIKE ?"; // 검색 쿼리

        // 쿼리 실행
        subjects = template.query(sql, new Object[]{"%" + search + "%", "%" + search + "%"},
                (rs, rowNum) -> {
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
                }
        );

        return subjects;
    }

}
