PCA - Exemplo prático - Dataset - USArrests

library(factoextra)
library(factoMineR)

# carregar o dataset:
df<- USArrests
 USArrests
               Murder Assault UrbanPop Rape
Alabama          13.2     236       58 21.2
Alaska           10.0     263       48 44.5
Arizona           8.1     294       80 31.0
Arkansas          8.8     190       50 19.5
California        9.0     276       91 40.6
Colorado          7.9     204       78 38.7
Connecticut       3.3     110       77 11.1
Delaware          5.9     238       72 15.8
Florida          15.4     335       80 31.9
Georgia          17.4     211       60 25.8
Hawaii            5.3      46       83 20.2
Idaho             2.6     120       54 14.2
Illinois         10.4     249       83 24.0
Indiana           7.2     113       65 21.0
Iowa              2.2      56       57 11.3
Kansas            6.0     115       66 18.0
Kentucky          9.7     109       52 16.3
Louisiana        15.4     249       66 22.2
Maine             2.1      83       51  7.8
Maryland         11.3     300       67 27.8
Massachusetts     4.4     149       85 16.3
Michigan         12.1     255       74 35.1
Minnesota         2.7      72       66 14.9
Mississippi      16.1     259       44 17.1
Missouri          9.0     178       70 28.2
Montana           6.0     109       53 16.4
Nebraska          4.3     102       62 16.5
Nevada           12.2     252       81 46.0
New Hampshire     2.1      57       56  9.5
New Jersey        7.4     159       89 18.8
New Mexico       11.4     285       70 32.1
New York         11.1     254       86 26.1
North Carolina   13.0     337       45 16.1
North Dakota      0.8      45       44  7.3
Ohio              7.3     120       75 21.4
Oklahoma          6.6     151       68 20.0
Oregon            4.9     159       67 29.3
Pennsylvania      6.3     106       72 14.9
Rhode Island      3.4     174       87  8.3
South Carolina   14.4     279       48 22.5
South Dakota      3.8      86       45 12.8
Tennessee        13.2     188       59 26.9
Texas            12.7     201       80 25.5
Utah              3.2     120       80 22.9
Vermont           2.2      48       32 11.2
Virginia          8.5     156       63 20.7
Washington        4.0     145       73 26.2
West Virginia     5.7      81       39  9.3
Wisconsin         2.6      53       66 10.8
Wyoming           6.8     161       60 15.6
df<- scale(df)
df<-scale(df)
## 
> scale(df)
                    Murder     Assault    UrbanPop         Rape
Alabama         1.24256408  0.78283935 -0.52090661 -0.003416473
Alaska          0.50786248  1.10682252 -1.21176419  2.484202941
Arizona         0.07163341  1.47880321  0.99898006  1.042878388
Arkansas        0.23234938  0.23086801 -1.07359268 -0.184916602
California      0.27826823  1.26281442  1.75892340  2.067820292
Colorado        0.02571456  0.39885929  0.86080854  1.864967207
Connecticut    -1.03041900 -0.72908214  0.79172279 -1.081740768
Delaware       -0.43347395  0.80683810  0.44629400 -0.579946294
Florida         1.74767144  1.97077766  0.99898006  1.138966691
Georgia         2.20685994  0.48285493 -0.38273510  0.487701523
Hawaii         -0.57123050 -1.49704226  1.20623733 -0.110181255
Idaho          -1.19113497 -0.60908837 -0.79724965 -0.750769945
Illinois        0.59970018  0.93883125  1.20623733  0.295524916
Indiana        -0.13500142 -0.69308401 -0.03730631 -0.024769429
Iowa           -1.28297267 -1.37704849 -0.58999237 -1.060387812
Kansas         -0.41051452 -0.66908525  0.03177945 -0.345063775
Kentucky        0.43898421 -0.74108152 -0.93542116 -0.526563903
Louisiana       1.74767144  0.93883125  0.03177945  0.103348309
Maine          -1.30593210 -1.05306531 -1.00450692 -1.434064548
Maryland        0.80633501  1.55079947  0.10086521  0.701231086
Massachusetts  -0.77786532 -0.26110644  1.34440885 -0.526563903
Michigan        0.99001041  1.01082751  0.58446551  1.480613993
Minnesota      -1.16817555 -1.18505846  0.03177945 -0.676034598
Mississippi     1.90838741  1.05882502 -1.48810723 -0.441152078
Missouri        0.27826823  0.08687549  0.30812248  0.743936999
Montana        -0.41051452 -0.74108152 -0.86633540 -0.515887425
Nebraska       -0.80082475 -0.82507715 -0.24456358 -0.505210947
Nevada          1.01296983  0.97482938  1.06806582  2.644350114
New Hampshire  -1.30593210 -1.36504911 -0.65907813 -1.252564419
New Jersey     -0.08908257 -0.14111267  1.62075188 -0.259651949
New Mexico      0.82929443  1.37080881  0.30812248  1.160319648
New York        0.76041616  0.99882813  1.41349461  0.519730957
North Carolina  1.19664523  1.99477641 -1.41902147 -0.547916860
North Dakota   -1.60440462 -1.50904164 -1.48810723 -1.487446939
Ohio           -0.11204199 -0.60908837  0.65355127  0.017936483
Oklahoma       -0.27275797 -0.23710769  0.16995096 -0.131534211
Oregon         -0.66306820 -0.14111267  0.10086521  0.861378259
Pennsylvania   -0.34163624 -0.77707965  0.44629400 -0.676034598
Rhode Island   -1.00745957  0.03887798  1.48258036 -1.380682157
South Carolina  1.51807718  1.29881255 -1.21176419  0.135377743
South Dakota   -0.91562187 -1.01706718 -1.41902147 -0.900240639
Tennessee       1.24256408  0.20686926 -0.45182086  0.605142783
Texas           1.12776696  0.36286116  0.99898006  0.455672088
Utah           -1.05337842 -0.60908837  0.99898006  0.178083656
Vermont        -1.28297267 -1.47304350 -2.31713632 -1.071064290
Virginia        0.16347111 -0.17711080 -0.17547783 -0.056798864
Washington     -0.86970302 -0.30910395  0.51537975  0.530407436
West Virginia  -0.47939280 -1.07706407 -1.83353601 -1.273917376
Wisconsin      -1.19113497 -1.41304662  0.03177945 -1.113770203
Wyoming        -0.22683912 -0.11711392 -0.38273510 -0.601299251
attr(,"scaled:center")
       Murder       Assault      UrbanPop          Rape 
