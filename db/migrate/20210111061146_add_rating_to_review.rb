class AddRatingToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :rating, :integer, default: 0
  end
end
