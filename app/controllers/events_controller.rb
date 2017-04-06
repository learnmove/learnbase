class EventsController < ApplicationController
	before_action :set_event,:only=>[:show,:edit,:update,:destroy]

	def index
		@events=Event.page(params[:page]).per(5)
		respond_to do |format|
			format.html
			format.xml{
				render :xml=>@events.to_xml
			}
			format.json{
				render :json=>@events.to_json
			}
		end
	end
	def new
		@event=Event.new
		
	end
	def create
		@event=Event.new(event_params)
		if @event.save
		flash[:scs]='新增成功'
		redirect_to events_path
			
		else
		flash[:alt]='新增失敗'

			render :action=>:new
		end
	end
	
	def show
		#@event=Event.find(params[:id])
		@page_title=@event.name
		respond_to do |format|
			format.html
			format.xml{
				render :xml=>@event.to_xml
			}
			format.json{
				# render :json=>@event.to_json
				render :json=>{id:@event.id,name:@event.name}
			}
		end
		
	end
	def edit
		#@event=Event.find(params[:id]) #渲染資料


	end
	def update
		
		if @event.update(event_params)
		flash[:scs]='修改成功'

			redirect_to events_path

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
		redirect_to events_path
		
	end
	def set_event

		@event=Event.find(params[:id])
	end
end
