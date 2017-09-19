Caça Palavras
=============

Trabalho de PIII

## Dependências
- [Ruby 2.3.1](https://www.ruby-lang.org/pt/)
- [Bundler](http://bundler.io/)

1. Clone do projeto
```bash
git clone git@github.com:lucianapda/tema3.git
```

2. Acessar diretório
```bash
cd tema3/backend/caca_palavras
```

3. Rodar bundle install
```bash
bundle install
```

4. Ajustar database.rb com username e password do MySQL
```yml
  username: root
  password: root
```

5. Criar databases
```bash
rake db:create
```

6. Rodar migrates
```bash
rake db:migrate
```

7. Rodar seeds
```bash
rake db:seed
```

8. Iniciar aplicação
```bash
rails s
```