-7.667478e-17  1.111611e-16 -4.332645e-16  8.938163e-17 
attr(,"scaled:scale")
  Murder  Assault UrbanPop     Rape 
       1        1        1        1 
==================================================================
pca = PCA(df, graph = FALSE)
pca
**Results for the Principal Component Analysis (PCA)**
The analysis was performed on 50 individuals, described by 4 variables
*The results are available in the following objects:

   name               description                          
1  "$eig"             "eigenvalues"                        
2  "$var"             "results for the variables"          
3  "$var$coord"       "coord. for the variables"           
4  "$var$cor"         "correlations variables - dimensions"
5  "$var$cos2"        "cos2 for the variables"             
6  "$var$contrib"     "contributions of the variables"     
7  "$ind"             "results for the individuals"        
8  "$ind$coord"       "coord. for the individuals"         
9  "$ind$cos2"        "cos2 for the individuals"           
10 "$ind$contrib"     "contributions of the individuals"   
11 "$call"            "summary statistics"                 
12 "$call$centre"     "mean of the variables"              
13 "$call$ecart.type" "standard error of the variables"    
14 "$call$row.w"      "weights for the individuals"        
15 "$call$col.w"      "weights for the variables"          
==================================================================
eig<- get_eigenvalue(pca)
eig
eig
      eigenvalue variance.percent cumulative.variance.percent
Dim.1  2.4802416        62.006039                    62.00604
Dim.2  0.9897652        24.744129                    86.75017
Dim.3  0.3565632         8.914080                    95.66425
Dim.4  0.1734301         4.335752                   100.00000


# Entretanto, essa medida não é suficiente para se definir quantos componentes são necessários.
# Um método alternativo para determinar o número de componentes principais é olhar para um Scree Plot, gráfico de autovalores
ordenados do maior para o menor:

