library(bigQueryR)
library(bigrquery)
library(googleAuthR)
library(googleLanguageR)

library(mscstexta4r) # R Client for the Microsoft Cognitive Services Text Analytics REST API
library(mscsweblm4r) # R Client for the Microsoft Cognitive Services Web Language Model REST API

docsText <- c(
  "Loved the food, service and atmosphere! We'll definitely be back.",
  "Very good food, reasonable prices, excellent service.",
  "It was a great restaurant.",
  "If steak is what you want, this is the place.",
  "The atmosphere is pretty bad but the food is quite good.",
  "The food is quite good but the atmosphere is pretty bad.",
  "The food wasn't very good.",
  "I'm not sure I would come back to this restaurant.",
  "While the food was good the service was a disappointment.",
  "I was very disappointed with both the service and my entree."
)
docsLanguage <- rep("en", length(docsText))

tryCatch({
  
  # Perform sentiment analysis
  textaSentiment(
    documents = docsText,    # Input sentences or documents
    languages = docsLanguage
    # "en"(English, default)|"es"(Spanish)|"fr"(French)|"pt"(Portuguese)
  )
  
}, error = function(err) {
  
  # Print error
  geterrmessage()
  
})