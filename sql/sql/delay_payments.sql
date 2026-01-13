SELECT p.PAYMENT_ID,
p.department,
p.amount,
p.payment_date_iso,
b.set_date_iso,
ROUND (
  julianday(b.set_date_iso) - julianday(p.payment_date_iso),
  1 ) AS delay_days
  from PAYMENT_SYSTEM p 
  JOIN BANK_STATEMENT b 
  on P.PAYMENT_ID=B.PAYMENT_ID
  WHERE (julianday(b.set_date_iso) - julianday(p.payment_date_iso)) >3;