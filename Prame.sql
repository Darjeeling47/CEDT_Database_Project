-- 1.Query - register(ข้อมูลที่จะใช้ลงทะเบียน) : สร้าง account
INSERT INTO users (user_name, user_password, email, telephone_number) 
VALUES ('mike_wilson', 'mikemike', 'mike@example.com', '12345678');

-- 4.Query - edit_user(user_id, ข้อมูล) : แก้ไขข้อมูล user ที่ต้องการ
UPDATE SET user_name = 'gift_tip', user_password = 'gift', email = 'idontknow@example.com', telephone_number = '089000000'
WHERE user_id = 1;

-- 9.Query - delete_restaurant(restaurant_id) : ลบร้านอาหาร
DELETE FROM restaurant WHERE restaurant_id = 1;

-- 27.Query - view_reserve(reserve_id) : ดูการจองที่ต้องการ
SELECT R.reserve_id, U.user_name, T.timeslot_date, T.start_time, T.end_time, RS.restaurant_name, B.branch_id, BT.table_number FROM reserves R, users U, timeslots T, branch_tables BT, branches B, restaurants RS
WHERE (R.user_id = U.user_id) AND (R.time_slot_id = T.time_slot_id) AND (R.branch_id = B.branch_id) AND (B.restaurant_id = RS.restaurant_id) AND (BT.table_id = R.table_id) AND U.user_id = 1;