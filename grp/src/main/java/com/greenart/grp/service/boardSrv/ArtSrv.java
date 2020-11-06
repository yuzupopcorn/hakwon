package com.greenart.grp.service.boardSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greenart.grp.model.ArticleVO;
import com.greenart.grp.model.BoardVO;
import com.greenart.grp.repository.boardDao.ArtDao;

@Service
public class ArtSrv {
	
	@Autowired
	ArtDao artDao;
	
	public BoardVO getBoardInfo(String boardCode) {
		return artDao.getBoardInfo(boardCode);
	}
	
	public List<ArticleVO> getArticleList(String boardCode, int start, int end) {
		return artDao.getArticleList(boardCode, start, end);
	}
	
	public void setArticle(ArticleVO avo) {
		//************ 특수문자 처리(replace)
		
		//값을 읽기
		String subject = avo.getSubject();
		String writer = avo.getWriter();
		String content = avo.getContent();
		
		//데이터 변환
		subject.replace("<", "&lt;");
		subject.replace(">", "&gt;");
		subject.replace(" ", "&nbsp;");
		subject.replace("\n", "<br />");
		
		writer.replace("<", "&lt;");
		writer.replace(">", "&gt;");
		writer.replace(" ", "&nbsp;");
		writer.replace("\n", "<br />");
		
		content.replace("<", "&lt;");
		content.replace(">", "&gt;");
		content.replace(" ", "&nbsp;");
		content.replace("\n", "<br />");
		
		//변환 데이터를 다시 model 저장
		avo.setSubject(subject);
		avo.setWriter(writer);
		avo.setContent(content);
		
		//**************************************//
		
		artDao.setArticle(avo);
	}
	
	public int getArticleCount(String boardCode) {
		return artDao.getArticleCount(boardCode);
	}
	
	public void hitUp(String boardCode, int aid) {
		artDao.hitUp(boardCode, aid);
	}
	
	public ArticleVO getArticleView(String boardCode, int aid) {
		return artDao.getArticleView(boardCode, aid);
	}
	
	public ArticleVO getArticleReplyInfo(String boardCode, int aid) {
		return artDao.getArticleReplyInfo(boardCode, aid);
	}
	
	public void setArticleReplyOrder(ArticleVO avo) {
		artDao.setArticleReplyOrder(avo);
	}
	
	public void setArticleReply(ArticleVO avo) {
		 ArticleVO vo = artDao.getArticleReplyInfo(avo.getBoardCode(), avo.getAid());
		 avo.setRef(vo.getRef());
		 avo.setRe_step(vo.getRe_step());
		 avo.setRe_level(vo.getRe_level());
		 
		 artDao.setArticleReplyOrder(avo);
		 artDao.setArticleReply(avo);
	}


}
