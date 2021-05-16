create temporary table banks
with top10_ids as
# get ids of top 10 bank by assets
(select bank_id 
		from 
			(SELECT * FROM v_cbraccounts_by_bank
			where dt = '2021-01-01' and cbr_id = 'Итого активов'
			union all
			select * from v_secretbanks
			where dt = '2021-01-01' and cbr_id = 'Итого активов') as all_banks
		order by iitg desc
		limit 10),

top10 as        
# get info about top10 bank by assets        
(select all_banks.node as node, all_banks.bank_id as bank_id, all_banks.name as name, all_banks.al as al, all_banks.cbr_id as cbr_id,
	   all_banks.cbr_name as cbr_name, all_banks.dt as dt, 
       all_banks.ir as ir, all_banks.iv as iv, all_banks.iitg as iitg 
from 
	# select all banks, including secret banks
	(select * from v_cbraccounts_by_bank
	union all 
	select * from v_secretbanks) as all_banks
where all_banks.bank_id in (select * from top10_ids)), 	

other_banks as
# get info about all other banks
(select all_banks.node as node, -2 as bank_id, 'Прочие банки' as name, all_banks.al as al, all_banks.cbr_id as cbr_id,
	   all_banks.cbr_name as cbr_name, all_banks.dt as dt, 
       sum(all_banks.ir) as ir, sum(all_banks.iv) as iv, sum(all_banks.iitg) as iitg 
from 
	# select all banks, including secret banks
	(select * from v_cbraccounts_by_bank
	union all 
	select * from v_secretbanks) as all_banks
where all_banks.bank_id not in (select * from top10_ids)
group by all_banks.node, all_banks.al, all_banks.cbr_id, all_banks.cbr_name, all_banks.dt),

sys_balance as
# get info about the system
(select cbracc.node as node, 0 as bank_id, 'Система' as name, s.assetliability_id as al, s.cbr_id as cbr_id, 
		   cbracc.cbr_name as cbr_name, s.dt as dt, 
           s.ir as ir, s.iv as iv, s.iitg as iitg 
	from system_balance as s
	inner join CBRaccounts as cbracc
	on cbracc.assetliability_id=s.assetliability_id and cbracc.cbr_id=s.cbr_id
    where s.dt >= '2020-01-01')
