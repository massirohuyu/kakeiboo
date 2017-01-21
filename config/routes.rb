Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'application#hello'
end
