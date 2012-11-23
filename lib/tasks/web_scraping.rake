#encoding: utf-8

Bundler.require :scraping

namespace :trademap do

  desc "Insertar en la base de datos los nomencladores HS12 desde TradeMap."
  task :hs12 => :environment do
    puts "Inicializando...\n"

    navegador = Watir::Browser.new :ff
    navegador.goto "http://www.trademap.org/stCorrespondingProductCodes.aspx"
    navegador.select_list(name: "ctl00$HeaderContent$HeadControl$DDL_Language").select("Español")
    tabla = navegador.table id: "ctl00_PageContent_MyGridView1"

    nomencladores = Array.new
    numero_pagina = 1

    begin
      loop do
        puts "  Página #{numero_pagina}"

        Nokogiri::HTML(tabla.html).xpath("//tr")[4..-3].each do |fila|
          codigo, descripcion = fila.xpath("td")[3..4].map(&:text)
          nomencladores <<  Hs12.new(
                              codigo: codigo.strip,
                              descripcion: descripcion.capitalize.tr("'", "") )
        end

        fallos = Hs12.import nomencladores, validate: true
        binding.pry
        nomencladores.clear
        numero_pagina += 1
        navegador.link(href: /Page\$#{numero_pagina}/).click
      end
    rescue Watir::Exception::UnknownObjectException
      #puts "No hay más páginas."
    end

    navegador.close

    puts "\nTarea completada."
  end
end
