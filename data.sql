insert into activitytype
select d.* from (values 
	(1,'программа', 	'program'	),
   	(2,'подпрограмма',	'subprogram'),
	(3,'проект',		'project'	),
	(4,'контракт',		'contract'	),
	(5,'котрольная точка',  'point' )
) as d(id, name, sysname)
where not exists(
    select 1 from activitytype as t
    where t.id = d.id
);

insert into activity 
values	(1, 1, 'somecode1', 'name1', 1, null),
		(2, 2, 'somecode2', 'name2', 1, 1),
		(3, 3, 'somecode3', 'name3', 1, 2),
		(4, 4, 'somecode4', 'name4', 1, 3),
		(5, 5, 'somecode5', 'name5', 1, 4),
		(6, 1, 'somecode1.1', 'name1.1', 2, 1),
		(7, 2, 'somecode2.1', 'name2.1', 2, 2),
		(8, 3, 'somecode3.1', 'name3.1', 2, 3),
		(9, 4, 'somecode4.1', 'name4.1', 2, 4)
on conflict do nothing;

insert into program 
values 	(1, 312, 1997, 1998),
	   	(2, 413, 1997, 1998)
on conflict (id) do nothing;

insert into subprogram 
values	(1, 4131),
		(2, 4132)
on conflict (id) do nothing;

insert into area 
values	(1, 'first area'),
		(2, 'second area')
on conflict (id) do nothing;

insert into project
values 	(1, 'test project1'),
		(2, 'test project2')
on conflict (id) do nothing;

insert into contract 
values 	(1, 1),
		(2, 2)
on conflict (id) do nothing;

insert into point
values	(1, date '1997-10-11', date '1997-10-25'),
		(2, date '1997-12-08', date '1997-12-22')
on conflict (id) do nothing;