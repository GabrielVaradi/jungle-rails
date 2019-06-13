module CartHelper
  def is_cart_empty?(cart)
    if cart.size == 0
      true
    else
      false
    end
   end
end
