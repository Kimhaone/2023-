INSERT INTO MEMBER VALUES (1, '박서준', '01048094818', '02:00:00','2023-11-23', TRUE, NULL);
INSERT INTO MEMBER VALUES (2, '박원빈', '01034384448', '02:00:00','2023-11-23', TRUE,NULL);
INSERT INTO MEMBER VALUES (3, '신민아', '01048324845', '06:00:00','2023-11-23', TRUE,NULL);
INSERT INTO MEMBER VALUES (4, '김지연', '01040904858', '06:00:00','2023-11-23', TRUE,NULL);
INSERT INTO MEMBER VALUES (5, '이서진', '01034884858', '08:00:00','2023-11-23', TRUE,NULL);
INSERT INTO MEMBER VALUES (6, '정유미', '01048334558', '08:00:00','2023-11-24', TRUE, NULL);
INSERT INTO MEMBER VALUES (7, '최우식', '01068382758', '08:00:00','2023-11-24', TRUE, NULL);
INSERT INTO MEMBER VALUES (8, '김혁수', '01038384086', '10:00:00','2023-11-24', TRUE, NULL);
INSERT INTO MEMBER VALUES (9, '주현영', '01088351458', '10:00:00','2023-11-24', TRUE, NULL);
INSERT INTO MEMBER VALUES (10, '이승민', '01018384458', '10:00:00','2023-11-24', TRUE, NULL);

UPDATE MEMBER
SET InviteID = 2
WHERE UserID = 1; #1번이 2번을 추천
UPDATE MEMBER
SET InviteID = 3
WHERE UserID = 2; #2번이 3번을 추천
UPDATE MEMBER
SET InviteID = 6
WHERE UserID = 3; #3번이 6번을 추천