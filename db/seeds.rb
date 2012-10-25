# encoding: utf-8
require 'csv'
# En este archivo va la carga inicial de datos. La mayoría de estos datos
# residen en db/semillas/, en diferentes archivos y formatos. Acá se realiza la
# carga.

# # Soporte
#
# Carga el archivo en formato csv +archivo+,  del directorio +semillas+, que
# tiene datos iniciales para la base de datos.
def cargar_csv_de(archivo, configuracion = {})
  begin
    puts "Cargando CSV de #{archivo} ..."
    CSV.foreach "db/semillas/#{archivo}.csv", configuracion do |fila|
      yield fila
    end
  rescue Exception => e
    puts "No se pudo abrir #{archivo}: #{e}"
  end
end

# # CIIU
#
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

# # HS12
#
cargar_csv_de 'hs2012_11', headers: true, col_sep: ';' do |fila|
  Hs12.find_or_create_by_codigo fila[2] do |nuevo|
    nuevo.descripcion = fila[3]
  end
end
