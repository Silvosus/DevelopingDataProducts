# This server.R file is part of the fourth Developing Data Products' assignment

library(shiny)
#library(ggplot2)

function(input, output) {
  output$distPlot <- renderPlot({
      if (input$dist == 'bern') {
        #bernoulli
        set.seed(428)
        p = seq(0 , 1, length = 1000)
        y = p * (1 - p)
        s <- t(replicate(input$rep, sample(y, size = 30)))
        S <- apply(s, 1, sd)
        hist(S, main = strwrap(paste("Histogram of the standard deviation of ",input$rep," samples of Bernoulli distributions"),width = 40),
                xlab = "Standard Deviation")
        abline(v=mean(S),col = 2)
      }
      if (input$dist == 'binom') {
        #binomial
        set.seed(428)
        x <- 0:100
        y <- dbinom(x,size = as.numeric(input$cant), as.numeric(input$prob))
        s <- t(replicate(input$rep, sample(y, size = 30)))
        S <- apply(s, 1, sd)
        hist(S, main = strwrap(paste("Histogram of the standard deviation of ",input$rep," samples of Binomial distributions"),width = 40),
             xlab = "Standard Deviation")
        abline(v=mean(S),col = 2)
      }
      if (input$dist == 'chi') {
        #Chi-squared
        set.seed(428)
        x <- seq(-20,20,by = .4)
        y <- dchisq(x, df = as.numeric(input$grados))
        s <- t(replicate(input$rep, sample(y, size = 30)))
        S <- apply(s, 1, sd)
        hist(S, main = strwrap(paste("Histogram of the standard deviation of ",input$rep," samples of Chi-squared distributions"),width = 40),
             xlab = "Standard Deviation")
        abline(v=mean(S),col = 2)
      }
    })
  output$text1 <- renderText({
    "The central limit theorem establishes that, for the most commonly studied scenarios, when independent random variables are added, their sum tends toward a normal distribution even if the original variables themselves are not normally distributed."
    })
}