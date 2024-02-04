---2.register_admin : ตั้งค่าให้ account นั้นเป็น admin
INSERT INTO admins(user_id, province_id) VALUES (11, 11);

--3.register_restaurant_manager : ตั้งค่าให้ account นั้นเป็น restaurant manager
INSERT INTO restaurant_managers (user_id, restaurant_id) VALUES (11, 11);

--5.edit_admin : แก้ไขพื้นที่รับผิดชอบ admin
UPDATE admins
SET province_id = 6
WHERE user_id = 9;

