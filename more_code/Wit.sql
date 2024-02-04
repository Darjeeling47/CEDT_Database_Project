--6.delete_user(user_id): ลบข้อมูล user ที่ต้องการ ยังไม่เสร็จ

--7.create_restaurant: ลงทะเบียนร้านอาหารใหม่ในระบบ
INSERT INTO restaurants(restaurant_id,restaurant_owner,restaurant_name,website)
VALUES (11,'raiden shogun','inazuma' , 'http://www.inazumaRI.com');

--8.edit_restaurant: แก้ไขข้อมูลร้านอาหาร
UPDATE restaurants
SET detail = 'seafood'
WHERE restaurant_id = 11 ;

--36.view_branch: ดูข้อมูล branch ที่ต้องการ
SELECT R.restaurant_name , BL.branch_id , BL.house_number , BL.lane , BL.road, BL.sub_district , BL.district ,BL.postal_code     
FROM branches B ,restaurants R , branch_locations BL 
WHERE BL.branch_id = B.branch_id AND B.restaurant_id = R.restaurant_id ;


--37.admin_view_branches: Admin ดู สาขาของร้านในจังหวัดที่รับผิดชอบ
SELECT R.restaurant_name , BL.branch_id , BL.house_number , BL.lane , BL.road, BL.sub_district , BL.district ,BL.postal_code , BT.table_id ,BT.max_capacity   
FROM branches B ,restaurants R , branch_locations BL , branch_tables BT
WHERE BL.branch_id = B.branch_id AND B.branch_id = BT.branch_id AND B.restaurant_id = R.restaurant_id ;

--39.edit_branch: แก้ไขข้อมูลใน branch ตามที่ได้รับมา
UPDATE branches
SET open_time = '09:00:00' ,close_time = '22:30:00'
WHERE branch_id =1 ;

--40.edit_branch_location: แก้ไขข้อมูล location ของ branch ที่ต้องการ
UPDATE branch_locations
SET postal_code = '73150' , house_number = 198
WHERE branch_id =1 ;

--41.delete_branch: ลบ branch นั้น พร้อม branch location 
