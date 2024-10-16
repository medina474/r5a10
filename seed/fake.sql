WITH cumulative AS (
  SELECT nom, nombre_total, SUM(nombre_total) OVER (ORDER BY nom) AS cumulative_sum
  FROM ta_table
),
total AS (
  SELECT SUM(nombre_total) AS total_sum FROM ta_table
)
SELECT nom
FROM cumulative, total
WHERE cumulative_sum >= RANDOM() * total.total_sum
ORDER BY cumulative_sum
LIMIT 1;
