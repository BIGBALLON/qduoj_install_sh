# qduoj_install_sh

本脚本用于自动安装青岛大学OnlineJudge
青岛大学OJ项目主页： https://github.com/QingdaoU/OnlineJudge


## 使用方法

以下所有命令均在root权限下使用


### 1.获取脚本
```
git clone https://github.com/BIGBALLON/qduoj_install_sh.git
```

### 2.切换目录
```
cd qduoj_install_sh
```

### 3.运行脚本
运行脚本 第一个参数为MySQL的密码
第二个参数为judger的token
第三个参数为服务器的IP地址或者服务器的域名
```
./install.sh 123456 123456 123.206.25.34
```

执行过程中会运行docker容器
需手动输入如下命令：

```
python manage.py migrate
python manage.py migrate --database=submission
python manage.py initadmin
python tools/release_static.py
exit
```
待脚本运行完毕之后，OJ安装完毕！
