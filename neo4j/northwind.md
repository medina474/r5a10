LOAD CSV WITH HEADERS FROM 'http://caddy/ventdest/customers.csv' as row
CREATE (n:Customer{
  customer_id:row.customer_id,
  company_name:row.company_name,
  contact_name:row.contact_name,
  contact_title:row.contact_title,
  address:row.address,
  city:row.city,
  region:row.region,
  postal_code:row.postal_code,
  country:row.country,
  phone:row.phone,
  fax:row.fax
  })
