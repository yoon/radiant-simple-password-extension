module SimplePassword
  module SiteControllerExt
    def self.included(base)
      base.class_eval {
        include InstanceMethods
        alias_method_chain :process_page, :simple_password
      }
    end
  
    module InstanceMethods
    
      protected
  
      def process_page_with_simple_password(page)
        if page.class == SimplePasswordPage
          if authenticate_with_http_basic { |u, p| u == page.user && p == page.password }
            page.process(request, response)
          else
            request_http_basic_authentication( page.realm )
          end
        else
          page.process(request, response)
        end
      end
    end
  end
end
