require 'terminal-table'

require_relative 'execute_sql/connection'
require_relative 'execute_sql/database'
require_relative 'execute_sql/blank_results'
require_relative 'execute_sql/mysql_result'
require_relative 'execute_sql/result'
require_relative 'execute_sql/execute_sql_error'

require_relative 'execute_sql/sql_query_data'
require_relative 'execute_sql/sql_explain'
require_relative 'execute_sql/sql_import'
require_relative 'execute_sql/sql_query'

require_relative 'execute_sql/adapters/base_adapter'
require_relative 'execute_sql/adapters/mysql'
require_relative 'execute_sql/adapters/postgres'
require_relative 'execute_sql/adapters/sqlite' 

require "execute_sql/railtie"

module ExecuteSql
  module ConsoleMethods
    
    def execute_sql(sql, mode: :print)
      sql_query = ExecuteSql::SqlQuery.new("#{sql}".strip).execute
      rows = sql_query.data.rows
      cols = sql_query.data.columns
      case mode.to_s
      when 'print'
        puts Terminal::Table.new(rows: rows, headings: cols)
      when 'raw'
        rows
      when 'single'
        rows.flatten[0]
      when 'none'
        nil
      else
        []
      end
    end

    def run(sql, *args)
      execute_sql(sql, *args)
    end
  end

  extend ConsoleMethods
end

ExecuteSQL = ExecuteSql