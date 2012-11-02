# encoding: utf-8
FactoryGirl.define do
  factory :hs12 do
    codigo {
      "#{rand(9999).to_s.rjust(4, '0')}.#{rand(99).to_s.rjust(2, '0')}"
    }
    descripcion "sarasa"
  end
end
