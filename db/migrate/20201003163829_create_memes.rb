class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.string :title
      t.string :source

      t.timestamps
    end
  end
end
