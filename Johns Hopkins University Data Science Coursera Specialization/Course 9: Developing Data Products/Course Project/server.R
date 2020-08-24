#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(plotly)
library(ggplot2)
library(gridExtra)

server = function(input, output) {
    
    #world happiness tab

  #specified country bar chart inputs
  df <- reactive({
    new <- subset(data_hist, Entity == input$spec_country)
    return(new)
  })
  
  barX <- reactive({
    new <- subset(data_hist, Entity == input$spec_country)
    new[, 4]
  })
  
  barY <- reactive({
    new <- subset(data_hist, Entity == input$spec_country)
    new[, 5]
  })
  
      #building bar chart output
      output$bar <- renderPlot({
      p1 <- ggplot(data, aes(x=Year, y=(Happiness)/100)) +
        geom_col(stat="identity", fill = 'Darkblue') +
        ggtitle('Aggregated Global Happiness Rate by Year') +
        theme_minimal()+
        xlab('Year') +
        ylab('Average Global Happiness')
      
      p2 <- ggplot(df(), aes(x=barX(), y=barY())) +
        geom_col(stat="identity", fill = 'Lightblue') +
        ggtitle('Specified Country Happiness Rate by Year') +
        theme_minimal() +
        xlab('Year') +
        ylab('Average Country Happiness')
      
      grid.arrange(p1, p2, ncol=2)
    
    })
    
    #choropleth map
    output$fig <- renderPlotly({
      plot_ly(data, type='choropleth', locations= data$Code, z=data$Happiness, 
                      text=data$Entity, colorscale="YlGnBu")
    })
    
    #trend plot tab
    df <- reactive({
      new <- subset(data, Entity == input$country)
      return(new)
    })
    
    scatX <- reactive({
      new <- subset(data, Entity == input$country)
      new[, input$predictor]
    })
    
    happy <- reactive({
      new <- subset(data, Entity == input$country)
      new[, 4]
    })
    
    newyear <- reactive({
      new <- subset(data, Entity == input$country)
      new[, 3]
    })
    
    # Make the scatter plot
    output$plot <- renderPlot({
      p <- ggplot(data = df(), aes(x = scatX(), y = happy(), color = newyear()))+
        geom_point() +
        xlab(input$predictor) + ylab('Happiness')+
        labs(colour = newyear()) +
        geom_point(size=9) +
        ggtitle(paste('Scatter plot of', input$predictor, 'vs Happiness')) +
        theme(plot.title = element_text(hjust = 0.5))
      print(p)
    })
    
}
    
    
    
    
    