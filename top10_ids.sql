select bank_id 
		from 
			(SELECT * FROM v_cbraccounts_by_bank
			where dt = '2021-01-01' and cbr_id = 'Итого активов'
			union all
			select * from v_secretbanks
			where dt = '2021-01-01' and cbr_id = 'Итого активов') as all_banks
		order by iitg desc
		limit 10
