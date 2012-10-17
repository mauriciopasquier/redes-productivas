# encoding: utf-8
# Nomenclador de la Clasificación Industrial Internacional Uniforme de todas
# las Actividades Económicas (CIIU). Formato: código@descripción@comentario
# (este último es opcional)

File.open('db/semillas/actividades.txt') do |actividades|

  puts "Cargando actividades..."

  actividades.each do |actividad|
    actividad.chomp!
    codigo, descripcion, comentario = actividad.split('@')
    Ciiu.find_or_create_by_codigo(codigo) do |ciuu|
      ciuu.descripcion = descripcion
      ciuu.comentario = comentario
    end
  end
end
