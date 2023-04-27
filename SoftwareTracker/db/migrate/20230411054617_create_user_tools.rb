class CreateUserTools < ActiveRecord::Migration[7.0]
  def change
    create_table :user_tools do |t|
      t.references :user, null: false
      t.references :tool, null: false

      t.timestamps
    end

    add_foreign_key :user_tools, :users, column: :user_id
    add_foreign_key :user_tools, :tools, column: :tool_id
  end
end
