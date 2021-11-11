class MemosController < ApplicationController

    before_action :authenticate_user!

    def index
        @memos = current_user.memos
    end

    def show
        @memo = target_memo params[:id]
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

    def edit
        @memo = target_memo params[:id]
    end

    def update
        @memo = target_memo params[:id]
        if @memo.update(memo_params)
            redirect_to @memo
        else
            render :edit
        end
    end

    private

    def memo_params
        params.require(:memo).permit(:title, :description)
    end

    def target_memo memo_id
        current_user.memos.where(id: memo_id).take
    end
end
