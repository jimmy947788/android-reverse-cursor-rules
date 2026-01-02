#!/bin/bash
# APK Pull Script
# 用法: ./apk-pull.sh <package_name_or_keyword>

PACKAGE_KEYWORD="$1"
APKS_DIR="apks"

# 如果没有提供参数，使用默认的 DBS 包名
if [ -z "$PACKAGE_KEYWORD" ]; then
    PACKAGE_KEYWORD="dbs"
fi

echo "[*] 搜索包含 '$PACKAGE_KEYWORD' 的应用..."

# 尝试查找包名
if [ "$PACKAGE_KEYWORD" = "dbs" ]; then
    PACKAGE_NAME="com.dbs.sg.dbsmbanking"
else
    # 搜索包含关键词的包名
    PACKAGE_NAME=$(adb shell pm list packages | grep -i "$PACKAGE_KEYWORD" | head -1 | sed 's/package://')
fi

if [ -z "$PACKAGE_NAME" ]; then
    echo "[!] 错误: 未找到包含 '$PACKAGE_KEYWORD' 的应用"
    echo "[*] 尝试搜索所有应用..."
    adb shell pm list packages | grep -i "$PACKAGE_KEYWORD"
    exit 1
fi

echo "[+] 找到应用: $PACKAGE_NAME"

# 获取版本号
VERSION=$(adb shell dumpsys package "$PACKAGE_NAME" | grep versionName | head -1 | sed 's/.*versionName=//' | tr -d '\r\n' | cut -d' ' -f1)

if [ -z "$VERSION" ]; then
    echo "[!] 警告: 无法获取版本号，使用当前时间戳"
    VERSION=$(date +%Y%m%d_%H%M%S)
fi

echo "[+] 版本号: $VERSION"

# 创建输出目录: apks/<package name>-<version>/
OUTPUT_DIR="${APKS_DIR}/${PACKAGE_NAME}-${VERSION}"

# 确保输出目录存在
mkdir -p "$OUTPUT_DIR"

# 获取所有 APK 路径（可能有多个：base.apk, split_*.apk 等）
APK_PATHS=$(adb shell pm path "$PACKAGE_NAME" | sed 's/package://')

if [ -z "$APK_PATHS" ]; then
    echo "[!] 错误: 无法获取 APK 路径"
    exit 1
fi

# 拉取所有 APK 文件
echo "[*] 正在拉取 APK 文件到: $OUTPUT_DIR"
SUCCESS_COUNT=0
FAIL_COUNT=0

while IFS= read -r APK_PATH; do
    if [ -z "$APK_PATH" ]; then
        continue
    fi
    
    # 获取 APK 文件名（保持原始名称）
    APK_FILENAME=$(basename "$APK_PATH")
    OUTPUT_FILE="${OUTPUT_DIR}/${APK_FILENAME}"
    
    echo "[*] 拉取: $APK_FILENAME"
    adb pull "$APK_PATH" "$OUTPUT_FILE"
    
    if [ $? -eq 0 ]; then
        echo "[+] 成功: $APK_FILENAME"
        ls -lh "$OUTPUT_FILE" | awk '{print "    " $5 " " $9}'
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "[!] 失败: $APK_FILENAME"
        FAIL_COUNT=$((FAIL_COUNT + 1))
    fi
done <<< "$APK_PATHS"

# 总结
echo ""
echo "[+] 完成! 成功: $SUCCESS_COUNT, 失败: $FAIL_COUNT"
echo "[+] APK 文件保存在: $OUTPUT_DIR"
if [ $SUCCESS_COUNT -gt 0 ]; then
    ls -lh "$OUTPUT_DIR" | tail -n +2
fi
