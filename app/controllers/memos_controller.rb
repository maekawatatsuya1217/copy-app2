class MemosController < ApplicationController

    before_action :authenticate_user!

    def index
        @memos = current_user.memos
    end

    def new
        @memo = Memo.new
    end

    def create
        @memo = current_user.memos.new(memo_params)
        if @memo.save
            redirect_to tasks_path
        else
            render :new
        end
    end

    private

    def memo_params
        params.require(:memo).permit(:title, :description)
    end
end
