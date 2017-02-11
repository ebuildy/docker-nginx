require 'mustache'
require 'yaml'
require 'fileutils'

class Hash
  def method_missing(method, *opts)
    m = method.to_s
    if self.has_key?(m)
      return self[m]
    elsif self.has_key?(m.to_sym)
      return self[m.to_sym]
    end
    super
  end
end

FileUtils.rm_rf "dist"

# Parse versions
versions = YAML::load_file "ci/versions.yml"

versions.data.each do |version|

  puts "Building \"#{version.name}\""

  templateData = version.build.data

  # Load partials
  Dir.entries('src/partials').each do |partialFile|

    if partialFile =~ /^*.mustache$/

      partialName = partialFile.gsub(".mustache","")

      templateData["partial_#{partialName}"] = Mustache.render(File.read("src/partials/#{partialFile}"), templateData)

    end

  end

  buffer = Mustache.render(File.read("src/#{version.build.file}"), templateData)

  FileUtils.mkdir_p "dist/#{version.name}"

  version.build.paths.each do |path|
    puts "*** Copy src/#{path} -> dist/#{version.name}/#{path}"
    FileUtils.copy_entry "src/#{path}", "dist/#{version.name}/#{path}"
  end

  puts "*** Create dist/#{version.name}/Dockerfile"

  File.write("dist/#{version.name}/Dockerfile", buffer)

  puts

end

# Generate README.md

puts "Create README.md"

File.write("README.md", Mustache.render(File.read("src/README.md.mustache"), { "versions" => versions.data }))
