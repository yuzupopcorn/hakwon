<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp" %>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
    <style>
        tr:first-child {
            background-color: #6f809a;
        }
    
        .tr-even {
            background-color: #eff3f9;
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
                        <div class="page-member-top flex flex-justify">
                            <div class="">
                            	<a href="${pageContext.request.contextPath}/employee/grp_employee_list">
	                                <span class="btn-on">사원목록</span>
	                            </a>
	                            <a href="${pageContext.request.contextPath}/employee/grp_employee_register">
	                                <span class="btn-off">사원등록</span>
	                            </a>
	                            <a href="${pageContext.request.contextPath}/employee/grp_employee_org">
	                                <span class="btn-off">조직도보기</span>
	                            </a>
	                                <span class="btn-off">조직도등록</span>

                            </div>
                            <div class="">
                                
                            </div>
                        </div>
                        <div class="title">
                            <h3 class="tomato font18 noto m-t20 weight700">
                                <i class="fas fa-feather-alt"></i> 사내조직/연락처 > 1. 사원목록
                            </h3>
                        </div>
                        <div class="btn-grp flex flex-justify">
                        	<div>
                        		<button class="btn-red" id="deleteAll">선택삭제</button>
                        	</div>	
                        	<div class="m-t10">
                        		<span class="font14 weight700 noto">
                        			전체사원 수 : ${count} 명 ( ${curPage} page of ${totalPage} pages )
                        		</span>
                        	</div>
                        	<div>
                        		<form method="POST" action="${pageContext.request.contextPath}/employee/grp_employee_list">
                                    <select class="" name="searchOpt">
                                    	<option value="emp_name" <c:if test="${searchOpt eq 'emp_name' }">selected</c:if> >사원명</option>
                                        <option value="emp_num" <c:if test="${searchOpt eq 'emp_num' }">selected</c:if> >사원번호</option>
                                        <option value="all" <c:if test="${searchOpt eq 'all' }">selected</c:if> >전체검색</option>
                                    </select>
                                    <input value="${words}" type="text" name="words" required style="margin-left: -2px;" />
                                    <button type="submit" class="btn-on" style="margin-left: -2px;">직원검색</button>
                                </form>
                        	</div>
                        </div>
                        <div class="page-member-bottom">
                            <div class="page-content">
                                <table>
                                    <tr class="center tr-color weight700 f6 font14 under">
                                        <td class="td-5">
                                        	<input type = "checkbox" onClick="chkAll();" id="chkAll" />
                                        </td>
                                        <td class="td-5">번호</td>
                                        <td class="td-5">부서코드</td>
                                        <td class="td-5">부서명</td>
                                        <td class="td-5">직급코드</td>
                                        <td class="td-5">직급명</td>
                                        <td class="td-5">호봉</td>
                                        <td class="td-10">사원번호</td>
                                        <td class="td-10">사원명</td>
                                        <td class="td-5">부서장</td>
                                        <td class="td-10">입사년월</td>
                                        <td class="td-10">가입년월</td>
                                        <td class="td-5">승인여부</td>
                                        <td class="td-5">권한</td>
                                        <td class="td-10">비고</td>
                                    </tr>
                                <c:if test="${count == 0}">    
                                    <tr>
                                    	<td colspan="15" class="center font14 weight700">등록된 사원이 없습니다.</td>
                                    </tr>
                                </c:if>
                                <c:forEach items="${list}" var="emp" varStatus="status">
                                    <tr class="center font14">
                                        <td class="">
                                        	<input type="checkbox" name="chk" class="chk" data-uid="${emp.empID}" />
                                        </td>
                                        <td>${ (count - status.index) - ( (curPage - 1) * end ) }</td>
                                        <td>${emp.empBuseoCode}</td>
                                        <td>${emp.empBuseoName}</td>
                                        <td>${emp.empGradeCode}</td>
                                        <td>${emp.empGradeCode}</td>
                                        <td>${emp.empStep}</td>
                                        <td>
                                        	<a href="#"><u><strong>${emp.empNum}</strong></u></a>
                                        </td>
                                        <td>
                                        	<a href="#"><u><strong>${emp.empName}</strong></u></a>
                                        </td>
                                        <td>
                                        	<input type = "checkbox" value="${emp.empHead}" onClick="headChange(this.value, '${emp.empID}');" 
                                        	<c:if test="${emp.empHead eq 'Y'}">checked</c:if> />
                                        </td>
                                        <td>${emp.empEnter}</td>
                                        <td>${emp.empRegdate}</td>
                                        <td>
                                        	<select onChange="confirmChange(this.value, '${emp.empID}');" name="" id="" style="width:75px; margin:0 2px;">
                                        		<option value="N" <c:if test="${emp.empConfirm eq 'N'}">selected</c:if> >거부</option>
                                        		<option value="Y" <c:if test="${emp.empConfirm eq 'Y'}">selected</c:if> >승인</option>
                                        	</select>
                                        </td>
                                        <td>
                                        	<select onChange="authChange(this.value, '${emp.empID}')" name="" id="" style="width:75px; margin:0 2px;">
	                                        	<option value="1" <c:if test="${emp.empAuth eq '1'}">selected</c:if> >협력업체</option>
	                                        	<option value="2" <c:if test="${emp.empAuth eq '2'}">selected</c:if> >사원</option>
                                        		<option value="3" <c:if test="${emp.empAuth eq '3'}">selected</c:if> >부서장</option>
                                        		<option value="4" <c:if test="${emp.empAuth eq '4'}">selected</c:if> >임원</option>
                                        		<option value="10" <c:if test="${emp.empAuth eq '10'}">selected</c:if> >관리자</option>
                                        	</select>
                                        </td>
                                        <td>
                                        	<button class="s-btn-on" >수정</button>
                                        	<button onClick="deleteOne('${emp.empID}');" class="s-btn-off">삭제</button>
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
		                                    <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/employee/grp_employee_list?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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
    </div>
</body>

<script>
    $(function () {
        $("tr:nth-child(2n+1)").addClass("tr-even")
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

	function deleteOne(eid) {
		//alert(eid);
		var msg = "선택하신 정보의 모든 내용이 삭제됩니다.\n삭제하시겠습니까?";
		if(confirm(msg)) { //확인창을 실행한다면

			$.ajax({
				url		: "${pageContext.request.contextPath}/employee/grp_employee_delete",
				type	: "POST",
				data	: {eid : eid},
				success	: function(resData) {
					if(resData == "success") {
						alert("선택하신 정보가 삭제되었습니다.");
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

	function headChange(empHead, empID) {
		var msg = "선택하신 사원의 부서장 설정을 변경합니다.\n변경하시겠습니까?";
		if( confirm(msg) ) {
			
			var headValue;
			if(empHead =='Y') {
				headValue = 'N';
			}else {
				headValue ='Y';
			}

			var formData = {
					empHead : headValue,
					empID	: empID
			};

			$.ajax({
				url		: "${pageContext.request.contextPath}/employee/grp_employee_head_change",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					if(resData == "success") {
						alert("부서장 설정이 변경 되었습니다.");
					}
				},
				error	: function() {
					alert("부서장 변경에 실패했습니다.");
				},
				complete: function() {
					window.location.reload();
				}
			});
		}
		
		window.location.reload();
	}

	function confirmChange(empConfirm, empID) {
		var msg = "선택하신 사원의 승인 여부를 변경하시겠습니까?";
		if( confirm(msg) ) {
			
			var formData = {
					empConfirm : empConfirm,
					empID	: empID
			};

			$.ajax({
				url		: "${pageContext.request.contextPath}/employee/grp_employee_confirm_change",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					if(resData == "success") {
						alert("승인 변경 되었습니다.");
					}
				},
				error	: function() {
					alert("변경에 실패했습니다.");
				},
				complete: function() {
					window.location.reload();
				}
			});
		}
		window.location.reload();
	}

	function authChange(empAuth, empID) {
		var msg = "선택하신 사원의 권한을 변경하시겠습니까?";
		if( confirm(msg) ) {
			
			var formData = {
					empAuth : empAuth,
					empID	: empID
			};

			$.ajax({
				url		: "${pageContext.request.contextPath}/employee/grp_employee_auth_change",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					if(resData == "success") {
						alert("권한이 변경 되었습니다.");
					}
				},
				error	: function() {
					alert("변경에 실패했습니다.");
				},
				complete: function() {
					window.location.reload();
				}
			});
		}
		window.location.reload();
	}

</script>

<script>
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
					url		: "${pageContext.request.contextPath}/employee/grp_employee_delete_all",
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
</script>

</html>