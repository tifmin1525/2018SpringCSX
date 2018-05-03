library(httr)

token  = "EAACEdEose0cBAAVNwdkJrbUxjPq0pA3OwsKw3N13VigtdiStGhUavce2yIWu9xBjZBxxyXFpTrNmEvSV8ZA1DfRXLbN47vBMOkaw8IWYw83PKZAeLhPGqWDhGVzp98ZB3ZBZBgG8VGiXShgPZBAqGE7Xyal7pAAX5ktDt9ZBzBu9yZBjSR1hh8dK06ES4xgkdbLcEAwQCLTYQZCgZDZD"
prefex = "https://graph.facebook.com/v2.12/DoctorKoWJ/?fields=posts&access_token="
url    = paste0(prefex, token)
res    = httr::GET(url)
posts  = content(res)

res = POST("https://graph.facebook.com/v2.12/me/feed",
           body=list(message=sprintf("[TEST Posting Message] %s At %s","httr 測試",Sys.time()),
                     access_token=token))
postId = content(res)$id


url = sprintf("https://graph.facebook.com/v2.12/%s?access_token=%s", postId, token)
res = DELETE(url)
content(res)
