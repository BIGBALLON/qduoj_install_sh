# qduoj_install_sh

本脚本用于自动安装青岛大学OnlineJudge  
青大OJ是基于 Python 和 Django 的在线评测平台。  

项目主页： https://github.com/QingdaoU/OnlineJudge  
安装文档: https://github.com/QingdaoU/OnlineJudge/wiki  
交流QQ群: https://github.com/QingdaoU/OnlineJudge/wiki/QQ群  

有任何问题欢迎加群进行讨论。  

## 脚本使用方法

以下所有命令均在root权限下使用

### 1.获取脚本

```
git clone https://github.com/BIGBALLON/qduoj_install_sh.git
```

### 2.给脚本添加执行权限

```
cd qduoj_install_sh
chmod +x install.sh
```

### 3.运行脚本

第一个参数为 MySQL的密码  
第二个参数为 Judger的Token  
第三个参数为 服务器的IP地址或者服务器的域名  

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

TODO:

- [ ] 操作判断返回值，是否成功

- [ ] 使用root权限，修改目录权限

- [ ] 将oj代码和data等放在`/home`下一个单独文件夹中，安装文档也需要修改，这样更好些

- [ ] docker版本的nginx（待讨论）

- [ ] MySQL和判题密码随机生成就好，然后显示一下

- [x] `mkdir -p` 可以放在一行

- [ ] MySQL打算单独做一个版本，加入binlog，放在阿里云上，redis也使用阿里云的