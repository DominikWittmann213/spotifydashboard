library(httr)

#replace this with yours
clientID <- '58de1eb913b44d87a3cfb756120949ea'
secret <- '###'

response <- POST(
  'https://accounts.spotify.com/api/token',
  accept_json(),
  authenticate(clientID, secret),
  body = list(grant_type = 'client_credentials'),
  encode = 'form',
  verbose()
)
mytoken <- content(response)$access_token
HeaderValue <- paste0('Bearer ', mytoken)

URL <- "https://api.spotify.com/v1/me/player/"
response2 <- GET(url = URL, add_headers(Authorization = HeaderValue))
data <- content(response2)




artistID = "06HL4z0CvFAxyc27GXpf02"
URI = paste0('https://api.spotify.com/v1/artists/', artistID)
response2 = GET(url = URI, add_headers(Authorization = HeaderValue))
Artist = content(response2)
