library(shiny)

shinyUI(
  ui<-fluidPage(
    titlePanel("Nevarnost cest evropskih držav"),
    sliderInput(inputId= "leto",
                label="Izberite leto",
                value=2004, min=2004, max=2013),
    plotOutput(outputId="graf")
))



























#titlePanel("Slovenske občine"),

#tabsetPanel(
 # tabPanel("Velikost družine",
  #         DT::dataTableOutput("druzine")),
  
#  tabPanel("Število naselij",
 #          sidebarPanel(
  #           uiOutput("pokrajine")
  #         ),
   #        mainPanel(plotOutput("naselja"))),
  
#  tabPanel("Zemljevid",
 #          plotOutput("zemljevid")),
  
  #tabPanel("Število naselij in površina",
   #        plotOutput("povrsina"))
#)
