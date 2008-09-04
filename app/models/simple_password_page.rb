class SimplePasswordPage < Page
  
  description %{
    A "Simple Password Page" page can be used to 
        
    Quote strings with ambiguous meaning in YAML including (not limited) to:
    "!abc", "foo:bar", "null", "true", "false", "yes", "no", "on", "off"
    (see http://yaml.org/spec/1.2/#id2588633 and 
     http://en.wikipedia.org/wiki/YAML#Pitfalls_and_implementation_defects)
    
  }

  def cache?
    false
  end

  def config
    string = render_part(:config)
    @config ||= string.blank? ? {} : YAML::load(string)
  end
  
  def user
    config['user'].to_s
  end
  
  def password
    config['password'].to_s
  end
  
  def realm
    config['realm'] || "Application"
  end
  
end
