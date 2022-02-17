view: d_supplier {

  sql_table_name: "DATA_MART"."D_SUPPLIER";;
  label: "Supplier"

  dimension: s_acctbal {
    label: "Supplier Account balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }
  dimension: acctbal_tier {
    label: "Cohort of suppliers according to Account Balance"
    type: tier
    tiers: [1, 3001, 5001, 7001]
    style: integer
    sql: ${s_acctbal} ;;
    value_format: "$#,##0"
  }

  dimension: s_address {
    label: "Supplier Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Supplier"
    type: string
    sql: ${TABLE}."S_NAME" ;;
    html:<a href="/dashboards/177?Supplier={{
         _filters['d_supplier.S_NAME'] }}">{{ value }}</a> ;;
  }

  dimension: s_nation {
    label: "Supplier Nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    label: "Supplier Phone"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    label: "Supplier Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."S_SUPPKEY" ;;
    hidden: yes
  }

  measure: count {
    type: count
    label: "No. of Suppliers"
    drill_fields: [s_name]
  }


}
