Rails.application.routes.draw do

  mount WebiniusCms::Engine => "/"

  post 'contact_mail', to: 'mailings#send_contact_email', as: 'contact_mail'
end
