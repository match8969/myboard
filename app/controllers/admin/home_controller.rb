class Admin::HomeController < ApplicationController
  def index
    # TODO: test
    TvProgramService.fetch_tv_programs
  end
end
