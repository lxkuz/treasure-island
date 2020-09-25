module Api
  module V1
    # Site Map API controller
    #
    class SiteMapController < ApplicationController
      def index
        site_map_data = SiteMapSearcher.call
        render json: SiteMapPresenter.call(site_map_data)
      end
    end
  end
end
