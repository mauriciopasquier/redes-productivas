class ProductoDecorator < Draper::Base
  decorates :producto

  # Devuelve el label para .dot
  def label
    html =  "<div>"
    html +=   "<a href='#{h.url_for(producto)}'>#{nombre}</a> "
    html +=   "<img  alt='#{h.image_alt 'fugue-icons/wooden-box.png'}'"
    html +=         "src='#{h.image_path 'fugue-icons/wooden-box.png'}' />"
    html += "</div>"
  end

  def id_nodo
    "p#{producto.id}"
  end

end
