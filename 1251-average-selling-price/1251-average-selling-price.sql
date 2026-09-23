Select P.Product_id,
COALESCE(round(sum(P.Price * S.units)/Sum(S.units),2),0) As average_price

From Prices P
Left Join UnitsSold S
On P.Product_id = S.Product_id
    AND S.purchase_date Between P.Start_date AND P.end_date
Group By P.product_id;

