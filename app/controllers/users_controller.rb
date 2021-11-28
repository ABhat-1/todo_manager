class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.
    join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password
    )
    response_text = "Hey, your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    user = User.where("email = ? and password = ?", params[:email], params[:password])
    if user.present?
      render plain: "True"
    else
      render plain: "False"
    end
  end

end
