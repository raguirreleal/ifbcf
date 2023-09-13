# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# FUNÇÃO: links_url_ibge
# Descrição: Obtém os link constantes na página da URL
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


links_url_ibge = function(x_url) {
  require(rvest)
  links = x_url %>% 
    read_html() %>% 
    html_nodes(xpath = '//td/a') %>% html_attr("href") %>% 
    gsub("/", "", .)
  return(links)
}

