create table CBRaccounts (
node int auto_increment primary key,
assetliability_id tinyint UNSIGNED,
cbr_id varchar(24),
cbr_name varchar(107),
constraint fk_CBRaccounts_assetliability_id foreign key (assetliability_id)
	references assetliability (assetliability_id)
);

insert into CBRaccounts (node, assetliability_id, cbr_id, cbr_name) values
(1,1,'Итого активов','Итого активов'),
(2,1,'1.','Денежные средства и их эквиваленты'),
(3,1,'1.1.','Денежные средства (касса, чеки, денежные средства в пути, в банкоматах)'),
(4,1,'1.2.','Драгоценные металлы и камни'),
(5,1,'1.3.','Корреспондентские счета в кредитных организациях'),
(6,1,'1.4.','Средства в Банке России'),
(7,1,'1.4.1.','Корреспондентские счета в Банке России'),
(8,1,'1.4.2.','Прочие средства в Банке России (не коррсчета)'),
(9,1,'1.5.','Резервы на возможные потери (без учета МСФО 9)'),
(10,1,'1.6.','Корректировка резерва на возможные потери по МСФО 9'),
(11,1,'2.','Депозиты в Банке России'),
(12,1,'3.','Обязательные резервы в Банке России '),
(13,1,'4.','Кредиты банкам'),
(14,1,'4.1.','Кредиты, приобретенные права требования и прочие размещенные средства'),
(15,1,'4.2.','Резервы на возможные потери (без учета МСФО 9)'),
(16,1,'4.3.','Корректировка резерва на возможные потери по МСФО 9'),
(17,1,'5.','Ценные бумаги'),
(18,1,'5.1.','Долговые ценные бумаги'),
(19,1,'5.1.1','Незаложенные долговые ценные бумаги'),
(20,1,'5.1.1.1.','Вложения в ценные бумаги Банка России'),
(21,1,'5.1.1.2.','Прочие долговые ценные бумаги (не Банка России)'),
(22,1,'5.1.2.','Долговые ценные бумаги, переданные без прекращения признания'),
(23,1,'5.1.3.','Переоценка и корректировка стоимости'),
(24,1,'5.2.','Долевые ценные бумаги (с учетом переоценки и изменений справедливой стоимости при первоначальном признании)'),
(25,1,'5.3.','Векселя (с учетом переоценки и корректировки стоимости)'),
(26,1,'5.4.','Резервы на возможные потери (без учета МСФО 9)'),
(27,1,'5.5.','Корректировка резервов на возможные потери по МСФО 9'),
(28,1,'6.','Участие в уставных капиталах'),
(29,1,'6.1.','Участие в уставных капиталах дочерних и зависимых акционерных обществах, паевых инвестиционных фондах'),
(30,1,'6.2.','Прочее участие в уставных капиталах'),
(31,1,'6.3.','Резервы на возможные потери (без учета МСФО 9)'),
(32,1,'6.4.','Корректировка резерва на возможные потери по МСФО 9'),
(33,1,'7.','Кредитный портфель и прочие размещенные средства'),
(34,1,'7.1.','Кредиты, приобретенные права требования и прочие размещенные средства'),
(35,1,'7.1.1.','Корпоративные кредиты'),
(36,1,'7.1.1.1.','Нефинансовые организации'),
(37,1,'7.1.1.2.','Финансовые организации'),
(38,1,'7.1.1.3.','Индивидуальные предприниматели'),
(39,1,'7.1.2.','Государственные структуры'),
(40,1,'7.1.3. ','Физические лица'),
(41,1,'7.1.4. ','Приобретенные права требования (без учета просроченной задолженности)'),
(42,1,'7.1.5. ','Прочее'),
(43,1,'7.2.','Резервы на возможные потери (без учета МСФО 9)'),
(44,1,'7.3.','Переоценки и корректировки МСФО 9'),
(45,1,'8.','Производные финансовые инструменты, от которых ожидается получение экономических выгод'),
(46,1,'9.','Основные средства и финансовая аренда'),
(47,1,'9.1.','Основные средства'),
(48,1,'9.2.','Финансовая аренда (лизинг)'),
(49,1,'9.3.','Резервы на возможные потери'),
(50,1,'10.','Недвижимость, временно неиспользуемая в основной деятельности'),
(51,1,'10.1.','Недвижимость до вычета РВП'),
(52,1,'10.2.','Резервы на возможные потери'),
(53,1,'11.','Нематериальные активы'),
(54,1,'12.','Отложенный налоговый актив'),
(55,1,'13.','Прочие активы'),
(56,1,'13.1.','Средства в расчетах'),
(57,1,'13.2.','Дебиторы'),
(58,1,'13.3.','Требования по начисленным процентам (без учета начисленных процентов (купонов) по ценным бумагам)'),
(59,1,'13.4.','Прочее'),
(60,1,'13.5.','Резервы на возможные потери (без учета МСФО 9)'),
(61,1,'13.6.','Корректировка резерва на возможные потери по МСФО 9');



