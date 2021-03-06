#
# Cookbook Name:: deploy
# Recipe:: updatephp
#

node[:deploy].each do |application, deploy|
   include_recipe 'apache2::service'
   execute 'Change Default File Upload Size' do
       action :run
       command "
          sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' `php -r 'echo php_ini_loaded_file();'`
       "
       user 'root'
       notifies :reload, resources(:service => "apache2"), :delayed
   end
end
