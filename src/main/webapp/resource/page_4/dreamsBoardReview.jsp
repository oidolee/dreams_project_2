<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈게시판 댓글목록</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resource/css/common/common.css">
    <link rel="stylesheet" href="${path}/resource/css/index.css">
    <link rel="stylesheet" href="${path}/resource/css/common/page4_board.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="${path}/resource/js/common/header.js"></script>

</head>
<body>

    <div>
        <div style="display: flex; justify-content: left;">
            <table id="reveiw" style="margin-bottom: 50px; width: 100%;">
                <tr  style="border-bottom: 2px solid gray;">
                    <td style="font-size: 15px;">
                        댓글 1
                    </td>                                    
                </tr>
                <c:forEach var="dto" items="${list}">
                <tr style="display: inline;">
                    <td style="width: 50px;">
                        ${dto.cust_Id}                                  
                    </td>
                    <td>
                        ${dto.review_Date}                                     
                    </td>
                    <td>
                        <button id="reportButton">신고</button>                                  
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid gray;">
                    <td style="color: rgb(110, 107, 107) !important;">
                        ${dto.review_Content}                                 
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>

    </div>

</body>

</html>