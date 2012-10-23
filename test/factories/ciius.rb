# encoding: utf-8
FactoryGirl.define do
  factory :ciiu do
    codigo { generate :cadena_unica }
    descripcion "sarasa"
    comentario  "sarasa"
  end
end
