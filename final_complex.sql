SELECT RS.restaurant_name, B.branch_id, COUNT(*) AS reserves_count
FROM reserves R
JOIN branch_tables BT ON R.table_id = BT.table_id
JOIN branches B ON BT.branch_id = B.branch_id
JOIN restaurants RS ON B.restaurant_id = RS.restaurant_id
WHERE (B.rating >= 3) AND (B.parking_amount >= 1)
GROUP BY RS.restaurant_id, B.branch_id
HAVING COUNT(*) >= ALL(
	SELECT COUNT(*)
	FROM reserves R
	JOIN branch_tables BT ON R.table_id = BT.table_id
	JOIN branches B ON BT.branch_id = B.branch_id
	WHERE (B.rating >= 3) AND (B.parking_amount >= 1)
	GROUP BY B.branch_id
)
ORDER BY RS.restaurant_name ASC, B.branch_id ASC;