# 图书管理系统运行指南

## 前置要求

### 1. 软件环境
- **JDK**: 1.8 或更高版本
- **Maven**: 3.6 或更高版本
- **MySQL**: 8.0 或更高版本
- **Tomcat**: 8.5 或更高版本（或使用Maven内置Tomcat插件）
- **IDE**: IntelliJ IDEA 或 Eclipse（推荐IDEA）

### 2. 开发工具
- Maven构建工具
- 数据库管理工具（Navicat、MySQL Workbench等）
- 浏览器（Chrome、Firefox、Edge等）

---

## 第一步：数据库配置

### 1.1 创建数据库
打开MySQL命令行或数据库管理工具，执行以下SQL：

```sql
CREATE DATABASE IF NOT EXISTS library_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 1.2 执行建表脚本
找到项目中的SQL脚本文件：
```
h:\javabc\javaeejieke\src\main\resources\sql\library_system.sql
```

在MySQL中执行该脚本，创建所有数据表。

### 1.3 初始化管理员账号
在`admin`表中插入初始管理员账号：

```sql
INSERT INTO admin (username, password, name, phone, create_time)
VALUES ('admin', 'admin123', 'System Administrator', '13800138000', NOW());
```

### 1.4 配置数据库连接
编辑数据库配置文件：
```
h:\javabc\javaeejieke\src\main\resources\jdbc.properties
```

根据你的MySQL配置修改以下参数：
```properties
jdbc.url=jdbc:mysql://localhost:3306/library_system?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=你的MySQL密码
```

---

## 第二步：Maven项目构建

### 2.1 使用命令行构建
在项目根目录打开PowerShell或命令行，执行：

```bash
# 清理之前的构建
mvn clean

# 编译并打包
mvn package

# 跳过测试打包
mvn package -DskipTests
```

### 2.2 使用IDE构建（推荐）

**IntelliJ IDEA**:
1. 打开IDEA，选择 `File` -> `Open`
2. 选择项目根目录 `h:\javabc\javaeejieke`
3. 等待Maven依赖下载完成
4. 点击右侧Maven工具栏
5. 展开 `Lifecycle`
6. 双击 `clean`，等待完成
7. 双击 `package`，等待构建完成

**Eclipse**:
1. 导入Maven项目：`File` -> `Import` -> `Existing Maven Projects`
2. 选择项目根目录
3. 右键项目 -> `Run As` -> `Maven clean`
4. 右键项目 -> `Run As` -> `Maven install`

### 2.3 检查构建结果
构建成功后，在以下目录生成WAR包：
```
h:\javabc\javaeejieke\target\javaeejieke.war
```

---

## 第三步：部署到Tomcat服务器

### 方式一：使用IDE内置Tomcat（推荐）

**IntelliJ IDEA**:
1. 点击右上角 `Add Configuration...`
2. 选择 `Tomcat Server` -> `Local`
3. 如果没有Tomcat，点击 `Configure...` 下载或配置
4. 在 `Deployment` 标签页：
   - 点击 `+` 按钮
   - 选择 `Artifact` -> `javaeejieke:war exploded`
5. 在 `Server` 标签页配置：
   - URL: `http://localhost:8080`
   - HTTP port: `8080`
   - JMX port: `1099`
6. 点击 `OK` 保存配置
7. 点击绿色运行按钮启动Tomcat

**Eclipse**:
1. 右键项目 -> `Run As` -> `Run on Server`
2. 选择Tomcat服务器
3. Eclipse会自动部署并启动

### 方式二：手动部署到外部Tomcat

1. 下载并安装Tomcat（推荐8.5.x版本）
   - 下载地址：https://tomcat.apache.org/
2. 解压Tomcat到指定目录（如：`D:\apache-tomcat-8.5.85`）
3. 复制WAR包到Tomcat的webapps目录：
   ```
   复制：h:\javabc\javaeejieke\target\javaeejieke.war
   到：D:\apache-tomcat-8.5.85\webapps\
   ```
4. 启动Tomcat：
   - Windows: 双击 `bin\startup.bat`
   - Linux/Mac: 执行 `bin/startup.sh`
5. 访问系统：`http://localhost:8080/javaeejieke/`

