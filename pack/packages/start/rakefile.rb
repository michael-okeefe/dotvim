repos = File.read('repos.txt').split()

desc "install repos"
task :install do
  repos.each do |repo|
    next if repo.start_with?("#")
    folder_name = repo.split(/\//)[-1].split(/\./)[0..-2].join(".")
    unless File.exist?(folder_name)
      sh "git clone #{repo}" unless repo.strip.start_with?(';')
    end
  end
end

def update
  dirs = Dir['*'].reject {|f| File.file? f}
  dirs.each do |d|
    Dir.chdir(d) do
      main_branch = `git branch --show-current`.strip
      sh "git pull origin #{main_branch}"
    end
  end
end

desc "update repos"
task :update do
  update
end

desc "same as update"
task :upgrade do
  update
end

task :default => [:install, :upgrade]
