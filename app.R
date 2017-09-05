## app.R ##
library(shinydashboard)
library(shiny)
library(qcc)

data("orangejuice")

ui <- dashboardPage(
  dashboardHeader(title = "QC Tool"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    h2("Plot of UCL and LCL"),
  plotOutput("plot")
  )
)

server <- function(input, output) {

  output$plot<-renderPlot({
    orangejuice$d <- orangejuice$D/orangejuice$size
    x<-as.vector(orangejuice$d, mode="numeric")
    qcc(x, type = "xbar.one")
  })
}

shinyApp(ui, server)