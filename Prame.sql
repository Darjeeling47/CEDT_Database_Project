-- 1.Query - register(ข้อมูลที่จะใช้ลงทะเบียน) : สร้าง account
INSERT INTO users (user_name, user_password, email, telephone_number) 
VALUES ('mike_wilson', 'mikemike', 'mike@example.com', '12345678');

-- 4.Query - edit_user(user_id, ข้อมูล) : แก้ไขข้อมูล user ที่ต้องการ
UPDATE SET user_name = 'gift_tip', user_password = 'gift', email = 'idontknow@example.com', telephone_number = '089000000'
WHERE user_id = 1;

-- 9.Function - delete_restaurant(restaurant_id) : ลบร้านอาหาร
CREATE OR REPLACE FUNCTION delete_restaurant(restaurant_id INT)
  LANGUAGE plpgsql
  AS
$$
BEGIN
  DELETE FROM restaurant R WHERE R.restaurant_id = restaurant_id;
END
$$