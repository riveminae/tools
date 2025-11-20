# ファイル名: auto_scrcpy_monitor_v3.ps1

# ▼▼▼ 設定エリア（ここだけ変更してください） ▼▼▼
# scrcpy.exe と adb.exe が入っているフォルダのパスを指定
# 例: $BaseDir = "C:\Users\User\Downloads\scrcpy-win64-v3.3.3"
$BaseDir = "C:\tools\scrcpy-win64-v3.3.3"

# scrcpyの起動オプション
$ScrcpyArgs = "--new-display=1920x1080/163 -b 20M --video-codec=h265 --audio-buffer=50 --stay-awake -K -f"
# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

# Mutexによる多重起動防止
$mutexName = "Global\AutoScrcpyMonitorMutex"
$mutex = New-Object System.Threading.Mutex($false, $mutexName)

# 既に起動しているか確認 (WaitOneがfalseを返したら取得失敗＝他で実行中)
if (!$mutex.WaitOne(0, $false)) {
    Write-Warning "このスクリプトは既に実行されています。 (Another instance is already running)"
    exit
}

try {
    # パスの自動生成
    $AdbExe = Join-Path $BaseDir "adb.exe"
    $ScrcpyExe = Join-Path $BaseDir "scrcpy.exe"

    Write-Host "=== Fold 7 Monitor V3 (Unified ADB) ===" -ForegroundColor Cyan
    Write-Host "Using ADB at: $AdbExe"

    # 最初に既存のADBサーバーを一度リセットして、バージョンを統一する
    Write-Host "Resetting ADB server to prevent version conflict..."
    & $AdbExe kill-server
    & $AdbExe start-server

    Write-Host "Waiting for device connection..."

    while ($true) {
        # 指定したパスのADBを使ってデバイスリストを取得
        $adbOutput = & $AdbExe devices | Out-String

        if ($adbOutput -match "\w+\s+device\s*$" -and $adbOutput -notmatch "unauthorized") {
            
            Write-Host ">> Device DETECTED! Launching scrcpy..." -ForegroundColor Green
            
            try {
                # scrcpyを実行（同じ場所にあるadbを使うため競合しない）
                Start-Process -FilePath $ScrcpyExe -ArgumentList $ScrcpyArgs -Wait -NoNewWindow -ErrorAction Stop
                
                Write-Host ">> scrcpy closed. Waiting for reconnection..." -ForegroundColor Yellow
            }
            catch {
                Write-Host "!! ERROR !!" -ForegroundColor Red
                Write-Host "Could not start scrcpy. Check the path settings."
                Write-Host $_.Exception.Message
                Start-Sleep -Seconds 5
            }

            Start-Sleep -Seconds 3
        }
        elseif ($adbOutput -match "unauthorized") {
            Write-Host ">> Status: UNAUTHORIZED (Check phone screen)" -ForegroundColor Red
        }
        
        Start-Sleep -Seconds 1
    }
}
finally {
    # 終了時に必ずMutexを解放
    if ($mutex) {
        $mutex.ReleaseMutex()
        $mutex.Dispose()
    }
}