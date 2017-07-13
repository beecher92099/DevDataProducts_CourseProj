#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# load required libraries
library(shiny)
library(maps)
library(mapdata)
library(ggplot2)

# load state mapping data
states <- map_data("state")

# make the first state choice be NA
state_choices <- c("")

# append the state choices
state_choices <- c(state_choices, unique(states$region))

# remove district of columbia, as its not visible when plotting
remove <- c("district of columbia")
state_choices <- state_choices[! state_choices %in% remove] 


# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("State Identification"),
  
  # Sidebar with drop down selector to choose the state
  # Also includes instructions to use the application
  sidebarLayout(
    sidebarPanel(
      "Select a state to highlight:",
      selectInput("sel_state", "",state_choices, selected = NULL, multiple=FALSE),
      h4("Detailed Instructions"),
      "This application allows you to choose a state to highlight on a map of the contiguous 48 states of the United States. 
      Use the selector above to choose a state to display."
    ),
    
    # Show the map plot
    mainPanel(
       h4("The contiguous 48 states of the United States"),
       plotOutput("mapPlot")
    )
  )
))
