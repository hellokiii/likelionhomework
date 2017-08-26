class HomeController < ApplicationController
    def index
        unless user_signed_in?
            redirect_to '/users/sign_in'
        end
        @all_post = Post.all
    end
    
    def create
       Post.create(title: params[:title], 
                   content: params[:content])
       redirect_to '/home/index'
    end
    
    def reply
        Reply.create(content: params[:cc],
                     post_id: params[:pi])
        redirect_to '/home/index'
    end
    
end
