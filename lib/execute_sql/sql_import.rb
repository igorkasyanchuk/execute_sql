module ExecuteSql
  class SqlImport
    include Connection

    attr_reader :time, :result

    def initialize(file)
      @file = file
    end

    def valid?
      if @file.nil?
        raise ExecuteSqlError.new('Please select valid SQL file and continue')
      end
    end

    def import
      valid?
      @time   = Database.adapter.execute(@file.read)
      @result = Result.ok
    rescue ExecuteSqlError, ActiveRecord::StatementInvalid => e
      @result = Result.new(e)
    end

  end
end