library(shiny)
library(shinythemes)

# Defining the UI for the calculator
ui <- fluidPage(
  theme = shinytheme("flatly"),  # Applying a theme for a cleaner look
  titlePanel("Calculating the String Size"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("input_string", label = "Enter a string:")
    ),
    
    mainPanel(
      verbatimTextOutput("output_size")
    )
  )
)

# Define server to handle the code to check the size of the string
server <- function(input, output) {
  output$output_size <- renderText({
    input_string <- input$input_string
    size_in_bytes <- nchar(input_string, type = "bytes")
    return(paste("Size in bytes: ", size_in_bytes))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
