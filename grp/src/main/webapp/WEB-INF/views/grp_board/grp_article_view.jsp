<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file ="/WEB-INF/views/grp_board/HEADER.jsp" %>
<style>
    .notice {
    	display: inline-block;
    	padding: 4px 8px;
    	background-color: #fd7216;
    	border-radius: 2px;
    	color: #fff;
    	text-align: center;
    }
</style>
<body>
    <div class="page-wrap bg-gray p10">
        <div class="container p10 bg-white">
            <div class="title">
                <h3 class="tomato font18 noto">
                    <i class="fas fa-feather-alt"></i> 그룹웨어 알림판 상세보기
                </h3>
            </div>
            <div class="board_insert">
                    <table>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 분류</td>
                            <td class="td-40 p-lr3">
                               <span class="btn-red">
                               	<c:if test="${view.division eq 'Y'}">
                        		<span>공지사항</span>
                        		</c:if>
                        		<c:if test="${view.division eq 'N'}">
                        		일반
                        		</c:if>
                               </span>
                            </td>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 비밀번호</td>
                            <td class="td-40 p-lr3">****
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 제목</td>
                            <td class="td-90 p-lr3" colspan="3">
                             <strong>${view.subject}</strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 작성자</td>
                            <td class="td-90 p-lr3" colspan="3">
                                <strong>${view.writer}</strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 내용</td>
                            <td class="td-90 p-lr3" colspan="3" style="height: 300px; padding-top:2px;padding-bottom: 2px;">
                            	${view.content}
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">첨부파일</td>
                            <td class="td-90 p-lr3" colspan="3">
                            	<c:if test="${view.fileOriName eq null}">
                            		<strong>첨부파일이 없습니다.</strong>
                            	</c:if>
                            	<c:if test="${view.fileOriName ne ''}">
                            		<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${view.aid}"><strong>${view.fileOriName}</strong></a>
                            	</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시물조회수</td>
                            <td class="td-90 p-lr3" colspan="3">
                               ${view.hit}회
                            </td>
                        </tr>
                    </table>
                    <div class="btn-grp center m-t10 flex flex-justify">
                        <div class="btn-left">
                            <button type="button" class="btn-red" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'">게시글목록</button>
                        </div>
                        <div class="btn-right">
                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_reply?boardCode=${boardCode}&aid=${aid}'">게시글답글</button>
                            <button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_insert?boardCode=${boardCode}'">게시글작성</button>
                            <button type="button" class="btn-on" onclick="location.href='grp_board_modify.html'">게시글수정</button>
                            <button type="button" class="btn-off">게시글삭제</button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</body>

</html>