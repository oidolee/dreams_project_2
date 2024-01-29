<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <script>
        function displayImageAsync(input, displayElement) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    displayElement.innerHTML = '<img src="' + e.target.result + '" width="50" height="50" />';
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

        function applyChanges() {
            var productName = document.getElementById('productName').value;
            var productPrice = document.getElementById('productPrice').value;
            var productSpecInput = document.getElementById('productSpec');
            var productDesc1Input = document.getElementById('productDesc1');
            var productDesc2Input = document.getElementById('productDesc2');
            var refundPolicyInput = document.getElementById('refundPolicy');
            var totalQty = document.getElementById('totalQty').value;

            var table = document.getElementById('productTable');
            var newRow = table.insertRow(-1);

            var cell1 = newRow.insertCell(0);
            displayImageAsync(productSpecInput, cell1);

            var cell2 = newRow.insertCell(1);
            cell2.innerHTML = productName;

            var cell3 = newRow.insertCell(2);
            cell3.innerHTML = productPrice;

            var cell4 = newRow.insertCell(3);
            displayImageAsync(productSpecInput, cell4);

            var cell5 = newRow.insertCell(4);
            displayImageAsync(productDesc1Input, cell5);

            var cell6 = newRow.insertCell(5);
            displayImageAsync(productDesc2Input, cell6);

            var cell7 = newRow.insertCell(6);
            displayImageAsync(refundPolicyInput, cell7);

            var cell8 = newRow.insertCell(7);
            cell8.innerHTML = totalQty;

            var cell9 = newRow.insertCell(8);
            cell9.innerHTML = '<button onclick="deleteRow(this)">삭제</button>';

            // 입력 필드 초기화
            document.getElementById('productName').value = '';
            document.getElementById('productPrice').value = '';
            productSpecInput.value = '';
            productDesc1Input.value = '';
            productDesc2Input.value = '';
            refundPolicyInput.value = '';
            document.getElementById('totalQty').value = '';
        }

        function deleteRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
</head>
<body>

    <table border="1" id="productTable">
        <tr>
            <th>상품 이미지</th>
            <th>상품이름</th>
            <th>가격</th>
            <th>상품 규격</th>
            <th>상품 상세 설명1</th>
            <th>상품 상세 설명2</th>
            <th>반품 및 환불 규정</th>
            <th>등록 수량</th>
            <th>관리</th>
        </tr>
    </table>

    <form id="addItemForm">
        <label for="productImage">상품 이미지:</label>
        <div id="displayProductImage"></div>
        <input type="text" id="productImage" name="productImage" onchange="displayImageAsync(this, document.getElementById('displayProductImage'))">
        <br>

        <label for="productName">상품 이름:</label>
        <input type="text" id="productName" name="productName">
        <br>

        <label for="productPrice">가격:</label>
        <input type="text" id="productPrice" name="productPrice">
        <br>

        <label for="productSpec">상품 규격:</label>
        <div id="displayProductSpec"></div>
        <input type="file" id="productSpec" name="productSpec" onchange="displayImageAsync(this, document.getElementById('displayProductSpec'))">
        <br>

        <label for="productDesc1">상품 상세 설명1:</label>
        <div id="displayProductDesc1"></div>
        <input type="file" id="productDesc1" name="productDesc1" onchange="displayImageAsync(this, document.getElementById('displayProductDesc1'))">
        <br>

        <label for="productDesc2">상품 상세 설명2:</label>
        <div id="displayProductDesc2"></div>
        <input type="file" id="productDesc2" name="productDesc2" onchange="displayImageAsync(this, document.getElementById('displayProductDesc2'))">
        <br>

        <label for="refundPolicy">반품 및 환불 규정:</label>
        <div id="displayRefundPolicy"></div>
        <input type="file" id="refundPolicy" name="refundPolicy" onchange="displayImageAsync(this, document.getElementById('displayRefundPolicy'))">
        <br>

        <label for="totalQty">등록 수량:</label>
        <input type="text" id="totalQty" name="totalQty">
        <br>

        <button type="button" id="applyButton" onclick="applyChanges()">추가</button>
    </form>

</body>
</html>