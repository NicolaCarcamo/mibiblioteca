class BibliotecaController < ApplicationController
    def index
        @libros = params[:libro]
        render :index
    end
end