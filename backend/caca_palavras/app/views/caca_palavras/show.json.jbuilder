json.id @caca_palavra.id
json.nome @caca_palavra.nome
json.professor_id @caca_palavra.professor_id
json.professor_nome @caca_palavra.professor.nome
json.turma_id @caca_palavra.turma_id
json.turma_nome @caca_palavra.turma.nome

json.palavras @caca_palavra.palavras do |palavra|
  json.id palavra.id
  json.palavra palavra.palavra
end

json.puzzle @caca_palavra.puzzle
