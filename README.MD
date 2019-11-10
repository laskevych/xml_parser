### Инструкция

1. Выполните команду

```bash
make up
# или
docker-compose up -d
```

2. Перейдите в phpMyAdmin по ссылке localhost:9090/  (user:password)
3. Сделайте импорт файла app/db.sql
4. Скачайте из [дампа](https://data.gov.ua/dataset/b244f35a-e50a-4a80-b704-032c42ba8142/resource/06bbccbd-e19c-40d5-9e18-447b110c0b4c/download/15-ufop.zip) и положите файл 15.1-EX_XML_EDR_UO_07.11.2019.xml в ./app/
5. Выполните команду для запуска скрипта
```bash
make run
# или
docker-compose run --rm app-php-cli php parse_xml.php
```