library(tidyverse)
library(here)
library(spotifyr)

# Você precisará pegar um id e segredo para seu código aqui: https://developer.spotify.com/my-applications/#!/applications 
# 
chaves = read_csv(here::here("code/chaves-do-spotify.csv"), 
                  col_types = "cc")

Sys.setenv(SPOTIFY_CLIENT_ID = pull(chaves, client_id))
Sys.setenv(SPOTIFY_CLIENT_SECRET = pull(chaves, client_secret))

# Autentica com a API e pega token para usar os endpoints 
access_token <- get_spotify_access_token()


features = get_playlist_audio_features(username = "Spotify", 
                                       playlist_uris = c("37i9dQZF1DWYYeOy9vs7I5",
                                                         "37i9dQZF1DX6qtBDSfhRrH", 
                                                         "37i9dQZF1DWZLiXDryu4Fe", 
                                                         "37i9dQZF1DWVK7iaoNgUk9", 
                                                         "37i9dQZF1DWVLcZxJO5zyf", 
                                                         "37i9dQZF1DXdSjVZQzv2tl",
                                                         "37i9dQZF1DX7IK76Iw6baR",
                                                         "37i9dQZF1DX6aTaZa0K6VA"))


f = features %>% 
    select_if(~ !is.list(.)) %>% 
    select(-playlist_img, -playlist_owner_name, -playlist_owner_id, 
           -analysis_url, -is_local, -primary_color, -starts_with("added"), 
           -track.episode, -track.track, -track.type, 
           -track.album.total_tracks, -track.album.total_tracks, 
           -track.album.type, -track.album.uri, -track.album.external_urls.spotify,
           -video_thumbnail.url, -starts_with("track.external"), -track.album.href,
           -track.album.album_type) %>% 
    set_names(~ str_replace_all(., fixed(".", TRUE), "_"))    

f %>% 
    write_csv(here::here("data/playlists-spotify.csv"))
