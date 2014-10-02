MusicApp::Application.routes.draw do
  resources :user, only: [:create, :new]
  resources :session, only: [:create, :new, :destroy]
end
