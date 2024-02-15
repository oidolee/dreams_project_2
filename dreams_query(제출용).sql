--  석무 시작 (page_1)
-- dreams 테이블 생성
-- 고객 테이블
CREATE TABLE DR_customers (
        cust_Id         VARCHAR2(50)    PRIMARY KEY,   -- 고객ID
        cust_Name       VARCHAR2(50)    NOT NULL,      -- 이름
        cust_Password   VARCHAR2(50)    NOT NULL,      -- 비밀번호
        cust_Email      VARCHAR2(50)    NOT NULL,      -- 이메일
	    cust_Birth      VARCHAR2(50)    NOT NULL,      -- 생년월일
        cust_Phone      VARCHAR2(20),                  -- 연락처
        cust_Address    VARCHAR2(225)   NOT NULL,      -- 주소
        cust_No         NUMBER,                         -- 넘버링
        show            CHAR(1) DEFAULT 'y'
);
-- 회원정보수정
UPDATE DR_customers SET cust_Name = '홍합', cust_Password = '222', cust_Email = 'hong12@naver.com', 
        cust_Birth = '980224',  cust_Phone = '010-9292-2512', cust_Address = '서울시 마포구 공덕동 1-4'
WHERE cust_Id = 'hong163';
COMMIT;

-- 회원목록 조회(삭제 반영)
ALTER TABLE DR_customers
  ADD show CHAR(1) DEFAULT 'y';
--  석무 끝

-- 창해님 시작 (page_2)
-- 티켓 테이블
CREATE TABLE DR_ticket (
        ticket_seat             VARCHAR2(50)    PRIMARY KEY,      -- 티켓좌석
        ticket_grade_normal     NUMBER          NOT NULL,         -- 일반 등급 가격
        ticket_grade_membership NUMBER          NOT NULL,         -- 멤버쉽 등급 가격
        ticket_grade_child      NUMBER          NOT NULL          -- 어린이 등급 가격
);


-- 티켓 예약테이블
CREATE TABLE DR_ticket_reservation (
        ticket_no           NUMBER          PRIMARY KEY,      -- 티켓번호
        ticket_seat         VARCHAR2(50)    NOT NULL,         -- 티켓좌석
        cust_Id             VARCHAR2(50)    NOT NULL,         -- 고객ID
        game_date           TIMESTAMP       NOT NULL,         -- 경기 날짜
        purchase_date       Date            DEFAULT sysdate NOT NULL,         -- 구매 날짜
        ticket_price        NUMBER          NOT NULL,         -- 티켓 가격
        
         -- 외래키 설정
        
        FOREIGN KEY (cust_Id) REFERENCES DR_customers(cust_Id),
        FOREIGN KEY (ticket_seat) REFERENCES DR_ticket(ticket_seat)
);

alter table DR_ticket_reservation add column show CHAR(1); 

ALTER TABLE DR_ticket_reservation
  ADD show CHAR(1) DEFAULT 'y';
-- 창해님 끝
  
--민진 시작 (page_3)
--경기 일정 테이블
create table DR_Gemes(
    DG_No number primary key,
    DG_Home varchar2(100) ,
    DG_Away varchar2(100) ,
    DG_Location varchar2(100) ,
    DG_Time timestamp default current_timestamp
);
--KBO 팀 테이블
create table DR_KBOTeams(
   DK_No number primary key,
   DK_TeamName varchar(100) ,
   DK_Location varchar(100)
);
--민진 끝

-- 승재시작 (page_4)
-- 게시판 테이블
CREATE TABLE DR_board (
        board_No          NUMBER          PRIMARY KEY,      -- 게시글번호
        cust_Id           VARCHAR2(50)    NOT NULL,         -- 고객ID
        board_Title       VARCHAR2(50)    NOT NULL,         -- 글제목
        board_Content     CLOB            NOT NULL,         -- 글내용
        board_Date        DATE            DEFAULT sysdate,  -- 게시일자
        show              CHAR(1)         DEFAULT 'y'      -- 공개여부
        -- 외래키 설정
        --FOREIGN KEY (cust_Id) REFERENCES DR_customers(cust_Id)
);

