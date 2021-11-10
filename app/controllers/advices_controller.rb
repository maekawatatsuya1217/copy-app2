class AdvicesController < ApplicationController

    before_action :authenticate_user!

    def index
        @advices = current_user.advices
    end

    def show
        @advice = target_advice params[:id]
    end

    def new
        @advice = Advice.new
    end

    def create
        @advice = current_user.advices.new(advice_params)
        if @advice.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    def edit
        @advice = target_advice params[:id]
    end

    def update
        @advice = target_advice params[:id]
        if @advice.update(advice_params)
            redirect_to @advice
        else
            render :edit
        end
    end

    def destroy
        @advice = target_advice params[:id]
        @advice.destroy
        redirect_to tasks_url
    end

    private

    def advice_params
        params.require(:advice).permit(:title, :description)
    end

    def target_advice advice_id
        current_user.advices.where(id: advice_id).take
    end
end
