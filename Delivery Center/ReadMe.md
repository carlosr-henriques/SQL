# Contexto  

Delivery Center é uma plataforma integra **lojistas** e **marketplaces**, criando um ecossistema saudável para **vendas** de **good (produtos)** e **food (comidas)** no varejo brasileiro, com seus diversos **hubs** operacionais espalhados pelo Brasil país.  
O dataset contém um **cadastro (catálogo + cardápio)** com mais de 900 mil **itens**, milhares de **pedidos** e **entregas** operacionalizados diariamente com uma rede de milhares **lojistas** e **entregadores** parceiros espalhados por **todas as regiões do país**.  

# Objetivo  

Utilizar SQL para extrair dados que poderão ser convertidos em visões onde, juntos, formarão um ou mais dasboards, possibilitando olhar a operação através de fatos. 

# Dados do projeto

Os dados foram obtidos no Kaggle, pelo autor [Nosbielcs](https://www.kaggle.com/nosbielcs). Os dados estão modelados no padrão floco de neve (snowflake), com informações anonimizadas seguindo as regras da LGPD, além de não conter em sua completude todos os dados operacionais da Delivery Center.

![image](https://github.com/user-attachments/assets/3b562b17-187b-482d-a60e-1c2fd5428fee)  

# Descrição das dimensões e fatos

- **channels** (dimensão): Este dataset possui informações sobre os canais de venda (marketplaces) onde são vendidos os good e food de nossos lojistas.
- **deliveries** (dimensão): Este dataset possui informações sobre as entregas realizadas por nossos entregadores parceiros.
- **drivers** (dimensão): Este dataset possui informações sobre os entregadores parceiros. Eles ficam em nossos hubs e toda vez que um pedido é processado, são eles fazem as entregas na casa dos consumidores.
- **hubs** (dimensão): Este dataset possui informações sobre os hubs do Delivery Center. Entenda que os Hubs são os centros de distribuição dos pedidos e é dali que saem as entregas.
- **orders** (fato): Este dataset possui informações sobre as vendas processadas através da plataforma do Delivery Center.
- **payments** (dimensão): Este dataset possui informações sobre os pagamentos realizados ao Delivery Center.
- **stores** (dimensão): Este dataset possui informações sobre os lojistas. Eles utilizam a Plataforma do Delivery Center para vender seus itens (good e/ou food) nos marketplaces.

# Fluxo de dados do projeto  

![image](https://github.com/user-attachments/assets/934a5932-0d1f-46c7-b14e-221be7307748)


