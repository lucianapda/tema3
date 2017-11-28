json.id @user.id
json.name @user.name
json.email @user.email
json.type @user.type
json.type_text @user.type_text

json.grades @user.grades do |grade|
  json.id grade.id
  json.grade grade.grade
end if @user.grades.present?
