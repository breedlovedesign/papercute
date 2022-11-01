desc  "Build"
task default:  [:build_ruby]


desc  "Build ruby files"

task build_ruby: [:copy_ruby_entry_point, :copy_ruby_file_loader, :copy_ruby_files ]

desc  "Copy ruby entry point"

task :copy_ruby_entry_point do
  src  = 'src/papercute.rb'
  dest = 'dist/papercute.rb'
  cp src, dest
end

desc  "Copy ruby file loader"

task :copy_ruby_file_loader do
  src  = 'src/papercute/main.rb'
  dest = 'dist/papercute/main.rb'
  cp src, dest
end

desc  "Copy ruby files"

task :copy_ruby_files do
  dest_base  = "dist/papercute/ruby"
  src_files = FileList['src/papercute/ruby/*.rb' ]
  src_files.each do |src|
    cp src, dest_base
  end
end
