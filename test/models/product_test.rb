require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email to subscribers when product is back in stock" do
    product = products(:tshirt)

    # Set product inventory to 0 to simulate out of stock
    product.update(inventory_count: 0)

    assert_emails 2 do
      product.update(inventory_count: 99)
    end
  end
end
