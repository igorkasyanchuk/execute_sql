module ExecuteSql
  module Adapters

    class BaseAdapter
      extend ::ExecuteSql::Connection

      MULTI_STATEMENT_HELP_TEXT = "EXPERIMENTAL: You can import only file with SQL statements separated by ';'. Each new statement must start from new line."

      def self.execute(sql)
        t0 = Time.now
        connection.execute(sql)
        Time.now - t0
      end

      def self.exec_query(sql)
        t0 = Time.now
        results = connection.exec_query(sql)
        execution_time = Time.now - t0
        [results, execution_time]
      end

      def self.select(sql)
        BaseAdapter.exec_query(sql)
      end

      def self.explain(sql)
        BaseAdapter.exec_query(sql)
      end

      def self.adapter_name
        'base'
      end

      def self.mime
        'text/x-sql'
      end

      private

      def self.multiple_execute(sql, divider = ";\n")
        sql.split(divider).each do |statement|
          connection.execute(statement)
        end
      end

    end

  end
end