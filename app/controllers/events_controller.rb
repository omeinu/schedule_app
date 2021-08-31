class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params.require(:event).permit(:title,:start_date,:end_date,:all_day,:memo))
    if @event.save
      flash[:notice] ="スケジュールを新規登録しました"
      redirect_to(:events)
    else
      render"new"
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(params.require(:event).permit(:title,:start_date,:end_date,:all_day,:memo))
      flash[:notice] = "イベントIDが「#{@event.id}」の情報を更新しました"
      redirect_to(:events)
    else
      render"edit"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "イベントを削除しました"
    redirect_to(:events)
  end
  
  
  
  
end
