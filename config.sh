clear
echo "GRAM Miner configurator"
echo "--------------------------------------"


read -p "Enter you wallet: " n1
clear


echo "CUDA или open_CL"
PS3="Выбери : "
select os in cuda open-cl
do
case $os in
"cuda") n3="$os"
echo "Ок, пусть будет $os.";break;;
"open-cl") n3="$os"
echo "Ок, пусть будет $os.";break;;
*)
echo "Попробуй еще раз"
esac
done


clear
echo "Разрешить CPU майнинг"
PS3="Выбери : "
select os in Да Нет
do
case $os in
"Да") n2="--cpu-auto"
echo "Ок, пусть будет $os.";break;;
"Нет") n2=""
echo "Ок, пусть будет $os.";break;;
*)
echo "Попробуй еще раз"
esac
done


echo "
#!/bin/bash

    while true; do
      ./gram-mining-pool --address $n1 --gpu-auto --miner $n3 $n2
    sleep 1;
done;
" > run.sh
chmod +x run.sh
clear
echo "Downloading Miner"
echo "--------------------------------------"

wget https://github.com/gramcoinorg/mining-pool/releases/download/miners-r1/gram-mining-pool-ubuntu-x86-64.tar.gz && tar -xzf gram-mining-pool-ubuntu-x86-64.tar.gz

clear




PS3="Выберите операцию: "

select opt in run_miner update_hiveOS quit; do

  case $opt in
    run_miner)
      ./run.sh
      ;;
    update_hiveOS)
        hive-replace -l 2 -y
      ;;
    quit)
      break
      ;;
    *) 
      echo "Недопустимая опция $REPLY"
      ;;
  esac
done