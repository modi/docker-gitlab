# 基于 Docker 运行 GitLab CE

## 使用

克隆本项目，进入项目目录执行：

    docker-compose up -d

此命令将下载镜像（约 800M）并初始化容器，执行时间较长，可用 `docker logs` 命令查看容器日志了解初始化进度。 

初始化完成后，将 `gitlab.example.com` 解析到 `127.0.0.1`，访问 http://gitlab.example.com:8980 即可进入 GitLab 设置 root 用户密码的界面。

有问题？欢迎[交流](https://github.com/modi/docker-gitlab/issues)。

## 配置说明

本项目在[官方默认配置](ssh://git@gitlab.localhost:8922/root/test.git)的基础上做了以下修改：

- 指定 GitLab 版本为 13.5.1
- 删掉了 `restart: always` 以关闭容器的自动重启
- 不挂载宿主机文件目录，改为挂载数据卷，因为 Windows / Mac 上的 Docker 是在虚拟机里运行的，宿主机文件目录挂载到容器里 IO 性能较低
- 修改 Web 站点端口为 8980
- 修改 Git SSH 传输服务的端口为 8922
- 关闭通过 Let's Encrypt 获取 SSL 证书的功能，不启用 Web 站点的 HTTPS，因为跨境网络访问不稳定

## 参考

- [运维工具](https://docs.gitlab.com/omnibus/maintenance/)
