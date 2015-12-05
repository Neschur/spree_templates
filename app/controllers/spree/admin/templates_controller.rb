module Spree
  module Admin
    class TemplatesController < Spree::Admin::BaseController
      def index
        @dirs = Dir['app/views/spree/**/**.erb']
        render :index
      end

      #TODO - different actions
      def show

        if params[:id] == 'templates_list'
          dirs1 = Dir['app/views/spree/**/**.erb'].map{|path| path.gsub('app/views/spree/', '')}
          dirs2 = Dir["#{store_path}**/**.erb"].map{|path| path.gsub(store_path, '')}
          @dirs = ([''] + dirs1 + dirs2).uniq.sort
          render :templates_list, :layout => false
        elsif params[:id] == 'page'
          if File.exists?(store_path + params[:page])
            render text: open(store_path + params[:page]).read
          else
            render text: open('app/views/spree/' + params[:page]).read
          end
        end
      end

      def update
        File.open(store_path + params[:template], 'w') { |file| file.write(params[:source]) }
        debugger
        render text: ''
      end

      private
        def store_path
          "app/views/stores/#{params[:code]}/spree/"
        end
    end
  end
end
