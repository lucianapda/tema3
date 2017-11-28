json.id @word_hunt.id
json.name @word_hunt.name
json.teacher_id @word_hunt.teacher_id
json.teacher_name @word_hunt.teacher.name
json.team_id @word_hunt.team_id
json.team_name @word_hunt.team.name

json.words @word_hunt.words do |word|
  json.id word.id
  json.word word.word
end

json.puzzle @word_hunt.puzzle
