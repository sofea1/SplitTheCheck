class CreateVoteHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_histories do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.integer :votetype

      t.timestamps
    end
  end
end
