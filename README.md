<br>
<h1 align = "center"> Fedora Linux + Hyprland Installation With Simple Dotfiles</h1>
<h2 align="center">Js Bro ( Md. Mahin Islam Mahi ) </h2>
<br>
<div align="center">

![GitHub last commit](https://img.shields.io/github/last-commit/me-js-bro/Fedora-Hyprland?style=for-the-badge&color=b4befe)

<br>
</div>

## Screenshots
<p align="center">
    <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/1.png?raw=true" /> <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/2.png?raw=true" />

   <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/3.png?raw=true" /> <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/4.png?raw=true" />

   <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/5.png?raw=true" /> <img align="center" width="49%" src="https://github.com/me-js-bro/Screen-Shots/blob/main/fedora/6.png?raw=true" />
</p>

<hr>

### Main Components:

- WM: [`Hyprland`](https://hyprland.org/)

- Terminal: [`Kitty`](https://sw.kovidgoyal.net/kitty/)
 
- Status bar: [`Waybar`](https://github.com/Alexays/Waybar)

- Menu: [`Rofi`](https://github.com/davatorium/rofi)

- File Manager-1: [`Dolphin`](https://github.com/KDE/dolphin)

- File Manager-2: [`Thunar`](https://docs.xfce.org/xfce/thunar/start)

## [ `Must Read` ] As I use only a Desktop Pc, and I don't have any laptop, I could not add some features like Bletooth and Brightness Controller. Also this script is not supported for Nvidia GPU Drivers and Asus ROG laptops. I would like if you contribute on this project and add these features.<br>

### I would like to mention [`JaKooLit`](https://github.com/JaKooLit) here. I took some of his scripts, modified and used for my project. Here is his [Arch + Hyprland](https://github.com/JaKooLit/Fedora-Hyprland) installation repository. <hr>


### Other Packages I have used for this configuration:

- `Swwww` - for wallpaper and wallpaper animation
- `Swaylock` - for lockscreen
- `Swaylock-effects` - for swaylock effects
- `Dunst` - for notifications
- `Grimblast` - for screenshot
- `Gwenview` - for image viewer 
- `Pamixer` - for volume control notification
- `Lxappearance` - for gtk themes
- `Nwg-look` - for gtk themes
- `Kvantum` - for qt5 themes
- `Qt5ct` - for qt5 themes
- `Pywal` - to pick colors from the wallpaper
 <hr>

## Themes:
#### I have tried to use a feature to toggle between light and dark theme. You can install your favourite theme and toggle between your themes using <b> nwg-look, lxappearance, qt5 settings. Also it will try to detect colors from the wallpaper automaticly with `pywal`.
<hr>
<br>

## Dotfiles:
<h4>Pre configured Hyprland Dotfiles are on the another repository, that will be clonned and added if the user want to add configuration files. Check the [ install-scripts/dotfiles.sh ] file. </h4>

#### Check out the [ Dotfiles Repository. ](https://github.com/me-js-bro/Hyprland-Dots-01)

### [ `NOTE` ]: <u> Read this part, it is all about editing the dotfiles. </u>

#### I have added all the useful directories in the `~/.config/hypr/` directory and linked all the necessary directories in the `~/.config/` directory using the <i>ln -sf </i> command.
#### For example, if you want to make changes in the key-bindings, just go to `~/.config/hypr/configs/` and edit the `keybinds.conf` file. Also if you want to make changes in the rofi configs, just go to `~/.config/hypr/rofi` and edit the files.
<hr>
<br>


### Clone this repository and run these commands.

```
git clone --depth=1 https://github.com/me-js-bro/Fedora-Hyprland.git
```

```
cd Fedora-Hyprland
chmod +x install.sh
./install.sh
```

### After you have installed successfully, press ` Mod(Windows Button) + Shift + H ` to see the key bindings.
<hr>
<br>

<br>


 <h1 align="center">Contributing on this project...</h1>
<h4>Well I could not add so many features on this project that are usefull for laptops <b><i>(Because I do not have any laptop)</i></b>. I would like you to contribute on this project and make the scripts and dotfiles better, if you are interested.</h4>

 ### What to do:

1) Fork this repository.
2) Make sure to uncheck the Copy the `main` branch only, under the Description option. This will copy the development branch also
3) After forking, Clone the development branch of the forked repository in your PC. Use this command:
    ```
    git clone --depth=1 -b development https://github.com/me-js-bro/Fedora-Hyprland.git
    ```

4) Create a branch with your name on the forked repository ( GitHub Name )
5) Commit the changes with some description. For example:<br>
    `git commit -m "added this feature in the _directory"`
6) Push changes to your created branch, For example: <br>
    `git push origin your_created_branch_name`
7) And then, create a pull request with the changes you have made.
    - Make sure to add the <i> pull request </i> on the `development` branch of the main repository ( With descriptions )

<br>
<br>

### Pull Request
1) Add a short description of what you have changed.
2) A list of the dependencies of packages required for the changes. ( if need any )


<hr>