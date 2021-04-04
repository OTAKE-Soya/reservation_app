Rails.application.routes.draw do
  scope module: :users do
    resources :reservations
    resource :user, only: [:edit, :show, :update] do
      resource :timetable, only: [:edit]
      resources :timetables, only: [:create, :destroy]
    end
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, path: "", controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