### 方式三：使用Maven Tomcat插件

在`pom.xml`中已配置Tomcat插件，可以使用以下命令运行：

```bash
# 启动Tomcat
mvn tomcat7:run

# 或者使用tomcat8插件
mvn tomcat8:run
```

---

## 第四步：访问系统

### 4.1 访问登录页面
在浏览器中输入：
```
http://localhost:8080/javaeejieke/admin/login
```

### 4.2 登录系统
使用初始化的管理员账号登录：
- **用户名**: `admin`
- **密码**: `admin123`

### 4.3 系统功能
登录成功后，可以访问以下功能：
- **图书管理**: 添加、编辑、删除、查询图书
- **读者管理**: 添加、编辑、删除、查询读者
- **借阅管理**: 借书、还书、查看借阅记录

---

## 常见问题解决

### 问题1：Maven依赖下载失败
**解决方案**:
1. 配置阿里云Maven镜像（推荐）
2. 修改 `settings.xml` 文件

```xml
<mirror>
    <id>aliyunmaven</id>
    <mirrorOf>*</mirrorOf>
    <name>阿里云公共仓库</name>
    <url>https://maven.aliyun.com/repository/public</url>
</mirror>
```

### 问题2：数据库连接失败
**检查项**:
1. MySQL服务是否启动
2. 数据库名称是否正确（library_system）
3. 用户名和密码是否正确
4. 端口是否正确（默认3306）
5. 驱动类名是否正确（com.mysql.cj.jdbc.Driver）

**解决方案**:
```properties
# 检查jdbc.properties配置
jdbc.url=jdbc:mysql://localhost:3306/library_system?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Shanghai
```

### 问题3：端口被占用
**解决方案**:
1. 修改Tomcat端口（默认8080）
2. 在IDE配置中修改HTTP port
3. 或关闭占用8080端口的程序

### 问题4：JSTL标签不生效
**检查项**:
1. `pom.xml`中是否引入JSTL依赖
2. JSP页面顶部是否声明taglib
3. 是否正确配置web.xml

**解决方案**:
```jsp
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```

### 问题5：静态资源访问404
**检查项**:
1. `spring-mvc.xml`中是否配置静态资源映射
2. 静态资源文件是否在正确位置

**解决方案**:
```xml
<mvc:resources mapping="/static/**" location="/static/" />
```

### 问题6：AJAX请求失败
**检查项**:
1. 浏览器控制台是否有错误
2. 网络请求是否发送
3. 服务器是否返回错误

**解决方案**:
1. 打开浏览器开发者工具（F12）
2. 查看Console和Network标签
3. 检查请求URL和参数

### 问题7：访问系统出现404错误
**原因分析**:
1. Spring MVC配置问题
2. Controller路径映射错误
3. 视图解析器配置问题
4. Tomcat部署问题

**解决方案**:

**方案一：检查访问路径**
- 确认访问URL格式：`http://localhost:8080/javaeejieke/`
- 首页访问：`http://localhost:8080/javaeejieke/`
- 登录页面：`http://localhost:8080/javaeejieke/admin/login`
- 测试页面：`http://localhost:8080/javaeejieke/test`

**方案二：检查Controller映射**
- 确认IndexController存在并正确配置
- 检查@RequestMapping路径是否正确
- 查看Tomcat启动日志是否有错误

**方案三：检查Spring配置**
- 确认spring-mvc.xml中视图解析器配置正确
- prefix应为：`/WEB-INF/jsp/`
- suffix应为：`.jsp`

**方案四：检查Tomcat部署**
- 确认WAR包是否正确部署
- 查看Tomcat的webapps目录
- 重启Tomcat服务器

**方案五：使用测试页面**
- 访问：`http://localhost:8080/javaeejieke/test`
- 如果能看到测试页面，说明Spring MVC工作正常
- 检查页面显示的Context Path信息

**方案六：查看Tomcat日志**
- 查看：`logs/catalina.out`
- 查找Spring初始化错误
- 查找Controller注册错误

**常见404原因及解决**:

1. **访问路径错误**
   - 错误：`http://localhost:8080/`（缺少项目名）
   - 正确：`http://localhost:8080/javaeejieke/`

