-- 17. add_timeslot : เพิ่ม timeslot ของวันนั้น
INSERT INTO timeslots (timeslot_id, timeslot_date, start_time, end_time)
VALUE ('2024-02-04', '10:00:00', '10:30:00');

-- 19. edit_timeslot : แก้ไข timeslot ที่ต้องการ
UPDATE timeslots
SET timeslot_date = '2024-02-05', start_time = '13:00:00', end_time = '13:30:00'
WHERE timeslot_id = 15;

-- 20. delete_timeslot : ลบ timeslot ที่ต้องการ
DELETE FROM timeslots WHERE timeslot_id = 15;