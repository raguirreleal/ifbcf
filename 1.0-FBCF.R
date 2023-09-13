# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script: FBCF
# Descrição: Indicador mensal de FBCF 
# Versão: 0.1.0
# Por: Ricardo Aguirre Leal
# Data: setembro/2023
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== Packages:
library(readxl); library(foreach)
#library(seasonal); library(seasonalview); library(forecast)
library(RCurl); library(rvest); library(zoo)
library(dygraphs); library(xts)   
library(magrittr); library(tidyverse)

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Definições e opções
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== Definir opções download:
# TRU atual: download novamente, se já feito?
redown_tru = TRUE 
# PMI atual: download novamente, se já feito?
redown_pmi = TRUE 

# ==== Definir Diretórios:
# Diretório de trabalho
dir_trab = getwd()
# Diretório para os dados de input
subdir_dados = "02-Inputs" 
dir_dados = file.path(dir_trab, subdir_dados)
# Diretório para as funções
subdir_func = "01-Functions" 
dir_func = file.path(dir_trab, subdir_func)

# ==== Definir opções exibição:
options(tibble.print_max = 100, tibble.print_min = 40)
#options(tibble.print_max = 50)

# ==== Ler funções:
list.files(dir_func, full.names=T) %>% sapply(source)

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Indicador para bens de capital
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ==== Web scraping dos arquivos `.xls` das TRU nível 68:
source("2.0-download_tru.R")
tab_arqs_tru

# ==== Cálculo dos pesos q_j = USO_j / DT_j
source("3.0-pesos_q.R")
m_q

# ==== Web scraping do arquivo da PIM-PF:
source("4.0-download_pim.R")
pim
pim_cc

# ==== Cálculo dos pesos p_j = q_j*VP_j / sum(q_j*VP_j)
source("5.0-pesos_p.R")
compat_cods



