class StaticPagesController < ActionController::Base
  def index
    render render: 'static_pages/index'
  end
end
