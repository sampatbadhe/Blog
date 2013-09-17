class CommentsController < ApplicationController
	http_basic_authenticate_with :name => "admin", :password => "secret", :only => :destroy
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		if @comment.save
			comment = nil
			redirect_to post_path(@post)
		else 
			@post.reload
			render template: "posts/show"
		end
	end
	

	
	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

end
