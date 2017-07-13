#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# load the necessary libraries
library(shiny)
library(ggplot2)
library(maps)
library(mapdata)

# Define server logic required to draw the map and selected state
shinyServer(function(input, output) {
  
  # load state mapping data
  states <- map_data("state")
  sel_state <- reactive({
                         subset(states, region %in% input$sel_state)
                        })
   
  output$mapPlot <- renderPlot({
    
    # draw the US map with the selected state highlighted in blue
    ggplot(data = states) + 
      geom_polygon(aes(x = long, y = lat, group = group), fill = "grey", color = "black") + 
      coord_fixed(1.3) +
      guides(fill=FALSE) + geom_polygon(data=sel_state(), aes(x = long, y = lat, group = group), fill = "blue")
    
  })
  
})
