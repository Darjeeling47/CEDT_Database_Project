-- 2.register_admin : ตั้งค่าให้ account นั้นเป็น admin
INSERT INTO admins(user_id, province_id) 
VALUES (11, 11);

-- 3.register_restaurant_manager : ตั้งค่าให้ account นั้นเป็น restaurant manager
INSERT INTO restaurant_managers (user_id, restaurant_id) 
VALUES (11, 11);

-- 5.edit_admin : แก้ไขพื้นที่รับผิดชอบ admin
UPDATE admins
SET province_id = 6
WHERE user_id = 9;

-- 42.add_menu : เพิ่มเมนูใหม่ของ branch ตามข้อมูล
INSERT INTO menus (branch_id, menu_name, price, menu_type, picture, food_limitation_id) 
VALUES (10, 'New Menu', 25, 'Appetizer', 'new.jpg', 1);


-- 44.edit_menu(menu_id, ข้อมูล) : แก้ไขเมนูตามข้อมูลที่รับมา
UPDATE menus
SET menu_type = 'Appetizer'
WHERE menu_id = 8;

UPDATE menus
SET food_limitation_id = 3
WHERE branch_id = 8 and menu_name = 'Lobster Roll' ;

-- 45.delete_menu : ลบ menu ที่ต้องการ
DELETE from menus WHERE menu_id = 9 ;

DELETE from menus WHERE branch_id = 10 AND menu_name = 'New Menu' ;

-- 46.add_table : เพิ่มโต๊ะไปยัง branch ที่เลือก
INSERT INTO branch_tables (table_number,max_capacity,branch_id) 
VALUES (3,3,4);

-- 48.edit_table : แก้ไขข้อมูลของ table ที่ต้องการ
UPDATE branch_tables
SET max_capacity = 10
WHERE table_id = 8;

UPDATE branch_tables
SET max_capacity = 6
WHERE table_number = 2 AND branch_id = 4 ;

-- 49.delete_table : ลบ table ที่ต้องการ
DELETE from branch_tables WHERE table_id = 8 ;

DELETE from branch_tables WHERE branch_id = 4 AND table_number = 3 ;

-- 50.add_report : User สร้าง report ร้านอาหาร
INSERT INTO reports (user_id,branch_id,report_description) 
VALUES (1,1,'NONE');

INSERT INTO reports (user_id,branch_id,report_description,is_other_issue) 
VALUES (1,2,'TOO HOT',TRUE);

-- 51.view_reports : ดูข้อมูลการ report ทั้งหมด sort by branch_id (report_id, report_description, all Flag)
SELECT report_id,  report_description, is_service_issue, is_hygiene_issue, is_other_issue FROM reports
WHERE branch_id = 1
ORDER BY branch_id ASC, report_id ASC;

-- 54.admin_view_reports : Admin ดู report ของร้านอาหารในจังหวัดที่รับผิดชอบ (report_id, restaurant_name, branch_id, user_name, report_description, all Flag)
SELECT r.report_id, res.restaurant_name, r.branch_id, u.user_name, r.report_description, r.is_service_issue, r.is_hygiene_issue, r.is_other_issue FROM reports r
INNER JOIN branches b ON r.branch_id = b.branch_id
INNER JOIN restaurants res ON b.restaurant_id = res.restaurant_id
INNER JOIN admins ad ON ad.user_id = r.user_id
INNER JOIN users u ON ad.user_id = u.user_id
WHERE ad.user_id = 5 ;

-- 55.restaurant_manager_view_reports : Restaurant manager ดู report ของ branch ทั้งหมดที่รับผิดชอบ (report_id, branch_id, report_description, all Flag)
SELECT r.report_id, r.branch_id, r.report_description, r.is_service_issue, r.is_hygiene_issue, r.is_other_issue FROM reports r
INNER JOIN branches b ON r.branch_id = b.branch_id
INNER JOIN restaurants res ON b.restaurant_id = res.restaurant_id
INNER JOIN restaurant_managers rm ON rm.user_id = r.user_id
WHERE rm.user_id = 5 ;

-- 56.edit_report : แก้ไข report นั้น (ห้ามแก้ branch_id)
UPDATE reports
SET report_description = 'TOO RUDE' , is_other_issue = TRUE 
WHERE report_id = 4 ;

-- 57.delete_report : ลบ report นั้น
DELETE from reports WHERE report_id = 4 ;

-- 58.add_search_record : เก็บข้อมูล search record อันใหม่
INSERT INTO search_records (user_id,search_records_timestamp,location_link) 
VALUES (1,'2024-02-03 11:00:00+00','http://maps.google.com/...');

INSERT INTO search_records (user_id,search_records_timestamp,location_link,amount) 
VALUES (1,'2024-02-03 11:00:00+00','http://maps.google.com/...',2);







