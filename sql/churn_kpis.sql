-- Total Customers
SELECT
    COUNT(*) AS total_customers
FROM customer_churn;

--------------------------------------------------

-- Churned Customers
SELECT
    COUNT(*) AS churned_customers
FROM customer_churn
WHERE [Churn Label] = 'Yes';

--------------------------------------------------

-- Churn Rate
SELECT
    ROUND(
        100.0 *
        SUM(CASE WHEN [Churn Label] = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;

--------------------------------------------------

-- Average Monthly Charges
SELECT
    ROUND(AVG([Monthly Charges]),2)
        AS avg_monthly_charge
FROM customer_churn;

--------------------------------------------------

-- Average Tenure
SELECT
    ROUND(AVG([Tenure Months]),2)
        AS avg_tenure
FROM customer_churn;

--------------------------------------------------

-- Average CLTV
SELECT
    ROUND(AVG(CLTV),2)
        AS avg_cltv
FROM customer_churn;

--------------------------------------------------

-- Revenue At Risk
SELECT
    ROUND(
        SUM([Monthly Charges]),
        2
    ) AS revenue_at_risk
FROM customer_churn
WHERE [Churn Label] = 'Yes';

--------------------------------------------------

-- CLTV At Risk
SELECT
    SUM(CLTV)
        AS cltv_at_risk
FROM customer_churn
WHERE [Churn Label] = 'Yes';