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
end
