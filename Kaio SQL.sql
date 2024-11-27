#1
DELIMITER $$

CREATE PROCEDURE exibirAlunosPorTurma(IN codigoTurma VARCHAR(15))
BEGIN
    SELECT aluno.numero_matricula, aluno.nome_aluno
    FROM aluno
    WHERE aluno.codigo_turma = codigoTurma;
END$$

DELIMITER ;

#2
DELIMITER $$

CREATE PROCEDURE atualizarStatusAluno(
    IN numeroMatricula INT,
    IN novoStatus VARCHAR(20)
)
BEGIN
    UPDATE aluno
    SET status_aluno = novoStatus
    WHERE numero_matricula = numeroMatricula;
END$$

DELIMITER ;


#3
DELIMITER $$

CREATE PROCEDURE exibirProfessoresPorDisciplina(IN codigoDisciplina VARCHAR(15))
BEGIN
    SELECT professor.numero_registro_professor, professor.nome
    FROM professor
    WHERE professor.codigo_disciplina = codigoDisciplina;
END$$

DELIMITER ;


#4
DELIMITER $$

CREATE PROCEDURE inserirNovaTurma(
    IN quantidadeAlunos INT,
    IN periodoTurma VARCHAR(20),
    IN semestreTurma INT,
    IN statusTurma VARCHAR(20)
)
BEGIN
    DECLARE novoCodigoTurma VARCHAR(15);
    SET novoCodigoTurma = CONCAT('TURMA_', UNIX_TIMESTAMP());
    INSERT INTO turma (codigo_turma, numero_alunos, periodo, status_turma)
    VALUES (novoCodigoTurma, quantidadeAlunos, periodoTurma, statusTurma);
END$$

DELIMITER ;


#5
DELIMITER $$

CREATE PROCEDURE atualizarEspecialidadeProfessor(
    IN codigoProfessor VARCHAR(15),
    IN novaEspecialidade VARCHAR(50)
)
BEGIN
    UPDATE professor
    SET especialidade = novaEspecialidade
    WHERE numero_registro_professor = codigoProfessor;
END$$

DELIMITER ;
