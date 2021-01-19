# frozen_string_literal: true
#require 'elasticsearch/model'
class Product < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  belongs_to :category
  delegate :category_type , to: :category
  belongs_to :supplier
  has_and_belongs_to_many :wishlists
  has_many :order_details
  has_many :orders, through: :order_details,dependent: :destroy
  has_many :users, through: :orders
  has_many_attached :images
  has_many :reviews

    # settings index: { number_of_shards: 1 } do
    # mappings dynamic: 'false' do
    #   indexes :name, analyzer: 'english'
     # indexes :overview, analyzer: 'english'
  #   end
  # end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      'Remove from'
    else
      'Add to'
    end
  end

  rails_admin do
    edit do
      include_all_fields
      field :images do
      end
    end
  end

  rails_admin do
    show do
      include_all_fields
      field :images do
      end
    end
  end
end
# Product.__elasticsearch__.create_index!
# Product.import
