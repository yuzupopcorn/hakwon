package com.greenart.grp.service.boardSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greenart.grp.model.BoardVO;
import com.greenart.grp.repository.boardDao.BoardDao;

@Service
public class BoardSrv {
	
	@Autowired
	BoardDao boardDao;
	
	public void setBoard(BoardVO bvo) {
		boardDao.setBoard(bvo);
	}
	
	public void createArticleTbl(String boardCode) {
		boardDao.createArticleTbl(boardCode);
	}
	
	public void createCommentTbl(String boardCode) {
		boardDao.createCommentTbl(boardCode);
	}
	
	public int getBoardChk(String boardCode) {
		return boardDao.getBoardChk(boardCode);
	}
	
	public List<BoardVO> getBoardList(int start, int end, String searchOpt, String words) {
		return boardDao.getBoardList(start, end, searchOpt, words);
	}
	
	public int getBoardCount() {
		return boardDao.getBoardCount();
	}
	
	public void setBoardDelete(String boardCode) {
		boardDao.setBoardDelete(boardCode);
	}
	
	public void setBoardDeleteAll(int bid) {
		boardDao.setBoardDeleteAll(bid);
	}
	
	public void dropArticleTbl(String boardCode) {
		boardDao.dropArticleTbl(boardCode);
	}
	
	public void dropCommentTbl(String boardCode) {
		boardDao.dropCommentTbl(boardCode);
	}
	
	public void updateBoardList(String boardCode) {
		boardDao.updateBoardList(boardCode);
	}
	
	public BoardVO getBoardOne(String boardCode) {
		return boardDao.getBoardOne(boardCode);
	}

}
