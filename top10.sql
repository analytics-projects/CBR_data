select all_banks.node as node, all_banks.bank_id as bank_id, all_banks.name as name, all_banks.al as al, all_banks.cbr_id as cbr_id,
	   all_banks.cbr_name as cbr_name, all_banks.dt as dt, 
       all_banks.ir as ir, all_banks.iv as iv, all_banks.iitg as iitg 
from 
	# select all banks, including secret banks
	(select * from v_cbraccounts_by_bank
	union all 
	select * from v_secretbanks) as all_banks
where all_banks.bank_id in (select * from top10_ids))
