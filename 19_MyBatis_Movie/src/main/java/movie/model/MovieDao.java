package movie.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import utility.Paging;

@Service("myMovieDao")
public class MovieDao {

	private String namespace = "movie.MovieBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MovieDao() {
		System.out.println("MovieDao()");
	}
	
	public List<MovieBean> getMovieList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<MovieBean> lists = new ArrayList<MovieBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getMovieList", map, rowBounds);
		
		return lists;
	}//getMovieList

	public int getTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		
		return cnt;
	}//getTotalCount

	public int insertMovie(MovieBean movie) {
		int cnt = -1;
		try {
			cnt = sqlSessionTemplate.insert(namespace + ".insertMovie", movie);
		} catch(DataAccessException e) {
			//System.out.println("insertMovie cnt: " + cnt);
		}
		return cnt;
	}//insertMovie

	public int searchTitle(String title) {
		//System.out.println("Dao title: "+ title);
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".searchTitle", title);
		
		return count;
	}//searchTitle

	public MovieBean detailMovie(int num) {
		MovieBean mb = sqlSessionTemplate.selectOne(namespace + ".detailMovie", num);
		
		return mb;
	}//detailMovie

	public void deleteMovie(int num) {
		sqlSessionTemplate.delete(namespace + ".deleteMovie", num);
	}//deleteMovie

	public void getMovie(int num) {
		sqlSessionTemplate.selectOne(namespace + ".getMovie", num);
	}//getMovie

	public void updateMovie(MovieBean movie) {
		sqlSessionTemplate.update(namespace + ".updateMovie", movie);
	}//updateMovie

}
