-- 14.Query - add_province(ข้อมูล) : เพิ่มข้อมูลจังหวัด
INSERT INTO province(province_id, country, province_name)
VALUE ('1', 'Thailand', 'Bankok');

-- 14.Query - edit_province(province_id, ข้อมูล) : แก้ไขข้อมูลใน province ที่ต้องการ
UPDATE province
SET country = 'Thailand', province_name = 'Bankok'
WHERE province_id = 1;

--15.Query - view_provinces() : ดูข้อมูลจังหวัดทั้งหมด (province_id , country, province_name)
SELECT * FROM provinces;

-- 16.Query - delete_province(province_id) : ลบข้อมูลในจังหวัดที่ต้องการ
DELETE FROM province WHERE province_id = 1;