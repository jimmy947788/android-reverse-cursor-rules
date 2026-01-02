# apk-pull

連線 adb 找尋app包 並下載到本地 apks 資料夾 `<package name>-<version>`
apk就照原本名稱 可能會有多個apk

## 使用方法

```bash
/apk-pull dbs
# 或
/apk-pull com.dbs.sg.dbsmbanking
```

## 功能說明

1. 搜索设备上包含关键词的应用包
2. 获取应用版本号
3. 从设备拉取 APK 文件
4. 保存到 `apks/<package name>-<version>/` 文件夹，命名为 `*.apk`

## 注意事項

- 如果设备上未安装应用，命令会失败
- 可以使用完整包名或关键词搜索
- 如果应用未安装，需要先安装 APK 到设备
