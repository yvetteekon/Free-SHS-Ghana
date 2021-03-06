# install packages
#install.packages("base64enc")
#install.packages("curl")
#install.packages("openssl")

# load libraries
packages <- c("twitteR", "RCurl", "base64enc", "curl", "openssl")
lapply(packages, require, character.only = T)

# set up api credentials
consumer_key <- "xxxx"
consumer_secret <- "xxxx"
access_token <- "xxxx"
access_secret <- "xxxx"

#Sys.setenv(TZ="GMT")

# create handshake
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# extract tweets
tweets <- searchTwitter("#FreeSHS OR #freeshs OR #freeshsishere", 
                        n = 3200, since = "2017-09-12", lang = "en")
head(tweets, 3)

# convert tweets to dataframe
tweetsDF <- twListToDF(tweets)
head(tweetsDF, 3)
tweetsDF$text[1]

# save tweets for reproducibility
save(tweets, file = "tweets.RData")
write.csv(tweetsDF, "20170917_tweetsDF.csv")
