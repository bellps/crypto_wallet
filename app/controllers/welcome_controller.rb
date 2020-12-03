class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - JZABEKKA"
    session[:teste] = "uma session"
    @nome = params[:nome]
    @pesquisa = params[:search]
  end
end
