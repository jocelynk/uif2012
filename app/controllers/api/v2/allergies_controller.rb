module Api
  module V2
    class AllergiesController < ApplicationController
      class Allergy < ::Allergy
        # Note: this does not take into consideration the create/update actions for changing released_on
        def as_json(options = {})
          #super.merge(released_on: released_at.to_date)
        end
      end
      
      respond_to :json

      def index
        respond_with Allergy.all
      end

      def show
        respond_with Allergy.find(params[:id])
      end

      def create
        respond_with Allergy.create(params[:allergy])
      end

      def update
        respond_with Allergy.update(params[:id], params[:allergy])
      end

      def destroy
        respond_with Allergy.destroy(params[:id])
      end
    end
  end
end
