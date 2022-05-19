Для старта 
1) docker-compose build
2) docker-compose run web rake db:create
3) docker-compose run web rails db:migrate
4) docker-compose run web rails db:seed при наличии чего либо в файле db/seeds.rb
5) docker-compose up
PS
Про проблемах с доступов в файлы применять следующую команду 
sudo chown -R $USER {путь к файлу}
//sudo chown -R $USER ~/dev/diplom/cloud_archive/ для омпьютера главного разработчика