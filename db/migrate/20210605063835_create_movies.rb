class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :plot 
      t.string :title
      
      t.timestamps
    end
  end
end
