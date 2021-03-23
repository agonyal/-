Select
count(*) as cnt
From
msu_analytics.legend a
left join msu_analytics.location b
on a.partner_rk = b.partner_rk
Where location_rk IS NULL
