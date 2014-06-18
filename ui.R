library(shiny)

shinyUI(fluidPage(
  titlePanel("censusVis"),
  sidebarLayout(
  sidebarPanel(
    p("Creat demographic maps with information from the",
      "2010 US Census."),
    selectInput("select",label=h3("Choose a variable to display"),
      choices=list("White","Black","Hispanic","Asian"),
      selected= "White"),
    sliderInput("slider",label=h3("范围"),
      min=0,max=100,value=c(0,100))
  ),
  mainPanel(
    plotOutput("maps")
    )
  )
  
))