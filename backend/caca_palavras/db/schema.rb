# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170916165850) do

  create_table "alunos_notas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "aluno_id"
    t.bigint "nota_id"
    t.index ["nota_id"], name: "index_alunos_notas_on_nota_id"
  end

  create_table "alunos_turmas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "aluno_id"
    t.bigint "turma_id"
    t.index ["turma_id"], name: "index_alunos_turmas_on_turma_id"
  end

  create_table "caca_palavras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.integer "professor_id"
    t.integer "turma_id"
  end

  create_table "notas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "caca_palavra_id"
    t.decimal "nota", precision: 4, scale: 2
    t.index ["caca_palavra_id"], name: "index_notas_on_caca_palavra_id"
  end

  create_table "palavras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "palavra"
    t.bigint "caca_palavra_id"
    t.index ["caca_palavra_id"], name: "index_palavras_on_caca_palavra_id"
  end

  create_table "turmas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nome"
    t.string "email"
    t.integer "tipo"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["uid", "provider"], name: "index_usuarios_on_uid_and_provider", unique: true
  end

end
