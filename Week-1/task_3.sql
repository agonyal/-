-- У какого квеста (выпишите его quest_nm) разница доли состоявшихся квестов в январе и в феврале наибольшая по модулю?
-- Долей считать количество состоявшихся квестов поделить на количество заявленных. 
-- В случае наличия нескольких квестов, подходящих под условие, требуется вывести тот, у которого значение quest_rk больше.


With test_table1 as
(
	Select Quest_rk
	,Game_rk
	,EXTRACT(MONTH FROM game_dttm)as month
	,game_flg
	,finish_flg
-- 	,Sum(game_flg) s
-- 	,Count(game_flg)
	From msu_analytics.game
	Group by quest_rk
	,game_rk
	,month
), 
test_table2 as
(
	Select quest_rk
	,quest_nm
	from msu_analytics.quest
),

Full_table as(
	Select *
	From test_table1
	Inner Join test_table2
	on test_table1.quest_rk= test_table2.quest_rk
 	Group by test_table2.quest_nm
	, test_table1.month
 	, test_table1.game_rk
 	, test_table1.quest_rk
 	, test_table1.game_flg
	, test_table1.finish_flg
	, test_table2.quest_rk
	
)

Select  Distinct *
From Full_Table
Order by Full_Table.quest_nm



















-- Select Distinct a.partner_rk
-- ,c.location_rk
-- From
--  msu_analytics.legend a
-- inner join msu_analytics.game b
-- on a.employee_rk = b.employee_rk
-- left join msu_analytics.quest c
-- on a.legend_rk = c.legend_rk
-- -- left join msu_analytics.game d
-- -- on a.employee_rk = d.employee_rk
-- Where a.gender = 'f' and d.time = min(d.time)