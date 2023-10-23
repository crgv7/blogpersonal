class ArticlesController < ApplicationController

    before_action :find_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
      @articles=Article.all
      @categories=Category.all  
    end

    def show
    end 

    def edit
      @categories=Category.all 
    end
    def update
    @article.update(article_params)
    @article.save_categories

    redirect_to article_path(@article)
    end

    def new
    @article=Article.new
    @categories=Category.all 

    end

    def create
    @article=Article.create(article_params)
    
    @article.save_categories

    redirect_to articles_path(@article)
    
    end
   
    def destroy
        puts "entre----------------------------------"
        @article.destroy
        redirect_to root_path, status: :see_other
    end
  
   def find_article
    puts "busque----------------------------------"
    @article=Article.find(params[:id])
  
   end

   def from_author
    @user=User.find(params[:user_id])
   
    
   end



   private
   def article_params
     params.require(:article).permit(:tittle, :content, category_elements: [])
   end
end
 