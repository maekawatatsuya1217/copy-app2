class MemosController < ApplicationController

    before_action :authenticate_user!

    def index
        @memos = current_user.memos
    end

    
end
