library(shiny)
library(shinythemes)
library(microbenchmark)

# Define UI
ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("String Size Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("input_string", label = "Enter a string:")
    ),
    
    mainPanel(
      verbatimTextOutput("output_size")
    )
  )
)

# Define server
server <- function(input, output) {
  output$output_size <- renderText({
    # Run the microbenchmark inside the render function
    benchmark_result <- microbenchmark::microbenchmark(
      {
        input_string <- input$input_string
        size_in_bytes <- nchar(input_string, type = "bytes")
        result <- paste("Size in bytes: ", size_in_bytes)
      },
      times = 10
    )
    
    # Print the benchmark results
    print(benchmark_result)
    
    # Return the result
    result
  })
}

# Run the application
shinyApp(ui = ui, server = server)
