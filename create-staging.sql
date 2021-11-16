DROP TABLE IF EXISTS staging.business;

CREATE TABLE staging.business (
        business_id character varying(25),
        name character varying(200),
        address character varying(500),
        city character varying(200),
        state character varying(200),
        postal_code character varying(200),
        latitude float,
        longitude float,
        stars smallint,
        review_count integer,
        is_open boolean,
        categorie character varying(500)
);

DROP TABLE IF EXISTS staging.business_hours;

CREATE TABLE staging.business_hours (
    business_id character varying(25),
    weekday character varying(10),
    opening_hours character varying(100)
);

DROP TABLE IF EXISTS staging.business_attributes;

CREATE TABLE staging.business_attributes(
    business_id character varying(25),
    attribute character varying(200),
    value character varying(200)
);

DROP TABLE IF EXISTS staging.checkin;

CREATE TABLE staging.checkin(
    business_id character varying(25),
    checkin_date date
); 

DROP TABLE IF EXISTS staging.review;

CREATE TABLE staging.review(
    review_id character varying(30),
    business_id character varying(25),
    user_id character varying(30),
    starts integer,
    useful integer,
    funny integer,
    cool integer,
    review_text text,
    review_date date
);

DROP TABLE IF EXISTS staging.tip;

CREATE TABLE staging.tip(
    user_id character varying(30),
    business_id character varying(25),
    tip_text text,
    tip_date date,
    compliment_count integer
);

DROP TABLE IF EXISTS staging.user;

CREATE TABLE staging.user(
    user_id character varying(30),
    user_name character varying(200),
    review_count integer,
    yelping_since timestamp,
    useful integer,
    funny integer,
    cool integer,
    friends integer,
    elite character varying(200)
);