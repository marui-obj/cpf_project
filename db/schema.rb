# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_18_164033) do

  create_table "departments", force: :cascade do |t|
    t.string "title"
    t.integer "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_departments_on_manager_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.integer "user_id"
    t.integer "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "overtime"
    t.integer "department_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_shifts_on_department_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workplans", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.integer "overtime"
    t.integer "shift_id"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_workplans_on_employee_id"
    t.index ["shift_id"], name: "index_workplans_on_shift_id"
  end

end
