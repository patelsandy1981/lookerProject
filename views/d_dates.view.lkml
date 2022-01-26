view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES"  ;;
  label: "Dates"


  dimension_group: date_val {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
    label: "Date"
  }

  dimension: datekey {
    type: number
    primary_key: yes
    sql: ${TABLE}."DATEKEY" ;;
    hidden: yes
  }

  dimension: day_of_week {
    label: "Day of Week"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Dayname of Week"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label: "Month"
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {
    label: "Month Number"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "Year"
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
