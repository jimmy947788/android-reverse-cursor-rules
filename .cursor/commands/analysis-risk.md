# analysis-risk-device

連線 Obsidian MCP、jeb-mcp 和 ida-mcp-proxy 實體，靜態分析 apk 和 so 檔案偵測風險環境

## 執行步驟

### 步驟 0: 查詢 Obsidian 知識庫（優先）

在開始靜態分析前，先從 Obsidian 知識庫學習相關知識：

- [ ] 使用 Obsidian MCP 搜尋設備風險檢測相關的分析記錄
- [ ] 查看歷史分析報告中關於 Root、開發者模式、TEE 等檢測機制的發現
- [ ] 檢查相關函數（如 `libchecks`、`libvosWrapperEx`）的分析記錄
- [ ] 參考已知的風險檢測方法和繞過策略
- [ ] 查看注意事項和已知問題

**搜尋關鍵字範例**：
- "Root detection"
- "Developer mode detection"
- "TEE check"
- "PlayIntegrity"
- "Bootloader unlock"
- "Screenshot detection"
- "USB debugging"

### 步驟 1-8: 靜態分析檢測項目

連線 jeb-mcp 和 ida-mcp-proxy 實體，進行靜態分析：

- 檢查設備是否存在root
- 檢查設備開啟 開發者選項 或 adb 或 usb 調試
- 禁止設備截圖 或 錄影功能
- 檢查設備是否存在 模擬點擊功  
- 檢查設備 TEE 是否正常 
- 檢查設備 bootloader unlock 是否正常 是否被破解
- 檢查設備是否存在 惡意軟體 或 惡意程式
- PlayIntegrityFix 是否正常 是否被破解

## 輸出要求

- 結合 Obsidian 知識庫中的歷史發現
- 對比靜態分析結果與已知檢測機制
- 標註新發現的檢測方法
- 提供風險評估和建議