package org.audioshop.mapper;

import java.util.List;

import org.audioshop.domain.AudioDramaVO;
import org.audioshop.domain.Criteria;

public interface AudioDramaMapper {  

		public List<AudioDramaVO> getList();
		
		public void insert(AudioDramaVO audio);

		public void insertSelectKey(AudioDramaVO audio);

		public AudioDramaVO read(Long auId);

		public int delete(Long auId);

		public int update(AudioDramaVO audio);

		public List<AudioDramaVO> getListWithPaging(Criteria cri);

		public int getTotalCount(Criteria cri); 
	 


}
