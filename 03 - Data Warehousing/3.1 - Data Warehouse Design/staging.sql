-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."softcartDimDate"
(
    dateid integer NOT NULL,
    date date NOT NULL,
    year integer NOT NULL,
    quarter integer NOT NULL,
    quarter_name character varying(32)[] NOT NULL,
    month integer NOT NULL,
    month_name character varying(32)[] NOT NULL,
    day integer NOT NULL,
    week_day integer NOT NULL,
    week_day_name character varying(32)[] NOT NULL,
    PRIMARY KEY (dateid)
);

CREATE TABLE IF NOT EXISTS public."softcartDimCategory"
(
    catergoryid integer NOT NULL,
    catergory character varying(32)[] NOT NULL,
    PRIMARY KEY (catergoryid)
);

CREATE TABLE IF NOT EXISTS public."softcartDimItem"
(
    itemid integer NOT NULL,
    item character varying(32)[] NOT NULL,
    PRIMARY KEY (itemid)
);

CREATE TABLE IF NOT EXISTS public."softcartDimCountry"
(
    countryid integer NOT NULL,
    country character varying(32)[] NOT NULL,
    PRIMARY KEY (countryid)
);

CREATE TABLE IF NOT EXISTS public."softcartFactSales"
(
    orderid integer NOT NULL,
    dateid integer NOT NULL,
    categoryid integer NOT NULL,
    itemid integer NOT NULL,
    countryid integer NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY (orderid)
);

ALTER TABLE IF EXISTS public."softcartFactSales"
    ADD FOREIGN KEY (dateid)
    REFERENCES public."softcartDimDate" (dateid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."softcartFactSales"
    ADD FOREIGN KEY (categoryid)
    REFERENCES public."softcartDimCategory" (catergoryid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."softcartFactSales"
    ADD FOREIGN KEY (countryid)
    REFERENCES public."softcartDimCountry" (countryid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."softcartFactSales"
    ADD FOREIGN KEY (itemid)
    REFERENCES public."softcartDimItem" (itemid) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;