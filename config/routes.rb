Road::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  # ---------
  # resources
  # ---------
  resources :stories, shallow: true, constraints: { id: /\d+/ } do
    collection do
      get :by_bounds, :by_keyword
      get 'by_user/:user_id', action: :by_user, constraints: { user_id: /\d+/ }
    end

    get :poster, on: :member

    resources :path_nodes, :pois, :photos
  end

  # ----
  # misc
  # ----
  root to: 'stories#index'

end
