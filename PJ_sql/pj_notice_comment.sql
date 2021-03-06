--프로젝트 게시판
CREATE TABLE PJ_NOTICE (
    PJ_IDX NUMBER PRIMARY KEY,
    WRITER VARCHAR2(20),
    PWD VARCHAR2(20),
    REGDATE DATE DEFAULT SYSDATE,
    EDITDATE DATE DEFAULT SYSDATE,
    HIT NUMBER,
    TITLE VARCHAR2(100),
    CONTENT CLOB,
    FILE_NAME VARCHAR2(50) 
);
CREATE SEQUENCE PJ_NOTICE_SEQ NOCACHE;
---NOT NULL 처리
ALTER TABLE PJ_NOTICE MODIFY (CONTENT  NOT NULL);
ALTER TABLE PJ_NOTICE MODIFY (TITLE  NOT NULL);
---댓글 개수 저장
ALTER TABLE PJ_NOTICE ADD COM_COUNT INT DEFAULT '0';
----
--샘플 데이터
INSERT INTO PJ_NOTICE (PJ_IDX, WRITER, PWD, REGDATE, EDITDATE, HIT, TITLE, CONTENT, FILE_NAME)
VALUES (PJNOTICE_SEQ.NEXTVAL, '주홍', 1111, SYSDATE, SYSDATE+1, 0, '제목1', '내용1', ''); 

INSERT INTO PJ_NOTICE (PJ_IDX, WRITER, PWD, REGDATE, EDITDATE, HIT, TITLE, CONTENT, FILE_NAME)
VALUES (PJNOTICE_SEQ.NEXTVAL, '삼색', 1111, SYSDATE, SYSDATE+2, 0, '제목2', '내용2', '');

INSERT INTO PJ_NOTICE (PJ_IDX, WRITER, PWD, REGDATE, EDITDATE, HIT, TITLE, CONTENT, FILE_NAME)
VALUES (PJNOTICE_SEQ.NEXTVAL, '무', 1111, SYSDATE, SYSDATE+2, 0, '제목3', '내용3', ''); 

SELECT * FROM PJ_NOTICE ORDER BY PJ_IDX;

--------------------------------------------------------
--댓글
CREATE TABLE PJ_COMMENT(
    C_IDX NUMBER(6) CONSTRAINT COMM_T_PK PRIMARY KEY,
    WRITER VARCHAR2(20),
    CONTENT CLOB,
    PWD VARCHAR2(20),
	WRITE_DATE DATE DEFAULT SYSDATE,
	PJ_IDX NUMBER(6),
 CONSTRAINT NFK FOREIGN KEY(PJ_IDX)
    REFERENCES PJ_NOTICE(PJ_IDX) ON DELETE CASCADE
 );

CREATE SEQUENCE COMMENT_T_SEQ NOCACHE;

--샘플 데이터
INSERT INTO PJ_COMMENT
VALUES (COMMENT_T_SEQ.NEXTVAL, '삼색', 'C-내용1',
        '1111', SYSDATE, 1);
INSERT INTO PJ_COMMENT
VALUES (COMMENT_T_SEQ.NEXTVAL, '무', 'C-내용2',
        '1111', SYSDATE, 1); 
INSERT INTO PJ_COMMENT
VALUES (COMMENT_T_SEQ.NEXTVAL, '뚱땅', 'C-내용3',
        '1111', SYSDATE, 1); 

COMMIT;    

ALTER TABLE PJ_COMMENT MODIFY (CONTENT  NOT NULL);
ALTER TABLE PJ_COMMENT MODIFY (WRITER  NOT NULL);
---------------------------------------------------
--페이징 처리 쿼리문
SELECT * FROM (
        SELECT ROWNUM R_NUM, PJ_NOTICE.* FROM (
        SELECT * FROM PJ_NOTICE
        ORDER BY REGDATE DESC
        )PJ_NOTICE -- 결과물에 대한 별칭
) WHERE R_NUM BETWEEN 1 AND 5

---------------------------------------------------
