With test_table1 as
(
	Select partner_rk
	,legend_rk
	From msu_analytics.legend	
),
test_table2 as 
(
	Select employee_rk
	,gender_cd
	From msu_analytics.employee	
),
test_table3 as
(
	Select employee_rk
	,Quest_rk
	,Game_rk
	,time
	From msu_analytics.game
), 
test_table4 as
(
	Select quest_rk
	,legend_rk
	,location_rk
	from msu_analytics.quest
)
Full_table as(
	Select Distinct *
	From test_table2
	Left Join test_table3
	on test_table2.employee_rk = test_table3.employee_rk
	Left Join test_table4
	on test_table3.quest_rk = test_table4.quest_rk
	Left Join test_table1
	on test_table1.legend_rk = test_table4.legend_rk
	Join msu_analytics.partner
	on msu_analytics.partner.partner_rk = test_table1.partner_rk
	Where test_table2.gender_cd = 'f'

	
)

Select *
,employee_gender
From Full_table 
Where Full_table.gender_cd = 'f'
Order by Avg(time), partner_nm;
