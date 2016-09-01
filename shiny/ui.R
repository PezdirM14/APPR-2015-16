library(shiny)

shinyUI(
  ui<-fluidPage(
    titlePanel("Nevarnost cest evropskih držav"),"Pred vami sta 2 grafa in 2 možnosti izbire. V prvem grafu boste z izbiro leta na grafu prikazali količnike nevarnosti cest za vse države. Količnik je dobljen z deljenjem števila umrlih na cestah v določenem letu, določene države, s številom prebivalcev države ter pomnožen s 100000, da dobimo primerljive podatke. V drugem grafu lahko izbirate države, katerih količnik nevarnosti cest želite izvedeti. Višji kot je količnik več ljudi umre v prometnih nesrečah na prebivalca v posameznih državah",
    sliderInput(inputId= "leto",
                label="Izberite leto",
                value=2004, min=2004, max=2013),
    selectInput(inputId="Drzava",label="Izberite države",choices=c("Austria","Belgium","Bulgaria","Croatia","Czech Republic","Denmark","Estonia","Finland","France","Germany","Greece","Hungary","Iceland","Ireland","Italy","Latvia","Liechtenstein","Lithuania","Luxembourg","Netherlands","Norway","Poland","Portugal","Romania","Slovakia","Slovenia","Spain","Sweden","Switzerland","United Kingdom"),
                multiple = TRUE,selected = c("Slovenia")),
    plotOutput(outputId="graf"), plotOutput(outputId="graf2")
    
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
