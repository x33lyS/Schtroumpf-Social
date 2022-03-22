class CreateProfils < ActiveRecord::Migration[7.0]
  def change
    create_table :profils do |t|
      t.references :user, null: false, foreign_key: true
      t.string :Name
      t.date :begin_at
      t.date :finish_at
      t.text :desc

      t.timestamps
    end
  end
end
