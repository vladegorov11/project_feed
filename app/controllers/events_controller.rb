class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_event, only: [:destroy, :show, :edit, :favorite]

  def index
     @events = Event.all

  end

  def show

  end

  def edit

  end
  private

    def set_event
      @event = Event.find(params[:id])
    end

end
