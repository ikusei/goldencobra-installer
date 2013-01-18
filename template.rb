if ARGV[0] == "."
  @gemset_name == system("pwd").to_s.split("/").last
else
  @gemset_name = ARGV[0]
end
if yes?("Would you like to configure rvm?")
  @ruby_version = ask("What is your current ruby version (bsp: 1.9.3-p194)")
  system("rvm #{@ruby_version} do rvm gemset create #{@gemset_name}")
end
gem('goldencobra', :git => 'ssh://git@git.ikusei.de:7999/GC/basis-modul.git')
gem('activeadmin', :git => 'git://github.com/ikusei/active_admin.git', :require => 'activeadmin')
system("rvm #{@ruby_version}@#{@gemset_name} do bundle install")
generate("goldencobra:install")