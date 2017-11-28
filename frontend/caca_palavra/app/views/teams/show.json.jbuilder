json.id @team.id
json.name @team.name

json.students @team.students do |student|
  json.id student.id
  json.name student.name
end