Sendo assim, o eixo 1 possui 62% e o eixo 2: 24.7%:
fviz_eig(pca,addlabels = TRUE, ylim = c(0,70)

# Outro método para extrair resultado de saída PCA é mostrando a matriz contendo todos os resultados das variáveis ativas.
# Como coordenadas, correlação entre variáveis, eixos, cosseno e contribuições.
# Executando a função 'get_pca_var()'
# Pelo contexto abordado a sintaxe é:
	get_pca_var(pca)    # Resultados das variáveis de PCA.

Principal Component Analysis Results for variables
 ===================================================
  Name       Description                                    
 "$coord"   "Coordinates for the variables"                
 "$cor"     "Correlations between variables and dimensions"
 "$cos2"    "Cos2 for the variables"                       
 "$contrib" "contributions of the variables" 

# Criar uma variável chamada 'var' para correlacionar com a variável ativa '$coord' para extrair mais resultados:
var<- get_pca_var(pca)
var
head(var$coord,4)
head(var$coord)
             Dim.1      Dim.2      Dim.3       Dim.4
Murder   0.8439764 -0.4160354  0.2037600  0.27037052
Assault  0.9184432 -0.1870211  0.1601192 -0.30959159
UrbanPop 0.4381168  0.8683282  0.2257242  0.05575330
Rape     0.8558394  0.1664602 -0.4883190  0.03707412


Informações sobre outros resultados das variáveis:
var$coord: criar um gráfico de dispersão.

var$cos2: representa a qualidade de representação das variáveis no mapa de fatores. É calculado como as coordenadas quadradas: var.cos2 = var.coord * var.coord.

var$contrib: contém as contribuições (em porcentagem) das variáveis para os componentes principais.

ROTAÇÃO DE FATORES:
	- Essa técnica os eixos de referência são rotacionais em torno da origem até que outra posição seja alcançada.
O primeiro fator tende a ser um fator geral com quase toda variável com carga significante e explica a quantia maior de
variância. O segundo fator e os seguintes são então baseados em quantias residuais de variância menores e cada fator extrai
porções cada vez menores de variância.
	- O efeito final de rotacionar a matriz fatorial é redistribuir a variância dos primeiros fatores para os últimos com o
objetivo de atingir um padrão fatorial mais simples e teoricamente mais significativo.
Obs:  ** PARA DEMONSTRAR AS RELAÇÕES DAS VARIÁVEIS EM COORDENADAS PODEMOS UTILIZAR O CÍRCULO DE CORRELAÇÃO GERADO PELA FUNÇÃO JÁ
		CONHECIDA E FEITA POR NÓS : 'FVIZ_PCA_VAR'

- O gráfico que melhor representa as coordenadas e também pode ser melhor interpretativo é o de eixos X e Y no plano.
	- As variáveis positivas correlacionadas são agrupadas.
	- As variáveis negativas correlacionadas são posicionadas em lados opostos da origem ( quadrantes opostos ).
	- A distância entre as variáveis e a origem mede a qualidade das variáveis no mapa de fatores.
head(var$coord, 4)
fviz_pca_var(pca, col.var = 'cos2', gradient.cols = c('#000AFBB', '#E7B800', '#FC4E07'), repel = TRUE) # Gráfico de correlação

head(var$contrib,4)
fviz_contrib(pca, choice = 'var', axes = 1, top = 10)

# GRÁFICOS DE INDIVÍDUOS, QUALIDADE E CONTRIBUIÇÕES:
	- O gráfico de individuos poderá ser impressio de várias maneiras; As funções get_pa_ind() e get_pca_var()
imprime os resultados contendo coordenadas, correlação entre indivíduos e eixos, cosseno ao quadrado e contribuições.
# Podemos visualizar as variáveis de indivíduos executando o código:


fviz_pca_ind(pca, col.ind = 'cos2', gradient.cols = c('#00AFBB','#E7B800','#FC4E07'), repel = TRUE)

fviz_pca_ind(pca, pointsize = 'cos2', pointshape = 21, fill = "#E7B800', repel = TRUE)

fviz_pca_ind(pca, col.ind = 'cos2', gradient.cols = c('#00AFBB', '#E7B800', '#FC4E07'), repel = TRUE)

Ou ainda podemos gerar um gráfico de barras:

fviz_pca_contrib(res.pca, choice = 'ind', axes = 1:2)

fviz_contrib(res.pca, choice = 'ind', a

fviz_pca_ind(pca, pointsize = 'cos2', pointshape = 21, fill = '#E7B800', repel = TRUE)

fviz_contrib(res.pca, choice = 'ind', axes = 1:2)

Autovalores e variâncias:
	- Os autovalores medem a quantidade de variação retida por cada componente principal. Os autovalores são grandes para os
primeiros componentes e pequenos para os subsequentes, ou seja, os primeiros PCs correspondem às direções com a quantidade máxima de
variação no conjunto de dados. Para visualizar a extração, usa-se a função 'get_eigenvalue'
Obs: *** A PROPORÇÃO DE VARIAÇÃO POR CADA AUTOVALOR É DADA NA COLUNA 'EIGENVALUE'. 
	- A maioria da variação é explicada pelos dois primeiros autovalores juntos.
PARA VISUALIZAR O QUADRO DE VARIÁVEIS E SUA PORCENTAGENS É NECESSÁRIO EXECUTAR A VARIÁVEL DECLARADA: 

eig <-get_eigenvalue(pca) depois eig no RStudio.
============================================================

