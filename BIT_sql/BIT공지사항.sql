--PROJECT ��Ʈ �������� �Խ���

--��Ʈ �������� �Խñ�(BIT_T)
CREATE TABLE BIT_T (
	B_IDX NUMBER CONSTRAINT BIT_T_PK PRIMARY KEY, --�۹�ȣ
	SUBJECT VARCHAR2(50), --������
	WRITER VARCHAR2(20), --�ۼ���
    CONTENT CLOB, --�۳���
    FILE_NAME VARCHAR2(50), --����Ǵ� ���ϸ�
	ORI_NAME VARCHAR2(50), --���� ���ϸ�
    PWD VARCHAR2(20), --��ȣ
    WRITE_DATE DATE DEFAULT SYSDATE, --�ۼ�����
    EDITE_DATE DATE DEFAULT SYSDATE, --��������
    IP VARCHAR2(15), --�ۼ��� IP�ּ�
    HIT NUMBER(4) --��ȸ��
);

--�Խñۿ� ���� ���(COMMENT_T)
CREATE TABLE COMMENT_T (
	C_IDX NUMBER(6) CONSTRAINT COMM_T_PK PRIMARY KEY, --����� ������ȣ,�⺻Ű
	WRITER VARCHAR2(20),--����ۼ���
	CONTENT CLOB, --��۳���
	PWD VARCHAR2(20), --����ۼ����� ��й�ȣ
	WRITE_DATE DATE DEFAULT SYSDATE, --����ۼ� ��¥3
	IP VARCHAR2(15), --����ۼ��� IP�ּ�
    B_IDX NUMBER(6), --�Խñ�(����)�� ��ȣ
	CONSTRAINT COMM_T_FK FOREIGN KEY (B_IDX) REFERENCES BIT_T(B_IDX)
    --BIT_T�� (B_IDX)���� ����Ǹ� COMMENT_T�� (B_IDX)���� ���� ����ǰ� ��
);

--������ �߰�
CREATE SEQUENCE BIT_T_SEQ NOCACHE;
CREATE SEQUENCE COMMENT_T_SEQ NOCACHE;
--------------------------------------------
--�� ��� ��ȸ�� ���� ���� ����Ÿ �ۼ�
INSERT INTO BIT_T
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ1','�׽���','�׽�Ʈ1-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ2','�׽���','�׽�Ʈ2-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ3','�׽���','�׽�Ʈ3-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ4','�׽���','�׽�Ʈ4-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ5','�׽���','�׽�Ʈ5-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ6','�׽���','�׽�Ʈ6-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BBS_T_SEQ.NEXTVAL, '�׽�Ʈ7','�׽���','�׽�Ʈ7-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ8','�׽���','�׽�Ʈ8-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ9','�׽���','�׽�Ʈ9-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ10','�׽���','�׽�Ʈ10-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
INSERT INTO BIT_T 
VALUES (BIT_T_SEQ.NEXTVAL, '�׽�Ʈ11','�׽���','�׽�Ʈ11-����','','','1234',SYSDATE,SYSDATE,'127.0.0.1',0);
--------------------
--��� ���� ����Ÿ �ۼ�
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����1',
        '1234', SYSDATE, '127.0.0.1', 10);
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����2',
        '1234', SYSDATE, '127.0.0.1', 10); 
INSERT INTO COMMENT_T
VALUES (COMMENT_T_SEQ.NEXTVAL, 'C�׽���', 'C-����3',
        '1234', SYSDATE, '127.0.0.1', 10); 

----------------------------------------
SELECT * FROM BIT_T;
SELECT * FROM COMMENT_T;

COMMIT;