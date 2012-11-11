#encoding: utf-8

namespace :trademap do

  desc 'Insertar en la base de datos los nomencladores HS12 desde TradeMap.'
  task :hs12 => :environment do
    puts "Inicializando..."
    
    navegador = Watir::Browser.new :ff
    navegador.goto 'http://www.trademap.org/stCorrespondingProductCodes.aspx'
    navegador.select_list(:name, 'ctl00$HeaderContent$HeadControl$DDL_Language').select('Español')
    tabla = navegador.table(:id, 'ctl00_PageContent_MyGridView1')
    
    nomencladores = Array.new

    begin
      pagina = 1
      loop do
        puts "  Página #{pagina}"
        begin
          fila = 3 # La primera fila es la tercera.
          loop do
            nomencladores << "('#{tabla[fila][3].text}', '#{tabla[fila][4].text.capitalize}')"
            puts "    Fila #{fila}"
            fila += 1
          end
        rescue Watir::Exception::UnknownObjectException
          puts "¡Rescate de fila!"
        end
        
        pagina += 1
        navegador.link(:text => pagina.to_s).click
      end
    rescue Watir::Exception::UnknownObjectException
      puts "¡Rescate de página!"
    end

    puts 'Escribiendo en la base de datos...'
    
    ActiveRecord::Base.connection.execute "INSERT OR REPLACE INTO hs12s (codigo, descripcion) VALUES #{nomencladores.join(', ')}"
    
    puts 'Tarea completada.'
  end
end
