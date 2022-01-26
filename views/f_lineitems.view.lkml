view: f_lineitems {

  sql_table_name: "DATA_MART"."F_LINEITEMS" ;;
  label: "Orders"

  dimension: l_availqty {
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
    hidden: yes
  }

  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
    hidden: yes
  }

  dimension: l_discount {
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
  }

  dimension: l_linenumber {
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    hidden: yes
  }

  dimension: l_orderkey {
    type: string
    sql: ${TABLE}."L_ORDERKEY" ;;

  }

  dimension: l_orderpriority {
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  dimension: l_quantity {
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }

  dimension: l_shipinstruct {
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }

  dimension: l_supplycost {
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
  }

  dimension: l_tax {
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: total_sales_price {
    type:  sum
    label: "Total Sale Price"
    description: "Sum of total price"
    sql: ${TABLE}."L_TOTALPRICE" ;;
    value_format_name: usd
  }

  measure: avg_sales_price {
    label: "Average Sale Price"
    description: "Average of total price"
    type:  average
    sql: ${TABLE}."L_TOTALPRICE" ;;
    value_format_name: usd
  }

  measure: cumulatie_total_sales {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales price"
    type:  running_total
    sql: ${total_sales_price} ;;
    value_format_name: usd
  }
}
