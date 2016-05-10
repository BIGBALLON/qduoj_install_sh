# qduoj_install_sh

本脚本用于自动安装青岛大学OnlineJudge  
青大OJ是基于 Python 和 Django 的在线评测平台。  

项目主页： https://github.com/QingdaoU/OnlineJudge  
安装文档: https://github.com/QingdaoU/OnlineJudge/wiki  
交流QQ群: https://github.com/QingdaoU/OnlineJudge/wiki/QQ群  

有任何问题欢迎加群进行讨论。  

温馨提示： 如果你完全不了解qduoj，推荐先进行 [手动部署][1]


## 脚本使用方法

以下所有命令均在root权限下使用

```
sudo su
```

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

执行过程中会运行docker容器，如下图 ``root@xxxxxxxxxx:/code#``

![docker][2]

这时，我们手动输入如下命令：

```
python manage.py migrate
python manage.py migrate --database=submission
python manage.py initadmin
python tools/release_static.py
exit
```

**待脚本运行完毕，OJ便搭建完毕！**

输入我们配置的IP，这里测试用的IP是123.206.25.34，可以看到OJ部署完成。  

![OJ index][3]

### 4. 说明

本脚本在 Ubuntu14.04 X64 下测试成功，脚本运行到OJ部署完成大约需要15-25分钟  
「主要的时间是花费在pull 镜像上」。
CentOS 或其他 linux版本不适用。。


如果你有其他任何问题，请联系我或者提出issue！ 非常感谢！！  


  [1]: https://github.com/QingdaoU/OnlineJudge/wiki/%E6%AD%A3%E5%BC%8F%E9%83%A8%E7%BD%B2%E6%96%87%E6%A1%A3
  [2]: http://7xi3e9.com1.z0.glb.clouddn.com/docker.png
  [3]: http://7xi3e9.com1.z0.glb.clouddn.com/ddag.jpg