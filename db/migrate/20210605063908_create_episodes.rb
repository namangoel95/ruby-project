class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :plot 
      t.string :title
      t.integer :number
      t.belongs_to :season
      
      t.timestamps

    end
  end
end
