# Limebird.org Development Server Management

## Quick Start

Use the batch file to avoid Windows execution policy issues:

```bash
# Start the development server
.\dev-server.bat start

# Check server status
.\dev-server.bat status

# Restart the server
.\dev-server.bat restart

# Stop the server
.\dev-server.bat stop

# Test connection
.\dev-server.bat test
```

## Advanced Usage

```bash
# Start with custom wait time (20 seconds)
.\dev-server.bat start 20

# Start on different port
.\dev-server.bat start 15 3001

# Get help
.\dev-server.bat
```

## Troubleshooting

### If you get Windows system popups:
- Use `.\dev-server.bat` instead of `.\dev-server.ps1`
- The batch file handles execution policy automatically

### If server won't start:
```bash
.\dev-server.bat stop
.\dev-server.bat start
```

### If port is in use:
```bash
.\dev-server.bat restart
```

### If getting 404 errors:
```bash
.\dev-server.bat restart
.\dev-server.bat test
```

## Files

- `dev-server.bat` - Main wrapper (use this)
- `dev-server.ps1` - PowerShell script (internal)
- `README-DEV-SERVER.md` - This file

## Features

- ✅ **No Windows popups** - Uses batch wrapper
- ✅ **Automatic cleanup** - Stops conflicting processes
- ✅ **Status monitoring** - Shows processes, ports, connection
- ✅ **Error handling** - Provides solutions for common issues
- ✅ **Timing control** - Customizable wait times
- ✅ **Color-coded output** - Easy to read status messages 