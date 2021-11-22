class BibliotecaController < ApplicationController
    skip_before_action :verify_authenticity_token, on: [:index]

    def index
        @libros = Biblioteca.all
    end

    def create
        @libro = Biblioteca.new(titulo: params[:titulo], autor: params[:autor], estado: params[:estado], fechaprestamo: params[:fechaprestamo], fechadevolucion: params[:fechadevolucion])

        if @libro.save
            redirect_to '/', notice: "Libro guardado de forma exitosa"
        else
            redirect_to '/'
        end
    end

    def show
        @libro = Libro.find_by(params[:titulo])

        if params[:estado].present?
            @libros = Biblioteca.where('estado = ?', params[:estado])
        elsif params[:titulo].present?
            render 'show_titulo'
        else
            render 'show_default'
        end

    end

    def update
        if @libro.update(params)
            redirect_to '/', notice: "Libro actualizado exitosamente."
        else
            render :edit
        end
    end
end