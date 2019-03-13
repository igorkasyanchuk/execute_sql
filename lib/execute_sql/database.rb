module ExecuteSql
  class Database
    extend Connection

    class << self
      delegate :execute,     to: :adapter
      delegate :select,      to: :adapter
      delegate :explain,     to: :adapter
      delegate :exec_query,  to: :adapter
    end

    def self.adapter
      case connection.class.to_s
      when /Mysql/
        ExecuteSql::Adapters::Mysql
      when /Postgre/
        ExecuteSql::Adapters::Postgres
      when /SQLite/
        ExecuteSql::Adapters::Sqlite
      else
        ExecuteSql::Adapters::BaseAdapter
      end
    end

  end
end