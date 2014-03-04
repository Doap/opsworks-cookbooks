cron "test_cron" do
  hour "*"
  minute "5"
  command "date >> /var/log/mylog.txt"
end
