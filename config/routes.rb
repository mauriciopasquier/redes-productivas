# encoding: utf-8
Tesla::Application.routes.draw do

  # Rutas en castellano (i.e. perfiles/nuevo, perfiles/2/editar)
  m = { new: "nuevo", edit: "editar" }
  f = { new: "nueva", edit: "editar" }

  resources :actividades, path_names: f

  resources :productos, path_names: m

  resources :cadenas, path_names: f do
    resources :relaciones, path_names: f
  end

end
