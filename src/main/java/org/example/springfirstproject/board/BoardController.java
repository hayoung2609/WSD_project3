package org.example.springfirstproject.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam; // 추가됨

@Controller
@RequestMapping(value="/board")
public class BoardController {

    @Autowired
    BoardDAO boardDAO;

    // [수정] 검색 기능 추가
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String boardlist(@RequestParam(value="keyword", required=false) String keyword, Model model) {
        if (keyword == null) keyword = ""; // 검색어가 없으면 빈 문자열로 처리
        model.addAttribute("list", boardDAO.getBoardList(keyword)); // DAO에 검색어 전달
        return "board/list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addPost() {
        return "board/write";
    }

    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo) {
        if (boardDAO.insertBoard(vo) == 0)
            System.out.println("데이터 추가 실패");
        else
            System.out.println("데이터 추가 성공");
        return "redirect:list";
    }

    // [추가] 상세보기 기능 (이게 없으면 view.jsp가 안 뜹니다!)
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public String viewPost(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardDAO.getBoard(id);
        model.addAttribute("u", boardVO);
        return "board/view";
    }

    @RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardDAO.getBoard(id);
        model.addAttribute("u", boardVO);
        return "board/edit";
    }

    @RequestMapping(value = "/editok", method = RequestMethod.POST)
    public String editPostOK(BoardVO vo) {
        if (boardDAO.updateBoard(vo) == 0)
            System.out.println("데이터 수정 실패");
        else
            System.out.println("데이터 수정 성공");
        return "redirect:list";
    }

    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id) {
        if (boardDAO.deleteBoard(id) == 0)
            System.out.println("데이터 삭제 실패");
        else
            System.out.println("데이터 삭제 성공");
        return "redirect:../list";
    }
}