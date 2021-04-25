# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title, limit: 80, null: false
      t.string :subtitle, limit: 160, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
