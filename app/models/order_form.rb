class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address1, :address2, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address1
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'input correctly' }
    validates :token
  end

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2,
                   phone_number: phone_number, order_id: @order.id)
  end
end
