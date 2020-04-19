ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :photo
  #
  # or
  #
  permit_params do
    permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :photo, :suspended]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do 
    column :id 
    column :email
    column :name
    column :member_since do |user|
      user.created_at.strftime('%F')
    end
    column :tweets do |user|
      user.tweets.count
    end
    
    actions 
  end
end
