server {
         listen       80;
         server_name  example.journaldev.com;
         root         /var/www/html/wordpress;

         access_log /var/log/nginx/example.journaldev.com-access.log;
         error_log  /var/log/nginx/example.journaldev.com-error.log error;
         index index.html index.htm index.php;

         location / {
                      try_files $uri $uri/ /index.php$is_args$args;
         }

         location ~ \.php$ {
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass wordpress:9000
            fastcgi_index index.php;
            include fastcgi.conf;
    }
}