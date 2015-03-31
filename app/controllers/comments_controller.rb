class CommentsController < ApplicationController

def index
	@comments = current_user.comments
end

def new
	@comment = Comment.new
end

def create
	@comment = Comment.new(comment_params)
	@comment.user = current_user

	if @comment.save
		redirect_to comments_path
	else
		render :new
	end
end

def edit
	@comment = current_user.comments.find(params[:id])
end

def update
	@comment = current_user.comment.find(params[:id])


if @comment.update_attributes(comment_params)
	redirect_to comments_path
elsegit add
	render :edit
	end
end

def comment_params
	params.require( :comment).permit( :body)


end