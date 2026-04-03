/*
  Staging model: stg_customers
  
  Purpose: Clean and type the raw Telco customer data for downstream use.
  Source: churn_raw.telco_customers (loaded from Kaggle)
  Output: One row per customer account with correct types and naming
  
  Transformations applied:
    - Rename columns to snake_case business-friendly names
    - Cast Yes/No strings to BOOLEAN
    - Cast seniorcitizen INTEGER to BOOLEAN  
    - Encode churn target as 0/1 INTEGER for ML
    - No business logic — that lives in the features layer
*/

WITH source AS (
    /*
      Why ref source() instead of the table name directly:
      dbt builds a dependency graph from source() calls.
      If the source table doesn't exist or fails a test,
      dbt stops here rather than running on missing data.
    */
    SELECT * FROM {{ source('churn_raw', 'telco_customers') }}
),

cleaned AS (
    SELECT
        -- Identifiers
        customerid                                          AS customer_id,

        -- Demographics
        gender,

        /*
          seniorcitizen is stored as INTEGER (0/1) in raw data.
          Casting to BOOLEAN makes intent explicit — this is a
          yes/no flag, not a number you would sum or average.
          Downstream feature models use TRUE/FALSE comparisons
          which are cleaner than = 1 checks.
        */
        CASE WHEN seniorcitizen = 1
             THEN TRUE ELSE FALSE
        END                                                 AS is_senior_citizen,

        /*
          All Yes/No string columns cast to BOOLEAN.
          Why: BOOLEAN comparisons are faster in BigQuery than
          string comparisons, and eliminate case-sensitivity bugs
          ('yes' vs 'Yes' would be two different values as strings).
        */
        CASE WHEN partner = 'Yes'
             THEN TRUE ELSE FALSE
        END                                                 AS has_partner,

        CASE WHEN dependents = 'Yes'
             THEN TRUE ELSE FALSE
        END                                                 AS has_dependents,

        -- Account metrics
        tenure                                              AS tenure_months,
        contract                                            AS contract_type,

        CASE WHEN paperlessbilling = 'Yes'
             THEN TRUE ELSE FALSE
        END                                                 AS has_paperless_billing,

        paymentmethod                                       AS payment_method,

        -- Charges (already FLOAT in raw — keep as is)
        monthlycharges                                      AS monthly_charges,
        totalcharges                                        AS total_charges,

        -- Services
        CASE WHEN phoneservice = 'Yes'
             THEN TRUE ELSE FALSE
        END                                                 AS has_phone_service,

        /*
          multiplelines, onlinesecurity etc. have three values:
          'Yes', 'No', and 'No internet service' / 'No phone service'
          
          Why we keep these as STRING not BOOLEAN:
          'No internet service' is fundamentally different from 'No' —
          it means the customer has no internet at all, not just that
          they chose not to add the feature. Collapsing to BOOLEAN
          would lose that signal. The features layer handles this nuance.
        */
        multiplelines                                       AS multiple_lines,
        internetservice                                     AS internet_service_type,
        onlinesecurity                                      AS online_security,
        onlinebackup                                        AS online_backup,
        deviceprotection                                    AS device_protection,
        techsupport                                         AS tech_support,
        streamingtv                                         AS streaming_tv,
        streamingmovies                                     AS streaming_movies,

        -- Target variable
        /*
          Why INTEGER not BOOLEAN:
          ML models require numeric targets. XGBoost expects 0/1.
          Storing as INTEGER means Kaggle can read this column
          directly into model training without additional encoding.
        */
        CASE WHEN churn = 'Yes' THEN 1
             ELSE 0
        END                                                 AS churn_flag

    FROM source
)

SELECT * FROM cleaned

