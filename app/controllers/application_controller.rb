class ApplicationController < ActionController::Base
  protect_from_forgery

  # GET /:controlador/autocompletar/:atributo
  def autocompletar(modelo, atributo)
    render json: lista_para_autocompletar(modelo, atributo)
  end

  private

    # Devuelve una lista de coincidencias con el término de búsqueda para usar
    # en el autocomplete de JQuery-UI. Cada controlador llama al método con un
    # Modelo
    def lista_para_autocompletar(modelo, atributo)
      # Uso ARel porque me permite ignorar que el LIKE es case-sensitive en
      # PostgreSQL pero insensitive en otros motores. En PostgreSQL se usa ILIKE
      # para comparaciones case-insensitive (es una extensión exclusiva de
      # PostgreSQL)
      if params[:term]
        conjunto = modelo.where modelo.arel_table[atributo].matches("%#{params[:term]}%")
      else
        conjunto = modelo.all
      end
      lista = conjunto.map {|elemento| Hash[:id => elemento.id,
                                            :label => elemento.send(atributo),
                                            "#{atributo}" => elemento.send(atributo)]}
    end

end
