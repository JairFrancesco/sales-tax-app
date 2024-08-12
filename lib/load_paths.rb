# Automatically require all Ruby files in the 'classes' and 'helpers' and 'services' directories
Dir[File.join(__dir__, "classes", "*.rb")].each { |file| require_relative file }
Dir[File.join(__dir__, "helpers", "*.rb")].each { |file| require_relative file }
Dir[File.join(__dir__, "services", "*.rb")].each { |file| require_relative file }
