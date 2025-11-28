# Auto Scrcpy Monitor

Androidデバイスが接続されたことを検知して、自動的に `scrcpy` を起動するPowerShellスクリプトです。

## 使い方

1. `autoScrcpy.ps1` をテキストエディタで開きます。
2. `$BaseDir` 変数を、`scrcpy.exe` が含まれているフォルダのパスに合わせて変更してください。
   ※デフォルトでは `C:\tools\scrcpy-win64-v3.3.3` に設定されています。
   ```powershell
   $BaseDir = "C:\path\to\your\scrcpy-win64-v3.3.3"
   ```
3. スクリプトを実行します。

## ライセンス情報 (License Information)

### scrcpy
本プロジェクトには [scrcpy](https://github.com/Genymobile/scrcpy) のWindows版バイナリが含まれています。
scrcpy は **Apache License 2.0** の下で配布されています。
ライセンスの全文は [scrcpy-win64-v3.3.3/LICENSE](scrcpy-win64-v3.3.3/LICENSE) を参照してください。

*   Copyright (C) 2018 Genymobile
*   Copyright (C) 2018-2025 Romain Vimont

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

### その他の同梱ライブラリ
同梱されているライブラリはそれぞれのライセンスに従います。

*   **ADB (Android Debug Bridge)**: Android Open Source Project (Apache License 2.0 / BSD)
*   **SDL2**: zlib License
*   **FFmpeg** (avcodec, avformat, avutil, swresample): LGPL v2.1+
*   **libusb**: LGPL v2.1+

### autoScrcpy.ps1
このスクリプト自体は、同梱されているコンポーネントのライセンス条件を侵害しない範囲で自由に使用・改変できます。
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
