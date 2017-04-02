# This ui.R file is part of the fourth Developing Data Products' assignment

library(shiny)

fluidPage(
  titlePanel("Central limit theorem example"),
  sidebarLayout(
      sidebarPanel(
      sliderInput('rep', "Number of samples:", min = 25, max = 2500, value = 1000, step = 250),
      sliderInput('samplesize', "Sample size:", min = 30, max = 75, value = 30, step = 15),
      radioButtons('dist',
                   'Distribution type:',
                   c('Bernoulli' = 'bern',
                     'Binomial' = 'binom',
                     'Chi-squared' = 'chi')),
        # Display this only if Binomial
        conditionalPanel(condition = "input.dist == 'binom'",
                          selectInput('cant', 'Number of draws with replacement',
                                    c(50,100,200)),
                          selectInput('prob', 'Success probability',
                                     c(.1,.25,.5))),
        # Display this only if Chi-squared
        conditionalPanel(condition = "input.dist == 'chi'",
                         sliderInput('grados','Degrees of freedom', min = 1, max = 12, value = 3)), 
      textOutput("text")
      ),
      mainPanel(textOutput("helpbern"),textOutput("helpbinom"), textOutput("helpchi"), plotOutput("distPlot"))
  )
)