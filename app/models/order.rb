class Order < ApplicationRecord
  FLAT_RATE_PHONES = ["Glass"]
  THREE_PHONE_DISCOUNT = 0.90
  DEFAULT_SHIPPING_FEE_PERCENTAGE = 0.02
  FRAGILE_SHIPPING_FLAT_RATE = 100
  DISCOUNT_MINIMUM = 3
  HOUSE_MAX = 6

  belongs_to :product
  belongs_to :user
  validates :quantity, numericality: { :greater_than_or_equal_to => 0, :less_than_or_equal_to => HOUSE_MAX }
  validates :shipping_fee, numericality: { :greater_than => 0 }
  before_create :set_discount, if: -> { self.quantity >= DISCOUNT_MINIMUM }

  def set_discount
    self.total *= THREE_PHONE_DISCOUNT
  end

  def set_total_before_shipping
    self.total = self.quantity * self.product.price
  end

  def set_shipping_fee
    self.shipping_fee = FLAT_RATE_PHONES.include?(product.name) ? FRAGILE_SHIPPING_FLAT_RATE : self.total * DEFAULT_SHIPPING_FEE_PERCENTAGE
  end

  def prepare(product_id, current_user_id)
    set_user(current_user_id)
    set_product(product_id)
    set_total_before_shipping
    set_shipping_fee
    set_total
  end

  def set_total
    self.total += self.shipping_fee
  end

  def set_user(current_user_id)
    self.user_id = current_user_id
  end

  def set_product(product_id)
    self.product_id = Product.find(product_id).id
  end
end
