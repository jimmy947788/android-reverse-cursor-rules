# Cursor Project Rules

> 本目錄包含 Cursor IDE 的專案規則文件（`.mdc` 格式）

---

## 📋 規則文件列表

### 1. `00_project_overview.mdc`
**專案總覽與邊界**
- 專案定位與目標
- 合規與安全邊界（必遵守）
- 基本輸出格式偏好

**適用範圍**: 所有文件（`alwaysApply: true`）

---

### 2. `05_code_quality.mdc`
**代碼質量與最佳實踐（整合自 awesome-cursorrules）**
- 核心原則（驗證與證據優先、簡潔性與可讀性、描述性命名、錯誤處理、模組化、性能考量）
- 代碼風格規範（JavaScript/TypeScript、Python）
- 逆向工程特定規範（證據收集、版本管理、安全與合規）
- 禁止事項（代碼變更、溝通方式、實現方式）
- 最佳實踐檢查清單

**適用範圍**: 所有文件（`alwaysApply: true`）

**參考來源**: [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules)

---

### 3. `10_reverse_workflow.mdc`
**逆向分析工作流程與證據標準**
- 工作流程（強制）
- 「可重現」要求（包含 App 版本檢查）
- 逆向命名規範（已整合代碼質量原則）
- 代碼質量原則（強制）
- 分析問題原因流程
- 分析問題後動作
- App 版本檢查（強制）

**適用範圍**: 所有文件（`alwaysApply: true`）

---

### 4. `12_version_management.mdc`
**App 版本管理與更新規則**
- 版本信息記錄要求
- App 更新改版處理流程
- 版本信息格式
- 版本變更檢查清單
- 版本兼容性標註

**適用範圍**: 所有文件（`alwaysApply: true`）

**相關文件**: 
- `config/VERSION_INFO.md` - 當前分析的 App 版本信息（專案特定）
- `config/APP_INFO.md` - 應用基本信息和常用命令（專案特定）
- `.cursor/rules/VERSION_INFO.template.md` - 版本信息模板
- `.cursor/rules/APP_INFO.template.md` - 應用信息模板

---

### 5. `15_problem_analysis.mdc`
**問題分析與除錯流程**
- 問題分析流程（標準作業程序）
  - 步驟 1: 檢查 Frida 執行腳本輸出
  - 步驟 2: 回到 JEB 驗證靜態分析
  - 步驟 3: 回到 IDA 驗證 Native 層
  - 步驟 4: 查詢 Obsidian 知識庫
- 問題解決後動作
  - 報告產生原則
  - 測試腳本管理（`frida-test/` 資料夾）
  - 修正執行錯誤腳本
- GitHub Issue 分析與實現規範
  - Issue 分析流程
  - 實現規範模板（10 個章節）
  - 逆向工程項目特定考量
  - 開發原則（TDD、KISS、300 行限制）

**適用範圍**: 所有文件（`alwaysApply: true`）

---

### 6. `20_frida_rules.mdc`
**Frida 腳本與動態觀測規則（JavaScript/TypeScript）**
- Frida 腳本規範（基本原則、配置與旗標、Hook 策略、註釋與文檔）
- 記錄格式（統一）
- 代碼質量要求（描述性命名、模組化設計、錯誤處理）
- Frida 執行環境配置
- 禁止事項

**適用範圍**: 
- `**/*.js`
- `**/*.ts`
- `**/frida-script/**`
- `**/frida-test/**`

---

### 7. `25_environment_config.mdc`
**Frida 執行環境配置與風控規避**
- 風控規避策略（使用改過特徵的 Frida Gadget）
- 固定端口配置（14725）
- 標準執行命令格式
- Frida 版本要求（frida-tools==13.7.1, frida==16.7.19）
- 環境準備檢查清單
- 故障排除

**適用範圍**:
- `**/*.js`
- `**/frida-script/**`
- `**/frida-test/**`

---

### 8. `30_ida_rules.mdc`
**IDA Pro 反編譯輸出解讀與重命名建議**
- IDA 輸出解讀原則
- 反混淆流程

**適用範圍**:
- `**/*.c`
- `**/*.h`
- `**/*.i64`
- `**/ida/**`

