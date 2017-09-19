json.id @turma.id
json.nome @turma.nome

json.palavras @turma.alunos do |aluno|
  json.id aluno.id
  json.nome aluno.nome
end
