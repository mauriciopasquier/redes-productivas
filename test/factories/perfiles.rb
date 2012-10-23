# encoding: utf-8
FactoryGirl.define do
  factory :actividad do
    nombre { generate :cadena_unica }
    descripcion "sarasa"

    ciiu

  end
end
