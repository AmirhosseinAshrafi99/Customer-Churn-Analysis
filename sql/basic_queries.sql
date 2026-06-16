SELECT COUNT(*) AS total_customers
FROM customer_churn

SELECT
ROUND(
100.0 *
SUM(CASE WHEN [Churn Label]='Yes' THEN 1 ELSE 0 END)
/ COUNT(*),
2
) AS churn_rate
FROM customer_churn

-- ============================================
-- CUSTOMER CHURN ANALYSIS : BASIC QUERIES
-- ============================================

-- Total Customers
SELECT
COUNT(*) AS total_customers
FROM customer_churn;

-- Churn Rate
SELECT
ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes' THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate
FROM customer_churn;

-- Average Monthly Charges
SELECT
ROUND(
AVG([Monthly Charges]),
2
) AS avg_monthly_charge
FROM customer_churn;

-- Average Tenure
SELECT
ROUND(
AVG([Tenure Months]),
2
) AS avg_tenure
FROM customer_churn;

-- Average CLTV
SELECT
ROUND(
AVG(CLTV),
2
) AS avg_cltv
FROM customer_churn;

-- Churn By Contract Type

SELECT
Contract,
COUNT(*) AS total_customers,
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
) AS churned_customers,
ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- ============================================
-- CHURN BY Internet Service : BASIC QUERIES
-- ============================================

SELECT
[Internet Service],
COUNT(*) AS total_customers,
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
) AS churned_customers,
ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate
FROM customer_churn
GROUP BY [Internet Service]
ORDER BY churn_rate DESC;

-- ============================================
-- CHURN BY PAYMENT METHOD : BASIC QUERIES
-- ============================================

SELECT
[Payment Method],
COUNT(*) AS total_customers,
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
) AS churned_customers,
ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate
FROM customer_churn
GROUP BY [Payment Method]
ORDER BY churn_rate DESC;

-- ============================================
-- SENIOR CITIZEN ANALYSIS : BASIC QUERIES
-- ============================================

SELECT
[Senior Citizen],
COUNT(*) AS total_customers,
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
) AS churned_customers,
ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate
FROM customer_churn
GROUP BY [Senior Citizen];

-- ============================================
-- TENURE GROUPS : BASIC QUERIES
-- ============================================

SELECT
CASE
WHEN [Tenure Months] <= 12 THEN '0-12'
WHEN [Tenure Months] <= 24 THEN '13-24'
WHEN [Tenure Months] <= 48 THEN '25-48'
ELSE '49-72'
END AS tenure_group,

COUNT(*) AS total_customers,

SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
) AS churned_customers,

ROUND(
100.0 *
SUM(
CASE
WHEN [Churn Label]='Yes'
THEN 1
ELSE 0
END
)
/COUNT(*),
2
) AS churn_rate

FROM customer_churn

GROUP BY tenure_group

ORDER BY tenure_group;