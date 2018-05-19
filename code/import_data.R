# install.packages("spotifyr")

library(tidyverse)
library(here)
library(spotifyr)

# Você precisará pegar um id e segredo para seu código aqui: https://developer.spotify.com/my-applications/#!/applications 
# 
chaves = read_csv(here::here("code/chaves-do-spotify.csv"), 
                  col_types = "cc")

Sys.setenv(SPOTIFY_CLIENT_ID = pull(chaves, client_id))
Sys.setenv(SPOTIFY_CLIENT_SECRET = pull(chaves, client_secret))

access_token <- get_spotify_access_token()

#
# PRECISA SER RODADO INTERATIVO, linha a linha: 
#

lua <- get_artist_audio_features('luiz gonzaga')
lua %>% 
    write_csv(here("data/luiz_gonzaga.csv"))

lua = lua %>% 
    mutate(artist = "Luiz Gonzaga")


jackson <- get_artist_audio_features('jackson do pandeiro')
jackson %>% 
    write_csv(here("data/jackson.csv"))

jackson %>% 
    mutate(artist = "Jackson do Pandeiro") %>% 
    bind_rows(lua) %>% 
    write_csv(here("data/forro_do_gogó_ao_mocotó.csv"))


c1 <- get_artist_audio_features('Caetano Veloso') %>% 
    mutate(artist = "Caetano Veloso")
c2 <- get_artist_audio_features('Gilberto Gil') %>% 
    mutate(artist = "Gilberto Gil")
c3 <- get_artist_audio_features('Gal Costa') %>% 
    mutate(artist = "Gal Costa")
c4 <- get_artist_audio_features('Maria Bethânia') %>% 
    mutate(artist = "Maria Bethânia")
c5 <- get_artist_audio_features('Tom Zé') %>% 
    mutate(artist = "Tom Zé")

bind_rows(c1, c2, c3, c4, c5) %>% 
    write_csv(here("data/tropicalistas.csv"))

o_rei <- get_artist_audio_features('Roberto Carlos') %>% 
    mutate(artist = "Roberto Carlos")
o_rei %>% 
    write_csv(here("data/o_rei.csv"))

nazareno = get_user_audio_features("zananeno")
nazareno %>% 
    write_csv(here("data/playlists_nazareno.csv"))

