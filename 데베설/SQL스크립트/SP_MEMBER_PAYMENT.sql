INSERT INTO SP_MEMBER_PAYMENT (SP_PaymentID, UserID, SP_ProductID, SP_PaymentStartTime, SP_PaymentCompleteTime, SP_PaymentAmount, InviteID)
VALUES
(1, 2, 1, '2023-11-26 15:12:00', '2023-11-26 15:14:00', 3000, 1), #1번이 2번을 추천해서 2번이 sp_member
(2, 3, 1, '2023-12-26 16:32:00', '2023-12-26 16:34:00', 3000, 2), #2번이 3번을 추천해서 3번이 sp_member
(3, 6, 3, '2024-04-02 16:32:00', '2024-04-02 16:33:00', 7000, 3); #3번이 6번을 추천해서 6번이 sp_member