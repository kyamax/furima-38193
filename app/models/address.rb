class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address1
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "Input only number"}
    validates :order_id
  end
end
