node[:deploy].each do |application, deploy|
   execute 'Add My Cron Job' do
       action :run
       command "
          command="date >> /var/log/mylog.txt"
		   job="5 * * * * $command"
	           cat <(fgrep -i -v "$command" <(crontab -l)) <(echo "$job") | crontab -

       "
       user 'root'
   end
end
