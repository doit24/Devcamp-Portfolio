# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles, :string
  end
end
