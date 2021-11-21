class CodesController < ApplicationController

    def index
        @codes = Code.includes(:user).with_attached_image.order('created_at DESC')
    end
    
end
