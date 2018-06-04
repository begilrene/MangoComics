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
<<<<<<< HEAD
    unless current_user.permission > 1
=======
    unless is_owner || current_user.permission.to_i > 1
>>>>>>> b50c34b725feffc2f1da430463191e1114e1e9b3
    redirect_back_or root_url
    end
  end
end
