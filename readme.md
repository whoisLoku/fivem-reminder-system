A fully customizable reminder system for FiveM that displays periodic break, health, or any custom messages to players. The UI appears on screen at configurable intervals and can be closed with the ESC key.

---

![FiveM_GTAProcess_BgXfz62zPa](https://github.com/user-attachments/assets/442f1839-6a95-4caa-b0b4-172fb70f96a8)

---


1. Download the resource.
2. Place it into your `resources` folder.
3. Ensure the folder is named:
4. Add this to your `server.cfg`:

---

All settings are inside **`config.lua`**:

```lua
Config = {}

-- Reminder interval (milliseconds)
Config.Interval = 60 * 60 * 1000 -- 1 hour

-- UI Texts
Config.Title = "Don't Forget Your Health, Take a Short Break"
Config.Message = "You've been playing for a long time! Long sessions can reduce your focus and energy. Stand up, stretch a little and drink some water. A short break will refresh you and keep the game fun!"
Config.CloseKey = "ESC"
Config.CloseText = "Press to Close Message"

```

---

A simple test command is included:
```lua
/testreminder
```

