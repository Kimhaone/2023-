
# MEMBER DURATION 첫 갱싱 시나리오
INSERT INTO MEMBER (UserID, Name_, PhoneNumber, UsageTIME, Duration, Permission, InviteID)
VALUES (1, '호진', '010-5446-2693', NULL, NULL, FALSE, 22);


# PAYMENT LOG 발생
INSERT INTO SP_MEMBER_PAYMENT (UserID, SP_ProductID, SP_PaymentStartTime, SP_PaymentCompleteTime, SP_PaymentAmount, InviteID)
VALUES (1, 1, '2023-11-24 12:00:00', '2023-11-24 12:00:03', 7000, 22);


# MEMBER 테이블 갱신
UPDATE MEMBER
SET UsageTIME = '06:00:00',
    Permission = TRUE,
    Duration = (SELECT SP_PaymentCompleteTime + INTERVAL 30 DAY
                FROM SP_MEMBER_PAYMENT
                WHERE SP_PaymentID = 1)
WHERE UserID = 1;


# 기존 MEMBER톄이블 레코드 수정 시나리오
INSERT INTO MEMBER (UserID, Name_, PhoneNumber, UsageTIME, Duration, Permission, InviteID)
VALUES (1, '호진', '010-5446-2693', '06:00:00', '2023-12-24 12:00:03', TRUE, 22);

# '2023-12-24 12:00:03'이 됐음
UPDATE MEMBER
SET UsageTIME = NULL,
    Duration = NULL,
    Permission = FALSE
WHERE UserID = 1 AND NOW() > '2023-12-24 12:00:03';







