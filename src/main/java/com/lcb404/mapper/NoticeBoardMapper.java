package com.lcb404.mapper;

import java.util.List;

import com.lcb404.command.NoticeBoardVO;
import com.lcb404.utill.Criteria;

public interface NoticeBoardMapper {
	public void regist(NoticeBoardVO noticeBoardVO);
	public List<NoticeBoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public NoticeBoardVO getContent(int tno);
	public int getUpdate(NoticeBoardVO vo);
	public int getDelete(int tno);
}
