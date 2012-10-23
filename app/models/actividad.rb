class Actividad < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :ciiu_id

  belongs_to :ciiu
end
