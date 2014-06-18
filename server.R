library(shiny)
library(maps)
source("helpers.R")
counties <- readRDS("data/counties.rds")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$maps <- renderPlot({
    data <- switch(input$select,
      "White" = counties$white,
      "Black" = counties$black,
      "Hispanic" = counties$hispanic,
      "Asian" = counties$asian)
    color <- switch(input$select,
      "White" = "darkgreen",
      "Black" = "black",
      "Hispanic" = "darkorange",
      "Asian" = "darkviolet")
    legend <- switch(input$select,
       "White" = "% White",
       "Black" = "% Black",
       "Hispanic" = "% Hispanic",
       "Asian" = "% Asian")
    percent_map( var=data, color = color ,legend.title=legend,
       max=input$slider[2], min=input$slider[1])
  })
})