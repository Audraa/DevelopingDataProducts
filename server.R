
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate plot based on input$cyc from ui.R
  
    if (input$cyl=="All"){
      n<-mtcars}
    else{
    n<-subset(mtcars,(mtcars$cyl == input$cyl))
    }
    title<-paste("Plot of mpg vs disp for Number of cylinders(" ,input$cyl ,")")
    # draw plot
    plot(n$mpg,n$disp, main=title,col=n$cyl)

  })
  
  output$Help <- renderUI({ 
  
    helpText(
h3("Help"),
br(""),
    ("The application uses the mtcars dataset that comes with R."),
br(""),
h4("Variables in dataset"),
code(print(names(mtcars))),
("  For this presentation we look at 3 variables"),
br(""),
tags$ul(
  tags$li("mpg  Miles/(US) gallon"), 
  tags$li("cyl  Number of cylinders"), 
  tags$li("Displacement (cu.in.)")
),
br(""),
" In the client interface you can select the dataset to use. For this application there is only one dataset." ,
br(""),
("Future development will have more datasources in the drop down list."),
br(""),
("The code that handle this can be found in ui.R"),
br(""),
h4("Selecting number of cylinders"),
  (" You can then select the the number of cylinders you wish to plot from the 
 drop down list of the side panel"), 
br(""),
("The options available are:"),
tags$ul(
  tags$li("4"), 
  tags$li("6"), 
  tags$li("8"),
  tags$li("All")
),
 ("This is used for an argument on the server serverside to draw the plot."),
br(""),
 ("The plot is drawn for mpg vs disp " )
    )
 
  
})


})
