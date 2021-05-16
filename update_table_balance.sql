LOAD DATA INFILE '/var/lib/mysql-files/f101/032021B1.csv'
INTO TABLE balance
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(bank_id, plan, account_id, a_p, @vr, @vv, @vitg, @ora, @ova, @oitga, @orp, @ovp, @oitgp, @ir, @iv, @iitg, dt, priz)
set 
#id = NULL,
vr = NULLIF(@vr,''),
vv = NULLIF(@vv,''),
vitg = NULLIF(@vitg,''),
ora = NULLIF(@ora,''),
ova = NULLIF(@ova,''),
oitga = NULLIF(@oitga,''),
orp = NULLIF(@orp,''),
ovp = NULLIF(@ovp,''),
oitgp = NULLIF(@oitgp,''),
ir = NULLIF(@ir,''),
iv = NULLIF(@iv,''),
iitg = NULLIF(@iitg,'');