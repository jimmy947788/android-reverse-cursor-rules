# {App 名稱} App 基本信息

> **快速參考**: 應用基本信息和常用命令
> 
> **使用說明**: 複製此文件到專案根目錄的 `config/APP_INFO.md`，並填入實際的應用信息

---

## 應用基本信息

| 項目 | 值 | 說明 |
|------|-----|------|
| **App 名稱** | `{App 顯示名稱}` | 應用顯示名稱 |
| **包名 (Package Name)** | `{com.example.app}` | 應用唯一標識符 |
| **App 版本** | `{X.Y.Z}` | 當前分析版本（見 config/VERSION_INFO.md） |
| **啟動 Activity** | `{com.example.MainActivity}` | 主啟動 Activity |

---

## 常用命令

### ADB 命令

#### 啟動應用
```bash
adb shell am start -n {包名}/{啟動 Activity}
```

#### 強制停止應用
```bash
adb shell am force-stop {包名}
```

#### 清除應用數據
```bash
adb shell pm clear {包名}
```

#### 卸載應用
```bash
adb uninstall {包名}
```

#### 查看應用信息
```bash
adb shell dumpsys package {包名} | grep versionName
```

### Frida 命令

#### 附加到運行中的應用
```bash
uv run frida -H {設備 IP}:{端口} -l {腳本名稱}.js -F
```

#### 啟動應用並注入
```bash
frida -U -f {包名} -l {腳本名稱}.js --no-pause
```

#### 列出應用進程
```bash
frida-ps -U | grep {包名關鍵字}
```

---

## 版本信息

詳細版本信息請參考：`config/VERSION_INFO.md`

---

## Mem0 配置

Mem0 專案配置資訊存儲在專案根目錄的 `.env` 文件中：

```bash
MEM0_API_KEY=your-api-key
MEM0_PROJECT_ID=your-project-id
MEM0_PROJECT_NAME=your-project-name
```

相關命令：`/agent-init` - 初始化 agent 並從 mem0 讀取專案記憶

---

## 相關規則

- 版本管理規則：`.cursor/rules/12_version_management.mdc`
- 環境配置：`.cursor/rules/25_environment_config.mdc`
- Mem0 配置：存儲在 `.env` 文件中

---

**最後更新**: {YYYY-MM-DD}
