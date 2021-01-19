# frozen_string_literal: true

module UsersHelper
  def collapsible_links
    if user_signed_in?
      @recent_products = Product.find(current_user.events.pluck(:properties).pluck("id"))
      'home'

    elsif supplier_signed_in?
      'supplier/index'

    else
      'index'

    end
  end
end
