/
create table cb_branches(
id number generated always as identity primary key,
name varchar2(30),
address varchar2(30)
);

/
create or replace procedure cb_branches_insert
(p_name varchar2, p_address varchar2) is
begin
    insert into cb_branches(name, address) values (p_name,p_address);
    commit;
end;

/
create or replace procedure cb_branches_update
(p_id number, p_name varchar2 default null, p_address varchar2 default null) is
begin
    update cb_branches set name=nvl(p_name, name), address=nvl(p_address, address)
    where id=p_id;
    commit;
end;

/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/
create table cb_currencies(
id number generated always as identity primary key,
name varchar2(30),
code varchar2(30)
);

/
create or replace procedure cb_currencies_insert
(p_name varchar2, p_code varchar2) is
begin
    insert into cb_currencies(name, code) values (p_name,p_code);
    commit;
end;

/
create or replace procedure cb_currencies_update
(p_id number, p_name varchar2 default null, p_code varchar2 default null) is
begin
    update cb_currencies set name=nvl(p_name, name), code=nvl(p_code, code)
    where id=p_id;
    commit;
end;
/

begin
    --cb_currencies_insert('azn', 944);
    cb_currencies_update(1,p_name=>'AZN');
end;
/
select * from cb_currencies;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/

create table cb_deposit_products(
id number generated always as identity primary key,
currency_id number,
product_name varchar2(100),
term number(4),
interest_rate number(10,2)
);

/
create or replace procedure cb_deposit_products_insert
(p_currency_id number,p_product_name varchar2, p_term number, p_interest_rate number) is
begin
    insert into cb_deposit_products(currency_id, product_name, term, interest_rate ) values (p_currency_id,p_product_name,p_term,p_interest_rate);
    commit;
end;

/
create or replace procedure cb_deposit_products_update
(p_id number, p_currency_id number default null, p_product_name varchar2 default null, p_term number default null, p_interest_rate number default null) is
begin
    update cb_deposit_products set 
    currency_id=nvl(p_currency_id, currency_id),
    product_name=nvl(p_product_name,product_name), 
    term=nvl(p_term,term), 
    interest_rate=nvl(p_interest_rate, interest_rate)
    where id=p_id;
    commit;
end;

/

begin
    --cb_deposit_products_insert(1, 'novruz emaneti', 3, 1.5);
    cb_deposit_products_update(1,p_product_name=>'Novruz emaneti');
end;
/
select * from cb_deposit_products;
/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/

create table cb_customer_deposits(
id number generated always as identity primary key,
customer_id number,
deposit_product_id number,
contract_no varchar2(30),
deposit_amount number(22,2),
profit_amount number(22,2),
start_date date
);

/
create or replace procedure cb_customer_deposits_insert
(p_customer_id number,p_deposit_product_id number, p_contract_no varchar2, p_deposit_amount number,p_profit_amount number,p_start_date date ) is
begin
    insert into cb_customer_deposits(customer_id, deposit_product_id, contract_no, deposit_amount,profit_amount,start_date ) values (p_customer_id,p_deposit_product_id,p_contract_no,p_deposit_amount,p_profit_amount,p_start_date );
    commit;
end;

/
create or replace procedure cb_customer_deposits_update
(p_id number, p_customer_id number default null, p_deposit_product_id number default null, p_contract_no varchar2 default null, p_deposit_amount number default null, p_profit_amount number default null, p_start_date date default null) is
begin
    update cb_customer_deposits set 
    customer_id=nvl(p_customer_id, customer_id),
    deposit_product_id=nvl(p_deposit_product_id,deposit_product_id), 
    contract_no=nvl(p_contract_no,contract_no), 
    deposit_amount=nvl(p_deposit_amount, deposit_amount),
    profit_amount=nvl(p_profit_amount, profit_amount),
    start_date=nvl(p_start_date, start_date)
    where id=p_id;
    commit;
end;

/

begin
   --cb_customer_deposits_insert(1,1,'0001',100,0,sysdate); 
   cb_customer_deposits_update(1,p_start_date=> sysdate-1);
end;

/
select * from cb_customer_deposits;
/

























