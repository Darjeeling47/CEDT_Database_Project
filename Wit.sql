--6.delete_user(user_id): ลบข้อมูล user ที่ต้องการ ยังไม่เสร็จ
DELETE FROM users WHERE user_id = 1;
--7.create_restaurant: ลงทะเบียนร้านอาหารใหม่ในระบบ
INSERT INTO restaurants(restaurant_id,restaurant_owner,restaurant_name,website)
VALUES (11,'raiden shogun','inazuma' , 'http://www.inazumaRI.com');
