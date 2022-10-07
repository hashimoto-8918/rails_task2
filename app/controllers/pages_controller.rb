class PagesController < ApplicationController
  def top
  end

  def profile
    @user = current_user
  end
end
