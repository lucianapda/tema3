json.id @usuario.id
json.nome @usuario.nome
json.email @usuario.email
json.tipo @usuario.tipo
json.tipo_text @usuario.tipo_text

json.notas @usuario.notas do |nota|
  json.id nota.id
  json.nota nota.nota
end if @usuario.notas.present?