---

### 9. `40_reporting_style.mdc`
**分析報告撰寫格式**
- 回覆模板（固定）
- 表格偏好

**適用範圍**: 所有文件（`alwaysApply: true`）

---

### 10. `50_bank_app_triage.mdc`
**銀行 App 高風控環境的證據收集與判斷樹**
- 高風控 App 觀測重點
- 證據收集層級
- 判斷樹（決策流程）
- 風險評估框架
- 替代方案（防禦導向）

**適用範圍**: 手動應用（`alwaysApply: false`）

---

## 🚀 使用說明

### 自動應用

Cursor 會根據規則文件的 `alwaysApply` 和 `globs` 設定自動套用規則：

- **`alwaysApply: true`**: 所有文件都會套用此規則
- **`alwaysApply: false` + `globs`**: 只有符合 glob 模式的文件才會套用

### 規則優先級

規則文件按數字前綴排序（00, 10, 20...），數字越小優先級越高。

### 驗證規則是否生效

1. 在 Cursor 中打開任意文件
2. 查看 Cursor 的規則指示器
3. 規則會自動影響 AI 助手（Cline）的回覆風格和內容

---

## 📋 快速參考文件

### 專案特定配置（`config/` 資料夾）

這些文件包含專案特定的信息，應從模板創建：

- **`config/APP_INFO.md`** - 應用基本信息和常用命令（從 `APP_INFO.template.md` 創建）
- **`config/VERSION_INFO.md`** - 當前分析的 App 版本信息（從 `VERSION_INFO.template.md` 創建）

### 模板文件（`.cursor/rules/` 資料夾）

這些是通用模板，可用於新專案：

- **`APP_INFO.template.md`** - 應用信息模板
- **`VERSION_INFO.template.md`** - 版本信息模板

---

## 📚 規則內容概要

### 核心原則

1. **合規與安全**: 只提供合法研究與防禦/測試用途的建議
2. **證據導向**: 任何推論都要指出依據
3. **可重現**: 實驗要提供版本、步驟、觀測點
4. **三層觀測**: Java/Kotlin、Native、Kernel/Preload
5. **問題分析流程**: Frida → JEB → IDA → Obsidian
6. **實用優先**: 不需要每次都產生報告，重點是修正腳本和產生測試腳本
7. **版本管理**: App 更新改版時必須立即更新版本信息（`config/VERSION_INFO.md`）
8. **報告產生規則**: 只有用戶明確要求時才產生報告，報告保存到 `docs/` 資料夾
9. **代碼質量**: 簡潔性、可讀性、描述性命名、錯誤處理、模組化設計（整合自 awesome-cursorrules）

### 輸出格式

每次回覆包含：
1. **結論**: 一句話總結
2. **證據**: log/offset/堆疊/對照點
3. **下一步**: 可執行清單（Checklist）

### 報告產生規則

- **只有用戶明確要求時才產生報告**
- **不要每次對話都自動產生報告**
- **一般對話只需提供結論、證據和下一步清單**
- **報告必須保存到 `docs/` 資料夾**

### 一般對話格式（不需要報告時）

```
## 結論
- 用 1~3 句話講清楚「發生什麼事」與「最可能原因」

## 證據
- 列出關鍵 log / offset / 字串 / CFG 片段

## 影響面
- 這個機制會影響哪些行為

## 下一步（Checklist）
- [ ] A：最低成本觀測
- [ ] B：第二層驗證（交叉證據）
- [ ] C：必要時的替代策略
```

---

## 🔧 自訂規則

如需新增或修改規則：

1. 創建新的 `.mdc` 文件
2. 使用正確的數字前綴（如 `60_xxx.mdc`）
3. 在文件開頭添加 metadata：
   ```markdown
   ---
   description: 規則描述
   alwaysApply: true/false
   globs:
     - "**/*.pattern"
   ---
   ```

---

## 📖 參考資料

- [Cursor Rules 官方文檔](https://docs.cursor.com/zh-Hant/context/rules)
- 專案規則文檔: `../.clinerules/`

---

**最後更新**: 2025-01-XX

**整合更新**: 已整合 [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) 的最佳實踐到 `05_code_quality.mdc`
