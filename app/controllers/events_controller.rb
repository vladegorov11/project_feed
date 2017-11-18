class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:destroy, :show, :edit]

  def index
     @events = Event.all

  end

  def show

  end

  def edit

  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, success: 'Событие успешно удалено' }
      format.json { head :no_content }
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

end
