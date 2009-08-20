require_dependency 'application_controller'
require_dependency 'site_controller_ext'


class SimplePasswordExtension < Radiant::Extension
  version "0.1"
  description %{
    A "Simple Password Page" page protects contents with HTTP Basic 
    Authentication. The user name, password, and realm are set up in
    the "config" page part with the following YAML format:

    user: foo
    password: secret
    realm: kingdom

    You will need to quote strings with ambiguous meaning in YAML including 
    (not limited) to: "!abc", "foo:bar", "null", "true", "false", "yes", 
    "no", "on", "off" (see http://yaml.org/spec/1.2/#id2588633 and 
    http://en.wikipedia.org/wiki/YAML#Pitfalls_and_implementation_defects)

    SimplePasswordExtension depends on the authenticate_with_http_basic and
    request_http_basic_authentication methods, introduced with Rails 2, and
    Radiant > 0.6.5.
  }
  url "git://github.com/yoon/radiant-simple-password-extension.git"

  def activate
    SiteController.send :include, SimplePassword::SiteControllerExt
    SimplePasswordPage
  end
  
  def deactivate
  end
  
end
