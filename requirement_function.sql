-- 1. ผู้ใช้งานลงเทียนในระบบ โดยมีข้อมูลคือ ชื่อ, รหัสผ่าน, อีเมล และ เบอร์ติดต่อ  
INSERT INTO users (user_name, user_password, email, telephone_number) 
VALUES ('mike_wilson', 'mikemike', 'mike@example.com', '12345678');

-- 2. ผู้ใช้งานที่ลงทะเบียนแล้วเข้าสู่ระบบด้วย อีเมล และ รหัสผ่าน
INSERT INTO logs (user_id, log_time, is_login, is_logout)
VALUES (1, '2024-02-03 11:00:00', TRUE, FALSE);

-- 3. ผู้ใช้งานที่ลงทะเบียนแล้วออกจากระบบ 
INSERT INTO logs (user_id, log_time, is_login, is_logout)
VALUES (1, '2024-02-03 15:00:00', FALSE, TRUE);

-- 4. ผู้ใช้งานเข้าสู่ระบบ เพื่อจองร้านอาหารตามวันที่ต้องการ ซึ่งจองได้สูงสุด 3 การจอง
INSERT INTO reserves (user_id, timeslot_id, table_id, preferred_name, amount, search_id) 
VALUES(1, 3, 7, 'John Doe', 1, 1);

-- 5. แสดงรายการร้านอาหารมีรายละเอียดประกอบด้วย ชื่อร้านอาหาร, ที่ตั้ง, เบอร์ติดต่อ และ เวลาเปิด - ปิด
SELECT R.restaurant_name, B.branch_id, BL.house_number, BL.lane, BL.road, BL.sub_district, BL.district, P.province_name, P.country, B.telephone_number, B.open_time, B.close_time 
FROM branches B
JOIN restaurants R ON B.restaurant_id = R.restaurant_id
JOIN provinces P ON B.province_id = P.province_id
JOIN branch_locations BL ON BL.branch_id = B.branch_id;

-- 6. แสดงรายการจองของผู้ใช้งาน
SELECT T.timeslot_date, T.start_time, T.end_time, RS.restaurant_name, B.branch_id, BT.table_number 
FROM reserves R
INNER JOIN timeslots T ON R.timeslot_id = T.timeslot_id
INNER JOIN branch_tables BT ON BT.table_id = R.table_id
INNER JOIN branches B ON B.branch_id = BT.branch_id
INNER JOIN restaurants RS ON B.restaurant_id = RS.restaurant_id
WHERE R.user_id = 1;

-- 7. แก้ไขข้อมูลการจองของผู้ใช้งาน
UPDATE reserves
SET preferred_name = 'Christian Black'
WHERE user_id = 1 AND timeslot_id = 1 AND table_id = 12;

-- 8. ยกเลิก(ลบ) การจองของผู้ใช้งาน
DELETE FROM reserves WHERE user_id = 1 AND timeslot_id = 1;

-- 9. ผู้ดูแล(admin) ดูรายการจองของร้านอาหารใดๆก็ได้ในเขตรับผิดชอบของตัวเอง
SELECT R.preferred_name, R.user_id, RS.restaurant_name, B.branch_id, P.province_name, BT.table_number, R.amount, T.timeslot_date, T.start_time, T.end_time
FROM admins A
JOIN provinces P ON A.province_id = P.province_id
JOIN branches B ON P.province_id = B.province_id
JOIN restaurants RS ON B.restaurant_id = RS.restaurant_id
JOIN branch_tables BT ON B.branch_id = BT.branch_id
JOIN reserves R ON BT.table_id = R.table_id
JOIN timeslots T ON T.timeslot_id = R.timeslot_id
WHERE A.user_id = 4 ;

-- 10. ผู้ดูแล(admin) แก้ไขรายการจองของร้านอาหารใดๆก็ได้ก็ได้ในเขตรับผิดชอบของตัวเอง
UPDATE reserves
SET timeslot_id = 2
WHERE user_id = 1 AND table_id = 12;

-- 11. ผู้ดูแล(admin) ยกเลิก(ลบ) รายการจองของร้านอาหารใดๆก็ได้ในเขตรับผิดชอบของตัวเอง
DELETE FROM reserves
WHERE timeslot_id = 2 AND table_id = 12;