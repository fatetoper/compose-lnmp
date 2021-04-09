FROM composer:latest

RUN docker-php-ext-install pdo_mysql
#  	&& docker-php-ext-install mysqli

WORKDIR /home/www-data

#更改国内源
#更改权限
#安装组件
#数据迁移
# && ./think migrate:run \
## 还原换源配置
# && composer config --unset repos.packagist
# composer clear && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer && chmod -R 766 . && composer install && composer update --lock && 
CMD php think run