# encoding: utf-8
FactoryGirl.define do
  factory :relacion do
    # por default producto -> actividad
    association :entrada, factory: :producto
    association :salida,  factory: :actividad

    factory :relacion_actividad_producto do
      association :entrada, factory: :actividad
      association :salida,  factory: :producto
    end

    factory :relacion_producto_actividad do
      # usa el default pero es más legible en los tests
    end
  end
end
