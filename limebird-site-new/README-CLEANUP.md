# Limebird.org Development Environment Cleanup

## Quick Start

Use the batch file to avoid Windows execution policy issues:

```bash
# Basic cleanup (graceful shutdown)
.\cleanup-dev.bat

# Force cleanup (kills stubborn processes)
.\cleanup-dev.bat -Force

# Verbose cleanup (detailed logging)
.\cleanup-dev.bat -Verbose
```

## What It Cleans

### 🧹 **Development Processes:**
- **Node.js**: `node`, `npm`, `npx`, `yarn`, `pnpm`
- **Build Tools**: `vite`, `webpack`, `rollup`, `parcel`
- **Frameworks**: `next`, `react-scripts`, `gatsby`, `nuxt`, `astro`
- **Testing**: `jest`, `cypress`, `playwright`, `mocha`, `karma`
- **Tools**: `tsc`, `eslint`, `prettier`, `babel`, `postcss`

### 🖥️ **Terminal Processes:**
- **PowerShell**: `powershell`, `pwsh`
- **Command Prompt**: `cmd`, `conhost`
- **Windows Terminal**: `WindowsTerminal`, `wt`
- **IDE Terminals**: VS Code, WebStorm, IntelliJ, Sublime Text
- **Integrated Terminals**: Processes running in IDE terminals

### 🌐 **Development Ports:**
- **3000, 3001**: Next.js/React default
- **5173**: Vite default
- **8080**: Webpack dev server
- **8000, 4000, 5000, 6000, 7000, 9000**: Alternative servers
- **4200, 4300**: Angular default
- **8888, 9999**: Alternative servers

## Features

### ✅ **Comprehensive Detection:**
- Finds all development processes by name
- Checks common development ports
- Identifies processes using specific ports
- Detects terminal windows and IDE terminals
- Finds processes running in integrated terminals

### ✅ **Smart Cleanup:**
- Graceful shutdown first (default)
- Force kill for stubborn processes (`-Force`)
- Verifies processes are actually stopped

### ✅ **Detailed Logging:**
- Console output with color coding
- File logging to `cleanup-dev.log`
- Timestamps and process details
- Summary with remaining processes/ports

### ✅ **Error Handling:**
- Safe process termination
- Port conflict resolution
- Detailed error messages
- Solution suggestions

## Usage Examples

```bash
# Before starting development (clean slate)
.\cleanup-dev.bat

# When switching projects
.\cleanup-dev.bat -Force

# When having port conflicts
.\cleanup-dev.bat -Force

# For detailed debugging
.\cleanup-dev.bat -Verbose

# Check what's running first
.\dev-server.bat status
```

## Troubleshooting

### If processes won't stop:
```bash
.\cleanup-dev.bat -Force
```

### If ports are still occupied:
```bash
.\cleanup-dev.bat -Force
```

### If you need to see what's running:
```bash
.\dev-server.bat status
```

### If you need detailed logs:
```bash
.\cleanup-dev.bat -Verbose
Get-Content cleanup-dev.log
```

## Files

- `cleanup-dev.bat` - Main wrapper (use this)
- `cleanup-dev.ps1` - PowerShell script (internal)
- `cleanup-dev.log` - Log file (auto-generated)
- `README-CLEANUP.md` - This file

## Integration with Development Workflow

### Before starting development:
```bash
.\cleanup-dev.bat
.\dev-server.bat start
```

### When switching projects:
```bash
.\cleanup-dev.bat -Force
.\dev-server.bat restart
```

### When finished for the day:
```bash
.\cleanup-dev.bat
```

### When troubleshooting:
```bash
.\cleanup-dev.bat -Force
.\dev-server.bat restart
.\dev-server.bat test
```

This cleanup script ensures a clean development environment and eliminates the "getting stuck" problem by systematically closing all development servers and processes. 