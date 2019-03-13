class HomeController < ApplicationController
  def index
    @users = ExecuteSql.run "select * from users", mode: :raw
  end
end
