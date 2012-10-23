class Ciiu < ActiveRecord::Base
  attr_accessible :comentario, :descripcion, :codigo

  has_many :actividades
end
