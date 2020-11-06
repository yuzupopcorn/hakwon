<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/grp_board/HEADER.jsp" %>
<style>
    tr:first-child {
        background-color: #6f809a;
    }

    .tr-even {
        background-color: #eff3f9;
    }
    
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
            <div class="search-wrap flex flex-justify bg-white m-b5">
                <div class="">
                    <span class="btn-normal">전체게시물 수 ${count} / PAGE 1</span>
                </div>
                <div class="">
                    <form method="POST" action="${pageContext.request.contextPath}/grp_board_list">
                        <select class="" name="searchOpt">
                            <option value="subject">게시물제목</option>
                            <option value="writer">작성자</option>
                            <option value="all">제목+작성자</option>
                        </select>
                        <input type="text" name="words" required style="margin-left: -2px;" />
                        <button type="submit" class="btn-off" style="margin-left: -2px;">게시글검색</button>
                        <button type="button" class="btn-on"
                            onclick="location.href='${pageContext.request.contextPath}/article/grp_article_insert?boardCode=${boardCode}'">게시글작성</button>
                    </form>
                </div>
            </div>
            <div class="title">
                <h3 class="tomato font18 noto m-t10 weight700">
                    <i class="fas fa-feather-alt"></i> ${boardTitle}
                </h3>
            </div>
            <div class="board-wrap bg-white">
                <table style="table-layout: fixed;">
                    <tr class="center f6 font14 weight700" style="background-color:${boardColor};">
                        <td class="td-3">
                            <input type="checkbox" />
                        </td>
                        <td class="td-5">번호</td>
                        <td class="td-5">분류</td>
                        <td>게시물제목</td>
                        <td class="td-5">작성자</td>
                        <td class="td-5">조회</td>
                        <td class="td-8">날짜</td>
                        <td class="td-7">관리</td>
                    </tr>
                 <c:forEach items="${list}" var="artList" varStatus="status">
                    <tr class="center">
                        <td>
                            <input type="checkbox" />
                        </td>
                        <td>
                        	<c:if test="${artList.division eq 'Y'}">
                        		-
                        	</c:if>
                        	<c:if test="${artList.division eq 'N'}">
                        		${ (count - status.index) - ( (curPage - 1) * end ) }
                        	</c:if>
                        </td>
                        <td>
                        	<c:if test="${artList.division eq 'Y'}">
                        		<span class="notice">공지</span>
                        	</c:if>
                        	<c:if test="${artList.division eq 'N'}">
                        		일반
                        	</c:if>
                        </td>
                        <td class="left p-lr10">
                        <c:forEach begin="1" end="${artList.re_level}">
                        	 <img src="${pageContext.request.contextPath}/images/icon_reply.gif" />
                        </c:forEach>
                            <a href="${pageContext.request.contextPath}/article/grp_article_view?boardCode=${boardCode}&aid=${artList.aid}" class="under weight700">
                            ${artList.subject}
                            </a>
                              
                             <c:set var="fileName" value="${fn:toLowerCase(artList.fileOriName)}" />
                             <c:forTokens var="ext" items="${fileName}" delims="." varStatus="status">
                             	<c:if test="${status.last}">
                             		<c:choose>
                             			<c:when test="${ext eq 'jpg' || ext eq 'gif' || ext eq 'png' || ext eq 'jpeg'}">
                             				<i class="far fa-file-image"></i>
                             			</c:when>
                             		</c:choose>
                             		<c:choose>
                             			<c:when test="${ext eq 'pdf'}">
                             				<i class="far fa-file-pdf"></i>
                             			</c:when>
                             		</c:choose>
                             		<c:choose>
                             			<c:when test="${ext eq 'xsl' || ext eq 'xlsx'}">
                             				<i class="far fa-file-excel"></i>
                             			</c:when>
                             		</c:choose>
                             		<c:choose>
                             			<c:when test="${ext eq 'hwp'}">
                             				<i class="far fa-file-alt"></i>
                             			</c:when>
                             		</c:choose>
                             	</c:if>
                             </c:forTokens>
                             
                            </td>
                        <td>${artList.writer}</td>
                        <td>${artList.hit}</td>
                        <td>${artList.regdate}</td>
                        <td>
                            <button type="button" class="s-btn-on" onclick="location.href='${pageContext.request.contextPath}/grp_board_modify.html?id=10'">수정</button>
                            <button type="button" class="s-btn-off">삭제</button>
                        </td>
                    </tr>
                 </c:forEach>
                </table>
                <!-- 페이징 ui 시작 -->
                             <c:if test="${count > 0}">
                                <div class="page-grp center m-t10">
                                <!-- 맨 앞으로 -->
                                <c:choose>
                                	<c:when test="${curPage > 1 }">
		                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&curPage=1&searchOpt=${searchOpt}&words=${words}">
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-double-left"></i>
		                                    	</span>
		                                    </a>
		                            </c:when>
		                            <c:otherwise> <!-- else -->
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-double-left"></i>
		                                    	</span>
		                            </c:otherwise>
                                </c:choose>
                                <!-- 맨 앞으로 -->
                                <!-- 한 칸 앞으로 -->
                                   <c:choose>
                                	<c:when test="${curPage > 1 }">
		                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-left"></i>
		                                    	</span>
		                                    </a>
		                            </c:when>
		                            <c:otherwise> <!-- else -->
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-left"></i>
		                                    	</span>
		                            </c:otherwise>
                                </c:choose>
                                <!-- 한 칸 앞으로 -->
                                <!-- 페이지 번호 출력 -->
                                <c:forEach begin="${blockBegin}" end="${blockEnd}" var="num"> <!-- 시작, 끝, 변수명 -->
                                	
                                	<c:if test="${selected == num }">                                	
                                	<a href="#" class="f6">
                                    	<span class="page page-active">
                                    	${num}
                                   		</span>
                                   	</a>
                                    </c:if>
                                    <c:if test="${selected != num }">                                	
                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&curPage=${num}&searchOpt=${searchOpt}&words=${words}">
                                    	<span class="page">
                                    	${num}
                                   		</span>
                                   	</a>
                                    </c:if>
                                    
                                </c:forEach>
                                <!-- 페이지 번호 출력 끝 -->
                                <!-- 한 칸 뒤로 -->
                                   <c:choose>
                                		<c:when test="${curPage != totalPage }">
		                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-right"></i>
		                                    	</span>
		                                    </a>
		                            	</c:when>
		                            	<c:otherwise>
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-right"></i>
		                                    	</span>
		                            	</c:otherwise>
                              	  </c:choose>
                                <!-- 한 칸 뒤로 -->
                                <!-- 맨 뒤로 -->
                                	<c:choose>
                                		<c:when test="${curPage != totalPage }">
		                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}&curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-double-right"></i>
		                                    	</span>
		                                    </a>
		                            	</c:when>
		                            	<c:otherwise>
		                                    	<span class="page">
		                                    		<i class="fas fa-angle-double-right"></i>
		                                    	</span>
		                            	</c:otherwise>
                                	</c:choose>
                                <!-- 맨 뒤로 -->
                                </div>
                            </c:if>
                            <!-- 페이징 ui 끝 -->
            </div>
            
        </div>
    </div>
</body>
<script>
    $(function () {
        $("tr:nth-child(2n+1)").addClass("tr-even")
    })
</script>

</html>