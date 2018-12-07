#language: pt
#encoding: utf-8

Funcionalidade: Eu, enquanto usuário, consigo visualizar pesquisa de satisfação atual

Cenário de Fundo:
Dado que eu estou na página onde a avaliação é mostrada

Cenário: Usuário visualiza avaliação Café da Manhã
Dado que a refeição é Café da Manhã eu devo visualizar o texto "Refeição: Café da Manhã"

Cenário: Usuário visualiza avaliação Almoço
Dado que a refeição é Almoço eu devo visualizar o texto "Refeição: Almoço"

Cenário: Usuário visualiza avaliação Jantar
Dado que a refeição é Jantar eu devo visualizar o texto "Refeição: Jantar"

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Nenhuma avaliação foi feita ainda :("

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Se eu fosse você comia na lanchonete"

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Não recomento mas se quiser arriscar..."

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Vale o investimento :)"

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Vai sem medo de ser feliz!!"

Cenário: Usuário pesquisa opção em branco (Sad)
Quando eu escolho o nome ""
E clico no botão "Pesquisar"
Então eu não devo ver o resultado "Quem é outback comparado a esse RU hoje?!"

Cenário: Usuário visualiza avaliação Café da Manhã no Campus RU/FGA (Happy)
Quando eu escolho o nome "RU/FGA"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "0.2 Se eu fosse você comia na lanchonete"

Cenário: Usuário visualiza avaliação Café da Manhã no Campus RU/FCE (Happy)
Quando eu escolho o nome "RU/FCE"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "2.0 Não recomento mas se quiser arriscar..."

Cenário: Usuário visualiza avaliação Café da Manhã no Campus RU/FUP (Happy)
Quando eu escolho o nome "RU/FUP"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "3.6 Vale o investimento :)"


Cenário: Usuário visualiza avaliação Café da Manhã no Campus RU/FAL (Happy)
Quando eu escolho o nome "RU/FAL"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "4.3 Vai sem medo de ser feliz!!"

Cenário: Usuário visualiza avaliação Almoço no Campus Darcy Ribeiro (Happy)
Quando eu escolho o nome "Darcy Ribeiro"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "4.2 Vai sem medo de ser feliz!!"

Cenário: Usuário visualiza avaliação Almoço no Campus RU/FCE (Happy)
Quando eu escolho o nome "RU/FCE"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "0.8 Se eu fosse você comia na lanchonete"

Cenário: Usuário visualiza avaliação Almoço no Campus RU/FUP (Happy)
Quando eu escolho o nome "RU/FUP"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "1.5 Não recomento mas se quiser arriscar..."

Cenário: Usuário visualiza avaliação Almoço no Campus RU/FAL (Happy)
Quando eu escolho o nome "RU/FAL"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "3.3 Vale o investimento :)"

Cenário: Usuário visualiza avaliação Jantar no Campus Darcy Ribeiro (Happy)
Quando eu escolho o nome "Darcy Ribeiro"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "2.9 Vale o investimento :)"

Cenário: Usuário visualiza avaliação Jantar no Campus RU/FGA (Happy)
Quando eu escolho o nome "RU/FGA"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "4.1 Vai sem medo de ser feliz!!"

Cenário: Usuário visualiza avaliação Jantar no Campus RU/FUP (Happy)
Quando eu escolho o nome "RU/FUP"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "0.0 Se eu fosse você comia na lanchonete"

Cenário: Usuário visualiza avaliação Jantar no Campus RU/FAL (Happy)
Quando eu escolho o nome "RU/FAL"
E clico no botão "Pesquisar"
Então eu devo ver o resultado "1.3 Não recomento mas se quiser arriscar..."



