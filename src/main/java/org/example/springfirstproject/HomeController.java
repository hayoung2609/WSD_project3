package org.example.springfirstproject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "index";
    }

    @RequestMapping("classlist")
    public String list(Model model){
        List<String> list = new ArrayList<String>();
        list.add("실전프로젝트1");
        list.add("컴퓨터구조");
        list.add("컴퓨터비전");
        list.add("이산수학");

        model.addAttribute("classlist", list);
        String msg = "2학년 2학기 교과목 리스트";
        model.addAttribute("title", msg);
        return "board/list";
    }
}