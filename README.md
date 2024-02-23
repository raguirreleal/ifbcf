# Índice mensal de FBCF

Construção do indicador baseado no Texto para Discussão 2101, de jun/2015, do IPEA: Indicadores de Consumo Aparente 
de Bens Industriais: Metodologia e Resultados (Carvalho; Ribeiro).

O cálculo do indicador de formação bruta de capital fixo (FBCF) se baseia no Consumo Aparente (CA) de bens de 
capital. “Os dados mensais são obtidos a partir das séries de quantum de exportação e de importação e das séries 
de produção física da indústria.”

Web scraping de dados nos repositórios do IBGE.

Três etapas para construção do indicador, seguindo a referência:
1. Criar indicador de produção física mensal para FBCF;
   - Criar indicador para bens de capial, a partir do PIM-PF;
   - Obter o índice de produção física de insumos para construção civil, a partir do PIM-PF;
   - Criar indicador de produção física mensal para FBCF, a partir de uma média ponderada dos outros dois;
3. Calcular os pesos anuais da i) produção, ii) importação e iii) exportação no CA da FBCF;
4. Criar o índice mensal de FBCF, usando o indicador de produção física e os pesos dos componentes do CA.

***

## VERSÕES
1. Versão 0.1.0 (13 de setembro de 2023):
   - Código em R para as etapas 1.1 (parcial) e 1.2
   - Realizado já todos os web scraping dos dados necessários

## CÓDIGIO
- Código em R e RMarkdown (html e pdf)
- Necessário instalação de pacotes R (ver quais na seção 'Packages' dos scripts '1.0-FBCF.R' e '1.1-FBCF_html').
- Para RMarkdown pdf, necessário instalação MikTex (ou LaTex substituto) e pacotes adicionais (ver quais no 
  cabeçalho do script '1.2-FBCF_pdf'.
- Pasta com funções R no diretório '..\01-Functions'.
- Pasta para download dos dados no diretório '..\02-Inputs'.

## EXECUÇÃO 
- Executar o arquivo '1.0-FBCF.R' do diretório raiz.
  Este código vai chamar os demais scripts (2.0, 3.0, ...) via 'source()'.
- Para criar o markdown em html, executar o script '1.1-FBCF_html.RMD", que também vai chamar os demais scripts 
  (2.0, 3.0, ...) via 'source()'. O arquivo será salvo como '1.1-FBCF_html.html".
- Para criar o markdown em pdf, executar o script '1.2-FBCF_pdf.pdf", que também vai chamar os demais scripts 
  (2.0, 3.0, ...) via 'source()'. O arquivo será salvo como '1.2-FBCF_pdf.pdf" no diretório base.





