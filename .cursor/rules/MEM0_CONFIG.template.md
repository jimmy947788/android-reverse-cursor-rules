# Mem0 專案配置

> **重要**: Mem0 配置信息應存儲在 `.env` 文件中，此文件僅作為說明文檔
> 
> **使用說明**: 將 Mem0 配置添加到專案根目錄的 `.env` 文件中

---

## Mem0 配置位置

Mem0 配置信息應存儲在專案根目錄的 `.env` 文件中：

```bash
MEM0_API_KEY={m0-xxxxxxxxxxxxx}
MEM0_PROJECT_ID={proj_xxxxxxxxxxxxx}
MEM0_PROJECT_NAME={project-name}
```

---

## 使用說明

此配置用於 mem0-mcp 服務，用於存儲和管理專案相關的記憶和線索。

### 相關命令

- `/agent-init` - 初始化 agent 並從 mem0 讀取專案記憶

### 讀取配置

在 Python 腳本中使用 `dotenv` 讀取：

```python
from dotenv import load_dotenv
import os

load_dotenv()

MEM0_API_KEY = os.getenv('MEM0_API_KEY')
MEM0_PROJECT_ID = os.getenv('MEM0_PROJECT_ID')
MEM0_PROJECT_NAME = os.getenv('MEM0_PROJECT_NAME')
```

---

## 注意事項

⚠️ **安全提醒**: 
- `.env` 文件已排除在版本控制外（見 `.gitignore`）
- API Key 是敏感資訊，請勿提交到公開版本控制
- 不要將 `.env` 文件分享給他人

---

## 配置日期

- **創建日期**: {YYYY-MM-DD}
- **最後更新**: {YYYY-MM-DD}

---

**最後更新**: {YYYY-MM-DD}
