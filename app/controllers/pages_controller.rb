class PagesController < ApplicationController
  def home
    render json: {message: "Hello world!"}, status: :ok
  end
end
