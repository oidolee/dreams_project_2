<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<!-- ������ �۾��� : �̹��� -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>�帲��</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="../resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/common.css">
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/footer.css">
    <link rel="stylesheet" href="/dreams_project_2/resource/css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="./resource/js/bootstrap/bootstrap.bundle.js"></script>
    

    <script>
        // ������ �ε� �� ����� �Լ�
        $(document).ready(function () {
            // top ��ư Ŭ�� �� ��ũ��
            $('#goTop a[href="#header"]').on('click', function (e) {
                window.scroll({
                    top: 0,
                });
                checkButton();
            });

            $(".floating-box.center").on("click",function(){
                $(".first-bg").hide();
            })
        });

        //ũ�� ��ũ�� ������ �ð� ���� �� ����
        $(window).on("scroll", function () {
            $("#goTop a").attr("href", "#none")
            $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
            setTimeout(() => {
                $("#goTop a").attr("href", "#header")
                $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
            }, 2000);
        })

    </script>
</head>
<div class="wrap">

    <body>
        <footer>
            <div class="footer-1 center">
                <div class="footer-list-box">

                    <div class="item-box">
                        <ul class="link-list">
                            <li><a href="#">��������ó����ħ</a></li>
                            <li><a href="#">�̿���</a></li>
                            <li><a href="#">�̸��Ϲ��ܼ����ź�</a></li>
                            <li><a href="#">�ȳ� �� Q&amp;A</a></li>
                            <li><a href="#">����Ʈ��</a></li>
                        </ul>
                        <div class="txt-add">
                            ����Ư���� ���α� ���η� 430(��ô��, ��ô��ī�̵����峻) T.02-3660-1000 F.02-3660-1099<br>
                            Copyright (C) Heroes, All Rights Reserved.
                        </div>
                    </div>
                    <div class="item-box">
                        <a href="/dreams_project_2/index.html">
                            <img src="/dreams_project_2/resource/image/logoSmall.png" alt="�帲�� ���ξ߱���" style="width: 200px;">
                        </a>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</div>

</html>