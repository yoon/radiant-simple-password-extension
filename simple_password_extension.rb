require_dependency 'site_controller_ext'

class SimplePasswordExtension < Radiant::Extension
  version "0.1"
  description %{
    SimplePassword uses http basic authentication to be viewed. 
    Username and password are set up in the 'config' page part
  }
  url "git://github.com/yoon/radiant-simple-password-extension.git"

  def activate
    SiteController.send :include, SimplePassword::SiteControllerExt
    SimplePasswordPage
  end
  
  def deactivate
  end
  
end
