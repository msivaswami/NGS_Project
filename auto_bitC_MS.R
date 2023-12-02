library(shiny)
library(shinythemes)

# Load the function definition from the source file
source("C:/Users/Muthu/Documents/NGS_Project/calculateSize.R") 
strings_to_process <- c("GATTACA",
                        "ATTACATTAC",
                        "ATATATATATA",
                        "ATATATATAT",
                        "AATAATAATAAT",
                        "AAAATAAATAAA",
                        "ATATACACACA",
                        "ATATGTATACAT")

# Define the UI for the calculator
ui <- fluidPage(
  theme = shinytheme("flatly"),  # Applying a theme for a cleaner look
  titlePanel("Calculating the String Size"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("input_string", label = "Select a string:", choices = strings_to_process)
    ),
    
    mainPanel(
      verbatimTextOutput("output_size")
    )
  )
)

# Define server to handle the code to check the size of the selected string
server <- function(input, output) {
  output$output_size <- renderText({
    input_string <- input$input_string
    size_in_bytes <- calculateSize(input_string)
    return(paste("Size in bytes: ", size_in_bytes))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
