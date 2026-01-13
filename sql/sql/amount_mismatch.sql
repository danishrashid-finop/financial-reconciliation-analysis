  SELECT p.PAYMENT_ID, p.department,p.amount,
    case 
    when b.PAYMENT_ID is NULL THEN 'MISSING IN BANK'
    WHEN p.AMOUNT <>b.SET_AMOUNT
    THEN 'AMOUNT MISMATCH'
    ELSE 'OK'
    END AS ISSUE_TYPE
    FROM PAYMENT_SYSTEM p 
    LeFT JOIN BANK_STATEMENT b 
    on p.PAYMENT_ID = b.PAYMENT_ID
    WHERE b.payment_id is NULL
    OR p.AMOUNT<>b.set_amount
    order by p.AMOUNT DESC
    LIMIT 5;
    