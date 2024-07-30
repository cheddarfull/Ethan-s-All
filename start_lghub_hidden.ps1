# Start the application
Start-Process "C:\Program Files\LGHUB\lghub.exe"

# Give the application some time to start
Start-Sleep -Seconds 5

# Hide the window
Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Diagnostics;

public class User32 {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    public const int SW_HIDE = 0;
}

public class Win32 {
    public static void HideWindow(string processName) {
        foreach (Process p in Process.GetProcessesByName(processName)) {
            User32.ShowWindow(p.MainWindowHandle, User32.SW_HIDE);
        }
    }
}
"@

[Win32]::HideWindow("lghub")

# Exit PowerShell
exit
