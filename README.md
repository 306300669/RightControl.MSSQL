# RightControl MSSQL 个人修改版本

#### 介绍
.NET 通用后台角色权限管理系统，个人修改版。<br>
项目地址：[暂时没有发布]

#### 软件架构
通用三层架构，面向接口编程。


#### 技术选型

1. MVC5
2. Mysql
3. Dapper
4. Autofac
5. Layui
6. 阿里巴巴矢量库

#### 使用说明

1. 先创建数据库，然后执行sql目录下面的rightcontrol.sql即可。
2. 账号：admin
3. 密码：123456

#### 项目由来
各位看官大佬觉得还可以的话，麻烦点个Star。

#### 个人新增及修改的Bug
1. 基本资料性别更改后后台数据不更新
2. 菜单管理没有删除功能
3. 菜单管理没有操作按钮设置功能	
4. 没有批量删除
5. 角色管理分配权限里不显示新增的菜单
6. 删除菜单同时清除菜单权限，菜单角色权限
7. 删除按钮同时清除菜单权限，菜单角色权限
8. 删除角色同时清除菜单角色权限

#### 个人新增修改模块
1. 登录修改为输完验证码自动触发登录
2. 角色添加是否个人字段、角色设置该角色可访问的角色范围
3. 添加工作日志模块
4. 之前官方下载的版本存在一个隐形bug（管理员为其他角色管理分配过菜单后，无法控制菜单显示，（已修复））

#### 项目截图
![输入图片说明](https://images.gitee.com/uploads/images/2019/0620/133448_cd9a4888_1130037.jpeg "1.jpg")
![输入图片说明](https://images.gitee.com/uploads/images/2019/0620/133502_f04776ed_1130037.png "2.png")
![输入图片说明](https://github.com/306300669/RightControl.MSSQL/blob/master/RightControl.WebApp/Upload/img/TIM%E5%9B%BE%E7%89%8720200115141301.png "2.png")
![输入图片说明](https://github.com/306300669/RightControl.MSSQL/blob/master/RightControl.WebApp/Upload/img/TIM%E5%9B%BE%E7%89%8720200115141229.png "2.png")
