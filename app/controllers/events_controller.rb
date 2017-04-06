class EventsController < ApplicationController
	before_action :set_event,:only=>[:show,:edit,:update,:destroy]

	def index
		@events=Event.page(params[:page]).per(5)

	end
	def new
		@event=Event.new
		
	end
	def create
		@event=Event.new(event_params)
		if @event.save
		flash[:scs]='新增成功'
		redirect_to :action=>:index
			
		else
		flash[:alt]='新增失敗'

			render :action=>:new
		end
	end
	
	def show
		#@event=Event.find(params[:id])
		@page_title=@event.name
		
	end
	def edit
		#@event=Event.find(params[:id]) #渲染資料


	end
	def update
		
		if @event.update(event_params)
		flash[:scs]='修改成功'

			redirect_to :action=>:index

		else
		flash[:alt]='修改失敗'

			render :action=>:edit
		end
	end
	def event_params
		params.require(:event).permit(:name,:description)
		
	end
	def destroy
		@event.destroy
		redirect_to :action=>:index
		
	end
	def set_event

		@event=Event.find(params[:id])
	end
end
