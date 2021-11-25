class UsersController < ApplicationController
  skip_before_action: ensure_user_logged_in
  name=params[:name]
  email=params[:email]
  password=params[:password]

  def index
    render plain: Users.all.map{|user| user.to_pleasant_string}.join("\n")

  def create
    new_user=Users.create!(
      name: name,
      email: email,
      password: password
    )
    response_text="Hey, your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    user=Users.find_by_email(params[:email])
    if user.present? && user.authenticate(params[:password])
      render plain: "True"
    else
      render plain: "False"
    end
  end
      
end