2. **Controller未扫描到**
   - 检查：`spring-mvc.xml`中的component-scan配置
   - 应为：`<context:component-scan base-package="com.library.controller" />`

3. **视图文件不存在**
   - 检查：`WEB-INF/jsp/`目录下是否有对应的JSP文件
   - 例如：`index.jsp`、`admin/login.jsp`

4. **静态资源404**
   - 检查：`spring-mvc.xml`中是否配置了静态资源映射
   - 应为：`<mvc:resources mapping="/static/**" location="/static/" />`

**调试步骤**:
1. 访问测试页面：`http://localhost:8080/javaeejieke/test`
2. 查看Tomcat控制台输出
3. 检查浏览器开发者工具的Network标签
4. 确认请求的URL和响应状态码
5. 查看Spring初始化日志

---

## 开发调试

### 启用日志
项目使用Logback日志框架，日志文件位置：
```
h:\javabc\javaeejieke\logs\library.log
```

### 调试模式
在IDE中设置断点，使用Debug模式启动Tomcat：
1. 在代码行号左侧点击设置断点
2. 选择Debug配置启动Tomcat
3. 程序运行到断点时会自动暂停

### 热部署
使用JRebel或Spring Boot DevTools（需改造为Spring Boot）实现热部署。

---

## 项目结构说明

```
javaeejieke/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── library/
│   │   │           ├── controller/     # 控制器层
│   │   │           ├── service/        # 业务层
│   │   │           ├── dao/            # 数据访问层
│   │   │           ├── pojo/           # 实体类
│   │   │           └── util/           # 工具类
│   │   ├── resources/
│   │   │   ├── mapper/         # MyBatis映射文件
│   │   │   ├── sql/             # SQL脚本
│   │   │   ├── applicationContext.xml    # Spring配置
│   │   │   ├── spring-mvc.xml          # SpringMVC配置
│   │   │   ├── mybatis-config.xml      # MyBatis配置
│   │   │   ├── jdbc.properties         # 数据库配置
│   │   │   └── logback.xml            # 日志配置
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── jsp/            # JSP页面
│   │       │   └── web.xml         # Web配置
│   │       └── static/          # 静态资源
│   │           ├── css/            # 样式文件
│   │           ├── js/             # JavaScript文件
│   │           └── images/         # 图片资源
└── pom.xml                        # Maven配置文件
```

---

## 技术栈

| 层次 | 技术 | 版本 |
|------|------|------|
| 表现层 | JSP + JSTL + jQuery | - |
| 控制层 | Spring MVC | 5.3.20 |
| 业务层 | Spring | 5.3.20 |
| 持久层 | MyBatis | 3.5.10 |
| 数据库 | MySQL | 8.0.28 |
| 连接池 | Druid | 1.2.11 |
| 构建工具 | Maven | - |
| 服务器 | Tomcat | 8.5+ |

---

## 快速开始

### 一键启动（推荐）

如果你使用IntelliJ IDEA：
1. 打开项目
2. 等待Maven依赖下载完成
3. 配置Tomcat运行环境
4. 点击运行按钮
5. 访问 `http://localhost:8080/javaeejieke/admin/login`
6. 使用 `admin/admin123` 登录

### 命令行启动

```bash
# 进入项目目录
cd h:\javabc\javaeejieke

# Maven打包
mvn clean package -DskipTests

# 复制WAR包到Tomcat
copy target\javaeejieke.war D:\apache-tomcat-8.5.85\webapps\

# 启动Tomcat
D:\apache-tomcat-8.5.85\bin\startup.bat
```

---

## 注意事项

1. **数据库编码**: 确保MySQL数据库使用utf8mb4字符集
2. **时区配置**: serverTimezone=Asia/Shanghai 避免时间错误
3. **端口冲突**: 确保8080端口未被占用
4. **内存配置**: 根据服务器配置调整Tomcat内存
5. **日志监控**: 定期查看日志文件排查问题
6. **备份**: 定期备份数据库数据

---

## 联系支持

如遇到问题，请检查：
1. 日志文件：`logs/library.log`
2. 浏览器控制台：F12开发者工具
3. 数据库连接：使用数据库工具测试连接
4. Maven构建：检查依赖下载情况

祝使用愉快！
