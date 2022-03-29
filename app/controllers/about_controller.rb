class AboutController < ApplicationController
  def index
    @about = AboutInfo.first
  end
end
