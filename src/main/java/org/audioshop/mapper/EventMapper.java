package org.audioshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.audioshop.domain.Criteria;
import org.audioshop.domain.EventVO;

public interface EventMapper {
	
	public List<EventVO> getList();
	
	public void insert(EventVO event);

	public void insertSelectKey(EventVO event);

	public EventVO read(Long evId);

	public int delete(Long evId);

	public int update(EventVO event);

	public List<EventVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);

	public void updateReplyCnt(@Param("evId") Long evId, @Param("amount") int amount);
 


	
	
	
	
	
}
