
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("mtcars Dataset"),

  # Sidebar with a slider input for number of cylinders
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c( "mtcars")),
      
      selectInput("cyl", "Number of cylinders:", choices=c("4","6","8","All") )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("distPlot")), 
        tabPanel("Help", htmlOutput("Help"))
        
      )
      
      
    )
  )
))
