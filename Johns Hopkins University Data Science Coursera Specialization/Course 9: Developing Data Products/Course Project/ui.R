#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(plotly)

ui = fluidPage(
  navbarPage(collapsible = TRUE, "Global Happiness Trends", id="nav",
             
             tabPanel("About",
                      mainPanel(
                          includeMarkdown("About.Rmd"))
             ),
             
             tabPanel("World Happiness",
                      span(h2("Yearly average happiness rates"), style="color:Darkblue"),
                      span(h2("around the world from 2005 to 2018"), style = "color:Darkblue"), 
                      sidebarLayout(
                          sidebarPanel(
                              helpText("Cantrill Ladder happiness ratings are reported on a 0 (not happy) to 10 (very happy) scale. Country happiness scores are averaged over their respective populations."),
                        
                          selectInput("spec_country", h5("Compare global happiness against specified country's happiness"),
                                      choices = unique(data_hist$Entity)) 
                          
                          ),
                      
                      mainPanel(
                        strong(h3('Histograms of average global happiness from 2005 to 2018')),
                        p(''),
                        p(''),
                        p(''),
                        plotOutput('bar'),
                        p(''),
                        p(''),
                        p(''),
                        strong('World map of happiness averaged over 2005 to 2018'),
                        div(plotlyOutput("fig"))
                        )
                      
                      )
                      
             ),
             
             tabPanel("Trend Plots",
                      span(h2("Plot the average population happiness"), style="color:Darkblue"),
                      span(h2("from 2005 to 2018 according to"), style = "color:Darkblue"),
                      span(h2("a specified predictor variable"), style = "color:Darkblue"),
                      sidebarLayout(
                        sidebarPanel(
                            helpText("Choose from the following scatterplot parameters"),
                          
                          selectInput("country", "Select a country:",   
                                      choices = unique(data$Entity)),
                          selectInput('predictor', 'Select a predictor variable:', 
                                    choices = names(data[, 5:8])),
                        
                        strong("Variable Descriptions:"),
                        tags$ul(
                          tags$li('Happiness: Cantrill Ladder ratings are reported on a 0 (not happy) to 10 (very happy) scale. Country happiness scores are averaged over their respective populations.'),
                          tags$li('Internet: Percentage of a given countrys population using the Internet within the last 3 months'),
                          tags$li('Education: Average years of total schooling across all education levels for a given countrys population age 25+ years'),
                          tags$li('Fertility: Expected number of children born to a woman from a given country'),
                          tags$li('Gender Ratio: Percentage of a given countrys population that is of female sex at birth'),
                        )
                      ),
                      
                      mainPanel(plotOutput("plot"))
                      
                      )
            )
  
        )
)
