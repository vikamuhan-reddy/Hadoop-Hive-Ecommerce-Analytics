# Session 5 - Business Analysis

## Objective

Generate business insights using Hive.

## Query

SELECT
customer_state,
COUNT(*) AS total_customers
FROM customers_raw
GROUP BY customer_state
ORDER BY total_customers DESC;

## Results

SP - 41746

RJ - 12852

MG - 11635

RS - 5466

PR - 5045

## Business Insight

The majority of customers are concentrated in São Paulo.

Marketing campaigns can prioritize regions with the highest customer density.

Regional segmentation can improve business decisions.

## Dashboard Opportunity

- Customer distribution by state
- Top states by customer count
- Regional customer concentration

## Outcome

Business-ready analytics dataset produced.

