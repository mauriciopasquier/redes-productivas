# encoding: utf-8
FactoryGirl.define do
  factory :cadena do
    nombre { generate :cadena_unica }
  end
end
