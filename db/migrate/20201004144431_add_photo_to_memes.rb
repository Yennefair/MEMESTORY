class AddPhotoToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :photo, :string
  end
end
