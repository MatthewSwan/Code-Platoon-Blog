class WelcomeController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').all
  end
end
