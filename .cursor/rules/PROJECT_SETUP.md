# 專案初始化指南

> **說明**: 此文件說明如何將此規則模板用於新的銀行 App 逆向專案

---

## 📋 重構說明

### 為什麼要重構？

原本的 `rules/` 資料夾混合了：
- ✅ **通用樣板**（應保留在 `rules/`）
- ❌ **專案特定信息**（應移到 `config/`）

為了讓 `rules/` 可以作為通用樣板，我們將專案特定文件移到了 `config/` 資料夾。

---

## 🗂️ 資料夾結構

### `.cursor/rules/` - 通用樣板（可複製到新專案）

包含所有通用的規則和模板：
- `*.mdc` - Cursor 規則文件（通用）
- `*.template.md` - 配置文件模板
- `PROJECT_SETUP.md` - 專案初始化指南

### `config/` - 專案特定配置（不應提交到版本控制）

包含專案特定的信息：
- `APP_INFO.md` - 應用基本信息（從模板創建）
- `VERSION_INFO.md` - 版本信息（從模板創建）

---

## 🚀 初始化新專案步驟

### 1. 複製規則文件

將整個 `.cursor/rules/` 資料夾複製到新專案：

```bash
cp -r .cursor/rules/ /path/to/new-project/.cursor/rules/
```

### 2. 創建配置資料夾

在新專案根目錄創建 `config/` 資料夾：

```bash
mkdir -p /path/to/new-project/config
```

### 3. 從模板創建配置文件

```bash
cd /path/to/new-project
cp .cursor/rules/APP_INFO.template.md config/APP_INFO.md
cp .cursor/rules/VERSION_INFO.template.md config/VERSION_INFO.md
# Mem0 配置應添加到 .env 文件（見下方步驟 5）
```

### 4. 編輯配置文件

填入實際的應用信息：

- **`config/APP_INFO.md`**: 填入 App 名稱、包名、版本、啟動 Activity、常用命令
- **`config/VERSION_INFO.md`**: 填入當前版本信息

### 5. 配置 Mem0（如需要）

將 Mem0 配置添加到專案根目錄的 `.env` 文件：

```bash
# Mem0 Configuration
MEM0_API_KEY=your-api-key
MEM0_PROJECT_ID=your-project-id
MEM0_PROJECT_NAME=your-project-name
```

### 6. 更新 .gitignore

確保敏感信息不被提交：

```gitignore
# 環境變數（包含敏感信息）
.env

# 專案配置（如需要）
config/*.md
```

**注意**: `.env` 文件包含 Mem0 API Key 等敏感信息，必須排除在版本控制外。

---

## 📝 模板文件說明

### `APP_INFO.template.md`
- **用途**: 應用基本信息和常用命令
- **位置**: `.cursor/rules/APP_INFO.template.md`
- **目標**: `config/APP_INFO.md`

### `VERSION_INFO.template.md`
- **用途**: App 版本信息和版本歷史
- **位置**: `.cursor/rules/VERSION_INFO.template.md`
- **目標**: `config/VERSION_INFO.md`


---

## ✅ 驗證清單

初始化完成後，確認：

- [ ] `.cursor/rules/` 包含所有 `.mdc` 規則文件
- [ ] `.cursor/rules/` 包含所有 `.template.md` 模板文件
- [ ] `config/` 資料夾已創建
- [ ] `config/APP_INFO.md` 已從模板創建並填入信息
- [ ] `config/VERSION_INFO.md` 已從模板創建並填入信息
- [ ] Mem0 配置已添加到 `.env` 文件（如需要）
- [ ] `.gitignore` 已更新，排除敏感文件
- [ ] 所有規則文件中的引用路徑正確（應指向 `config/`）

---

## 🔄 規則文件中的引用

所有規則文件（`.mdc`）中的引用已更新為：

- ✅ `config/VERSION_INFO.md` - 版本信息
- ✅ `config/APP_INFO.md` - 應用信息

**不需要修改規則文件**，它們已經使用正確的路徑。

---

## 📚 相關文檔

- **規則文件**: `.cursor/rules/*.mdc` - 詳細規則文件列表見專案根目錄 `README.md`
- **配置說明**: `config/README.md`
- **版本管理規則**: `.cursor/rules/12_version_management.mdc`

---

**最後更新**: 2025-01-XX
