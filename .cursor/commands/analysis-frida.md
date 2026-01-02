# analysis-frida

連線 Obsidian MCP、jeb-mcp 和 ida-mcp-proxy 實體，靜態分析 apk 和 so 檔案偵測 frida 相關的風險環境

## 執行步驟

### 步驟 0: 查詢 Obsidian 知識庫（優先）

在開始靜態分析前，先從 Obsidian 知識庫學習相關知識：

- [ ] 使用 Obsidian MCP 搜尋 Frida 檢測相關的分析記錄
- [ ] 查看歷史分析報告中關於 Frida 檢測機制的發現
- [ ] 檢查相關函數（如 `libchecks`、`libvosWrapperEx`）的分析記錄
- [ ] 參考已知的 Frida 檢測方法和繞過策略
- [ ] 查看注意事項和已知問題

**搜尋關鍵字範例**：
- "Frida detection"
- "Frida bypass"
- "libchecks"
- "frida-gadget"
- "frida-agent"
- "anti-frida"

### 步驟 1-7: 靜態分析檢測項目

連線 jeb-mcp 和 ida-mcp-proxy 實體，進行靜態分析：

1. 检测文件名（改名）、端口名27042（改端口）、双进程保护（spawn启动）
2. 检测D-Bus
3. 检测/proc/pid/maps依赖文件
4. 检测/proc/pid/tast下线程、fd目录下打开文件
5. frida-server启动
6. 直接调用openat的syscall的检测在text节表中搜索frida-gadget.so / frida-agent.so字符串，避免了hook libc来anti-anti的方法
7. 从inlinehook角度检测frida
8. hook_open函数可以查看是哪里检测了so文件

## 輸出要求

- 結合 Obsidian 知識庫中的歷史發現
- 對比靜態分析結果與已知檢測機制
- 標註新發現的檢測方法
- 提供風險評估和建議