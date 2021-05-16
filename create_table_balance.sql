create table balance
(
id mediumint unsigned auto_increment,
bank_id smallint unsigned,
plan char(1),
account_id varchar(5),
a_p char(1) check (a_p in ('1', '2')),
vr bigint,
vv bigint,
vitg float(37),
ora bigint,
ova bigint,
oitga float(37),
orp bigint,
ovp bigint,
oitgp float(37),
ir bigint,
iv bigint,
iitg float(37),
dt date,
priz tinyint check (priz in ('1', '2')),
constraint pk_id primary key(id),
constraint fk_balance_bank_id foreign key (bank_id)
	references bank (bank_id),
constraint fk_balance_account_id foreign key (account_id)
	references account (account_id)    
)