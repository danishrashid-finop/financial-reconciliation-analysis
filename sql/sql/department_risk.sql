 select
  p.DEPARTMENT,
  COUNT(DISTINCT p.PAYMENT_ID) AS ISSUE_COUNT,
  SUM ( 
    CASE 
       WHEN b.payment_ID IS NULL THEN 
    p.amount 
    when p.amount <> b.set_amount
    THEN ABS (p.amount - b.set_amount)
    else 0 
    end )
    as risk_amount
    from PAYMENT_SYSTEM p 
    LEFT JOIN BANK_STATEMENT b 
    on p.PAYMENT_ID=b.PAYMENT_ID
    group by p.DEPARTMENT
    order by risk_amount desc ;