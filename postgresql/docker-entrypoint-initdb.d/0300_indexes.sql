\c ventdest
select '=============== CRÉER LES INDEX' as msg;

update orders set order_date = order_date + INTERVAL '3 years',
  required_date = required_date + INTERVAL '3 years',
  shipped_date = shipped_date + INTERVAL '3 years';
