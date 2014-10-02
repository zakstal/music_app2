MusicApp::Application.routes.draw do
  resources :users, only: [:create, :new, :show, :index]
  resource :session, only: [:create, :new, :destroy]
  resources :bands, only: [:index, :create, :new, :show, :update, :edit, :destroy] do
    resources :albums, only: [:show]
  end
  resources :albums, only: [:index, :create, :new, :edit, :show, :destroy] do
    resources :tracks, only: [:show]
  end
  resources :tracks, only: [:index, :create, :new, :edit, :show, :destroy]

end
