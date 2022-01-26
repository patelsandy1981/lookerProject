view: d_part {
  sql_table_name: "DATA_MART"."D_PART";;
  label: "Parts"



  dimension: p_brand {
    type: string
    sql: ${TABLE}."P_BRAND" ;;
  }

  dimension: p_mfgr {
    type: string
    sql: ${TABLE}."P_MFGR" ;;
  }

  dimension: p_name {
    label: "Part"
    type: string
    sql: ${TABLE}."P_NAME" ;;
  }

  dimension: p_partkey {
    type: number
    primary_key: yes
    sql: ${TABLE}."P_PARTKEY" ;;
    hidden: yes
  }

  dimension: p_size {
    type: number
    sql: ${TABLE}."P_SIZE" ;;
  }

  dimension: p_type {
    type: string
    sql: ${TABLE}."P_TYPE" ;;
  }

  measure: count {
    label: "No. of Parts"
    type: count
    drill_fields: [p_name]
  }
}
