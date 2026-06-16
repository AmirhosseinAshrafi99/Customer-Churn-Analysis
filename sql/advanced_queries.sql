-- ============================================
-- Query 1 – Churn by Contract and Internet Service
-- ============================================

SELECT
    [Contract],
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
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY
    [Contract],
    [Internet Service]
ORDER BY churn_rate DESC;

-- ============================================
-- Query 2 – Top Churn Reasons
-- ============================================

SELECT
    [Churn Reason],
    COUNT(*) AS customers
FROM customer_churn
WHERE [Churn Label]='Yes'
GROUP BY [Churn Reason]
ORDER BY customers DESC;

-- ============================================
-- Query 3 – Average Monthly Charges by Contract
-- ============================================

SELECT
    [Contract],
    ROUND(
        AVG([Monthly Charges]),
        2
    ) AS avg_monthly_charge
FROM customer_churn
GROUP BY [Contract]
ORDER BY avg_monthly_charge DESC;

-- ============================================
-- Query 4 – Average CLTV by Contract
-- ============================================

SELECT
    [Contract],
    ROUND(
        AVG(CLTV),
        2
    ) AS avg_cltv
FROM customer_churn
GROUP BY [Contract]
ORDER BY avg_cltv DESC;

-- ============================================
-- Query 5 – Churn by Gender
-- ============================================

SELECT
    Gender,
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
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Gender;

-- ============================================
-- Query 6 – Churn by Partner Status
-- ============================================

SELECT
    Partner,
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
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Partner
ORDER BY churn_rate DESC;

-- ============================================
-- Query 7 – Churn by Dependents
-- ============================================

SELECT
    Dependents,
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
        ) / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY Dependents
ORDER BY churn_rate DESC;