-- lookup tables

-- teams lookup
drop table if exists teams;
select distinct(team)
as "description"
into teams
from import.master_plan;

alter table teams
add id serial primary key ;

-- spass_types lookup
drop table if exists spass_types;
select distinct(spass_type)
as "description"
into spass_types
from import.master_plan;

alter table spass_types
add id serial
primary key;

-- targets lookup
drop table if exists targets;
select distinct(target)
as "description"
into targets
from import.master_plan;

alter table targets
add id serial
primary key;

-- requests lookup
drop table if exists requests;
select distinct(request_name)
as "description"
into requests
from import.master_plan;

alter table requests
add id serial
primary key;

-- events lookup
drop table if exists 
event_types
;
select distinct(library_definition)
as "description"
into 
event_types
from import.master_plan;

alter table 
event_types 
add id serial
primary key;

--fact table
--events

drop table if exists events;
create table events
(
    id serial primary key,
    time_stamp timestamp not null,
    title varchar(500),
    description text,
    event_type_id int references event_types(id),
    target_id int references targets(id),
    team_id int references teams(id),
    request_id int references requests(id),
    spass_type_id int references spass_types(id)
);

insert into events
    (
    time_stamp,
    title,
    description,
    event_type_id,
    spass_type_id,
    target_id,
    team_id,
    request_id
    )
select
    m.start_time_utc::timestamp,
    m.title,
    m.description,
    event_types.id as event_type_id,
    spass_types.id as spass_type_id,
    targets.id as target_id,
    teams.id as team_id,
    requests.id as request_id
from import.master_plan m
    left join event_types
    on event_types.description 
  = m.library_definition
    left join spass_types
    on spass_types.description 
  = m.spass_type
    left join targets
    on targets.description 
  = m.target
    left join teams
    on teams.description 
  = m.team
    left join requests
    on requests.description 
  = m.request_name;