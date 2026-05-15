# Week 0 — Claude Code 설치 및 설정

Claude Code 환경 설치 및 커스터마이제이션 스크립트입니다.

&nbsp;

## 설치 스크립트

### Windows

```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

또는 GitHub에서 직접 설치:

```powershell
irm https://raw.githubusercontent.com/whatfontisthis/claude-setup/main/install.ps1 | iex
```

### macOS / Linux

```bash
bash install.sh
```

또는 GitHub에서 직접 설치:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/whatfontisthis/claude-setup/main/install.sh)"
```

&nbsp;

## 커스터마이제이션 스크립트

### 1. `cc` 별칭 설정 — 빠른 권한 스킵

`cc` 명령으로 `claude --dangerously-skip-permissions` 실행하기

**Windows:**
```powershell
.\setup-cc-alias-windows.ps1
```

**macOS / Linux:**
```bash
chmod +x setup-cc-alias-mac.sh
./setup-cc-alias-mac.sh
```

설정 후 쉘을 다시 시작하고 `cc` 명령으로 테스트:
```
cc
```

&nbsp;

### 2. 맞춤 설정 적용

```powershell
# Windows
.\customize.ps1

# macOS / Linux (coming soon)
```

&nbsp;

### 3. 제거 (Windows만)

```powershell
.\uninstall-win.ps1
```

&nbsp;

## 스크립트 목록

| 파일 | 용도 | 대상 OS |
|------|------|--------|
| `install.ps1` | Claude Code 설치 | Windows |
| `install.sh` | Claude Code 설치 | macOS / Linux |
| `setup-cc-alias-windows.ps1` | `cc` 별칭 설정 | Windows |
| `setup-cc-alias-mac.sh` | `cc` 별칭 설정 | macOS / Linux |
| `customize.ps1` | 설정 커스터마이제이션 | Windows |
| `uninstall-win.ps1` | 제거 | Windows |

&nbsp;

## 자주 묻는 질문

**Q: 같은 스크립트를 여러 번 실행해도 되나?**

A: 네. 이미 설치된 항목은 자동으로 스킵됩니다.

**Q: `cc` 별칭이 바로 적용되지 않으면?**

A: 쉘을 완전히 닫고 새로 열어주세요.

**Q: `cc` 대신 다른 이름의 별칭을 사용하고 싶으면?**

A: 스크립트의 `cc` 부분을 원하는 이름으로 수정 후 실행하세요.
