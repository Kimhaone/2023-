
create user 'Master'@'localhost' identified by '0000';
grant all on studycafe.* to Master@localhost;

create user 'Kim'@'localhost' identified by '0001';
grant all on studycafe.member_product to Kim@localhost;
grant all on studycafe.non_member_product to Kim@localhost;
grant all on studycafe.sp_member_product to Kim@localhost;

create user 'Shin'@'localhost' identified by '0002';
grant all on studycafe.seat_res to Shin@localhost;

create user 'Jeong'@'localhost' identified by '0003';
grant all on studycafe.studyroom_res to Jeong@localhost;

create user 'An'@'localhost' identified by '0004';
grant all on studycafe.locker_res to An@localhost;



