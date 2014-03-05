node[:deploy].each do |application, deploy|
   execute 'Add My Cron Job' do
       action :run
       command <<-EOT
       command="date >> /var/log/mylog.txt"
       job="5 * * * * $command"
       cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -
       EOT
       user 'root'
   end
end
