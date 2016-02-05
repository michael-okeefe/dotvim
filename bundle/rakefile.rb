repos = File.read('repos.txt').split()

desc "install repos"
task :install do
  repos.each do |repo|
    folder_name = repo.split(/\//)[-1].split(/\./)[0]
    unless File.exist?(folder_name)
      sh "git clone #{repo}" unless repo.strip.start_with?(';')
    end
  end
end

def update
  dirs = Dir['*'].reject {|f| File.file? f}
  dirs.each do |d|
    sh "cd #{d} && git pull origin master && cd .."
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
