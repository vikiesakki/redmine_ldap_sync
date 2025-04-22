module LdapSync
  NAMESPACE = name.downcase.to_sym
  PLUGIN_NAME = "redmine_#{NAMESPACE}".to_sym
  PLUGIN_ROOT = Pathname.new(File.join File.dirname(__FILE__), '..').cleanpath

  VERSION = '1.3.0-dev'
end

Dir.glob File.join(LdapSync::PLUGIN_ROOT, 'config', 'initializers', '*'), &method(:require)

if Rails.version >= "5" and Rails.configuration.eager_load
  Dir.glob(File.join(LdapSync::PLUGIN_ROOT, 'lib', 'ldap_sync', "**/*.rb")).sort.each(&method(:require))
end