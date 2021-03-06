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

ActiveRecord::Schema.define(version: 2019_06_02_095452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pastes", primary_key: "shortlink", id: :string, limit: 7, force: :cascade do |t|
    t.datetime "expired_at"
    t.string "path", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["created_at"], name: "index_pastes_on_created_at"
    t.index ["user_id"], name: "index_pastes_on_user_id"
  end

  create_table "sidekiq_jobs", force: :cascade do |t|
    t.string "jid"
    t.string "queue"
    t.string "class_name"
    t.text "args"
    t.boolean "retry"
    t.datetime "enqueued_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "status"
    t.string "name"
    t.text "result"
    t.index ["class_name"], name: "index_sidekiq_jobs_on_class_name"
    t.index ["enqueued_at"], name: "index_sidekiq_jobs_on_enqueued_at"
    t.index ["finished_at"], name: "index_sidekiq_jobs_on_finished_at"
    t.index ["jid"], name: "index_sidekiq_jobs_on_jid"
    t.index ["queue"], name: "index_sidekiq_jobs_on_queue"
    t.index ["retry"], name: "index_sidekiq_jobs_on_retry"
    t.index ["started_at"], name: "index_sidekiq_jobs_on_started_at"
    t.index ["status"], name: "index_sidekiq_jobs_on_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
