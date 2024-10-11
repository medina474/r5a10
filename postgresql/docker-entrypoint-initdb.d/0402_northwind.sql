\c northwind

alter table only categories
  add constraint pk_categories
  primary key (category_id);


ALTER TABLE ONLY customers
  ADD CONSTRAINT pk_customers
  PRIMARY KEY (customer_id);


--
-- Name: pk_employes; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

ALTER TABLE ONLY order_details
  ADD CONSTRAINT pk_order_details 
  PRIMARY KEY (order_id, product_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

alter table only orders
  add constraint pk_orders
  primary key (order_id);


alter table only shippers
  add constraint pk_shippers
  primary key (shipper_id);

alter table only suppliers
  add constraint pk_suppliers
  primary key (supplier_id);

--
-- Name: pk_products; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace:
--

--ALTER TABLE ONLY products
--    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);

--
-- Name: fk_orders_customers; Type: Constraint; Schema: -; Owner: -
--

--
-- Name: fk_orders_employes; Type: Constraint; Schema: -; Owner: -
--

--
-- Name: fk_orders_shippers; Type: Constraint; Schema: -; Owner: -
--

--
-- Name: fk_order_details_products; Type: Constraint; Schema: -; Owner: -
--




--
-- Name: fk_order_details_orders; Type: Constraint; Schema: -; Owner: -
--




--
-- Name: fk_products_categories; Type: Constraint; Schema: -; Owner: -
--

--
-- Name: fk_products_suppliers; Type: Constraint; Schema: -; Owner: -
--


--
-- Name: fk_territories_region; Type: Constraint; Schema: -; Owner: -
--

--ALTER TABLE ONLY territories
--    ADD CONSTRAINT fk_territories_region FOREIGN KEY (zone_id) REFERENCES zones;


--
-- Name: fk_employe_territories_territories; Type: Constraint; Schema: -; Owner: -
--

-- ALTER TABLE ONLY employe_territories
--    ADD CONSTRAINT fk_employe_territories_territories FOREIGN KEY (territory_id) REFERENCES territories;


--
-- Name: fk_employe_territories_employes; Type: Constraint; Schema: -; Owner: -
--


--
-- Name: fk_employes_employes; Type: Constraint; Schema: -; Owner: -
--



SELECT setval(pg_get_serial_sequence('products', 'product_id'), MAX(product_id)) FROM products;
