class PoolsController < ApplicationController
    before_action :set_pool, only: [:show, :edit, :update, :destroy]
    
    def index
        
    end

    def new
        @pool = Pool.new
    end


    private
        def set_pool
            @pool = Pool.find(params[:id])
        end

        def pool_params
             params.require(:pool).permit(:user_id,:schedule_id,:name)
        end
end
