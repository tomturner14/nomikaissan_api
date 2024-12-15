module Api
  module V1
    class EventsController < ApplicationController
      def index
        events = Event.all
        render json: events
      end

      def show
        event = Event.find_by!(url_id: params[:id])
        render json: event, include: [:event_dates]
      end

      def create
        Rails.logger.info "Received params: #{params.inspect}"
        event = Event.new(event_params)

        if event.save
          Rails.logger.info "Event saved successfully: #{event.inspect}"
          render json: event, status: :created
        else
          Rails.logger.error "Event save failed: #{event.errors.full_messages}"
          render json: { errors: event.errors.full_messages }, status: :unprocessable_entity
        end
      rescue => e
        Rails.logger.error "Error in create: #{e.message}\n#{e.backtrace.join("\n")}"
        render json: { error: e.message }, status: :internal_server_error
      end

      def update
        event = Event.find(params[:id])
        if event.update(event_params)
          render json: event
        else
          render json: event.errors, status: :unprocessable_entity
        end
      end

      def destroy
        event = Event.find(params[:id])
        event.destroy
        head :no_content
      end

      private

      def event_params
        params.require(:event).permit(
          :name,
          :memo,
          :url_id,
          event_dates_attributes: [:date]
        )
      end
    end
  end
end
