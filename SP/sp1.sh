#!/bin/bash
echo "программа для вывода текущего каталога, вывода файла и запроса даты. Разработчик Лотов Александр"
echo "Текущая директория:  $(pwd)"
file_exists=false
while [ "$file_exists" = false ]
do
read -p "Введите имя файла: " file_name
if [ -f "$file_name" ]
then
file_exists=true
else
echo "Файл не найден, попробуйте снова: " >&2
fi
done
read -p "Введите дату в формате  год-месяц-день : " input_date
file_modification_date=$(stat -c %y "$file_name" | awk '{print$1}')
if [ "$file_modification_date" > "$input_date" ]
then
echo "Индекс дескриптора был успешно изменен!"
exit 120
else
echo "Индекс дескриптора не был изменен"
fi
