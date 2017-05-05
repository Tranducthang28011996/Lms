class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.string :video_url
      t.string :document_url

      t.timestamps
    end
  end
end
