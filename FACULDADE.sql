CREATE TABLE Cursos (
    id_curso INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    duracao INTEGER,
    carga_horaria INTEGER,
    modalidade TEXT
);

CREATE TABLE Alunos (
    id_aluno INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL,
    data_nascimento DATE,
    endereco TEXT,
    email TEXT,
    telefone TEXT,
    id_curso INTEGER,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Professores (
    id_professor INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL,
    especializacao TEXT,
    email TEXT,
    telefone TEXT
);

CREATE TABLE Disciplinas (
    id_disciplina INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    carga_horaria INTEGER,
    id_professor INTEGER,
    id_curso INTEGER,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Turmas (
    id_turma INTEGER PRIMARY KEY,
    ano INTEGER NOT NULL,
    semestre INTEGER NOT NULL,
    id_disciplina INTEGER,
    id_curso INTEGER,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Notas (
    id_nota INTEGER PRIMARY KEY,
    id_aluno INTEGER,
    id_disciplina INTEGER,
    nota DECIMAL(5, 2),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);
