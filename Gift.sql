-- 17. add_timeslot : เพิ่ม timeslot ของวันนั้น
INSERT INTO timeslots (timeslot_date, start_time, end_time)
VALUES ('2024-02-04', '10:00:00', '10:30:00');

-- 19. edit_timeslot : แก้ไข timeslot ที่ต้องการ
UPDATE timeslots
SET timeslot_date = '2024-02-05', start_time = '13:00:00', end_time = '13:30:00'
WHERE timeslot_id = 1;

-- 20. delete_timeslot : ลบ timeslot ที่ต้องการ
DELETE FROM reserves WHERE timeslot_id = 1;
DELETE FROM timeslots WHERE timeslot_id = 1;

-- 26. add_reserve : User เพิ่มการจอง
INSERT INTO reserves (user_id, timeslot_id, table_id, preferred_name, amount, search_id)
VALUES (4, 4, 5, 'Emily White', 3, 3);

-- 28. view_branch_reserves : ดูการจองทั้งหมดใน branch 
SELECT B.branch_id, R.preferred_name, T.table_number, R.amount
FROM reserves R, branch_tables BT, branches B
WHERE B.branch_id = 1 AND (B.branch_id = T.branch_id) AND (R.table_id = T.table_id);

-- 29. user_view_reserves: User ดูการจองของตัวเอง
SELECT R.user_id, R.preferred_name, RS.restaurant_name, B.branch_id, BT.table_number, R.amount 
FROM reserves R, branch_tables BT, branches B, restaurants RS
WHERE R.user_id = 1 AND (R.table_id = BT.table_id) AND (BT.branch_id = B.branch_id) AND (B.restaurant_id = RS.restaurant_id);

-- 30. admin_view_reserves : Admin ดูการจองในจังหวัดที่ตัวเองรับผิดชอบ
SELECT A.user_id AS admin_id, P.province_name, RS.restaurant_name, B.branch_id, BT.table_number, R.user_id, R.preferred_name, R.amount
FROM admins A, provinces P, restaurants RS, branches B, branch_tables BT, reserves R
WHERE A.user_id = 1 AND (A.province_id = P.province_id) AND (P.province_id = B.province_id) AND (B.restaurant_id = RS.restaurant_id) AND (B.branch_id = BT.branch_id) AND (BT.table_id = R.table_id);

-- 31. restaurant_manager_view_reserves : Restaurant manager ดูการจองในร้านที่รับผิดชอบ 
SELECT RM.user_id AS restaurant_manager_id, RS.restaurant_name, B.branch_id, BT.table_number, R.user_id, R.preferred_name, R.amount
FROM restaurant_managers RM, restaurants RS, branches B, branch_tables BT, reserves R
WHERE RM.user_id = 1 AND (RM.restaurant_id = RS.restaurant_id) AND (RS.restaurant_id = B.restaurant_id) AND (B.branch_id = BT.branch_id) AND (BT.table_id = R.table_id);

-- 32. edit_reserve : แก้ไขการจองของตัวเอง 
UPDATE reserves
SET preferred_name = 'Christian Black'
WHERE user_id = 1 AND timeslot_id = 1 AND table_id = 12;

-- 33. delete_reserve : User ลบการจองของตัวเอง
DELETE FROM reserves WHERE user_id = 1 AND timeslot_id = 1;

-- 34. add_branch : เพิ่ม branch ใหม่ พร้อม branch location
INSERT INTO branches (branch_id, province_id, branch_type, open_time, close_time, telephone_number, rating, max_capacity, parking_amount, restaurant_id)
VALUES (11, 1, 'Subbranch', '10:00', '22:00', '089-123-4567', 4.0, 80, 30, 1);

INSERT INTO branch_locations (branch_id, house_number, lane, road, sub_district, district, postal_code) 
VALUES (11, '101', NULL, 'Sky Avenue', 'Seaside', 'Austin', '50123');

INSERT INTO branch_tables (table_number, max_capacity, branch_id) 
VALUES (1, 5, 11), (2, 8, 11);