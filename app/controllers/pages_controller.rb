class PagesController < ApplicationController
  def home
    Rails.logger.info('Hitting the home page now!')
  end
end
