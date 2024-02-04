## แนะนำการ Set up & Template 📁
### Template 📠
Template ทั้งหมดจะถูกรวมไว้ใน Folder ชื่อ Template ในนั้นจะมีไฟล์ทั้งหมด 3 ตัว คือ
- select
- insert_update_delete
- function
ทั้งหมดนี้จะมีตัวอย่างการเขียนไว้ให้อยู่แล้วให้เขียนตาม format ที่มีโดยเน้นไปที่
- การเว้นวรรค และแทบ
- ตัวใหญ่และตัวเล็ก
- ชื่อตัวแปรให้ใช้เป็น snake_case
---------------------------------------------------------------------------------------
### Set up 💻
การ set up ให้ดูใน folder set_up_database ในนั้นจะมีไฟล์ทั้งหมด 5 ตัว คือ 
0. create_database
 - เอาไว้สร้าง database
1. create_table_format_order
 - สร้าง table ทั้งหมด
 - ทั้งหมดในไฟล์ถูกเรียงให้ไม่ขัดกับ constrain แล้วสามารถกดรันพร้อมกันได้เลย (จะได้สบาย)
2. insert_table_test_data
 - ใส่ข้อมูลลง table ทั้งหมด
 - ทั้งหมดในไฟล์ถูกเรียงให้ไม่ขัดกับ constrain แล้วสามารถกดรันพร้อมกันได้เลย
3. select_test
 - เอาไว้ดูทั้งหมดเป็น SELECT * FROM table
4. something_went_wrong
 - ในกรณีที่เกิด error เนื่องจากข้อมูลมันเยอะมาก แนะนำให้ลบละลงใหม่ตั้งแต่ขั้นตอนที่ 2 -> 4
 - ตัว drop ถูกจัดเรียงมาแล้วกดรันพร้อมกันได้

---------------------------------------------------------------------------------------

## แนะนำ Structure ของ zip file 💻
### complex_query.sql 📁
ในไฟล์นี้จะเป็นชุดโค้ดของ complex query ที่เห็น table ได้ระดับหนึ่ง ถ้าอยากเห็นมากกว่านี้ให้อ่านต่อใน folder more_code
### more_code folder 📁
ในไฟล์จะรวมชุดโค้ดไว้ประมาณ 60 ตัว ซึงจะรวมไปทั้ง select insert update delete ของเท่าที่จะเป็นไปได้ โดยใน folder จะมีไฟล์ทั้งหมด 6 ตัว (ต้องลองหา ๆ ดูเพราะผมก็ไม่รู้ว่าอะไรอยู่ไหนบ้าง >_< แหะ)
### set_up_database folder 📁
ให้อ่านจากข้างบน
