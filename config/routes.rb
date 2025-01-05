Rails.application.routes.draw do
  Rails.application.routes.draw do
    get 'rolldice', to: 'dice#roll'
  end
  root "dice#roll"
end
