require 'test_helper'

class ExecuteSql::Test < ActiveSupport::TestCase
  test "works" do
    User.create(name: 'John', age: 20)
    User.create(name: 'Bob', age: 25)
    User.create(name: 'Michael', age: 30)
    ExecuteSql.execute_sql("SELECT * from users")
    ExecuteSQL.execute_sql("SELECT * from users where age > 26")
    puts ExecuteSQL.run("SELECT * from users where age > 26", mode: :single)
    puts ExecuteSQL.run("SELECT * from users where age > 26", mode: :raw)
    puts ExecuteSQL.run("SELECT * from users where age > 26", mode: :none)
  end
end
