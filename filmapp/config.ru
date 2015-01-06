# This file is used by Rack-based servers to start the application.

Rack::Utils.multipart_part_limit = 0
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
