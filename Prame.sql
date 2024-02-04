-- 1.Query - register(ข้อมูลที่จะใช้ลงทะเบียน) : สร้าง account
INSERT INTO users (user_name, user_password, email, telephone_number) 
VALUES ('mike_wilson', 'mikemike', 'mike@example.com', '12345678');

-- 4.Query - edit_user(user_id, ข้อมูล) : แก้ไขข้อมูล user ที่ต้องการ
UPDATE SET user_name = 'gift_tip', user_password = 'gift', email = 'idontknow@example.com', telephone_number = '089000000'
WHERE user_id = 1;

-- 9.Query - delete_restaurant(restaurant_id) : ลบร้านอาหาร
DELETE FROM restaurant WHERE restaurant_id = 1;

-- 12.Trigger - calculate_max_capacity() : function สำหรับ trigger หลัง insert + update + delete โต๊ะใน branch -> ทำการคำนวณจำนวนโต๊ะทั้งหมดที่ branch นั้นๆ มี แล้วเก็บใน attribute ใน table ของ branch นั้น

-- 13.Trigger - calculate_menu_price() : function สำหรับ trigger หลัง insert + update + delete menu ใน branch -> ทำการคำนวณราคา avg, min, max ของ menuทั้งหมดที่ branch นั้นๆ มี แล้วเก็บใน attribute ใน table ของ branch นั้น

-- 18.Query - view_timeslots(วันที่) : ดู timeslot ทั้งหมดของวันนั้น
SELECT * FROM timeslots
WHERE timeslot_date = '2024-02-03';

-- 27.Query - view_reserve(reserve_id) : ดูการจองที่ต้องการ
SELECT U.user_name, T.timeslot_date, T.start_time, T.end_time, RS.restaurant_name, B.branch_id, BT.table_number 
FROM reserves R, users U, timeslots T, branch_tables BT, branches B, restaurants RS
WHERE (R.user_id = U.user_id) AND (R.time_slot_id = T.timeslot_id) AND (BT.branch_id = B.branch_id) AND (B.restaurant_id = RS.restaurant_id) AND (BT.table_id = R.table_id) AND U.user_id = 1;

-- 38.Query - restaurant_manager_view_branches(user_id) : Restaurant manager ข้อมูล branch ทั้งหมดที่ดูแลอยู่
SELECT RS.restaurant_name, B.*, BL.* FROM restaurants RS, branches B, branch_locations BL, restaurant_managers RM
WHERE (RM.user_id = a) AND (RM.restaurant_id = RS.restaurant_id) AND (B.restaurant_id = RS.restaurant_id) AND (BL.branch_id = B.branch_id);

-- 43.Query - view_menus(branch_id, เงื่อนไข filter) : ดูเมนูอาหารของ branch ตามเงื่อนไขที่มี
SELECT M.*, FL.* FROM menus M
INNER JOIN food_limitation FL ON M.food_limitation_id = FL.food_limitation_id
WHERE M.branch_id = 1;

-- 47.Query - view_tables(branch_id) : ดูโต๊ะที่มีใน branch
SELECT * FROM branch_tables
WHERE branch_id = 1;

-- 52.Query - view_report(report_id) : ดูรายละเอียดการ report ที่ต้องการ
SELECT RS.restaurant_name, B.branch_id, R.* FROM reports R
INNER JOIN branches B ON R.branch_id = B.branch_id
INNER JOIN restaurants RS ON B.restaurant_id = RS.restaurant_id
WHERE (R.report_id = 1);

-- 53.Query - view_branch_report(branch_id) : ดูข้อมูลการ report ทั้งหมด ของ branch นั้น 
SELECT * FROM reports
WHERE branch_id = 1;

-- 59.Query - view_search_records() : ดูข้อมูล search record ทั้งหมดที่เก็บไว้
SELECT * FROM search_records;

-- 60.Query - view_search_record(record_id) : ดูข้อมูล search record ที่ต้องการ
SELECT * FROM search_records
WHERE search_id = 1;

-- 61.Query - view_reserved_search_records() : ดูข้อมูล search record ทั้งหมดที่ถูกจองจริง
SELECT U.user_name ,RS.restaurant_name, B.branch_id, SR.*, FL.* FROM search_records SR
INNER JOIN reserves R ON R.search_id = SR.search_id
INNER JOIN branch_tables BT ON R.table_id = BT.table_id
INNER JOIN branches B ON BT.branch_id = B.branch_id
INNER JOIN restaurants RS ON B.restaurant_id = RS.restaurant_id
INNER JOIN users U ON SR.user_id = U.user_id
INNER JOIN food_limitation FL ON SR.food_limitation_id = FL.food_limitation_id;