# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :sex
      t.string :nationality
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
