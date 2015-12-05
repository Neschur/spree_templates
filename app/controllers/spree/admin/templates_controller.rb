module Spree
  module Admin
    class TemplatesController < Spree::Admin::BaseController
      def index
        @dirs = Dir['app/views/spree/**/**'].reject do |a|
          a.start_with?('app/views/spree/admin')
        end
        render :index
      end
    end
  end
end
