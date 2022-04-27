\c escola;


--Implementar um script SQL chamado ‘consultas_escola.sql’ com os comandos que respondam às seguintes consultas :
--a-Produza um relatório que contenha os dados dos alunos matriculados em todos os CURSOs oferecidos pela escola.

SELECT CURSO.nome AS CURSO ,aluno.* 
FROM matricula 
JOIN CURSO on matricula.codigo_CURSO = CURSO.codigo_CURSO
JOIN aluno on matricula.cpf = aluno.cpf
ORDER BY CURSO.nome;

--Produza um relatório com os dados de todos os CURSOs, com suas respectivas DISCIPLINAs, oferecidos pela --escola

--sem agregar

SELECT CURSO.Nome AS CURSO, DISCIPLINA.nome AS DISCIPLINAS
FROM COMPOE
INNER JOIN CURSO on COMPOE.codigo_CURSO = CURSO.codigo_CURSO
INNER JOIN DISCIPLINA on COMPOE.codigo_disc = DISCIPLINA.codigo_disc
ORDER BY CURSO.nome;

--agregado

SELECT CURSO.nome AS CURSO, 
string_agg(DISCIPLINA.nome , ', ') AS DISCIPLINAS
FROM compoe
INNER JOIN CURSO on compoe.codigo_CURSO = CURSO.codigo_CURSO
INNER JOIN DISCIPLINA on compoe.codigo_disc = DISCIPLINA.codigo_disc
GROUP BY CURSO.nome
ORDER BY CURSO.nome;


--Produza um relatório que contenha o nome dos alunos e as DISCIPLINAs em que estão matriculados.

--sem agregar

SELECT ALUNO.nome AS ALUNO, DISCIPLINA.nome AS DISCIPLINAS_CURSADAS
FROM CURSA
INNER JOIN ALUNO ON CURSA.cpf = ALUNO.cpf
INNER JOIN DISCIPLINA ON CURSA.codigo_disc = DISCIPLINA.codigo_disc
ORDER BY ALUNO.nome;

--agregado

SELECT ALUNO.nome AS ALUNO, 
string_agg(DISCIPLINA.nome , ', ') AS DISCIPLINAS_CURSADAS
FROM CURSA
INNER JOIN ALUNO ON CURSA.cpf = ALUNO.cpf
INNER JOIN DISCIPLINA ON CURSA.codigo_disc = DISCIPLINA.codigo_disc
GROUP BY ALUNO.nome
ORDER BY ALUNO.nome;


--Produza um relatório com os dados dos professores e as DISCIPLINAs que ministram.

SELECT PROFESSOR.nome AS PROFESSOR, PROFESSOR.endereco, PROFESSOR.telefone, PROFESSOR.data_nascimento,
DISCIPLINA.nome AS DISCIPLINAS
FROM DISCIPLINA
JOIN PROFESSOR ON PROFESSOR.matricula_prof = DISCIPLINA.matricula_prof
ORDER BY PROFESSOR.nome;


--Produza um relatório com os nomes das DISCIPLINAs e seus pré-requisitos.

SELECT A.NOME_DISCIPLINA,
CASE 
WHEN DISCIPLINA.nome is null THEN 'Nenhum pre requisito'
ELSE DISCIPLINA.nome
END AS PRE_REQUISITO
FROM (SELECT DISCIPLINA.nome AS NOME_DISCIPLINA, codigo_prereq AS PRE_REQUISITO 
FROM DISCIPLINA 
LEFT JOIN PREREQUISITO ON DISCIPLINA.codigo_disc = PREREQUISITO.codigo_disc ) AS A
LEFT JOIN DISCIPLINA ON A.PRE_REQUISITO = DISCIPLINA.codigo_disc
ORDER BY DISCIPLINA;


--Produza um relatório com a média de idade dos alunos matriculados em cada curso.

SELECT CURSO.nome, avg(AGE(CURRENT_DATE,data_nascimento)) AS MEDIA_IDADE_ALUNOS
FROM MATRICULA 
JOIN CURSO ON MATRICULA.codigo_curso = CURSO.codigo_curso 
JOIN ALUNO ON MATRICULA.cpf = ALUNO.cpf
GROUP BY CURSO.nome;


--Produza um relatório com os cursos oferecidos por cada departamento.

SELECT DEPARTAMENTO.nome AS DEPARTAMENT, CURSO.nome AS CURSO, descricao
FROM DEPARTAMENTO 
JOIN CURSO ON CURSO.codigo_dpto = DEPARTAMENTO.codigo_dpto
ORDER BY DEPARTAMENTO.nome;
