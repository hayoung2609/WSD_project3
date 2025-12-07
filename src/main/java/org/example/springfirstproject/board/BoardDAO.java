package org.example.springfirstproject.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    private final String BOARD_INSERT = "insert into BOARD (title, writer, content, category, password, email) values (?,?,?,?,?,?)";

    private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, content=?, category=?, email=? where id=?";

    private final String BOARD_DELETE = "delete from BOARD where id=?";
    private final String BOARD_GET = "select * from BOARD where id=?";
    private final String BOARD_LIST = "select * from BOARD order by id desc";

    public int insertBoard(BoardVO vo) {
        return template.update(BOARD_INSERT,
                vo.getTitle(),
                vo.getWriter(),
                vo.getContent(),
                vo.getCategory(),
                vo.getPassword(),
                vo.getEmail());
    }

    public int deleteBoard(int id) {
        return template.update(BOARD_DELETE, id);
    }

    public int updateBoard(BoardVO vo) {
        return template.update(BOARD_UPDATE,
                vo.getTitle(),
                vo.getWriter(),
                vo.getContent(),
                vo.getCategory(),
                vo.getEmail(),
                vo.getId());
    }

    public BoardVO getBoard(int id) {
        return template.queryForObject(BOARD_GET, new Object[]{id}, new BeanPropertyRowMapper<BoardVO>(BoardVO.class));
    }

    public List<BoardVO> getBoardList() {
        return template.query(BOARD_LIST, new RowMapper<BoardVO>() {
            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                BoardVO data = new BoardVO();
                data.setId(rs.getInt("id"));
                data.setTitle(rs.getString("title"));
                data.setWriter(rs.getString("writer"));
                data.setContent(rs.getString("content"));
                data.setCategory(rs.getString("category"));
                data.setRegdate(rs.getDate("regdate"));
                data.setCnt(rs.getInt("cnt"));
                data.setEmail(rs.getString("email"));
                return data;
            }
        });
    }
}