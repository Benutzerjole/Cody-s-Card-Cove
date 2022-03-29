class ContactController < ApplicationController
  def index
    @about = AboutInfo.first
  end
end
