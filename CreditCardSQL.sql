SELECT *
FROM Demographics

SELECT * 
FROM CreditActivity

-- Average Credit Limit by age

SELECT Customer_Age, CAST(AVG(Credit_Limit) AS decimal(10,2)) AS AverageCreditLimit
FROM Demographics
WHERE Customer_Age is not NULL
GROUP BY Customer_Age
ORDER BY Customer_Age


-- Average Credit Limit by income

SELECT Income_Category, CAST(AVG(Credit_Limit) AS decimal(10,2)) AS AverageCreditLimit
FROM Demographics
WHERE Income_Category is not NULL
GROUP BY Income_Category
ORDER BY Income_Category DESC


-- Average revolving balance by income

SELECT i.Income_Category, CAST(AVG(a.Total_Revolving_Bal) AS decimal(10,2)) AS AverageRevolvingBalance
FROM CreditActivity a
JOIN Demographics i
ON a.CLIENTNUM = i.CLIENTNUM
WHERE Income_Category is not NULL
GROUP BY i.Income_Category
ORDER BY Income_Category DESC


-- Average Revolving Balance by Marital Status

SELECT i.Marital_Status, CAST(AVG(a.Total_Revolving_Bal) AS decimal(10,2)) AS AverageRevolvingBalance
FROM CreditActivity a
JOIN Demographics i
ON a.CLIENTNUM = i.CLIENTNUM
WHERE Marital_Status is not NULL
GROUP BY Marital_Status
ORDER BY Marital_Status DESC


--Average Months on Book by age

SELECT Customer_Age, CAST(AVG(Months_on_book) AS decimal(10,0)) AS AverageMonthsOnBook
FROM Demographics
WHERE Customer_Age is not NULL
GROUP BY Customer_Age
ORDER BY Customer_Age 

--Average Utilization Ration by Age

SELECT i.Customer_Age, CAST(AVG(a.Avg_Utilization_Ratio) AS decimal(10,2)) AS AverageUtilizationRation
FROM CreditActivity a
JOIN Demographics i
ON a.CLIENTNUM = i.CLIENTNUM
WHERE Customer_Age is not NULL
GROUP BY Customer_Age
ORDER BY Customer_Age

