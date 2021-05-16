select cbrr.cbr_id, b.bank_id, bank.name, b.dt, sum(b.iitg)/1000000, sum(b.iitg)/1000000/sum(sum(b.iitg)/1000000) over() from balance as b
left join CBRaccount_ref as cbrr
	on b.account_id=cbrr.account_id and b.assetliability_id=cbrr.account_assetliability_id
left join bank as bank
	on bank.bank_id=b.bank_id
where 
	b.bank_id in
		(select distinct balance.bank_id from balance
		where right(account_id, 4)='XXXX') 
    and b.dt = '2021-04-01' 
    and cbrr.cbr_id='Итого активов'
group by cbrr.cbr_id, b.bank_id, bank.name, b.dt
order by sum(b.iitg)/1000000 desc
