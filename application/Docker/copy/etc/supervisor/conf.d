[program:payever_notifications_consumer]
command=/srv/www/payever_stage/current/symfony rabbitmq:consumer notification -m 100 --env=prod
process_name=%(process_num)s
stdout_logfile=/var/log/payever_notifications_consumer.log
stderr_logfile=/var/log/payever_notifications_consumer.log
redirect_stderr=true
autostart=false
autorestart=true
startsecs=1
numprocs=2
user=www-data
