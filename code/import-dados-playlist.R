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

# Acessa as músicas de uma playlist específica
playlist = get_user_playlists("zananeno") %>% 
    filter(playlist_name == "30 dias em 30 músicas")

tracks = get_playlist_tracks(p)

tracks %>% 
    write_csv(here::here("data/playlist-30-30.csv"))