# Load necessary libraries
library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(WWEAnalytics)

# Load the data from the WWEAnalytics package
# This assumes that `wrestling_data_clean` is included as data in the WWEAnalytics package
data("wrestling_data_clean")

# Define the UI for the Shiny app
# This UI consists of a dashboard with three main tabs:
# 1. Top Wrestlers by Reign Length
# 2. Average Reign by Era
# 3. Data Table
ui <- dashboardPage(
  skin = "blue",  # Sets the theme color to blue
  dashboardHeader(title = "WWE Championship Reign Analysis"),

  # Sidebar layout for user inputs
  dashboardSidebar(
    sidebarMenu(
      menuItem("Top Wrestlers by Reign Length", tabName = "top_wrestlers", icon = icon("trophy")),
      menuItem("Average Reign by Era", tabName = "average_reign", icon = icon("history")),
      menuItem("Data Table", tabName = "data_table", icon = icon("table"))
    ),

    # Filters for user interactivity
    sliderInput("top_n", "Select Number of Top Wrestlers to View:", min = 5, max = 20, value = 10),
    selectInput("gender_select", "Select Gender to View:", choices = c("All", "Male", "Female"), selected = "All"),
    selectInput("era_select", "Select Era to View:", choices = c("All", "Pre-1980", "1980s-1990s", "2000s and later"), selected = "All")
  ),

  # Main body of the dashboard with tabs for different analyses
  dashboardBody(
    tabItems(
      # Tab 1: Plot for Top Wrestlers by Reign Length
      tabItem(tabName = "top_wrestlers",
              fluidRow(
                box(width = 12, title = "Top Wrestlers by Average Reign Length", solidHeader = TRUE, status = "primary",
                    plotOutput("top_wrestlers_plot"),
                    p("This chart displays the top wrestlers based on their average reign length, allowing you to observe which wrestlers had the longest reigns and how this changes with the gender and era filters.")
                )
              )
      ),

      # Tab 2: Plot for Average Reign by Era
      tabItem(tabName = "average_reign",
              fluidRow(
                box(width = 12, title = "Average Reign Length by Era", solidHeader = TRUE, status = "info",
                    plotOutput("average_reign_by_era_plot"),
                    p("This chart shows the average reign length across different WWE eras, highlighting changes in booking strategies over time. Use the filters to focus on specific eras or genders.")
                )
              )
      ),

      # Tab 3: Data Table for Wrestling Data
      tabItem(tabName = "data_table",
              fluidRow(
                box(width = 12, title = "Wrestling Data Table", solidHeader = TRUE, status = "warning",
                    DT::dataTableOutput("wrestling_data_table"),
                    p("This table provides the full WWE Championship data, filtered by your selections. You can sort and explore reign lengths, eras, and wrestler details.")
                )
              )
      )
    )
  )
)

# Define the server logic for the Shiny app
server <- function(input, output) {

  # Reactive function to filter the data based on selected gender and era
  filtered_data <- reactive({
    data <- wrestling_data_clean
    if (input$gender_select != "All") {
      data <- data %>% filter(gender == input$gender_select)
    }
    if (input$era_select != "All") {
      data <- data %>% filter(era == input$era_select)
    }
    data
  })

  # Reactive function to get top wrestlers by reign length based on user input
  top_wrestlers_filtered <- reactive({
    filtered_data() %>%
      group_by(name) %>%
      summarise(avg_reign_length = mean(days, na.rm = TRUE)) %>%
      arrange(desc(avg_reign_length)) %>%
      head(input$top_n)
  })

  # Reactive function for calculating average reign length by era
  average_reign_by_era <- reactive({
    filtered_data() %>%
      group_by(era) %>%
      summarise(avg_reign_length = mean(days, na.rm = TRUE))
  })

  # Render Plot: Top Wrestlers by Reign Length
  output$top_wrestlers_plot <- renderPlot({
    ggplot(top_wrestlers_filtered(), aes(x = reorder(name, avg_reign_length), y = avg_reign_length)) +
      geom_col(fill = "steelblue") +
      coord_flip() +
      labs(title = "Top Wrestlers by Average Reign Length",
           x = "Wrestler",
           y = "Average Reign Length (days)") +
      theme_minimal()
  })

  # Render Plot: Average Reign by Era
  output$average_reign_by_era_plot <- renderPlot({
    ggplot(average_reign_by_era(), aes(x = era, y = avg_reign_length, fill = era)) +
      geom_col(show.legend = FALSE) +
      labs(title = "Average Reign Length by Era",
           x = "Era",
           y = "Average Reign Length (days)") +
      theme_minimal()
  })

  # Render Data Table: Filtered Wrestling Data
  output$wrestling_data_table <- DT::renderDataTable({
    DT::datatable(filtered_data())
  })
}

# Run the Shiny application
# This will create an interactive dashboard for exploring WWE Championship reigns
shinyApp(ui = ui, server = server)

