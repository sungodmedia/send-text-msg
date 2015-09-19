class CreateSends < ActiveRecord::Migration
  def change
    create_table :sends do |t|
      t.string :phone
      t.string :message

      t.timestamps null: false
    end
  end
end
