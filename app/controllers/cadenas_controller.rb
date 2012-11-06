class CadenasController < ApplicationController
  # GET /cadenas
  # GET /cadenas.json
  def index
    @cadenas = Cadena.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadenas }
    end
  end

  # GET /cadenas/1
  # GET /cadenas/1.json
  def show
    @cadena = CadenaDecorator.new(Cadena.find(params[:id]))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadena }
      format.dot  { render text: @cadena.to_dot }
    end
  end

  # GET /cadenas/new
  # GET /cadenas/new.json
  def new
    @cadena = CadenaDecorator.new(Cadena.new)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cadena }
    end
  end

  # GET /cadenas/1/edit
  def edit
    @cadena = CadenaDecorator.new(Cadena.find(params[:id]))
  end

  # POST /cadenas
  # POST /cadenas.json
  def create
    @cadena = Cadena.new(params[:cadena])

    respond_to do |format|
      if @cadena.save
        format.html { redirect_to cadena_o_relaciones,
                                  notice: 'Cadena was successfully updated.' }
        format.json { render json: @cadena, status: :created, location: @cadena }
      else
        @cadena = CadenaDecorator.new(@cadena)
        format.html { render action: "new" }
        format.json { render json: @cadena.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadenas/1
  # PUT /cadenas/1.json
  def update
    @cadena = Cadena.find(params[:id])

    respond_to do |format|
      if @cadena.update_attributes(params[:cadena])
        format.html { redirect_to cadena_o_relaciones,
                                  notice: 'Cadena was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadena.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadenas/1
  # DELETE /cadenas/1.json
  def destroy
    @cadena = Cadena.find(params[:id])
    @cadena.destroy

    respond_to do |format|
      format.html { redirect_to cadenas_url }
      format.json { head :no_content }
    end
  end

  private

    # Determina la ruta a la que reenvia
    def cadena_o_relaciones
      params[:relaciones].present? ? cadena_relaciones_url(@cadena) : @cadena
    end

end
