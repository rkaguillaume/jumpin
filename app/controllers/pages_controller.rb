class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
    @lines = Line.all
  end

  def account

  end

  def add_app

  end
end
