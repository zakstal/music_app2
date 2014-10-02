MusicApp::Application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resource :band do
    # post :new
  end
  resource :album
  resource :track

end
