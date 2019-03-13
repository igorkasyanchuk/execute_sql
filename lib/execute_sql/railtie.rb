module ExecuteSql
  class Railtie < ::Rails::Railtie

    console do
      TOPLEVEL_BINDING.eval('self').extend ExecuteSql::ConsoleMethods
    end

  end
end