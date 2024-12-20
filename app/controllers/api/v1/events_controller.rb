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

      def create_attendance
        event = Event.find_by!(url_id: params[:id])

        ActiveRecord::Base.transaction do
          participant = event.participants.create!(
            name: params[:participant][:name]
          )

          params[:participant][:attendances].each do |attendance_params|
            Attendance.create!(
              participant: participant,
              event_date_id: attendance_params[:event_date_id],
              status: attendance_params[:status],
              comment: params[:participant][:comment]
            )
          end

          render json: { message: '出欠を登録しました' }, status: :created
        end

      rescue ActiveRecord::RecordInvalid => e
        render json: { error: e.message }, status: :unprocessable_entity
      rescue => e
        Rails.logger.error "エラー発生: #{e.class} - #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
        render json: { errors: e.message }, status: :internal_server_error
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
