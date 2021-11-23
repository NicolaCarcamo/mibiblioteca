class BibliotecaController < ApplicationController
    skip_before_action :verify_authenticity_token, on: [:index]
    before_action :set_biblioteca, only: [:show, :edit, :update]

    def index
        if params[:estado] == "order"
            @bibliotecas = Biblioteca.order('titulo ASC')
        elsif params[:estado].present?
            @bibliotecas = Biblioteca.where('estado = ?', params[:estado])
        else
            @bibliotecas = Biblioteca.all
        end
    end

    def create
        @biblioteca = Biblioteca.new(biblioteca_params)

        if @biblioteca.save
            redirect_to '/', notice: "Libro guardado de forma éxitosa"
        else
            redirect_to '/', notice: "El libro no se pudo guardar"
        end
    end

    def edit
    end
    
    def update
        if @biblioteca.update(biblioteca_params)
            redirect_to '/', notice: "Libro actualizado éxitosamente"
        else
            flash.now[:notice] = 'El libro no pudo ser actualizado'
            render :edit
        end
    end

    def biblioteca_params
        params.permit(:id, :titulo, :autor, :estado, :fechaprestamo, :fechadevolucion)
    end

    private
        def set_biblioteca
            @biblioteca = Biblioteca.find(params[:id])
        end
end