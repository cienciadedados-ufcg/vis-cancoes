# Vendo as canções

Este repo tem o código da semente de uma análise características de áudio e de metadados de músicas do catálogo do spotify. Dá por exemplo para checar quais os albuns mais tristes de  Roberto Carlos ou comparar o padrão de popularidade ano-a-ano das músicas de Aviões do Forró, Elis Regina ou Gil Bala. 

## Organização

Tem exemplos bem iniciais de análises possíveis em `reports/`, com dados já coletados e salvos em `data/`. Os atributos de cada faixa (track) são descritos [na documentação da API do Spotify](https://beta.developer.spotify.com/documentation/web-api/reference/object-model/#audio-features-object). 

Os dados são acessados via o pacote [spotifyr](https://github.com/charlie86/spotifyr), um wrapper da API do Spotify. Tem código mostrando como os dados em `data/` foram coletados e como coletar dados de playlists em `code/`. 

## Importante 

Para usar a API você precisará logar e pegar um id e segredo para seu código [na página de desenvolvedores do Spotify](https://developer.spotify.com/my-applications/#!/applications). É rapidinho. Pegue lá e edite `code/chaves-do-spotify.csv`. Mas perceba que esse arquivo (e suas chaves) não devem ir pro github, e por isso estão no `.gitignode`.