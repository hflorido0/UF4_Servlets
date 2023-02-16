create schema m06uf4servlets;
use m06uf4servlets;

create table usuari (
                        id int primary key auto_increment,
                        usuari varchar(100) unique,
                        password varchar(100),
                        email varchar(255),
                        linkedin varchar(255),
                        gitlab varchar(255)
);

create table post (
                      id int primary key auto_increment,
                      id_usuari int,
                      title varchar(255),
                      url text,
                      message text,
                      image blob,
                      likes int,
                      dat date,
                      constraint fk_post_usuari foreign key (id_usuari) references usuari (id)
);

select * from post p inner join usuari u on p.id_usuari = u.id order by p.id desc limit 100;

insert into usuari (usuari, password) values ('hflorido','root');