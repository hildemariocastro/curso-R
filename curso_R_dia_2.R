library(tidyverse)
library(readxl)
library(dados)
### importando dados ####
read.csv("estudantes.csv")
view(estudantes)
read_xlsx("estudantes.xlsx",
           col_names = c("estudante_id","nome_completo",
                         "comida_favorita","refeicao","idade"),
          skip =1,
          col_types = c("numeric","text",
                        "text", "text",
                        "text"),
          na = c("","N/A"))## pular a primeira linha da tabela e transformar tipos de dados


#### pivotar dados - dados largos para dados longos####
df<- tribble(
  ~id,~ps1,~ps2,
  "A",100, 120,
  "B", 140 , 115,
  "C", 120, 125)

df_longo<-df |> pivot_longer(ps1:ps2, names_to = "medicao",
                   values_to  = "valores")

#####
billboard |> pivot_longer(wk1:wk76,
                          names_to = "semana",
                          values_to = "posicao")

billboard|>
  pivot_longer(starts_with("wk"),
               names_to = "week_semana",
               values_to = "rank_posicao")


#### juntar tabelas #####

voo2<-voos|> 
  select(ano,data_hora, 
         origem, destino, 
         cauda, companhia_aerea)

voo2_comp_aerias<-voo2 |>
  left_join(companhias_aereas)

voo2|> 
  right_join(clima)

voo2 |> 
  full_join(clima) |>
  view()

#### filtros ####
 voos |>
  filter(is.na(cauda)) #### selecionar o que tem NA

voos|>
  filter((!is.na(cauda))) ### selecionar tudo que nao tem NA

 voos|>
   filter(origem =="JFK" & destino == "MIA")

 voos|>
   filter(atraso_saida >= 120)
 
 voos |> 
   distinct(origem,destino) ### dados unicos
 
 voos |>
   distinct(destino) #### dados unicos

 voos |>
   arrange((atraso_saida)) #### orgamizar dados ordenados
 install.packages("writexl")
 library(writexl)
 
 
 #### exportar dados para exel ####
 write_xlsx(voo2_comp_aerias , path = "voo2_comp_aeria.xlsx")
 