User.create(name: 'Professor', email: 'professor@gmail.com', password: 'senha123', type: 1)

team = Team.create(name: '8ª série')

student = User.create(name: 'Aluno', email: 'aluno@gmail.com', password: 'senha123', type: 2)

StudentsTeam.create(team: team, student: student)
