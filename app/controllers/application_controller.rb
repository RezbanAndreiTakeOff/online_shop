class ApplicationController < ActionController::Base

  def hello
    render html: "hello world!"
  end

  def goodbye
    render html: "goodbye world!"
  end

  def extra
    respond_to do |format|
      format.html { render html: "extra" }
      format.json { render :json => { message: "extra" } }
    end
  end

  private
    def check_admin
      if current_user.role != 'admin'
        redirect_to root_path
        return
      end
    end
end
