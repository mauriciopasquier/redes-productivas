# encoding: utf-8
FactoryGirl.define do
  factory :producto do
    nombre { generate :cadena_unica }
    descripcion "sarasa"

    #hs12

  end
end
