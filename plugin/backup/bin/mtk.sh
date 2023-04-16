echo "此备份脚本：理论联发科CPU通用"
echo "5秒后开始备份字库..."
echo "请不要中断..."
echo "备份所需时间，取决你的闪存读写速度..."
sleep 5
if [ ! -d /sdcard/Rannki/ ]; then
    mkdir /sdcard/Rannki
fi
i=$(ls /dev/block/by-name/)
for i in $i
do
if [ $i = system ]; then
    continue
fi
if [ $i = vendor ]; then
    continue
fi
if [ $i = userdata ]; then
    continue
fi
if [ $i = super ]; then
    continue
fi
if [ $i = mmcblk0 ]; then
    continue
fi
if [ $i = sda ]; then
    continue
fi
if [ $i = sdb ]; then
    continue
fi
if [ $i = sdc ]; then
    continue
fi
if [ $i = sdd ]; then
    continue
fi
if [ $i = sde ]; then
    continue
fi
if [ $i = sdf ]; then
    continue
fi
echo "dd if=/dev/block/by-name/$i of=/sdcard/Rannki/$i.img" >> /sdcard/Rannki/bak.sh
echo "echo 备份$i分区完毕" >> /sdcard/Rannki/bak.sh
done
sh /sdcard/Rannki/bak.sh
rm -rf /sdcard/Rannki/bak.sh
echo "system分区，vendor分区，super分区，userdata分区无需备份"
echo "-------------------------------------------------------"
echo "字库备份完毕，所有备份的分区镜像，在/sdcard/Rannki/目录下..."
echo "字库备份脚本来自酷安 @Rannki"
echo "由bilibili@-星间晞-调整某些参数以适配一键ROOT工具"
echo "已执行备份脚本，60秒后自动退出程序..."
echo "您现在也可以手动关闭此窗口"
sleep 60
exit