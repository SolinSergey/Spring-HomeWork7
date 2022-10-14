CREATE DATABASE magazine_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

---------
	
CREATE TABLE IF NOT EXISTS public.buyer
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT buyer_pkey PRIMARY KEY (id),
    CONSTRAINT buyer_name_key UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.buyer
    OWNER to postgres;

---------
	
CREATE TABLE IF NOT EXISTS public.product
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    title character varying(100) COLLATE pg_catalog."default" NOT NULL,
    price integer NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id),
    CONSTRAINT product_title_key UNIQUE (title)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product
    OWNER to postgres;

---------
	
CREATE TABLE IF NOT EXISTS public.purchase
(
    id_buyer bigint NOT NULL,
    id_product bigint NOT NULL,
    date date NOT NULL,
    cost integer,
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    CONSTRAINT purchase_pkey PRIMARY KEY (id),
    CONSTRAINT purchase_id_buyer_fkey FOREIGN KEY (id_buyer)
        REFERENCES public.buyer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT purchase_id_product_fkey FOREIGN KEY (id_product)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.purchase
    OWNER to postgres;

---------
	
INSERT INTO public.buyer (name) VALUES
('Наташа'),
('Влад'),
('Сергей'),
('Лиза'),
('Саша'),
('Леха');

---------

INSERT INTO public.product (title,price) VALUES
('Селедка',500),
('Огурчики',100),
('Хлеб',35),
('Лимонад',55),
('Молоко',59),
('Кефир',60),
('Сыр',250);

---------

INSERT INTO public.purchase (id_buyer, id_product, date, cost) VALUES
(1,1,'2010-10-10',100),
(1,2,'2010-10-11',120),
(1,3,'2012-09-10',30),
(2,3,'2020-12-25',125),
(2,2,'2020-11-26',57),
(3,2,'2022-01-01',500),
(3,1,'2021-01-01',1000),
(4,4,'2012-12-12',125),
(4,7,'2013-12-13',135),
(5,5,'2011-11-11',350),
(5,6,'2019-12-20',1100),
(6,4,'2002-10-22',750);

