# encoding: utf-8
FactoryGirl.define do
  factory :hs12 do
    codigo { generate :cadena_unica }
    descripcion "sarasa"
    comentario  "sarasa"
  end
end
