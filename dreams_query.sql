select * from tab;
-- 재욱님 시작


DROP TABLE DR_refund;

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


INSERT INTO DR_refund (REF_No, order_No, REF_cust_Id, REF_Name, REF_Phone, REF_Address, REF_Prod_No, REF_Prod_Name, REF_Prod_qty, REF_Reason, REF_Account, REF_Status)
VALUES ((SELECT NVL(MAX(REF_No) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '001')) FROM DR_refund), 1000, 'kim1234', '김철수', '010-2222-3333', '서울시 마포구 신수동', 3301, '야구공', 2, '찢어짐', '국민은행 011-222412-2442', '환불');

SELECT * FROM DR_refund;

----------------------------------------------

DROP TABLE DR_orders CASCADE CONSTRAINTS;
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

SELECT * FROM DR_orders;

INSERT INTO DR_orders(order_No, cust_Id, order_Content, order_Amount, order_Name, order_Phone, order_Address, order_Date, order_Status)
     VALUES ( (SELECT NVL(MAX(order_No) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '001')) FROM DR_orders), 'hong', '야구공 등 4건', 92000, '김태희', '010-1111-2222', '서울시 마포구', sysdate, '결제완료');

INSERT INTO DR_orders(order_No, cust_Id, order_Content, order_Amount, order_Name, order_Phone, order_Address, order_Date, order_Status)
     VALUES ( (SELECT NVL(MAX(order_No) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '001')) FROM DR_orders), 'kim1234', '티셔츠 등 3건', 110000, '홍길동', '010-1231-2463', '서울시 용산구', sysdate, '배송중');

COMMIT;

SELECT * FROM DR_orders;

-- 내 주문 조회
SELECT * FROM DR_orders where cust_Id = 'hong';
SELECT * FROM DR_orders where cust_Id = 'kim1234';

-- 구매 확정
UPDATE DR_orders
   SET order_Status = '구매확정'
 WHERE order_No = ?;

------------------------------------------------------------





DROP TABLE DR_orderDetail CASCADE CONSTRAINTS;
-- 주문상세 테이블
CREATE TABLE DR_orderDetail (
        orderDetail_No       NUMBER         PRIMARY KEY,        -- 주문상세번호
        order_No             NUMBER         NOT NULL,           -- 주문번호
        product_No           NUMBER         NOT NULL,           -- 상품번호
        product_Name         VARCHAR2(50)   NOT NULL,           -- 상품명
        orderDetail_qty      NUMBER         NOT NULL,           -- 주문수량
        orderDetail_price    NUMBER         NOT NULL            -- 개당가격
);        

SELECT * FROM DR_orderDetail;

------ 2월 13일 입력

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213001, 1001, '야구공', 1, 25000);

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213001, 2001, '싸인볼', 2, 16000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213001, 3001, '야구배트', 1, 15000);     

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213001, 4001, '키링', 3, 20000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213002, 3001, '야구배트', 1, 15000);     
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213002, 6001, '티셔츠', 1, 55000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240213002, 5001, '글러브', 1, 40000);     
     
COMMIT;     


------- 2월 14일 입력

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214001, 1001, '야구공', 1, 25000);

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214001, 2001, '싸인볼', 2, 16000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214001, 3001, '야구배트', 1, 15000);     

INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214001, 4001, '키링', 3, 20000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214002, 3001, '야구배트', 1, 15000);     
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214002, 6001, '티셔츠', 1, 55000);
     
INSERT INTO DR_orderDetail(orderDetail_No, order_No, product_No, product_Name, orderDetail_qty, orderDetail_price)
     VALUES ((SELECT NVL(MAX(orderDetail_No) + 1, 1) FROM DR_orderDetail), 240214002, 5001, '글러브', 1, 40000);     
     
COMMIT;     

SELECT * FROM DR_orderDetail;






-- 재욱님 끝



--호진끝 시작
-- 상품 테이블
--- 상품 테이블 삭제 명령어
DROP TABLE DR_product  CASCADE CONSTRAINTS;

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

-- UPDATE EX)
UPDATE DR_product SET product_Name = ?, product_Price = ?, product_Qty = ?, product_Category = ?, 
				  product_ImgName = ?, product_ImgDetail = ?, product_ImgSize = ?, product_ImgRfd = ? 
WHERE product_No = ?;


-- INSERT EX)
INSERT INTO DR_product(product_No, product_Name, product_Price, product_Qty, product_Category, product_ImgName, product_ImgDetail, product_ImgSize, product_ImgRfd, regDate)
VALUES((SELECT NVL(MAX(product_No)+1, 1) FROM DR_product), 'Dreams Stove 마우스패드', 20000, 20, '기타', 'dreams_project2/resource/upload/mousepad1.png', 'mousepadSize.jpg', 'sizeInform.jpg', 'refund.PNG', sysdate);

