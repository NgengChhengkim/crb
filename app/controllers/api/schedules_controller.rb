class Api::SchedulesController < ApplicationController
  load_and_authorize_resource

  def index
    if(room_id.nil?)
      schedules = Schedule.filter_by_room_nil
    else
      schedules = Schedule.filter_by_room_not_nil params[:room_id]
    end
    respond_to do |format|
      format.json {render json: {schedules: schedules.map(&:min_json)}, status: :ok}
    end
  end
end
