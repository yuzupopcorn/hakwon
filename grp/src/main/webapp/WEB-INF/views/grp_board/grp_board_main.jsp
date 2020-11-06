<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp" %>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">

    <style>
    
        td {
            border: 1px solid #d6dce7;
        }
        
        .board-list tr:first-child {
            background-color: #6f809a;
        }

        .tr-even {
            background-color: #eff3f9;
        }
        
        #layerbox {
            display:none;
        }
        
        .layerpop {
        	width:1200px;
        	padding:50px;
        	background-color:#fff;
        	border: 1px solid #ccc;
        }
        .modify {
        	margin:auto;
        	width: 95%;
        }

</style>
<body>
    <div class="page-wrap bg-gray">
        <div class="container p10">
            <div class="page-main-wrap flex flex-justify">
                <!-- include logo -->
                <%@ include file = "/WEB-INF/views/grp_admin/ADMIN_LOGO.jsp" %>
                <!-- include logo -->
                <div class="page-right bg-white height40">
                    <!--  include auth -->
                    <%@ include file = "/WEB-INF/views/grp_admin/ADMIN_AUTH.jsp" %>
                    <!--  include auth -->
                </div>
            </div>
            <div class="page-main-wrap flex flex-justify m-t10">
                <div class="page-left bg-white p10">
                    <!-- include menu -->
                    <%@ include file = "/WEB-INF/views/grp_admin/ADMIN_MENU.jsp" %>
                    <!-- include menu -->
                </div>
                <div class="page-right bg-white p10">
                    <div class="page-main-wrap">
                        <div class="">
                            <span class="btn-normal">생성된 게시판 수 ${count} 개</span>
                        </div>
                        <div class="title">
                            <h3 class="tomato font18 noto m-t20 weight700">
                                <i class="fas fa-feather-alt"></i> 게시판관리 > 1. 게시판생성
                            </h3>
                        </div>
                        <div class="board-maker">
                            <form method="POST" id="frm" name="" autocomplete="off">
                                <table>
                                    <tr class="center">
                                        <td class="td-10 bg-gray under weight700">게시판그룹</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardGrp" id="boardGrp">
                                            </select>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">게시판코드</td>
                                        <td class="td-15 p-lr3">
                                            <input onBlur="chkBoardCode()" type="text" name="boardCode" id="boardCode" class="input-100" placeholder="영어로 입력" required/>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">게시판색상</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" id="boardColor" name="boardColor">
                                                <option value="#6F809A">#6F809A</option>
                                                <option value="#5D1049">#5D1049</option>
                                                <option value="#3949AB">#3949AB</option>
                                                <option value="#673AB7">#673AB7</option>
                                            </select>
                                            <span class="color"></span>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">게시판 관리자</td>
                                        <td class="td-15 p-lr3">
                                            <input type="text" value="${sessionScope.empName}" name="boardMaker" class="input-100" readonly/>
                                        </td>
                                    </tr>
                                    <tr class="center">
                                        <td class="td-10 bg-gray under weight700">게시판제목</td>
                                        <td class="td-90 p-lr3" colspan="5">
                                            <input type="text" name="boardTitle" id="boardTitle" required class="input-100" />
                                        </td>
                                        <td class="td-10 bg-gray under weight700">게시판타입</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardType">
                                                <option value="1">답변형 게시판</option>
                                                <option value="2">공지사항 게시판</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr class="center">
                                        <td class="td-10 bg-gray under weight700">읽기권한</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardRead">
                                                <option value="0">모두</option>
                                                <option value="1">직원</option>
                                            </select>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">쓰기권한</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardWrite">
                                                <option value="0">모두</option>
                                                <option value="1">직원</option>
                                            </select>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">댓글권한</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardReply">
                                                <option value="0">모두</option>
                                                <option value="1">직원</option>
                                            </select>
                                        </td>
                                        <td class="td-10 bg-gray under weight700">다운권한</td>
                                        <td class="td-15 p-lr3">
                                            <select class="sel-100" name="boardDownload">
                                                <option value="0">모두</option>
                                                <option value="1">직원</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <div class="btn-grp center m-t10">
                                    <button class="btn-on" type="button" id="btn">게시판생성</button>
                                    <button class="btn-off" type="reset">취소하기</button>
                                </div>
                            </form>
                        </div>
                        <div class="title">
                            <h3 class="tomato font18 noto m-t20 weight700">
                                <i class="fas fa-feather-alt"></i> 게시판관리 > 2. 게시판목록
                            </h3>
                        </div>
                        <div class="btn-grp flex flex-justify">
                        	<div>
                        		<button class="btn-red" id="deleteAll">선택삭제</button>
                        	</div>	
                        	<div class="m-t10">
                        		
                        	</div>
                        	<div>
                        		<form method="POST" action="${pageContext.request.contextPath}/board">
                                    <select class="" name="searchOpt">
                                    	<option value="buseo_name" <c:if test="${searchOpt eq 'buseo_name' }">selected</c:if> >게시판그룹</option>
                                        <option value="board_code" <c:if test="${searchOpt eq 'board_code' }">selected</c:if> >게시판코드</option>
                                        <option value="board_title" <c:if test="${searchOpt eq 'board_title' }">selected</c:if> >게시판제목</option>
                                        <option value="all" <c:if test="${searchOpt eq 'all' }">selected</c:if> >전체검색</option>
                                    </select>
                                    <input value="${words}" type="text" name="words" required style="margin-left: -2px;" />
                                    <button type="submit" class="btn-on" style="margin-left: -2px;">게시판검색</button>
                                </form>
                        	</div>
                        </div>
                        <div class="board-list">
                            <table>
                                <tr class="center under weight700 tr-color f6 font14" id="rowColor">
                                    <td class="td-5">
                                    	<input type = "checkbox" onClick="chkAll();" id="chkAll" />
                                    </td>
                                    <td class="td-10">게시물그룹</td>
                                    <td class="td-10">게시판코드</td>
                                    <td class="td-10">게시판색상</td>
                                    <td>게시판제목</td>
                                    <td class="td-5">읽기권한</td>
                                    <td class="td-5">쓰기권한</td>
                                    <td class="td-5">댓글권한</td>
                                    <td class="td-5">다운권한</td>
                                    <td class="td-10">게시판관리</td>
                                </tr>
                            	<c:forEach items="${list}" var="board">
	                                <tr class="center font14 weight700">
	                                    <td><input type="checkbox" name="chk" class="chk" data-uid="${board.boardCode}" /></td>
	                                    <td>${board.buseo_name}</td>
	                                    <td>
	                                        <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}" target="_blank" class="under">${board.boardCode}</a>
	                                    </td>
	                                    <td>${board.boardColor}</td>
	                                    <td>
	                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}" target="_blank" class="under">${board.boardTitle}</a>
	                                    </td>
	                                    <td>${board.boardRead}</td>
	                                    <td>${board.boardWrite}</td>
	                                    <td>${board.boardReply}</td>
	                                    <td>${board.boardDownload}</td>
	                                    <td>
	                                        <button type="button" onclick="popup('${board.boardCode}')" class="s-btn-on" >수정</button>
	                                        <button type="" class="s-btn-off" onClick="boardDel('${board.boardCode}')">삭제</button>
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
		                                    <a href="${pageContext.request.contextPath}/board?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/board?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/board?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/board?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/board?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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
            </div>
        </div>
    </div>
    
    <div id="layerbox" class="layerpop">
    	<div class="modify" >
    	<form method="POST" id="pop" name="" autocomplete="off">
			<table>
               <tr class="center">
                 <td class="td-10 bg-gray under weight700">게시판그룹</td>
                 <td class="td-15 p-lr3">
                 <input type="text" class="input-100" name="MboardGrp" id="MboardGrp" />
                 </td>
                 <td class="td-10 bg-gray under weight700">게시판코드</td>
                  <td class="td-15 p-lr3">
                   <input readonly type="text" name="MboardCode" id="MboardCode" class="input-100" value="${boardCode}" required/>
                   </td>
                   <td class="td-10 bg-gray under weight700">게시판색상</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" id="MboardColor" name="MboardColor">
                   <option value="#6f809A">#6F809A</option>
                   <option value="#5D1049">#5D1049</option>
                   <option value="#3949AB">#3949AB</option>
                   <option value="#673AB7">#673AB7</option>
                   </select>
                   <span class="color"></span>
                   </td>
                   <td class="td-10 bg-gray under weight700">게시판 관리자</td>
                   <td class="td-15 p-lr3">
                   <input type="text" id="MboardMaker" name="MboardMaker" class="input-100" readonly/>
                   </td>
                   </tr>
                   <tr class="center">
                   <td class="td-10 bg-gray under weight700">게시판제목</td>
                   <td class="td-90 p-lr3" colspan="5">
                   <input type="text" name="boardTitle" id="boardTitle" required class="input-100" />
                   </td>
                   <td class="td-10 bg-gray under weight700">게시판타입</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" name="boardType">
                   <option value="1">답변형 게시판</option>
                   <option value="2">공지사항 게시판</option>
                   </select>
                   </td>
                   </tr>
                   <tr class="center">
                   <td class="td-10 bg-gray under weight700">읽기권한</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" name="boardRead">
                   <option value="0">모두</option>
                   <option value="1">직원</option>
                   </select>
                   </td>
                   <td class="td-10 bg-gray under weight700">쓰기권한</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" name="boardWrite">
                   <option value="0">모두</option>
                   <option value="1">직원</option>
                   </select>
                   </td>
                   <td class="td-10 bg-gray under weight700">댓글권한</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" name="boardReply">
                   <option value="0">모두</option>
                   <option value="1">직원</option>
                   </select>
                   </td>
                   <td class="td-10 bg-gray under weight700">다운권한</td>
                   <td class="td-15 p-lr3">
                   <select class="sel-100" name="boardDownload">
                   <option value="0">모두</option>
                   <option value="1">직원</option>
                   </select>
                   </td>
                                    </tr>
                                </table>
            <div class="btn-grp center m-t10">
            	<button class="btn-on" type="button" id="btn">수정</button>
            	<button class="btn-off" onclick="popup_close();">취소</button>
            </div>
        </form>
        </div>
    </div>
