# typed: false
Dairy =
  FileList[
    "dist/papercute/ruby/*.rb",
    "dist/papercute/ruby/vendor/bridge.rb",
    "dist/papercute/main.rb",
    "dist/papercute.rb"
  ]

desc "Build"
task default: [:build_ruby]

desc "Build ruby files"

task build_ruby: %i[
       copy_ruby_entry_point
       copy_ruby_file_loader
       copy_ruby_bridge
       copy_ruby_files
     ]

desc "Copy ruby entry point"

task :copy_ruby_entry_point do
  src = "src/papercute.rb"
  dest = "dist/papercute.rb"
  cp src, dest
end

desc "Copy ruby file loader"

task :copy_ruby_file_loader do
  src = "src/papercute/main.rb"
  dest = "dist/papercute/main.rb"
  cp src, dest
end

desc "Copy ruby bridge"

task :copy_ruby_bridge do
  src = "src/papercute/ruby/vendor/bridge.rb"
  dest = "dist/papercute/ruby/vendor/bridge.rb"
  cp src, dest
end

desc "Copy ruby files"

task :copy_ruby_files do
  dest_base = "dist/papercute/ruby"
  src_files = FileList["src/papercute/ruby/*.rb"]
  src_files.each { |src| cp src, dest_base }
end

desc "Copy icons"

task :copy_icons do
  dest_base = "dist/papercute/ruby/ui_assets"
  src_files = FileList["src/papercute/ruby/ui_assets/*.png"]
  src_files.each { |src| cp src, dest_base }
end

desc "Replace sorbet sigil with frozen string literal"

task :replace_sorbet_sigil_with_frozen_string_literal do
  pattern = /^#\s?typed:.*$\n/ # matches Sorbet type
  Dairy.each do |file|
    modified = File.read(file).gsub(pattern, "# frozen_string_literal: true\n")
    File.write(file, modified)
  end
end

desc "Comment out Sorbet sigs via Curdle gem"

task :curdle do
  Dairy.each { |file| system("curdle #{file}") }
end
