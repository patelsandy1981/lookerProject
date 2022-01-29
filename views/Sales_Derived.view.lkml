
  # # If necessary, uncomment the line below to include explore_source.

 # include: "Looker_intesive7_sandip_patel.model.lkml"

  view: sales_derived {
    derived_table: {
      explore_source: f_lineitems {
        column: l_orderkey {}
        column: total_sales_price {}
        column: avg_sales_price {}
      }
    }
    dimension: l_orderkey {
      label: "Lineitems Order Number"
    }
    dimension: total_sales_price {
      label: "Lineitems Total Sale Price"
      description: "Sum of total price"
      value_format: "$#,##0.00"
      type: number
    }
    dimension: avg_sales_price {
      label: "Lineitems Average Sale Price"
      description: "Average of total price"
      value_format: "$#,##0.00"
      type: number
    }
  }
