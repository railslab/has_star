require 'has_star/model'
require 'has_star/controller'
require 'has_star/helper'
require 'has_star/route'

module HasStar
  module ActiveRecord
    def has_star
      include Model
    end
  end

  module ActionController
    attr_accessor :has_star_resource_method

    def has_star(resource_method)
      self.has_star_resource_method = resource_method
      include Controller
    end
  end
end

ActiveRecord::Base.send     :extend, HasStar::ActiveRecord
ActionController::Base.send :extend, HasStar::ActionController
ActionView::Base.send       :include, HasStar::Helper
ActionDispatch::Routing::Mapper.send :include, HasStar::Route
