ActiveRecord::Schema.define(version: 20150913144027) do

  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "content",                      null: false
    t.integer  "responder_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "best_answer",  default: false
  end

  create_table "comments", force: true do |t|
    t.text     "content",          null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "commentator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "questions", force: true do |t|
    t.string   "title",          limit: 150, null: false
    t.text     "content",                    null: false
    t.integer  "submitter_id"
    t.integer  "best_answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        limit: 50,  null: false
    t.string   "email",           limit: 50,  null: false
    t.string   "avatar_url",      limit: 500
    t.string   "password_digest",             null: false
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "value",         null: false
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "voter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree

end
