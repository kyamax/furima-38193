class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :days
  has_one_attached :image

  validates :name, :explanation, :price, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_charges_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, inclusion: { in: 300..9999999, message: "is out of setting range" }, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }

end