create table CBRaccounts_relationships (
ancestor int not null,
descendant int not null,
primary key (ancestor, descendant),
foreign key (ancestor) references CBRaccounts(node),
foreign key (descendant) references CBRaccounts(node)
);

insert into CBRaccounts_relationships (ancestor, descendant) values
(1,1),	(1,2),	(1,3),	(1,4),	(1,5),	(1,6),	(1,7),	(1,8),	(1,9),	(1,10),	(1,11),	(1,12),	(1,13),	(1,14),	(1,15),	(1,16),	(1,17),	(1,18),	(1,19),	(1,20),	(1,21),	(1,22),	(1,23),	(1,24),	(1,25),	(1,26),	(1,27),	(1,28),	(1,29),	(1,30),	(1,31),	(1,32),	(1,33),	(1,34),	(1,35),	(1,36),	(1,37),	(1,38),	(1,39),	(1,40),	(1,41),	(1,42),	(1,43),	(1,44),	(1,45),	(1,46),	(1,47),	(1,48),	(1,49),	(1,50),	(1,51),	(1,52),	(1,53),	(1,54),	(1,55),	(1,56),	(1,57),	(1,58),	(1,59),	(1,60),	(1,61),
(2,2),	(2,3),	(2,4),	(2,5),	(2,6),	(2,7),	(2,8),	(2,9),	(2,10),																																																				
(3,3),																																																												
(4,4),																																																												
(5,5),																																																												
(6,6),	(6,7),	(6,8),																																																										
(7,7),																																																												
(8,8),																																																												
(9,9),																																																												
(10,10),																																																												
(11,11),																																																												
(12,12),																																																												
(13,13),	(13,14),	(13,15),	(13,16),																																																									
(14,14),																																																												
(15,15),																																																												
(16,16),																																																												
(17,17),	(17,18),	(17,19),	(17,20),	(17,21),	(17,22),	(17,23),	(17,24),	(17,25),	(17,26),	(17,27),																																																		
(18,18),	(18,19),	(18,20),	(18,21),	(18,22),	(18,23),																																																							
(19,19),	(19,20),	(19,21),																																																										
(20,20),																																																												
(21,21),																																																												
(22,22),																																																												
(23,23),																																																												
(24,24),																																																												
(25,25),																																																												
(26,26),																																																												
(27,27),																																																												
(28,28),	(28,29),	(28,30),	(28,31),	(28,32),																																																								
(29,29),																																																												
(30,30),																																																												
(31,31),																																																												
(32,32),																																																												
(33,33),	(33,34),	(33,35),	(33,36),	(33,37),	(33,38),	(33,39),	(33,40),	(33,41),	(33,42),	(33,43),	(33,44),																																																	
(34,34),	(34,35),	(34,36),	(34,37),	(34,38),	(34,39),	(34,40),	(34,41),	(34,42),																																																				
(35,35),	(35,36),	(35,37),	(35,38),																																																				
(36,36),																																																												
(37,37),																																																												
(38,38),																																																												
(39,39),																																																												
(40,40),																																																												
(41,41),																																																												
(42,42),																																																												
(43,43),																																																												
(44,44),																																																												
(45,45),																																																												
(46,46),	(46,47),	(46,48),	(46,49),																																																									
(47,47),																																																												
(48,48),																																																												
(49,49),																																																												
(50,50),	(50,51),	(50,52),																																																										
(51,51),																																																												
(52,52),																																																												
(53,53),																																																												
(54,54),																																																												
(55,55),	(55,56),	(55,57),	(55,58),	(55,59),	(55,60),	(55,61),																																																						
(56,56),																																																												
(57,57),																																																												
(58,58),																																																												
(59,59),																																																												
(60,60),																																																												
(61,61);																																																									
