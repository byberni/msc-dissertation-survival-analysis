# SURVIVAL ANALYSIS AFTER PERMANENT PACEMAKER IMPLANTATION FOR PATIENTS WITH CARDIOVASCULAR DISEASES



**Keywords:** survival analysis, cardiovascular diseases, Kaplan Meier, Cox model.


### I. Motivation
One of the modern and effective methods of treating cardiovascular diseases is the installation of a pacemaker. However, for cardiologists, the question arises in assessing the average survival rate of patients after an appropriate operation to install a stimulator, in our case, in the presence of sick sinus syndrome (SSNS) in patients.

### II. Problem
This work provided survival analysis for patients with cardiovascular diseases after permanent pacemaker implantation in a four-year perspective. The Cox model showed which predictor has an influence on mortality.

### III. Key Results 
As part of this work, the following tasks were completed:
1. A methodology has been developed to estimate the survival function taking into account the influence of control variables.
2. An experimental design has been developed for statistical assessments of survival functions for patients with SSNS.
3. Signs that influence the risk of death in the long term have been selected.
4. A survival model was developed taking into account the selected characteristics.
5. Information support has been developed for assessing death risk multipliers.




### IV. Content
Based on the constructed Cox proportional hazards model, the following conclusions were made:
* age increases the risk of death by an average of 1.06 times;
* myocardial infarction increases the risk of death by an average of 2.92 times (taking into account a confidence level of 95%, confidence interval - from 1.62 to 5.24 times);
* the presence of diabetes mellitus increases the risk of death by 3.3 times, and taking into account the 95% confidence level, the confidence interval is from 1.67 to 6.51 times;
* stimulation mode A reduces the risk of death by an average of 0.44 times;
* third type of SSSU - 2.7 times (taking into account a confidence probability of 95%, confidence interval - from 1.56 to 4.67 times).


<p align="center">
  <img src="https://github.com/byberni/msc-dissertation-survival-analysis/assets/143712969/a8af0de4-3777-45aa-ad0f-5264ef266df8" />
</p>


<p align="center"> Fig. 1. GUI of R App for Medical Researchers</p>


[Research Article (in Russian).](https://github.com/byberni/msc-dissertation-survival-analysis/blob/main/Research%20Article.pdf)



# V. How to use
Run the code belove on your R Studio.

```R
library(shiny)
# Define UI for dataset viewer app ----
ui <- fluidPage(
 
 # App title ----
 titlePanel("Survival analysis"),
 
 # Sidebar layout with a input and output definitions ----
 sidebarLayout(
 
 # Sidebar panel for inputs ----
 sidebarPanel(
 h2("Input data"),
 
 # Input: Numeric entry for age ----
 numericInput(inputId = "age", label = "Age:", value = 40),
 # Input: Button for SD ----
 checkboxInput("SD", label = "Diabetes", value = TRUE),
 # Input: Button for IM ----
 checkboxInput("IM", label = "Myocardial infarction:", value = TRUE),
 # Input: Button for SSU 3 ----
 checkboxInput("SSU3", label = "Type of SSU #3:", value = TRUE),
 # Input: Button for Regime A ----
 checkboxInput("RegimeA", label = "Stimulation Regime A:", value = TRUE)),
 
 # Main panel for displaying outputs ----
 mainPanel(h2("Result"),
 # Output: Text the risk of death ----
 textOutput("text"),
h2("Plot"),
 # Output: Plot of the risk function
 plotOutput("plot")
 )
 )
)
# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
 dataInput <- reactive({seq(input$age, len = 65, by = 1)
 })
 
 # Show the risk of death ----
 output$text <- renderText({
 paste("Risk of death probability increases ", exp(0.063*input$age + 1.19*input$SD + 
1.07*input$IM + 0.99*input$SSU3 - 0.81*input$RegimeA), " times")
 })
 output$plot <- renderPlot({
 x <- dataInput()
 plot(x, exp(0.063*x + 1.19*input$SD + 1.07*input$IM + 0.99*input$SSU3 -
0.81*input$RegimeA), type = "o", col = "red",
 xlab = "Age", ylab = "Risk of death", frame.plot = TRUE,
 main = "The graph of the dynamics of the risk of death depending on the age")
 }) 
}
# Create Shiny app ----
shinyApp(ui = ui, server = server)

```
