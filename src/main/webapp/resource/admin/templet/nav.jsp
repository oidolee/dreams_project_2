<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <div class="sb-sidenav-menu-heading">HOME</div>
            <a class="nav-link" href="../index.html">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                메인
            </a>
            <div class="sb-sidenav-menu-heading">LIST</div>
            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                관리목록
                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
            </a>
            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="../member/member.html">회원</a>
                    <a class="nav-link" href="../account/acocunt.html">결제</a>
                    <a class="nav-link" href="../board/board.html">게시판</a>
                    <a class="nav-link" href="../ticket/ticket.html">티켓</a>
                    <a class="nav-link" href="../product/product.jsp">상품</a>
                </nav>
            </div>

            
        </div>
    </div>
    <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        드림즈 관리자
    </div>
</nav>