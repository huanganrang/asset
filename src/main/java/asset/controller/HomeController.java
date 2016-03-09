package asset.controller;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.PageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author yanghui
 * 首页controller
 *
 */
@Controller
@RequestMapping("/")
public class HomeController {

	
	 @RequestMapping("/home")
	 public String getLedgerList(HttpServletRequest request, PageHelper ph) {
	        return "/home";
	 }
}
