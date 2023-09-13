# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script: download_tru
# Descrição: Download Tabelas Recursos e Usos (nível 68) atuais 
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ==== Definir opções download:
# TRU atual: download novamente, se já feito?
if(!exists("redown_tru")) redown_tru = TRUE

# ==== Diretórios:
# Para os arquivos xls do TRU
subdir_tru = "TRU_nivel_68"
dir_tru = file.path(dir_dados, subdir_tru)

# ==== URLs do IBGE:
# URL do diretório para SCN
url_scn = "https://ftp.ibge.gov.br/Contas_Nacionais/Sistema_de_Contas_Nacionais/"
# subURL do diretório SCN para as tabelas de recursos e usos (formato xls)
suburl_tru = "tabelas_xls/tabelas_de_recursos_e_usos/"

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== URL arquivos último ano
if(!url.exists(url_scn)) stop("A URL do SCN informada não existe.")
links_scn  = links_url_ibge(url_scn)
ano_scn = as.numeric(links_scn) %>% 
  suppressWarnings() %>% 
  na.exclude() %>% 
  max()
url_tru = paste0(url_scn, ano_scn, "/", suburl_tru)

# ==== Arquivos TRU
if(!url.exists(url_tru)) stop("A URL para a TRU não existe.")
links_scn  = links_url_ibge(url_tru)
name_tru_zip = grep("nivel_68", links_scn, value = TRUE)
url_tru_zip = paste0(url_tru, name_tru_zip)
# Download na pasta 'dir_dados' e unzip na pasta 'dir_tru'
if(!url.exists(url_tru_zip)) stop("A URL para o arquivo TRU não existe.")
path_tru_zip = file.path(dir_dados, name_tru_zip)
if(file.exists(path_tru_zip)) {
  if(redown_tru){ 
    download.file(url_tru_zip, path_tru_zip, mode = "wb")
    unzip(path_tru_zip, exdir = dir_tru)
    cat("Dowload dos arquivos .xls das TRU nível 68 completo.", fill=T)
  } else cat("Os arquivos .xls das TRU nível 68 atuais já exitem ", 
              "na pasta de download ", "Conforme a opção 'redown_tru', ",
              "o download não será feito novamente.", fill = T)
} 

tab_arqs_tru = list.files(dir_tru) %>% tibble(arquivo = .)




