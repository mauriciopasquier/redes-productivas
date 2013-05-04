#encoding: utf-8

namespace :trademap do


  desc "Valores exportados e importados por producto, Argentina-Mundo."
  task :valores do
    navegador = Watir::Browser.new :ff
    navegador.goto "http://www.trademap.org/stCorrespondingProductCodes.aspx"
    navegador.select_list(name: "ctl00$HeaderContent$HeadControl$DDL_Language").select("Español")
    tabla = navegador.table id: "ctl00_PageContent_MyGridView1"


  end

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
        #numero_fila = 1
            
        Nokogiri::HTML(tabla.html).xpath("//tr")[4..-3].each do |fila|
          codigo, descripcion = fila.xpath("td")[3..4].map(&:text)
          nomencladores << "('#{codigo.strip}', '#{descripcion.capitalize.tr("'", "")}')"
          #puts "    Fila #{numero_fila}"
          #numero_fila += 1
        end
        
        ActiveRecord::Base.connection.execute "INSERT OR REPLACE INTO hs12s (codigo, descripcion) VALUES #{nomencladores.join(", ")}"
        
        nomencladores.clear
        numero_pagina += 1
        navegador.link(href: /Page\$#{numero_pagina}/).click
      end
    rescue Watir::Exception::UnknownObjectException
      #puts "No hay más páginas."
    end
    
    puts "\nTarea completada."
  end
end
