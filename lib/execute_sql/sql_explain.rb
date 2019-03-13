module ExecuteSql
  class SqlExplain < SqlQueryData

    def sql
      "EXPLAIN #{super}"
    end

  end
end