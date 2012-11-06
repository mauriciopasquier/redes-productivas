class ActividadDecorator < Draper::Base
  decorates :actividad

  # Devuelve el label para .dot
  def label
    html =  "<span>"
    html +=   "<a href='#{h.url_for(actividad)}'>#{nombre}</a> "
    html +=   "<img  alt='#{h.image_alt 'fugue-icons/gear.png'}'"
    html +=         "src='#{h.image_path 'fugue-icons/gear.png'}' />"
    html += "</span>"
  end

  def id_nodo
    "a#{actividad.id}"
  end

end
