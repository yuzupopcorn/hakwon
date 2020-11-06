<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin/ADMIN_HEADER.jsp" %>
<style>
        .page-main-left {
            width: 69.7%;
        }

        .page-main-right {
            width: 29.7%;
        }

        .main-right-top {
            height: 260px;
            border: 1px solid #5ebfd9;
        }

        .main-right-bottom {
            height: 220px;
        }

        .main-bottom-left,
        .main-bottom-right {
            width: 49.7%;
        }

        .buseo-icon {
            width: 40px;
            height: 40px;
            margin-right: 20px;
            border-radius: 50%;
            overflow: hidden;
        }

        .buseo-icon img {
            width: 100%;
            display: inline-block;
        }

        .attend-btn-off {
            width: 220px;
            border: 1px solid #5ebfd9;
            border-radius: 50px;
            background-color: transparent;
            color: #5ebfd9;
            padding: 10px 0;
        }

        .attend-btn-on {
            width: 220px;
            border: 1px solid #ccc;
            border-radius: 50px;
            background-color: transparent;
            color: #ccc;
            padding: 10px 0;
        }

        .app-list {
            border-bottom: 1px solid #e7e7e7;
            padding-bottom: 10px;
        }

        .notice-content {
            border-bottom: 1px solid #e7e7e7;
            padding-bottom: 10px;
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
                <div class="page-right">
                    <div class="page-main-wrap flex flex-justify">
                        <div class="page-main-left bg-white p20">
                            <div class="title">
                                <h2 class="font16 noto m-b10">최근 부서 알림글</h2>
                            </div>
                            <div class="buseo-wrap">
                                <div class="buseo-content flex flex-justify p-tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="content-left flex">
                                        <div class="buseo-icon">
                                            <img src="${pageContext.request.contextPath}/images/picture.jpg" alt="" title="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서
                                                확인하세요.</p>
                                            <p class="noto font14">09-15 09:50 어두민 과장</p>
                                        </div>
                                    </div>
                                    <div class="content-right" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i
                                                class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="buseo-wrap">
                                <div class="buseo-content flex flex-justify p-tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="content-left flex">
                                        <div class="buseo-icon">
                                            <img src="${pageContext.request.contextPath}/images/picture.jpg" alt="" title="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서
                                                확인하세요.</p>
                                            <p class="noto font14">09-15 09:50 어두민 과장</p>
                                        </div>
                                    </div>
                                    <div class="content-right" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i
                                                class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="buseo-wrap">
                                <div class="buseo-content flex flex-justify p-tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="content-left flex">
                                        <div class="buseo-icon">
                                            <img src="${pageContext.request.contextPath}/images/picture.jpg" alt="" title="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서
                                                확인하세요.</p>
                                            <p class="noto font14">09-15 09:50 어두민 과장</p>
                                        </div>
                                    </div>
                                    <div class="content-right" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i
                                                class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="buseo-wrap">
                                <div class="buseo-content flex flex-justify p-tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="content-left flex">
                                        <div class="buseo-icon">
                                            <img src="${pageContext.request.contextPath}/images/picture.jpg" alt="" title="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서
                                                확인하세요.</p>
                                            <p class="noto font14">09-15 09:50 어두민 과장</p>
                                        </div>
                                    </div>
                                    <div class="content-right" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i
                                                class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="buseo-wrap">
                                <div class="buseo-content flex flex-justify p-tb20"
                                    style="border-bottom: 1px solid #e7e7e7;">
                                    <div class="content-left flex">
                                        <div class="buseo-icon">
                                            <img src="${pageContext.request.contextPath}/images/picture.jpg" alt="" title="" />
                                        </div>
                                        <div class="buseo-info">
                                            <p class="noto font14 weight700">[인사과 알림] 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서
                                                확인하세요.</p>
                                            <p class="noto font14">09-15 09:50 어두민 과장</p>
                                        </div>
                                    </div>
                                    <div class="content-right" style="width: 50px;">
                                        <span style="font-size: 24px; color: #555;"><i
                                                class="fas fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="page-main-right">
                            <div class="main-right-top bg-white p20">
                                <div class="main-attend">
                                    <div class="title">
                                        <h2 class="font16 noto m-b10">근태관리</h2>
                                        <p class="gray">2020년 09월 15일 화요일</p>
                                    </div>
                                    <div class="attend flex flex-justify noto font14 weight700 m-t20">
                                        <span>출근시간</span>
                                        <span>AM 08:55</span>
                                    </div>
                                    <div class="attend flex flex-justify noto font14 weight700 m-t10">
                                        <span>퇴근시간</span>
                                        <span>PM 18:30</span>
                                    </div>
                                    <div class="attend flex flex-justify noto font14 weight700 m-t10">
                                        <span>현재시간</span>
                                        <span>
                                            <select class="sel-attend noto font14 weight700">
                                                <option value="">업무중</option>
                                                <option value="">외근중</option>
                                                <option value="">퇴근</option>
                                            </select>
                                        </span>
                                    </div>
                                    <div class="attend flex flex-justify noto font14 weight700 m-t10">
                                        <button type="button" class="noto font14 weight700 attend-btn-on">출근하기</button>
                                        <button type="button" class="noto font14 weight700 attend-btn-off">퇴근하기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="main-right-bottom bg-white p20 m-t10">
                                <div class="title">
                                    <h2 class="font16 noto m-b10">메일관리</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="page-main-wrap flex flex-justify m-t10">
                        <div class="main-bottom-left bg-white p20">
                            <div class="title">
                                <h2 class="font16 noto m-b10">결재 대기 문서</h2>
                            </div>
                            <div class="app-content-wrap m-t20">
                                <div class="app-list flex flex-justify noto weight700 font14">
                                    <div class="app-date" style="width: 10%;">기안일</div>
                                    <div class="app-form" style="width: 10%;">문서양식</div>
                                    <div class="app-subject center" style="width: 70%;">결재문서제목</div>
                                    <div class="app-file" style="width: 10%;">첨부</div>
                                </div>
                                <div class="app-content center p-tb10">
                                    <span class="noto font16 weight700">결재할 문서가 없습니다.</span>
                                </div>
                            </div>
                        </div>
                        <div class="main-bottom-right bg-white p20">
                            <div class="title">
                                <h2 class="font16 noto m-b10">공지사항 알림글</h2>
                            </div>
                            <div class="notice-content-wrap">
                                <div class="notice-content flex flex-justify p-tb10">
                                    <div class="notice-left">
                                        <p class="noto font14 weight700">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                    <div class="notice-right">
                                        <span class="noto gray">09.15</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10">
                                    <div class="notice-left">
                                        <p class="noto font14 weight700">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                    <div class="notice-right">
                                        <span class="noto gray">09.15</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10">
                                    <div class="notice-left">
                                        <p class="noto font14 weight700">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                    <div class="notice-right">
                                        <span class="noto gray">09.15</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10">
                                    <div class="notice-left">
                                        <p class="noto font14 weight700">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                    <div class="notice-right">
                                        <span class="noto gray">09.15</span>
                                    </div>
                                </div>
                                <div class="notice-content flex flex-justify p-tb10">
                                    <div class="notice-left">
                                        <p class="noto font14 weight700">
                                            <span style="color: #d92550; margin-right: 10px;">[공지]</span> 운영자 확인이 필요한 근태 정보가 있습니다. 근태관리에서 확인하세요.
                                        </p>
                                    </div>
                                    <div class="notice-right">
                                        <span class="noto gray">09.15</span>
                                    </div>
                                </div>
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

</html>