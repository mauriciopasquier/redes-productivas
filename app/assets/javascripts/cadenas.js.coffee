jQuery ->

  # Autocompletar
  # =============
  comun =
    delay:      100
    autoFocus:  true
    minLenght:  2

  productos =
    source: "/productos/autocompletar/nombre"

  actividades =
    source: "/actividades/autocompletar/nombre"

  # extendemos los objetos con las características comunes
  $.extend productos, comun
  $.extend actividades, comun

  $('.producto').autocomplete productos
  $('.actividad').autocomplete actividades

  $('form.cadena').nestedFields({
    containerSelector: 'tbody',
    itemSelector: 'tr'
  })
