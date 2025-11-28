# autoScrcpy

AndroidデバイスがPCに接続されたときに、自動的に [scrcpy](https://github.com/Genymobile/scrcpy) を起動するためのPowerShellスクリプトです。

## 機能

- **自動検知**: Androidデバイスの接続を監視し、接続されると自動的にscrcpyを起動します。
- **ADB競合対策**: スクリプト実行時にADBサーバーをリセットし、指定されたscrcpyフォルダ内のadbを使用することでバージョンの競合を防ぎます。
- **多重起動防止**: スクリプトの二重起動を防止する仕組みが含まれています。
- **自動再接続**: scrcpyが終了した後も監視を継続し、再接続時に再び起動します。

## 必要要件

- Windows OS
- PowerShell
- scrcpy (本リポジトリに含まれている `scrcpy-win64-v3.3.3` または別途ダウンロードしたもの)

## 設定方法

`autoScrcpy.ps1` ファイルをテキストエディタで開き、以下の変数を環境に合わせて修正してください。

```powershell
# ▼▼▼ 設定エリア（ここだけ変更してください） ▼▼▼
# scrcpy.exe と adb.exe が入っているフォルダのパスを指定
# 例: $BaseDir = "C:\Users\User\Downloads\scrcpy-win64-v3.3.3"
$BaseDir = "C:\tools\scrcpy-win64-v3.3.3"
```

`$BaseDir` には `scrcpy.exe` と `adb.exe` が存在するディレクトリのフルパスを指定してください。

必要に応じて `$ScrcpyArgs` を変更して、scrcpyの起動オプションをカスタマイズすることも可能です。

## 使い方

1. AndroidデバイスのUSBデバッグを有効にします。
2. `autoScrcpy.ps1` を右クリックし、「PowerShell で実行」を選択するか、PowerShellコンソールから実行します。

   ```powershell
   .\autoScrcpy.ps1
   ```

3. スクリプトが起動し、デバイスの接続待ち状態になります。
4. AndroidデバイスをUSB接続すると、scrcpyが自動的に起動します。
