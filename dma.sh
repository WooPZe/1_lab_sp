echo "Программа расчета контрольной суммы файла"
echo "Программа предназначена для расчета контрольной суммы файла и копировании ее в другой файл"
echo "Разработчик: Демин Максим 738-1"
echo "---------------------------------"
echo "Приятного пользования!!!"
echo "---------------------------------"
 proverka=0
 while [ $proverka -eq 0 ]
 do
   echo "Вы находитесь в каталоге:"
   pwd
   echo "Файлы в этом каталоге:"
   ls
   while [ $proverka -eq 0 ]
   do
     read -p "Введите имя файла, контрольную сумму которого вы хотите узнать: " file1
     read -p "Вы корректно ввели имя файла? [д;Н] : " otvet1
     if [[ "$otvet1" == "д" ]]; then
           break
     elif [[ "$otvet1" == "Н" ]]; then  
           proverka=0
     elif [[ -z $otvet1 ]]; then
         proverka=0
     else 
           echo "Введенное вами значение не корректно, введите д или Н" 
     fi
   done 
   echo "Контрольная сумма файла /$file1 :"    
   md5sum $file1
   read -p "Создать новый файл[1] иил выбрать существующий[2], в который будет скопирована контрольная сумма: " otvet2
   if [[ "$otvet2" == "1" ]]; then
     read -p "Введите имя файла, который хотите создать: " file2
     touch $file2.txt 
     md5sum $file1>$file2.txt
     echo "Контрольная сумма успешно скопирована!"
   elif [[ "$otvet2" == "2" ]]; then
     while [ $proverka -eq 0 ]
     do
       read -p "Введите имя файла, в который вы хотите скопировать: " file3
       read -p "Вы корректно ввели имя файла? [д;Н] : " otvet3
       if [[ "$otvet3" == "д" ]]; then
           break
       elif [[ "$otvet3" == "Н" ]]; then  
           proverka=0
       elif [[ -z $otvet3 ]]; then
         proverka=0
       else 
           echo "Введенное вами значение не корректно, введите д или Н" 
       fi
     done 
     while [ $proverka -eq 0 ]
     do
       read -p "Вы согласны внести изменения в файл [д;Н] : " otvet4
       if [[ "$otvet4" == "д" ]]; then
         md5sum $file1>$file3
         echo "Контрольная сумма успешно скопирована!"
         break
       elif [[ "$otvet4" == "Н" ]]; then  
         break
       elif [[ -z $otvet4 ]]; then
         break
       else 
         echo "Введенное вами значение не корректно, введите д или Н" 
       fi
     done
   fi       
     while [ $proverka -eq 0 ]
     do
     read -p "Вы хотите продолжить? [д;Н]" otvet5
       if [[ "$otvet5" == "д" ]]; then
         break
       elif [[ "$otvet5" == "Н" ]]; then  
         exit
       elif [[ -z $otvet5 ]]; then
         exit
       else 
         echo "Введенное вами значение не корректно, введите д или Н" 
       fi
     done      
 done
