# Banco-de-dados-para-uma-escola---PostgreSQL
Modelagem de um sistema de banco de dados de uma escola e exemplos de consultas

Os diagramas abaixo referem-se a modelagem de um sistema de banco de dados de uma escola. 
A Figura 1 representa o modelo entidade-relacionamento (ER) simplificado, obtido a partir dos requisitos do problema. Assuma que esse processo foi realizado em uma etapa anterior.
![Figura 1](https://user-images.githubusercontent.com/68875230/165408472-48142bf2-e025-4c92-9147-6db3dc764534.png)

Figura 1 - Modelo ER Escola
Já a Figura 2 representa o modelo relacional, mapeado a partir do modelo ER da Figura 1. Note que o modelo relacional possui mais detalhes que o modelo ER.

Figura 2- Modelo Relacional Escola
Considerando os diagramas como referência, pede-se:
Implementar um script SQL chamado ‘escola.sql’ com os comandos de criação do banco de dados escola. Mais especificamente, o script deverá:
Criar um banco de dados vazio chamado escola.
Criar todas as tabelas que fazem parte do banco, a partir do modelo relacional.
Definir as restrições de integridade referencial (chaves estrangeiras) nas tabelas necessárias.
Definir as chaves primárias das tabelas.
Definir as restrições de domínio de atributo.
Conter comandos de inserção de dados em todas as tabelas. Os dados inseridos serão utilizados na etapa 2 do projeto.

Implementar um script SQL chamado ‘consultas_escola.sql’ com os comandos que respondam às seguintes consultas. :
Produza um relatório que contenha os dados dos alunos matriculados em todos os cursos oferecidos pela escola.
Produza um relatório com os dados de todos os cursos, com suas respectivas disciplinas, oferecidos pela escola.
Produza um relatório que contenha o nome dos alunos e as disciplinas em que estão matriculados.
Produza um relatório com os dados dos professores e as disciplinas que ministram.
Produza um relatório com os nomes das disciplinas e seus pré-requisitos.
Produza um relatório com a média de idade dos alunos matriculados em cada curso.
Produza um relatório com os cursos oferecidos por cada departamento.

Entregar as consultas, bem como as respostas de cada uma em um arquivo separado ou organizado no mesmo arquivo. O resultado da consulta pode ficar comentado após cada query.
Considere que:
O SGBD adotado para o projeto deve ser o PostgreSQL.
Os scripts devem ser implementados de modo que sua execução seja direta e aconteça sem erros em qualquer ambiente Postgres.
O domínio dos atributos (tipo de dados, formato, etc.) fica a critério do aluno.
O aluno tem liberdade de criar novos atributos ou relações que julgar necessário para enriquecimento do modelo.
