return <- gl_speech(test_audio, languageCode = "en-GB")

return$transcript
# A tibble: 1 x 2
#                                                                                                         transcript confidence
#                                                                                                              <chr>      <chr>
#1 to administer medicine to animals is frequently a very difficult matter and yet sometimes it's necessary to do so  0.9711006

return$timings
#   startTime endTime       word
#1         0s  0.100s         to
#2     0.100s  0.700s administer
#3     0.700s  0.700s   medicine
#4     0.700s  1.200s         to
# etc...

library(googleLanguageR)
## get the sample source file
test_audio <- system.file("woman1_wb.wav", package = "googleLanguageR")

## its not perfect but...:)
gl_speech(test_audio)$transcript

## get alternative transcriptions
gl_speech(test_audio, maxAlternatives = 2L)$transcript

gl_speech(test_audio, languageCode = "en-GB")$transcript

## help it out with context for "frequently"
gl_speech(test_audio, 
            languageCode = "en-GB", 
            speechContexts = list(phrases = list("is frequently a very difficult")))$transcript

str(result$timings)
#'data.frame':  152 obs. of  3 variables:
# $ startTime: chr  "0s" "0.100s" "0.500s" "0.700s" ...
# $ endTime  : chr  "0.100s" "0.500s" "0.700s" "0.900s" ...
# $ word     : chr  "a" "Dream" "Within" "A" ...

result$timings
#     startTime endTime       word
#1          0s  0.100s          a
#2      0.100s  0.500s      Dream
#3      0.500s  0.700s     Within
#4      0.700s  0.900s          A
#5      0.900s      1s      Dream

## Use a custom configuration
my_config <- list(encoding = "LINEAR16",
                  diarizationConfig = list(
                    enableSpeakerDiarization = TRUE,
                    minSpeakerCount = 2,
                    maxSpeakCount = 3
                  ))

# languageCode is required, so will be added if not in your custom config
gl_speech(my_audio, languageCode = "en-US", customConfig = my_config)


async <- gl_speech(test_audio, asynch = TRUE)
async
## Send to gl_speech_op() for status
## 4625920921526393240

result <- gl_speech_op(async)

print(result)