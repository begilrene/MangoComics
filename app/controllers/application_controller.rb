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
  def superpermission
    unless is_owner || current_user.permission.to_i > 1
    redirect_back_or root_url
    end
  end
end
