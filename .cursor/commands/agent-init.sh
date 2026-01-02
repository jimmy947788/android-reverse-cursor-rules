#!/bin/bash
# Agent Initialization Script
# 從 mem0-mcp 讀取專案狀況和已知線索

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
VERSION_INFO="${PROJECT_ROOT}/config/VERSION_INFO.md"
APP_INFO="${PROJECT_ROOT}/config/APP_INFO.md"

echo "=== Agent 初始化 ==="
echo ""

# 1. 顯示專案基本信息
echo "## 📋 專案基本信息"
echo ""

if [ -f "$VERSION_INFO" ]; then
    echo "### 當前分析版本"
    APP_NAME=$(grep -E "^\|\s*\*\*App 名稱\*\*" "$VERSION_INFO" | sed 's/|//g' | sed 's/\*\*//g' | xargs)
    PACKAGE_NAME=$(grep -E "^\|\s*\*\*包名" "$VERSION_INFO" | sed 's/|//g' | sed 's/\*\*//g' | xargs)
    APP_VERSION=$(grep -E "^\|\s*\*\*App 版本" "$VERSION_INFO" | sed 's/|//g' | sed 's/\*\*//g' | xargs)
    LAUNCH_ACTIVITY=$(grep -E "^\|\s*\*\*啟動 Activity" "$VERSION_INFO" | sed 's/|//g' | sed 's/\*\*//g' | xargs)
    
    [ -n "$APP_NAME" ] && echo "  App 名稱: $APP_NAME"
    [ -n "$PACKAGE_NAME" ] && echo "  包名: $PACKAGE_NAME"
    [ -n "$APP_VERSION" ] && echo "  版本: $APP_VERSION"
    [ -n "$LAUNCH_ACTIVITY" ] && echo "  啟動 Activity: $LAUNCH_ACTIVITY"
    echo ""
fi

# 2. 顯示專案結構摘要
echo "## 📁 專案結構摘要"
echo ""

if [ -d "${PROJECT_ROOT}/frida-script" ]; then
    SCRIPT_COUNT=$(find "${PROJECT_ROOT}/frida-script" -name "*.js" 2>/dev/null | wc -l)
    echo "  Frida 腳本: ${SCRIPT_COUNT} 個"
fi

if [ -d "${PROJECT_ROOT}/docs" ]; then
    DOC_COUNT=$(find "${PROJECT_ROOT}/docs" -name "*.md" 2>/dev/null | wc -l)
    echo "  分析文檔: ${DOC_COUNT} 個"
fi

if [ -d "${PROJECT_ROOT}/frida-test" ]; then
    TEST_COUNT=$(find "${PROJECT_ROOT}/frida-test" -name "*.js" 2>/dev/null | wc -l)
    echo "  測試腳本: ${TEST_COUNT} 個"
fi

echo ""

# 3. 顯示快速參考
echo "## 🚀 快速參考"
echo ""
echo "### 專案命令"
echo "  - /apk-pull <包名> - 從設備拉取 APK"
echo "  - /test-jeb-mcp - 測試 JEB MCP 連接"
echo "  - /test-ida-mcp - 測試 IDA MCP 連接"
echo "  - /analysis-frida - Frida 檢測風險分析"
echo "  - /analysis-risk-device - 設備風險環境分析"
echo ""

echo "### 重要文件"
echo "  - config/VERSION_INFO.md - 版本信息"
echo "  - config/APP_INFO.md - 應用基本信息"
echo "  - .cursor/rules/*.mdc - 規則文件"
echo ""

echo "=== 初始化完成 ==="
echo ""
echo "💡 提示: AI 會自動從 mem0-mcp 讀取相關記憶"
echo "   請在 Cursor 聊天中詢問專案狀況或已知線索"
