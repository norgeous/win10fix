# md2gui api
The `md2gui.ps1` parses `.md` files to create forms, details below.

## Controlling the form

### window title
```
# My Window Title
```

### section title
```
## My Section
```

### button
```
### button:My Button
```
followed by commands.

### checkbox
```
### checkbox:My Checkbox
```
followed by commands.
any form with checkboxes automatically has a button added to the form (to run selected commands).




## Useful

### Git bash shortcut
in `.bashrc` add:
```
alias t='S:\\path\\too\\win10fix\\launch.bat'
```

### Command spawns in a new PS window
```
### button:Update all Chocolatey packages now
`start powershell {cup all -y; PAUSE}`
```
