desc "create a basic jekyll structure"
task :init do
  File.open "_config.yml", "w" do |file|
    file.puts "safe:        false"
    file.puts "auto:        false"
    file.puts "server:      false"
    file.puts "server_port: 4000"
    file.puts "baseurl:     /"
    file.puts "url:         http://localhost:4000"
    file.puts "source:      ./_source"
    file.puts "destination: ./_site"
    file.puts "plugins:     ./_plugins"
  end
  FileUtils.mkdir_p "_source"
  File.open "_source/index.html", "w" do |file|
    file.puts "Hello world!"
  end
  FileUtils.mkdir_p "_site"
  FileUtils.mkdir_p "_plugins"
  File.open ".gitignore", "w" do |file|
    file.puts "_site/"
  end
end

