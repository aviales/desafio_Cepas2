class CreateMagazineoenologistjobtitles < ActiveRecord::Migration[5.1]
  def change
    create_table :magazineoenologistjobtitles do |t|
      t.references :magazine, foreign_key: true
      t.references :oenologist, foreign_key: true
      t.references :job_title, foreign_key: true

      t.timestamps
    end
  end
end
