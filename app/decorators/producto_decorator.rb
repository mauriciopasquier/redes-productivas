class ProductoDecorator < Draper::Base
  decorates :producto

  # Devuelve el label para .dot
  def label
    html =  "<div>"
    html +=   "<img  alt='#{h.image_alt 'fugue-icons/wooden-box.png'}' src='#{h.image_path 'fugue-icons/wooden-box.png'}' />"
    html +=   "<a class='menu' href='#'>#{nombre}</a>"
    html += "</div>"
  end

  def id_nodo
    "p#{producto.id}"
  end

end
