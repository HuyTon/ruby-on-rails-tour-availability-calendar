require 'psych'

class CustomYamlLoader
  def self.load_file(file_path)
    YAML.safe_load(File.read(file_path), aliases: true)
  end
end
