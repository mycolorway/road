Road::Application.routes.draw do
  devise_for :users

  # ---------
  # resources
  # ---------
  resources :stories, shallow: true, constraints: { id: /\d+/ } do
    collection do
      get :by_bounds, :by_keyword
    end

    resources :path_nodes, :pois, :photos
  end

  # ----
  # misc
  # ----
  root to: 'stories#index'

end
