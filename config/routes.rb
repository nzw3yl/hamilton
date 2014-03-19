Hamilton::Application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, :controllers => {:registrations => "registrations"}
    resources :users
    root to:  "home#index"
  end
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  get '', to: redirect("/#{I18n.default_locale}")
end