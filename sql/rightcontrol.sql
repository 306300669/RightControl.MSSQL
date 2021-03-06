USE [master]
GO
/****** Object:  Database [RightControl]    Script Date: 2019/11/20 17:57:28 ******/
CREATE DATABASE [RightControl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RightControl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RightControl.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RightControl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\RightControl_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RightControl] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RightControl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RightControl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RightControl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RightControl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RightControl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RightControl] SET ARITHABORT OFF 
GO
ALTER DATABASE [RightControl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RightControl] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RightControl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RightControl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RightControl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RightControl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RightControl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RightControl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RightControl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RightControl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RightControl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RightControl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RightControl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RightControl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RightControl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RightControl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RightControl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RightControl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RightControl] SET RECOVERY FULL 
GO
ALTER DATABASE [RightControl] SET  MULTI_USER 
GO
ALTER DATABASE [RightControl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RightControl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RightControl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RightControl] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RightControl', N'ON'
GO
USE [RightControl]
GO
/****** Object:  Table [dbo].[t_action]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_action](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionCode] [varchar](20) NULL,
	[ActionName] [varchar](40) NULL,
	[Position] [int] NULL,
	[ClassName] [varchar](30) NULL,
	[Icon] [varchar](30) NULL,
	[Method] [varchar](20) NULL,
	[Remark] [varchar](50) NULL,
	[OrderBy] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_t_action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_log]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [varchar](20) NULL,
	[UserName] [varchar](20) NULL,
	[RealName] [varchar](20) NULL,
	[ModuleName] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[CreateOn] [datetime] NULL,
	[IPAddress] [varchar](20) NULL,
	[IPAddressName] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_t_log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_menu]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](20) NULL,
	[MenuUrl] [varchar](60) NULL,
	[MenuIcon] [varchar](30) NULL,
	[OrderNo] [int] NULL,
	[ParentId] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_t_menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_menu_action]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_menu_action](
	[MenuId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_t_menu_action] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_menu_role_action]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_menu_role_action](
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
 CONSTRAINT [PK_t_menu_role_action] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC,
	[RoleId] ASC,
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t_role]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [varchar](20) NULL,
	[RoleName] [varchar](30) NULL,
	[Remark] [varchar](50) NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_t_role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 2019/11/20 17:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NULL,
	[RealName] [varchar](20) NULL,
	[PassWord] [varchar](50) NULL,
	[Gender] [int] NULL,
	[Phone] [varchar](11) NULL,
	[Email] [varchar](30) NULL,
	[Remark] [varchar](50) NULL,
	[HeadShot] [varchar](50) NULL,
	[RoleId] [int] NULL,
	[Status] [bit] NULL,
	[CreateOn] [datetime] NULL,
	[UpdateOn] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateBy] [int] NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[t_action] ON 

INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'Add', N'添加', 1, NULL, N'icon-add', N'Add', NULL, 0, 1, CAST(0x0000AA0200F2F2EC AS DateTime), CAST(0x0000AA6D0183D974 AS DateTime), 0, 1)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (2, N'edit', N'编辑', 0, NULL, N'icon-bianji', N'edit', NULL, 0, 1, CAST(0x0000AA0200F2F670 AS DateTime), CAST(0x0000AA0200F32B2C AS DateTime), 0, 0)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (3, N'detail', N'查看', 0, N'layui-btn-normal', N'icon-chakan', N'detail', NULL, 0, 1, CAST(0x0000AA0200F2F9F4 AS DateTime), CAST(0x0000AA0200F32EB0 AS DateTime), 0, 0)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (4, N'del', N'删除', 0, N'layui-btn-danger', N'icon-guanbi', N'del', NULL, 0, 1, CAST(0x0000AA0200F2FD78 AS DateTime), CAST(0x0000AA0200F33234 AS DateTime), 0, 0)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (5, N'reset', N'重置密码', 0, N'layui-btn-warm', N'icon-reset', N'reset', NULL, 0, 1, CAST(0x0000AA0200F300FC AS DateTime), CAST(0x0000AA6D01849E54 AS DateTime), 0, 1)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (6, N'assign', N'分配权限', 0, NULL, N'icon-jiaoseguanli', N'assign', NULL, 0, 1, CAST(0x0000AA0200F30480 AS DateTime), CAST(0x0000AA0200F33A68 AS DateTime), 0, 0)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (7, N'BatchDel', N'批量删除', 1, NULL, N'icon-shanchu', N'BatchDel', NULL, 0, 1, CAST(0x0000AA6D01846F74 AS DateTime), CAST(0x0000AA6F011848BC AS DateTime), 1, 0)
INSERT [dbo].[t_action] ([Id], [ActionCode], [ActionName], [Position], [ClassName], [Icon], [Method], [Remark], [OrderBy], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (8, N'menu_action', N'菜单权限', 0, NULL, N'icon-setting-permissions', N'menu_action', NULL, 0, 1, CAST(0x0000AA6F011848BC AS DateTime), CAST(0x0000AB0B0109CE73 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[t_action] OFF
SET IDENTITY_INSERT [dbo].[t_log] ON 

INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (1, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(0x0000AA6D017A0318 AS DateTime), N'192.168.1.2', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (2, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(0x0000AA6D017E51D4 AS DateTime), N'192.168.1.2', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (3, N'Exit', N'admin', N'超级管理员', NULL, N'安全退出系统', CAST(0x0000AA6D017E57B0 AS DateTime), N'192.168.1.2', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (4, N'Login', N'admin', N'admin', N'系统登录', N'登录失败，用户名或密码错误。', CAST(0x0000AB0B00E7DA29 AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (8, N'Update', N'admin', N'超级管理员', N'修改密码', N'密码修改成功', CAST(0x0000AB0B01056E1B AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (9, N'Exit', N'admin', N'超级管理员', NULL, N'安全退出系统', CAST(0x0000AB0B0105730E AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (10, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(0x0000AB0B01057CC9 AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (11, N'Update', N'admin', N'超级管理员', N'修改密码', N'密码修改成功', CAST(0x0000AB0B010589A1 AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (12, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(0x0000AB0B0116C4AF AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (13, N'Exit', N'admin', N'超级管理员', NULL, N'安全退出系统', CAST(0x0000AB0B0124448A AS DateTime), N'192.168.1.148', N'本地局域网', 1)
INSERT [dbo].[t_log] ([Id], [LogType], [UserName], [RealName], [ModuleName], [Description], [CreateOn], [IPAddress], [IPAddressName], [Status]) VALUES (14, N'Login', N'admin', N'超级管理员', N'系统登录', N'登录成功', CAST(0x0000AB0B01244D77 AS DateTime), N'192.168.1.148', N'本地局域网', 1)
SET IDENTITY_INSERT [dbo].[t_log] OFF
SET IDENTITY_INSERT [dbo].[t_menu] ON 

INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'权限管理', NULL, N'icon-setting-permissions', 0, 0, 1, CAST(0x0000AA0200F81498 AS DateTime), CAST(0x0000AA6F011B497C AS DateTime), 0, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (2, N'菜单管理', N'/permissions/menu', N'icon-caidan', 1, 1, 1, CAST(0x0000AA0200F81BA0 AS DateTime), CAST(0x0000AA0200F81F24 AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (3, N'角色管理', N'/permissions/role', N'icon-jiaoseguanli', 2, 1, 1, CAST(0x0000AA0200F8217C AS DateTime), CAST(0x0000AA0200F8262C AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (4, N'用户管理', N'/permissions/user', N'icon-yonghu', 3, 1, 1, CAST(0x0000AA0200F829B0 AS DateTime), CAST(0x0000AA0200F82D34 AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (5, N'操作管理', N'/permissions/action', N'icon-shezhi', 4, 1, 1, CAST(0x0000AA0200F831E4 AS DateTime), CAST(0x0000AB0B0106A7C2 AS DateTime), 0, 1)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (6, N'系统设置', NULL, N'icon-xitong', 0, 0, 1, CAST(0x0000AA0200F83A18 AS DateTime), CAST(0x0000AA0200F83C70 AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (7, N'网站设置', N'/sysset/website', N'icon-ditu', 1, 6, 1, CAST(0x0000AA0200F83FF4 AS DateTime), CAST(0x0000AA0200F8424C AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (8, N'基本资料', N'/SysSet/info', N'icon-jibenziliao', 2, 6, 1, CAST(0x0000AA0200F845D0 AS DateTime), CAST(0x0000AA0200F84828 AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (9, N'修改密码', N'/SysSet/password', N'icon-xiugaimima', 3, 6, 1, CAST(0x0000AA0200F84CD8 AS DateTime), CAST(0x0000AA0200F8505C AS DateTime), 0, 0)
INSERT [dbo].[t_menu] ([Id], [MenuName], [MenuUrl], [MenuIcon], [OrderNo], [ParentId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (10, N'日志管理', N'/SysSet/Log', N'icon-xitongrizhi', 4, 6, 1, CAST(0x0000AA0200F852B4 AS DateTime), CAST(0x0000AA0200F85638 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[t_menu] OFF
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (2, 8)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (3, 6)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (4, 5)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 1)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 2)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 3)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (5, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (10, 4)
INSERT [dbo].[t_menu_action] ([MenuId], [ActionId]) VALUES (10, 7)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (1, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (1, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 1, 8)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (2, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 1, 6)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 3, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (3, 3, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 1, 5)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 3, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (4, 3, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 1)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 2)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 3, 3)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (5, 3, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (6, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (6, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (7, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (7, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (8, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (8, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (9, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (9, 3, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 0)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 4)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 1, 7)
INSERT [dbo].[t_menu_role_action] ([MenuId], [RoleId], [ActionId]) VALUES (10, 3, 0)
SET IDENTITY_INSERT [dbo].[t_role] ON 

INSERT [dbo].[t_role] ([Id], [RoleCode], [RoleName], [Remark], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'SysAdmin', N'超级管理员', NULL, 1, CAST(0x0000AA020100CD04 AS DateTime), CAST(0x0000AA020100D1B4 AS DateTime), 0, 0)
INSERT [dbo].[t_role] ([Id], [RoleCode], [RoleName], [Remark], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (2, N'GeneralAdmin', N'普通管理员', NULL, 1, CAST(0x0000AA020100D8BC AS DateTime), CAST(0x0000AA020100D538 AS DateTime), 0, 0)
INSERT [dbo].[t_role] ([Id], [RoleCode], [RoleName], [Remark], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (3, N'GeneralUser', N'用户', NULL, 1, CAST(0x0000AA020100DD6C AS DateTime), CAST(0x0000AB0B01097F96 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[t_role] OFF
SET IDENTITY_INSERT [dbo].[t_user] ON 

INSERT [dbo].[t_user] ([Id], [UserName], [RealName], [PassWord], [Gender], [Phone], [Email], [Remark], [HeadShot], [RoleId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (1, N'admin', N'超级管理员', N'e10adc3949ba59abbe56e057f20f883e', 1, N'11111111111', N'123456@qq.com', N'最高权限', N'/Upload/img/502.jpg', 1, 1, CAST(0x0000AA02010CDA90 AS DateTime), CAST(0x0000AB0B0106144E AS DateTime), 0, 1)
INSERT [dbo].[t_user] ([Id], [UserName], [RealName], [PassWord], [Gender], [Phone], [Email], [Remark], [HeadShot], [RoleId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (2, N'test', N'普通管理员', N'e10adc3949ba59abbe56e057f20f883e', 1, N'178899573', N'123456@qq.com', N'普通权限', N'', 2, 1, CAST(0x0000AA02010D94E4 AS DateTime), CAST(0x0000AA02010D9868 AS DateTime), 0, 0)
INSERT [dbo].[t_user] ([Id], [UserName], [RealName], [PassWord], [Gender], [Phone], [Email], [Remark], [HeadShot], [RoleId], [Status], [CreateOn], [UpdateOn], [CreateBy], [UpdateBy]) VALUES (3, N'user', N'用户', N'e10adc3949ba59abbe56e057f20f883e', 1, N'178899573', N'123456@qq.com', N'低级权限', NULL, 3, 1, CAST(0x0000AA02010DC874 AS DateTime), CAST(0x0000AB0B0123B6F7 AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[t_user] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'ActionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'ActionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示位置（1：表单内，2：表单右上）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Icon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'OrderBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'CreateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'UpdateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_action', @level2type=N'COLUMN',@level2name=N'UpdateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'LogType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作账户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志模块' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日志描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'CreateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'IPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在地' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'IPAddressName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_log', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'MenuUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'MenuIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'OrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'CreateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'UpdateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu', @level2type=N'COLUMN',@level2name=N'UpdateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu_action', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu_action', @level2type=N'COLUMN',@level2name=N'ActionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu_role_action', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu_role_action', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_menu_role_action', @level2type=N'COLUMN',@level2name=N'ActionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'RoleCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(1:有效，0：无效)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'CreateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'UpdateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_role', @level2type=N'COLUMN',@level2name=N'UpdateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名（登录）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（0：男，1：女）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'HeadShot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'CreateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'UpdateOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_user', @level2type=N'COLUMN',@level2name=N'UpdateBy'
GO
USE [master]
GO
ALTER DATABASE [RightControl] SET  READ_WRITE 
GO
