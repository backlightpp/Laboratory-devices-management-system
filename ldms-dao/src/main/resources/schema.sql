/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/5/18 10:38:35                           */
/*==============================================================*/

drop table if exists device;

drop table if exists device_type;

drop table if exists lab;

drop table if exists project;

drop table if exists project_order;

drop table if exists student;

drop table if exists subject;

drop table if exists teacher;

drop table if exists user;

/*==============================================================*/
/* Table: device                                                */
/*==============================================================*/
create table device
(
   id                   char(10) not null,
   lab_id               char(10),
   tea_id               char(10),
   dev_id               char(10),
   sub_id               char(20),
   name                 char(50),
   english_name         char(50),
   model_id             char(30),
   brand                char(50),
   subject_type         char(20),
   purchase_time        datetime,
   amount               int,
   amount_used          int default 0,
   per_price            float,
   sum_price            float,
   price_type           char(20),
   bill                 char(30),
   unit_of_measurement  char(10),
   fund_from            char(30),
   property_from        char(30),
   account_type         char(10),
   purchase_type        char(30),
   ps                   text,
   primary key (id)
);

/*==============================================================*/
/* Table: device_type                                           */
/*==============================================================*/
create table device_type
(
   id                   char(10) not null,
   name                 char(20),
   primary key (id)
);

/*==============================================================*/
/* Table: lab                                                   */
/*==============================================================*/
create table lab
(
   id                   char(10) not null,
   name                 varchar(50),
   size                 int,
   open_way             char(50) default 'ԤԼ����',
   manager              char(20),
   "use"                text,
   primary key (id)
);

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project
(
   id                   varchar(10) not null,
   lab_id               char(10),
   tea_id               char(10),
   name                 varchar(50) not null,
   start_time           datetime not null,
   end_time             datetime not null,
   capacity             int not null,
   state                smallint not null,
   credit               float not null,
   submit_time          datetime not null,
   pass_time            datetime not null,
   devices              varchar(200),
   files                varchar(50),
   description          text,
   primary key (id)
);

/*==============================================================*/
/* Table: project_order                                         */
/*==============================================================*/
create table project_order
(
   id                   char(10) not null,
   pro_id               varchar(10),
   stu_id               varchar(11),
   score                float(4) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   id                   varchar(11) not null,
   name                 varchar(20) not null,
   major                varchar(50) not null,
   class_id INT(6) NOT NULL,
   academy              varchar(50) not null,
   sex                  char(4) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: subject                                               */
/*==============================================================*/
create table subject
(
   id                   char(20) not null,
   name                 char(40),
   primary key (id)
);

/*==============================================================*/
/* Table: teacher                                               */
/*==============================================================*/
create table teacher
(
   id                   char(10) not null,
   name                 char(20),
   sex                  char(10),
   major                char(30),
   academy              char(30),
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   username             char(10) not null,
   password             char(10),
   auth                 char(10),
   primary key (username)
);

alter table device add constraint FK_D_D_T foreign key (dev_id)
      references device_type (id) on delete restrict on update restrict;

alter table device add constraint FK_D_L foreign key (lab_id)
      references lab (id) on delete restrict on update restrict;

alter table device add constraint FK_D_S foreign key (sub_id)
      references subject (id) on delete restrict on update restrict;

alter table device add constraint FK_D_T foreign key (tea_id)
      references teacher (id) on delete restrict on update restrict;

alter table project add constraint FK_L_P foreign key (lab_id)
      references lab (id) on delete restrict on update restrict;

alter table project add constraint FK_P_T foreign key (tea_id)
      references teacher (id) on delete restrict on update restrict;

alter table project_order add constraint FK_O_S foreign key (stu_id)
      references student (id) on delete restrict on update restrict;

alter table project_order add constraint FK_P_O foreign key (pro_id)
      references project (id) on delete restrict on update restrict;

