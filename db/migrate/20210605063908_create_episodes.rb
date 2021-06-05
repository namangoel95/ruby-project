class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :plot 
      t.string :title
      t.integer :number_of_epiosdes
      t.belongs_to :season
      
      t.timestamps

    end
  end
end
