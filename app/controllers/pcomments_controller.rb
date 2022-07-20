class PcommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_poster

    def create
        @poster = Poster.find(params[:poster_id])
        @pcomment = @poster.pcomments.create(pcomment_params)
        @pcomment.user = current_user

        if @pcomment.save
            flash[:notice] = "Comment created successfully"
            redirect_to poster_path(@poster)
        else
            flash[:alert] = "Comment not been created"
            redirect_to poster_path(@poster)
        end
    end

    def destroy
        @pcomment = @poster.pcomments.find(params[:id])
        @pcomment.destroy
        redirect_to poster_path(@poster)
    end

    def update
        @pcomment = @poster.pcomments.find(params[:id])
    
        respond_to do |format|
          if @pcomment.update(pcomment_params)
            format.html { redirect_to poster_url(@poster), notice: 'Comment has been updated' }
          else
            format.html { redirect_to poster_url(@poster), alert: 'Comment was not updated!' }
          end
        end
      end
    
    private

    def set_poster
        @poster = Poster.find(params[:poster_id])
    end
    

    def pcomment_params
        params.require(:pcomment).permit(:name)
    end

end
