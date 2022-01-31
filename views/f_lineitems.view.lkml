view: f_lineitems {

  sql_table_name: "DATA_MART"."F_LINEITEMS" ;;
  label: "Orders"

  dimension: l_availqty {
    label: "Available Qty"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    label: "Clerk"
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
    label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
    hidden: yes
  }

  dimension: l_extendedprice {
    label: "Extended Price"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
    hidden: yes
  }

  dimension: l_linenumber {
    label: "Line number"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    hidden: yes
  }

  dimension: l_orderkey {
    label: "Order Number"
    type: string
    sql: ${TABLE}."L_ORDERKEY" ;;
    primary_key: yes

  }

  dimension: l_orderpriority {
    label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
    hidden: yes
  }

  dimension: l_quantity {
    label: "Order Qty"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
    hidden: yes
  }

  dimension: l_receiptdatekey {
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
    hidden: yes
  }

  dimension: l_returnflag {
    label: "Return flag"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
    hidden: yes
  }

  dimension: l_shipinstruct {
    label: "Shipping Instruction"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    label: "Shipping Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    label: "Shipping Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
    hidden: yes
  }

  dimension: l_supplycost {
    label: "Supply cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    hidden: yes
  }

  dimension: l_tax {
    label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
  }

  dimension: l_totalprice {
    label: "Total price"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
    hidden: yes
  }

  dimension: is_returned {
    type: yesno
    sql: ${l_returnflag} = 'R' ;;
  }

  dimension: is_completed {
    type: yesno
    sql: ${l_orderstatus} = 'F' ;;
  }

  dimension: is_shipped_by_air {
    type: yesno
    sql: ${l_shipmode} in ('AIR','REG AIR') ;;
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

  measure: total_number_of_items_sold {
    type:  sum
    label: "Total number of Items sold"
    description: "Quantity ordered"
    sql: ${TABLE}."l_quantity" ;;
    value_format_name: decimal_0
  }

  measure: Avg_spend_per_customer {
    label:"Average Spend per Customer"
    description: "Average Spend per Customer"
    sql: ${total_sales_price}/${d_customer.count} ;;
    value_format_name: usd
  }

  measure: Total_Cost {
    type: sum
    label:"Total Cost"
    description: "Total Cost"
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    value_format_name: usd
  }

  measure: Total_Sale_Price_Shipped_By_Air {
    label:"Total Sale Price Shipped by Air"
    type: sum
    description: "Total sales of items shipped by air"
    filters: [is_shipped_by_air: "Yes"]
    value_format_name: usd
  }

  measure: Total_Russia_Sales {
    label:"Total Russia Sales"
    type: sum
    description: "Total sales to customers in Russia"
    sql: ${TABLE}."L_TOTALPRICE" ;;
    filters: [d_customer.c_nation: "RUSSIA"]
    value_format_name: usd
  }

  measure: number_of_items_returned {
    label: "Number of items returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    sql: ${l_quantity} ;;
    filters: [is_returned: "yes"]
    # drill_fields: [detail*]
  }

}
