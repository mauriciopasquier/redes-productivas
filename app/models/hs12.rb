class Hs12 < ActiveRecord::Base
  attr_accessible :codigo, :descripcion

  has_many :productos

  validate :codigo_de_bienes

  private

    # Valida los código de tipo +dddd.dd+ donde +d+ es un dígito. Esta forma es
    # exclusiva de los códigos de los bienes en sí y no de las categoría que los
    # agrupan
    def codigo_de_bienes
      errors.add(:codigo, :de_bienes) unless codigo =~ /\A\d{4}\.\d{2}\Z/
    end

end