CREATE TABLE DR_review (
        review_No         NUMBER          PRIMARY KEY,      -- 리뷰번호
        board_No          NUMBER          NOT NULL,         -- 게시글번호
        cust_Id           VARCHAR2(50)    NOT NULL,         -- 고객ID
        review_Content    VARCHAR2(50)    NOT NULL,         -- 리뷰내용
        review_Date       DATE            DEFAULT sysdate,  -- 게시일자
        show              CHAR(1)         DEFAULT 'y'      -- 공개여부
         -- 외래키 설정
        --FOREIGN KEY (board_No) REFERENCES DR_board(board_No)
        --FOREIGN KEY (cust_Id) REFERENCES DR_customers(cust_Id)
);
-- 승재끝
  
--호진끝 시작 (page_5)
-- 상품 테이블
CREATE TABLE DR_product (
        product_No            NUMBER          PRIMARY KEY,      -- 상품번호
        product_Name        VARCHAR2(50)    NOT NULL,         -- 상품명
        product_Price         NUMBER          NOT NULL,         -- 가격
        product_Qty          NUMBER          NOT NULL,         -- 재고수량
        product_Category   VARCHAR2(50) NOT NULL,           -- 상품카테고리
        product_ImgName   CLOB            NOT NULL,         -- 상품이미지
        product_ImgDetail   CLOB            ,         -- 상품 상세 이미지
        product_ImgSize     CLOB            NOT NULL ,           -- 상품 정보 이미지
        product_ImgRfd      CLOB            NOT NULL,         -- 반품 관련 이미지
        regDate                DATE            DEFAULT sysdate,   -- 등록일
        show                    CHAR(1)         DEFAULT 'y'
);
--호진님 끝

-- 재욱님 시작 (page_6)
-- 환불 테이블
CREATE TABLE DR_refund (
        REF_No          NUMBER          PRIMARY KEY,        -- 환불번호
        
        order_No        NUMBER          NOT NULL,           -- 주문번호(구매당시)
        REF_cust_Id     VARCHAR2(20)    NOT NULL,           -- 구매자 아이디
        REF_Name        VARCHAR2(20)    NOT NULL,           -- 구매자이름
        REF_Phone       VARCHAR2(20)    NOT NULL,           -- 연락처
        REF_Address     VARCHAR2(50)    NOT NULL,           -- 주소
        
        REF_Prod_No     NUMBER          NOT NULL,           -- 상품번호
        REF_Prod_Name   VARCHAR2(30)    NOT NULL,           -- 상품명
        REF_Prod_qty    NUMBER(2)       NOT NULL,           -- 환불/교환 개수
        REF_Reason      CLOB            NOT NULL,           -- 환불/교환 사유
        REF_Account     VARCHAR2(50)    NOT NULL,           -- 환불 받을 계좌
        REF_Date        DATE            DEFAULT sysdate,    -- 환불/교환 신청일
        
        REF_Status      VARCHAR2(20)    NOT NULL            -- 환불 or 교환
);

----------------------------------------------
-- 주문 테이블
CREATE TABLE DR_orders (
        order_No          NUMBER          PRIMARY KEY,          -- 주문번호
        cust_Id           VARCHAR2(50)    NOT NULL,             -- 고객ID
        order_Content     VARCHAR2(50)    NOT NULL,             -- 주문내용
        order_Amount      NUMBER          NOT NULL,             -- 총결제금액
        order_Name        VARCHAR2(50)    NOT NULL,             -- 주문자이름
        order_Phone       VARCHAR2(20)    NOT NULL,             -- 연락처
        order_Address     VARCHAR2(100)   NOT NULL,             -- 주소
        order_Date        VARCHAR2(50)    NOT NULL,             -- 주문일자
        order_Status      VARCHAR2(50)    NOT NULL              -- 주문상태
);        

------------------------------------------------------------

-- 주문상세 테이블
CREATE TABLE DR_orderDetail (
        orderDetail_No       NUMBER         PRIMARY KEY,        -- 주문상세번호
        order_No             NUMBER         NOT NULL,           -- 주문번호
        product_No           NUMBER         NOT NULL,           -- 상품번호
        product_Name         VARCHAR2(50)   NOT NULL,           -- 상품명
        orderDetail_qty      NUMBER         NOT NULL,           -- 주문수량
        orderDetail_price    NUMBER         NOT NULL            -- 개당가격
);        
-- 재욱님 끝



 



