module Bootstrap
  module ViewHelpers
    class Engine < ::Rails::Engine
      isolate_namespace Bootstrap::ViewHelpers
    end
  end
end
