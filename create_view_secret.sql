create view v_secretbanks as
(select node, bank_id, name, al, cbr_id, cbr_name, dt, sum(iv) as iv, sum(ir) as ir, sum(iitg) as iitg
	from 
		(select cbra.node as node, -1 as bank_id, 'Секрет' as name, cbra.al as al, cbra.cbr_id as cbr_id, cbra.cbr_name as cbr_name, cbra.dt as dt, 
		        -1*cbra.ir as ir, -1*cbra.iv as iv, -1*cbra.iitg as iitg
		from v_cbraccounts_by_bank as cbra
		# bank with id 1470 was integrated by one of the secret banks in 2020
		where cbra.bank_id <> 1470

		union all

		select cbracc.node as node, -1 as bank_id, 'Секрет' as name, s.assetliability_id as al, s.cbr_id, cbracc.cbr_name as cbr_name, s.dt as dt, 
		s.ir as ir, s.iv as iv, s.iitg as iitg 
		from system_balance as s
		inner join CBRaccounts as cbracc
			on cbracc.assetliability_id=s.assetliability_id and cbracc.cbr_id=s.cbr_id
		where s.dt >= '2020-01-01') as banks_and_system

group by node, bank_id, name, al, cbr_id, cbr_name, dt);
