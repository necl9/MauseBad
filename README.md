# MauseBad
A small Windows script to replace your mouse with keystrokes - Vim style.

Free and open source. 
...Obviously. I mean it's a script.

I've seen some ideas and examples on the net - and it looked intriguing. I wanted to try how it would feel to not take my hands off of keyboard at all. That interruption always annoyed me.

But what I found on the net was either not the way I liked, not on Windows, or paywalled.

So I did it for myself. 

And since the script already done, why not share it, right?

Just keep in mind that it's first and foremost the script that I did for myself. Hence, some of the decisions.

# Dependancies:
AutoHotkey v2.0 or later.
https://www.autohotkey.com/

...Because, you know - it's an AutoHotkey script.

# Installation:
After installing AutoHotkey, just double-click on MouseBad.ahk - and it should show as a running program in the tray.

And because it's just a script, you can always open it with your text-editor and modify however you like.

# Keybindings and Configuration:
Your active config is in "config/config.ahk"

All other files in the "config/" directory are different configs that you can use by renaming them into "config.ahk".

Copy and modify it to your heart's content.

### By default CapsLock is to enter/exit "Mouse Layer" (you should see a pic-notification in the top-left corner of your screen).

For now, I made 2 different configs for "Mouse Layer": 

### Intuitive:
|Key:| Action:                                                                                              |
|:---|:-----------------------------------------------------------------------------------------------------|
|l:  | move and click Left Mouse Button.                                                                    |
|r:  | move and click Right Mouse Button.                                                                   |
|m:  | move and click Middle Mouse Button.                                                                  |
|j:  | "Jump". Moves the mouse to the target location.                                                      |
|c:  | just a click. Left Mouse Button.                                                                     |
|k:  | click and drag. ...Because d was already taken.                                                      |
|u:  | mouse wheel Up.                                                                                      |
|d:  | mouse wheel Down.                                                                                    |
|s+u:| "Super" wheel up. Precisely 8 times faster.                                                          |
|s+d:| "Super" wheel down.                                                                                  |
|i:  | left arrow. ...Beause hjkl already taken. Use "Ergonomic" config for hjkl.                           |
|o:  | down arrow.                                                                                          |
|p:  | up arrow.                                                                                            |
|[:  | right arrow.                                                                                         |
|Tab:| Switch between screens. Or you can use numbers from 1 to 0 to choose the monitor you need directly.  |
|Esc:| to regain the control of your keyboard. :) The same as CapsLock - does not close the program.        |

### Ergonomic:
|Key:| Action:                                                                                              |
|:---|:-----------------------------------------------------------------------------------------------------|
|w:  | move and click Left Mouse Button.                                                                    |
|r:  | move and click Right Mouse Button.                                                                   |
|e:  | move and click Middle Mouse Button.                                                                  |
|f:  | Moves the mouse to the target location.                                                              |
|c:  | just a click. Left Mouse Button.                                                                     |
|q:  | click and drag.                                                                                      |
|u:  | mouse wheel Up.                                                                                      |
|d:  | mouse wheel Down.                                                                                    |
|s+u:| "Super" wheel up. Precisely 8 times faster.                                                          |
|s+d:| "Super" wheel down.                                                                                  |
|h:  | left arrow.                                                                                          |
|j:  | down arrow.                                                                                          |
|k:  | up arrow.                                                                                            |
|l:  | right arrow.                                                                                         |
|Tab:| Switch between monitors. Or you can use numbers from 1 to 0 to choose the monitor you need directly. |
|Esc:| to regain the control of your keyboard. :) The same as CapsLock - does not close the program.        |

Ergonomic is the one I use, so it's the one active by default.

# Usage:
- Press CapsLock.
    - 'CapsLock' again will return your keyboard to you - to use as usual.
    - Or reset back to beginning if you want to cancel your mouse movement.
- In the top-left corner of your screen you should see a pic "Mouse Layer".
- Now you can use all of the key-commands mentioned above.
- If you choose a command that needs to move the mouse, you'll be shown a grid on the screen.
- For starters, you can just follow the instructions on the screen. For example, if you press 'z' then 'n', you'll choose the bottom left corner cell.
- Now you can either press 'Space' to move the mouse to the center of that cell, or select a specific part of the cell for more precision
    - For example 'z' again will move to the far bottom-left corner of the selected cell.
- You can also interrupt the cell selection with 'Space' at any time.
    - If you press 'Space' right after the grid is shown - the mouse will move to the center of the screen.
    - If you press, again for example, 'z' and 'Space' - your mouse will move to the center of the 'z-cluster' at the bottom-left (all the cells starting with 'z').
- Also, you can just press 'z' 3 times and it will do the same as 'znz', or 'znn', or 'nnn'.
    - That is because script devides your keyboard on the left and right side of 5x4 grid:

        | Left =     | = Right     |
        |:----------:|:-----------:|
        | 1 2 3 4 5  |  6 7 8 9 0  |
        | q w e r t  |  y u i o p  |
        | a s d f g  |  h j k l ;  |
        | z x c v b  |  n m , . /  |

    - These two halves of your keyboard function absolutely the same. '1' = '6', 'e' = 'i', and so on. 
    - That is done so - when you get used to it - you don't even need to look at the grid shown on the screen.
        - You need to move somewhere on top of your screen - you use the top row keys. You need somewhere at the center - you use keys around the center ('e' or 'd', 'i' or 'k').
        - Then you do the same for every sub-cell.
        - And because keys and proportions (5x4) remain the same everywhere, it is possible to just get used to it with time - and do the same as Vim motions are doing to your speed. It'll get faster and faster the more you use it.

## If you liked it, you can leave me a tip:
https://boosty.to/necl9/donate
