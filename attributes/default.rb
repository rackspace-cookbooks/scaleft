# 'initial_url_required' is there to preserve backwards compatable
# behavior with the original Rackspace version
# Override it to false to not require 'initial_url' in your
# environment, role or wrapper cookbook
default['scaleft']['initial_url_required'] = true

# Values used to set the sftd.yaml config file
# If set to nil, it won't be written to the file and will use
# ScaleFT Defaults
# Override in your environment, role or wrapper cookbook
# See https://www.scaleft.com/docs/sftd/
#
default['scaleft']['initial_url'] = nil
default['scaleft']['access_address'] = nil
default['scaleft']['alt_names'] = nil
default['scaleft']['auto_enroll'] = true
default['scaleft']['bastion'] = nil
default['scaleft']['canonical_name'] = nil
default['scaleft']['log_level'] = nil
default['scaleft']['buffer_file'] = nil
default['scaleft']['enrollment_token_file'] = nil
default['scaleft']['server_file'] = nil
default['scaleft']['sshd_config_file'] = nil
default['scaleft']['token_file'] = nil
default['scaleft']['trusted_user_ca_file'] = nil
