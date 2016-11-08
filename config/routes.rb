Rails.application.routes.draw do

  
  get '/', to: redirect('/users')

  resources :users do
    collection do
      post :draw
    end
  end

end
