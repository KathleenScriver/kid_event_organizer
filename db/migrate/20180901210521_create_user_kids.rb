class CreateUserKids < ActiveRecord::Migration[5.1]
  def change
    create_table :user_kids do |t|
      t.references :user, foreign_key: true
      t.references :kid, foreign_key: true
    end
  end
end
