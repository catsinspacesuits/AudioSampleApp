ActiveAdmin.register User do
  permit_params :email, :reset_password_sent_at, :remember_created_at, :admin, :confirmed_at, :confirmation_sent_at

end
