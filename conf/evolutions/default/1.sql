# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table client (
  id                            bigserial not null,
  first_name                    varchar(255),
  last_name                     varchar(255),
  address                       varchar(255),
  phone_number                  varchar(255),
  age                           integer,
  constraint pk_client primary key (id)
);

create table company (
  id                            bigserial not null,
  name                          varchar(255),
  address                       varchar(255),
  nb_employees                  bigint,
  constraint pk_company primary key (id)
);

create table field (
  id                            bigserial not null,
  field_name                    varchar(255),
  field_type                    varchar(8),
  pivot_table_id                bigint,
  constraint ck_field_field_type check ( field_type in ('String','Boolean','Integer','Number','Date','Time','DateTime')),
  constraint pk_field primary key (id)
);

create table filter (
  id                            bigserial not null,
  field_id                      bigint,
  pivot_table_id                bigint,
  constraint pk_filter primary key (id)
);

create table filter_valid_value (
  id                            bigserial not null,
  filter_id                     bigint,
  value_type                    varchar(255),
  specific_value                varchar(255),
  start_date                    timestamptz,
  end_date                      timestamptz,
  min_value                     bigint,
  max_value                     bigint,
  constraint pk_filter_valid_value primary key (id)
);

create table pivot_column (
  id                            bigserial not null,
  field_id                      bigint,
  pivot_table_id                bigint,
  constraint pk_pivot_column primary key (id)
);

create table pivot_page (
  id                            bigserial not null,
  field_id                      bigint,
  pivot_table_id                bigint,
  constraint pk_pivot_page primary key (id)
);

create table pivot_row (
  id                            bigserial not null,
  field_id                      bigint,
  pivot_table_id                bigint,
  constraint pk_pivot_row primary key (id)
);

create table pivot_table (
  id                            bigserial not null,
  constraint pk_pivot_table primary key (id)
);

create table pivot_value (
  id                            bigserial not null,
  field_id                      bigint,
  pivot_table_id                bigint,
  pivot_value_type_id           bigint,
  constraint pk_pivot_value primary key (id)
);

create table pivot_value_type (
  id                            bigserial not null,
  value_type                    varchar(255),
  display_name                  varchar(255),
  constraint pk_pivot_value_type primary key (id)
);

create table product (
  id                            bigserial not null,
  name                          varchar(255),
  unit_price                    float,
  constraint pk_product primary key (id)
);

create table product_sale (
  id                            bigserial not null,
  quantity                      bigint,
  constraint pk_product_sale primary key (id)
);

create table sale (
  id                            bigserial not null,
  date                          timestamptz,
  constraint pk_sale primary key (id)
);

alter table field add constraint fk_field_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_field_pivot_table_id on field (pivot_table_id);

alter table filter add constraint fk_filter_field_id foreign key (field_id) references field (id) on delete restrict on update restrict;
create index ix_filter_field_id on filter (field_id);

alter table filter add constraint fk_filter_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_filter_pivot_table_id on filter (pivot_table_id);

alter table filter_valid_value add constraint fk_filter_valid_value_filter_id foreign key (filter_id) references filter (id) on delete restrict on update restrict;
create index ix_filter_valid_value_filter_id on filter_valid_value (filter_id);

alter table pivot_column add constraint fk_pivot_column_field_id foreign key (field_id) references field (id) on delete restrict on update restrict;
create index ix_pivot_column_field_id on pivot_column (field_id);

alter table pivot_column add constraint fk_pivot_column_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_pivot_column_pivot_table_id on pivot_column (pivot_table_id);

alter table pivot_page add constraint fk_pivot_page_field_id foreign key (field_id) references field (id) on delete restrict on update restrict;
create index ix_pivot_page_field_id on pivot_page (field_id);

alter table pivot_page add constraint fk_pivot_page_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_pivot_page_pivot_table_id on pivot_page (pivot_table_id);

alter table pivot_row add constraint fk_pivot_row_field_id foreign key (field_id) references field (id) on delete restrict on update restrict;
create index ix_pivot_row_field_id on pivot_row (field_id);

alter table pivot_row add constraint fk_pivot_row_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_pivot_row_pivot_table_id on pivot_row (pivot_table_id);

alter table pivot_value add constraint fk_pivot_value_field_id foreign key (field_id) references field (id) on delete restrict on update restrict;
create index ix_pivot_value_field_id on pivot_value (field_id);

alter table pivot_value add constraint fk_pivot_value_pivot_table_id foreign key (pivot_table_id) references pivot_table (id) on delete restrict on update restrict;
create index ix_pivot_value_pivot_table_id on pivot_value (pivot_table_id);

alter table pivot_value add constraint fk_pivot_value_pivot_value_type_id foreign key (pivot_value_type_id) references pivot_value_type (id) on delete restrict on update restrict;
create index ix_pivot_value_pivot_value_type_id on pivot_value (pivot_value_type_id);


# --- !Downs

alter table if exists field drop constraint if exists fk_field_pivot_table_id;
drop index if exists ix_field_pivot_table_id;

alter table if exists filter drop constraint if exists fk_filter_field_id;
drop index if exists ix_filter_field_id;

alter table if exists filter drop constraint if exists fk_filter_pivot_table_id;
drop index if exists ix_filter_pivot_table_id;

alter table if exists filter_valid_value drop constraint if exists fk_filter_valid_value_filter_id;
drop index if exists ix_filter_valid_value_filter_id;

alter table if exists pivot_column drop constraint if exists fk_pivot_column_field_id;
drop index if exists ix_pivot_column_field_id;

alter table if exists pivot_column drop constraint if exists fk_pivot_column_pivot_table_id;
drop index if exists ix_pivot_column_pivot_table_id;

alter table if exists pivot_page drop constraint if exists fk_pivot_page_field_id;
drop index if exists ix_pivot_page_field_id;

alter table if exists pivot_page drop constraint if exists fk_pivot_page_pivot_table_id;
drop index if exists ix_pivot_page_pivot_table_id;

alter table if exists pivot_row drop constraint if exists fk_pivot_row_field_id;
drop index if exists ix_pivot_row_field_id;

alter table if exists pivot_row drop constraint if exists fk_pivot_row_pivot_table_id;
drop index if exists ix_pivot_row_pivot_table_id;

alter table if exists pivot_value drop constraint if exists fk_pivot_value_field_id;
drop index if exists ix_pivot_value_field_id;

alter table if exists pivot_value drop constraint if exists fk_pivot_value_pivot_table_id;
drop index if exists ix_pivot_value_pivot_table_id;

alter table if exists pivot_value drop constraint if exists fk_pivot_value_pivot_value_type_id;
drop index if exists ix_pivot_value_pivot_value_type_id;

drop table if exists client cascade;

drop table if exists company cascade;

drop table if exists field cascade;

drop table if exists filter cascade;

drop table if exists filter_valid_value cascade;

drop table if exists pivot_column cascade;

drop table if exists pivot_page cascade;

drop table if exists pivot_row cascade;

drop table if exists pivot_table cascade;

drop table if exists pivot_value cascade;

drop table if exists pivot_value_type cascade;

drop table if exists product cascade;

drop table if exists product_sale cascade;

drop table if exists sale cascade;

