class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    client = Issue.first.all
    render html: client
  end
end