-- DELETE EX)
DELETE FROM DR_product WHERE product_no = 6;

-- SELECT EX)
SELECT * FROM DR_product ORDER BY product_No DESC;

-- Customer category detail  (null값나와 수정중)
SELECT * FROM DR_product WHERE product_Name= ?;

COMMIT;
--호진님 끝










select * from tab;
--민진 시작
drop table DR_Gemes;
create table DR_Gemes(
    DG_No number primary key,
    DG_Home varchar2(100) ,
    DG_Away varchar2(100) ,
    DG_Location varchar2(100) ,
    DG_Time timestamp default current_timestamp
);
select * from DR_Gemes;
insert into DR_Gemes(DG_No, DG_Home, DG_Away, DG_Location, DG_Time)
   values(nvl((select max(DG_No) from DR_Gemes)+1,1), '드림즈', '두산', '고척', '2024-02-04 18:11:11');
insert into DR_Gemes(DG_No, DG_Home, DG_Away, DG_Location, DG_Time)
   values(nvl((select max(DG_No) from DR_Gemes)+1,1), '드림즈', '두산', '고척', '2024-02-05 13:20:00');
commit;

drop table DR_KBOTeams;
create table DR_KBOTeams(
   DK_No number primary key,
   DK_TeamName varchar(100) ,
   DK_Location varchar(100)
);

select * from DR_KBOTeams;
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1), '드림즈','고척');
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1),'키움','고척');
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1),'LG','잠실');
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1),'두산','잠실');
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1),'한화','대전');
insert into DR_KBOTeams(DK_No, DK_TeamName, DK_Location) values(nvl((select max(DK_No) from DR_KBOTeams)+1,1),'kia','광주');
commit;
--민진 끝
 
--  석무 시작
 
-- dreams 테이블 삭제
DROP TABLE DR_customers  CASCADE CONSTRAINTS;

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
ROLLBACK;

-- 회원가입
INSERT INTO DR_customers(cust_Id, cust_Name, cust_Password, cust_Email, cust_Birth, cust_Phone, cust_Address, cust_No)
VALUES('hong', '홍', '123', 'h@naver.com', '990920', '010-9002-2512', '서울시 마포구 공덕동 1-4', (SELECT NVL(MAX(cust_No)+1,1 ) FROM DR_customers));

INSERT INTO DR_customers(cust_Id, cust_Name, cust_Password, cust_Email, cust_Birth, cust_Phone, cust_Address, cust_No)
VALUES('kim', '김기남', '123', 'kim@naver.com', '900920', '010-9792-2662', '서울시 서초구 명망동 7-89', (SELECT NVL(MAX(cust_No)+1,1 ) FROM DR_customers));

INSERT INTO DR_customers(cust_Id, cust_Name, cust_Password, cust_Email, cust_Birth, cust_Phone, cust_Address, cust_No)
VALUES('admin', '관리자', '111', 'h@naver.com', '990920', '010-9002-2512', '서울시 마포구 공덕동 1-4', (SELECT NVL(MAX(cust_No)+1,1 ) FROM DR_customers));
COMMIT;

-- 회원정보수정
UPDATE DR_customers SET cust_Name = '홍합', cust_Password = '222', cust_Email = 'hong12@naver.com', 
        cust_Birth = '980224',  cust_Phone = '010-9292-2512', cust_Address = '서울시 마포구 공덕동 1-4'
WHERE cust_Id = 'hong163';
COMMIT;

-- 회원목록 조회(삭제 반영)
-- ALTER TABLE DR_customers
-- ADD show CHAR(1) DEFAULT 'y';

SELECT * FROM DR_customers;


-- 회원탈퇴
UPDATE DR_customers
SET show = 'n'
WHERE cust_Id = 'holng';

-- 조회
SELECT * FROM DR_customers;
SELECT * FROM DR_customers WHERE cust_Id='hong123';

-- 관리자모드 - 회원조회
SELECT * FROM DR_customers
ORDER BY cust_No DESC;

-- 관리자모드 - 계정복구
UPDATE DR_customers
SET show = 'y'
WHERE cust_No = 4;

-- 관리자모드 - 계정삭제(비활성)
UPDATE DR_customers
SET show = 'n'
WHERE cust_No = 4;
COMMIT;

-- 관리자모드 - 영구삭제
DELETE FROM DR_customers WHERE cust_No = 1;



--  석무 끝





-- 창해님 시작
-- 티켓 테이블
DROP TABLE DR_ticket  CASCADE CONSTRAINTS;
CREATE TABLE DR_ticket (
        ticket_seat             VARCHAR2(50)    PRIMARY KEY,      -- 티켓좌석
        ticket_grade_normal     NUMBER          NOT NULL,         -- 일반 등급 가격
        ticket_grade_membership NUMBER          NOT NULL,         -- 멤버쉽 등급 가격
        ticket_grade_child      NUMBER          NOT NULL          -- 어린이 등급 가격
);

