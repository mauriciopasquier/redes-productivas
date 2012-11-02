# encoding: utf-8
FactoryGirl.define do
  factory :cadena do
    nombre { generate :cadena_unica }

    factory :cadena_con_relaciones do
      # por default 5 relaciones (ignore es para que no trate de agregarlo al
      # objeto Cadena generado
      ignore do
        relaciones 5
      end

      # sólo podemos usar esta fábrica con create, para la relación habtm
      after(:create) do |este_objeto, evaluator|
        FactoryGirl.create_list(:relacion, evaluator.relaciones,
                                cadenas: [este_objeto])
      end

    end
  end
end
