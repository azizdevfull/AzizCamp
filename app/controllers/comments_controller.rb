class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_poster

    def create
        @poster = Poster.find(params[:poster_id])
        @comment = @poster.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment created successfully"
            redirect_to poster_path(@poster)
        else
            flash[:alert] = "Comment not been created"
            redirect_to poster_path(@poster)
        end
    end

    def destroy
        @comment = @poster.comments.find(params[:id])
        @comment.destroy
        redirect_to poster_path(@poster)
    end

    def update
        @comment = @poster.comments.find(params[:id])
    
        respond_to do |format|
          if @comment.update(comment_params)
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
    

    def comment_params
        params.require(:comment).permit(:name)
    end

end
