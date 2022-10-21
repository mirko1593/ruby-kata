class CreatePictures < ActiveRecord::Migration[7.0]
  def change
    create_table :pictures do |t|
      t.string :comment
      t.string :name
      t.string :content_type
      t.binary :data, :limit => 1.megabyte

      t.timestamps
    end
  end
end
