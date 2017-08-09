module ApplicationHelper

  def login_logout_link
    text, url, method = if User.current_user.present?
      [I18n.t('.defaults.log_out'), logout_path, 'delete']
    else
      [I18n.t('.defaults.log_in'), login_path, 'get']
    end
    link_to text, url, method: method
  end

  def cart_products_count
    count = 0
    products_hash = session[:products]
    products_hash.each_value {|v| count += v} if products_hash.present?
    count
  end

end