-- INSERT 
INSERT INTO DR_ticket (ticket_seat, ticket_grade_normal, ticket_grade_membership, ticket_grade_child)
VALUES('버건디석', 15000, 15000, 7000); 

SELECT * FROM DR_ticket;

commit;
SELECT * FROM DR_ticket WHERE ticket_seat = 'R.d club';

UPDATE DR_ticket
SET ticket_grade_normal = 15000,
    ticket_grade_membership = 15000,
    ticket_grade_child = 7000
WHERE ticket_seat='버건디석';


-- 티켓 예약테이블
DROP TABLE DR_ticket_reservation  CASCADE CONSTRAINTS;
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



INSERT INTO DR_ticket_reservation (ticket_no, ticket_seat, cust_Id, game_date, purchase_date, ticket_price)
VALUES((SELECT NVL(MAX(ticket_no) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '0001')) FROM DR_ticket_reservation), ?, ?, sysdate, sysdate, ?); 

SELECT * FROM DR_ticket_reservation;

SELECT * FROM DR_ticket_reservation;

SELECT *
  FROM ( 
		SELECT A.*,  
		rownum AS rn  -- 일련번호 가져오기
		FROM( 
				SELECT * 
				 FROM DR_ticket_reservation 
				 WHERE show ='y' 
				 ORDER BY ticket_no DESC
              ) A
        );


commit;

ALTER TABLE DR_ticket_reservation
  ADD show CHAR(1) DEFAULT 'y';



-- 창해님 끝











-- 승재시작

-- 게시판 테이블
DROP TABLE DR_board  CASCADE CONSTRAINTS;
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

DROP TABLE DR_review  CASCADE CONSTRAINTS;
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

INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(1, 'hong', '드림즈게시판', '드림즈 게시판이 열렸어요', '24/01/24');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(2, 'nam', '드림즈화이팅!!', '드림즈화이팅팅팅팅팅팅팅', '24/01/24');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(3, 'park', '우승을 위하여', '우승을위하여우승을위하여우승을위하여우승을위하여우승을위하여우승을위하여우승을위하여', '24/01/25');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(4, 'kim', '임동규를 방출하라', '임동규를 방출하라임동규를 방출하라임동규를 방출하라임동규를 방출하라임동규를 방출하라임동규를 방출하라', '24/01/26');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(5, 'seoul', '야구장이 멀어요', '야구장이 멀어요야구장이 멀어요야구장이 멀어요야구장이 멀어요야구장이 멀어요야구장이 멀어요야구장이 멀어요', '24/01/26');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(6, 'jusi', '근데 야구장 가본사람 있어요?', '근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?근데 야구장 가본사람 있어요?', '24/01/27');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(7, 'ahn', '우승은 언제쯤 할까요?', '우승은 언제쯤 할까요?우승은 언제쯤 할까요?우승은 언제쯤 할까요?우승은 언제쯤 할까요?우승은 언제쯤 할까요?', '24/01/27');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(8, 'lim', '	내 욕한 사람들 다 기억한다', '	내 욕한 사람들 다 기억한다	내 욕한 사람들 다 기억한다	내 욕한 사람들 다 기억한다	내 욕한 사람들 다 기억한다	내 욕한 사람들 다 기억한다	내 욕한 사람들 다 기억한다', '24/01/28');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(9, 'cha', '연말 잘보내세요', '연말 잘보내세요연말 잘보내세요연말 잘보내세요연말 잘보내세요연말 잘보내세요연말 잘보내세요연말 잘보내세요', '24/01/28');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(10, 'cho', '야구장에 소주 갖고오는 사람 뭐냐', '	야구장에 소주 갖고오는 사람 뭐냐	야구장에 소주 갖고오는 사람 뭐냐	야구장에 소주 갖고오는 사람 뭐냐	야구장에 소주 갖고오는 사람 뭐냐	야구장에 소주 갖고오는 사람 뭐냐', '24/01/28');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(11, 'han', '플젝 언제끝나나', '플젝 언제끝나나플젝 언제끝나나플젝 언제끝나나플젝 언제끝나나플젝 언제끝나나플젝 언제끝나나', '24/01/29');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(12, 'kang', '피곤하다', '피곤하다피곤하다피곤하다피곤하다피곤하다피곤하다피곤하다', '24/01/30');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(13, 'ku', '게시판담당누구야', '게시판담당누구야게시판담당누구야게시판담당누구야게시판담당누구야게시판담당누구야게시판담당누구야게시판담당누구야게시판담당누구야', '24/01/31');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(14, 'kong', '박하사탕', '나 다시 돌아갈래', '24/01/31');
INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content, board_Date)
VALUES(15, 'alala', '부디 잘 만들 수 있기를', '바래봅니다', '24/01/31');

commit;

SELECT * FROM DR_board;
-- 승재끝
commit;
