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
