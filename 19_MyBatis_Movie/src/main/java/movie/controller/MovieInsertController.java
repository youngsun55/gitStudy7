package movie.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import movie.model.MovieBean;
import movie.model.MovieDao;

@Controller
public class MovieInsertController {

	private final String command = "/insert.mv";
	private final String getPage = "movieInsertForm";
	private final String gotoPage = "redirect:/list.mv";
	
	@Autowired
	MovieDao movieDao;
	
	//GET: movieList.jsp���� �߰��ϱ� ��ư Ŭ����
	@RequestMapping(value=command)
	public String insert() {
		return getPage;
	}
	
	//POST: movieInserForm.jsp���� �߰��ϱ� ��ư Ŭ����
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String insert(@ModelAttribute("movie") @Valid MovieBean movie, BindingResult result) {
		//System.out.println("continent: " + movie.getContinent());
		//System.out.println("nation: " + movie.getNation());
		
		//kim ���� ����
		
		int cnt = -1;
		cnt = movieDao.insertMovie(movie);
		
		//kim ���� �߰�
		
		if(cnt != -1) {
			return gotoPage;
		} else {
			return getPage;
		}
	}
}
