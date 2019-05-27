#!/bin/sh

#if [ ! -f /var/run/redis_6379.pid ]; then
#        /etc/init.d/redis_6379 start
#else
#        rm /var/run/redis_6379.pid
#        /etc/init.d/redis_6379 start
#fi
echo *Start Redis*
/etc/init.d/redis_6379 start

#if (! pgrep mysql); then
#        /etc/init.d/mysql start
#fi
echo *Start MySQL*
/etc/init.d/mysql start

echo *Start Bundle*
cd /var/www/phishing-frenzy/
bundle exec sidekiq -d -C config/sidekiq.yml
sleep 10

echo *Start Apache*
apachectl stop
apachectl start
