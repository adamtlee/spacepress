class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end 

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find params[:id]
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        respond_to do |format|
            if @article.save
            @article.save
                format.html { redirect_to @article, notice: 'Article was successfully created.' }
                format.json { render :show, status: :created, location: @article }
            else
                format.html { render :new}
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        @article = Article.find params[:id]
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to @article, notice: 'Article was successfully updated.' }
                format.json { render :show, status: :ok, location: @article }
            else
                format.html { render :edit }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @article = Article.find params[:id]
        @article.destroy
        respond_to do |format|
            format.html { redirect_to articles_url, notice: 'Article was successfully destroyed' }
            format.json { head :no_content } 
        end
    end

    private

        def set_article
            @article = Article.find(params[:id])
        end
        def article_params
            params.require(:article).permit(:title, :description, :excerpt)
        end
end
