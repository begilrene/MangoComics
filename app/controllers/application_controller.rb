class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def hello
    render html: "Hello, world!"
  end
  def comics
    @comiclist = Issue.all
  end
  def editorpermission
    unless current_user.permission.to_i > 0
    redirect_back_or root_url
    end
  end
  def can_delete
    unless current_user.permission > 1 || Comment.find(params[:id]).user_id = current_user.userID
    redirect_back_or root_url
    end
  end
end
