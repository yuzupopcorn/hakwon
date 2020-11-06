<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/grp_board/HEADER.jsp" %>

<body>
    <div class="page-wrap bg-gray p10">
        <div class="container p10 bg-white">
            <div class="title">
                <h3 class="tomato font18 noto">
                    <i class="fas fa-feather-alt"></i> ${boardTitle}
                </h3>
            </div>
            <div class="board_insert">
                <form enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/article/grp_article_insert">
                <input type="hidden" name="boardCode" value="${boardCode}" />
                    <table>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 분류</td>
                            <td class="td-40 p-lr3">
                                <select name="division" class="sel-100">
                                    <option value="N">일반게시글</option>
                                    <option value="Y">알림게시글</option>
                                </select>
                            </td>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 비밀번호</td>
                            <td class="td-40 p-lr3">
                                <input type="password" class="input135" maxlength="4" name="passwd" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 제목</td>
                            <td class="td-90 p-lr3" colspan="3">
                                <input name="subject" type="text" class="input-100" maxlength="100" required />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 작성자</td>
                            <td class="td-90 p-lr3" colspan="3">
                                <input value="${sessionScope.empName}" readonly name="writer" type="text" class="" maxlength="5" required />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">게시글 내용</td>
                            <td class="td-90 p-lr3" colspan="3" style="padding-top:2px;padding-bottom: 2px;">
                                <textarea id="editor" name="content"
                                    style="border: 1px solid #d5d5d5; border-radius: 2px; padding: 5px;" class="noto">
                                </textarea>
                                <script>
                                    CKEDITOR.replace('editor');
                                    CKEDITOR.config.height = 300;
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-10 center weight700 noto under f6" style="background-color:${boardColor};">첨부파일</td>
                            <td class="td-90 p-lr3" colspan="3">
                                <input type="file" class="input-100" name="files" id="" style="border: none;" />
                            </td>
                        </tr>
                    </table>
                    <div class="btn-grp center m-t10">
                        <button type="submit" class="btn-normal">게시글작성</button>
                        <button type="button" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'"
                            class="btn-red">게시글목록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>