
# SongBeamer OBS Scene Switcher

Switches the Scenes automatically.

## Author

[@teelicht_foxy](https://www.github.com/teelichtfoxy)

## Used By

This project is used by the following companies:

- [Christus Gemeinde Nord](https://cgnord.de) (Technik)

## Supported Operating Systems

- Windows 10/11

## Required Programs

- [OBS 30.2.3](https://obsproject.com)
- [SongBeamer 6.00f](https://www.songbeamer.de)
- [Python 3.12](https://www.microsoft.com/store/productId/9NCVDN91XZQP)
## Installation

1. Download the [.zip file](https://github.com/TeelichtFoxy/SongBeamer-OBS-Scene-Switcher/archive/refs/heads/main.zip) to your "Downloads" folder.

2. Open the "Downloads" folder (``` %USERPROFILE%/Downloads ```)

3. Extract the downloaded .zip file (``` SongBeamer-OBS-Scene-Switcher-main.zip ```)
  - Right klick the file
  - Klick on ```Extract all...```
  - Klick on ```Extract```

4. Open the extracted folder (``` SongBeamer-OBS-Scene-Switcher-main/SongBeamer-OBS-Scene-Switcher-main ```)

5. Run the installation script (``` install.cmd ```) by double-clicking it
 - Click on ```More Informations```
 - Click on ```Execute anyway```
 - (Confirm the installation with admin rights if necessary)

6. Install the OBS-Script
 - Open an terminal with admin rights
 - Copy the following commands with (```Strg. + C``` + ```Strg. + V```) in the terminal:
   ```bash
     cd Downloads/SongBeamer-OBS-Scene-Switcher-main/SongBeamer-OBS-Scene-Switcher-main
     move "./automaticsceneswitcher.lua" "C:/Program Files/obs-studio/data/obs-plugins/frontend-tools/scripts/"
   ```
- Press ```ENTER```
- Close the terminal

7. To start the script automatically when Windows starts, do the following:
 - Copy the autostart .bat file (``` autostartsbobsautomaticsceneswitcher.bat ```) by clicking on the file and press (``` Strg. + C ```)
 - Open the windows autostart folder (``` %APPDATA%/Microsoft/Windows/Startmenü/Programme/Autostart ```)
 - Press (``` Strg. + V ```) to paste the autostart .bat file in the folder
 - Close the folder

8. Start OBS

9. (Follow the OBS setup if necessary)

10. Click on ```Tools``` in the bar above

11. Click on ```Scripts``` in the list

12. Click on the ```+``` symbol

13. Double-click the ```automaticsceneswitcher.lua``` file

14. Set up the script with the ```scenes``` and set the ```refreshinterval```
- ![image](http://teelichtfoxy.cgnord.de/images/SB-OBS-Scene-Switcher-Settings.png)


15. Close the window

16. Click on ```File``` in the bar above

17. Click on ```Settings``` in the list

18. Click on ```Hotkeys```

19. Set your hotkeys to pause and continue switching
![image](http://teelichtfoxy.cgnord.de/images/SB-OBS-Scene-Switcher-Hotkeys.png)

20. Close the window and Restart your PC

21. See [Usage](https://github.com/TeelichtFoxy/SongBeamer-OBS-Scene-Switcher#usage) to learn how to use this Program
## Usage

1. Open SongBeamer

2. Configure SongBeamer for usage with this program (Necessary every time you start SongBeamer):
 - Click on ```Tools```/```Extras``` in the bar above
 - Click on ```Output > Output to Text File...``` in the list
 - Select the ```songbeamertextoutput.txt``` file in ```C:\ES-OBS-Script-Dateien```
 - Accept with ```yes```

3. Start OBS

4. Enjoy the automatic scene changing
![Logo](http://teelichtfoxy.cgnord.de/images/foxy.png)
