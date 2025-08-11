# Ainaa-windows

### **Running the App**
1. **Terminal**:
   ```bash
   # Dev mode
   flutter run --dart-define=APP_ENV=dev

   # Prod mode (simulated)
   flutter run --dart-define=APP_ENV=prod
   ```

***or***

2. **VS Code Debugging with launch.json**

## 📁 File Setup
1. Create `.vscode/launch.json` in your project root
2. Paste this configuration:

  ```json
  {
    "version": "0.2.0",
    "configurations": [
      {
        "name": "Flutter: Run Dev",
        "request": "launch",
        "type": "dart",
        "program": "lib/main.dart",
        "args": [
          "--dart-define=APP_ENV=dev",
        ]
      },
      {
        "name": "Flutter: Run Prod",
        "request": "launch",
        "type": "dart",
        "program": "lib/main.dart",
        "args": [
          "--dart-define=APP_ENV=prod"
        ]
      }
    ]
  }
  ```
3.How to Use:
-Open VS Code's Debug Panel
-Select configuration:
  Run - Dev Mode for development
  Run - Prod Mode for production testing

***Windows Production Build***
  ```batch
  flutter build windows --release --dart-define=APP_ENV=prod
  ```

