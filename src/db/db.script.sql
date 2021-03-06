drop table task;
drop table card;
drop table token;
drop table users;



create table users (
    id serial primary key,
    name varchar(255),
    email varchar(255),
    password varchar(255)
);

create table token (
  user_id integer references users(id) on DELETE CASCADE,
  refresh_token varchar(255)
);


create table card (
    id serial primary key,
    name varchar(255),
    admin_id integer REFERENCES users(id) on DELETE CASCADE
);

create table task (
    id serial primary key,
    card_id integer REFERENCES card(id) on DELETE CASCADE ,
    title varchar(255),
    description varchar(255),
    start timestamptz null,
    percent smallint,
    deadline timestamptz null,
    completed boolean
);


