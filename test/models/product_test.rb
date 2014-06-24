require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
end

test "product price must be positive" do
    product = Product.new(title:        "This Title Is The Shit",
                          description:  "This description is the actual titties",
                                image_url:  "boob.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
        product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01, brah.",
        product.errors[:price].join('; ')
    
    product.price = 1
    assert product.valid?
    assert_equal "you did it, doooooood."

end
end