</body>

<script>
    $(function () {
        $(".board-list tr:nth-child(2n+1)").addClass("tr-even")
    })
</script>
<script>
var flag = false;
function chkAll() {

	var chk = document.getElementsByName("chk");
	if(flag == false) { // 선택 x
		flag = true;

		for(var i=0; i < chk.length; i++) {
			chk[i].checked = true;
		}
	}else {
		flag = false;

		for(var i=0; i < chk.length; i++) {
			chk[i].checked = false;
		}
	}
	
}
</script>
<script>
	$(function() {
		//keyup:키보드 입력 이벤트
		$("#boardCode").keyup(function(){ 
			// 영어만 사용가능한 정규식(정규표현식)
			$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );
		});
	});

	function loadBuseo() {
		$.ajax({
			url		: "${pageContext.request.contextPath}/grp_get_buseo",
			type	: "POST",
			data	: "",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType: "json",
			success	: function(resData) {
				$.each(resData, function(key, value) {
					$("#boardGrp").append("<option value="+value.buseo_id+">" + value.buseo_name + "</option>");
				});
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete: function() {}
		});
	}

	$(function() {
		//js:onChange(), jquery:change()
		$("#boardColor").change(function() {
			$("#rowColor").css({
				backgroundColor	: this.value
			});
		});
	});

	$(function() {
		$("#btn").click(function() {
			//json, jquery - id, serialize - name
			//alert($("#frm").serialize());
			
			//required는 버튼 타입이 submit 일 때만 가능... 별도 처리
			
			var a = $("#boardCode").val();
			var b = $("#boardTitle").val();

			if( a == "" ) {
				alert("게시판 코드(영문)를 입력하세요.");
				$("#boardCode").focus();
				return false;
			}

			if( b == "" ) {
				alert("게시판 제목을 입력하세요");
				$("#boardTitle").focus();
				return false;
			}

			$.ajax({
				url		: "${pageContext.request.contextPath}/board/grp_board_insert",
				type	: "POST",
				data	: $("#frm").serialize(),
				success	: function(resData) {
					alert( a + " 게시판 & 댓글게시판이 생성되었습니다.");
					window.location.reload();
				},
				error	: function() {
					alert("시스템 에러");
				},
				complete: function(){}
			});
		});
	});

	$(function() {
		$("#deleteAll").click(function() {
			var msg = "선택하신 정보를 삭제합니다.\n삭제 후에는 복원할 수 없습니다.";
			if(confirm(msg)) {
				var chkArray = new Array();
				$(".chk:checked").each(function() { //each = 향상된 for
					chkArray.push($(this).attr("data-uid"));
				});
				//alert(chkArray);

				$.ajax({
					url		: "${pageContext.request.contextPath}/board/board_delete_all",
					type	: "POST",
					data	: {chkArr : chkArray}, //controller <- chkArr
					success	: function(resData) {
						if(resData == "success") {
							alert("선택하신 정보가 삭제되었습니다.");
							window.location.reload();
						} 
					},
					error	: function() {
						alert("선택하신 정보를 삭제할 수 없습니다.");
					},
					complete: function() {
						window.location.reload();
					}
				});
				
			}
		});
	});

	function chkBoardCode() {
		
		var formData = {
			boardCode : $("#boardCode").val()
		};

		$.ajax({
			url		: "${pageContext.request.contextPath}/board/grp_board_check",
			type	: "POST",
			data	: formData,
			success	: function(resData) {
				if(resData == 'failure') {
					alert("사용할 수 없는 코드입니다.");
					$("#boardCode").val("");
					$("#boardCode").focus();
				}
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete: function(){}
		});	
		
	}

	function boardDel(boardCode) {
		var msg = "삭제 후 복구는 불가능합니다.\n선택하신 게시판&댓글을 삭제하시겠습니까?";

		var formData = {
				boardCode : boardCode
			};
		
		if(confirm(msg)) { //확인 클릭
			$.ajax({
				url		: "${pageContext.request.contextPath}/board/grp_board_delete",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					if(resData == "success") {
						alert("선택하신 게시판&댓글이 삭제되었습니다.");
						window.location.reload();
					} 
				},
				error	: function() {
					alert("선택하신 정보를 삭제할 수 없습니다.");
				},
				complete: function() {
					window.location.reload();
				}
			});
		}
	}

	function popup(boardCode) {
		//alert(boardCode);
		$('.layerpop').css("position", "absolute");
        //레이어 화면에 배치하기 위한 좌표값
        $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
        $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
        $('#layerbox').css("display", "block");

        var formData = {
                boardCode : boardCode
               }
        
    }

    function popup_close() {
        $('#layerbox').css("display", "none");
    }	
	

	$(function() {
		loadBuseo();
	});
</script>

</html>