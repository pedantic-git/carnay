require 'yaml'

dir = File.dirname(__FILE__)
stations = YAML.load(File.open("#{dir}/stations.yml"))
stations.each do |hash|
  Station.create(hash)
end
