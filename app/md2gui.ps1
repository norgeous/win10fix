$Script:defaultshortcutsfile="config.md"
$Script:guiconfig = @{}
$Script:commandstorun = @()

# validation helpers
function Test-StringEmpty($String){
    return ([string]::IsNullOrEmpty($Local:String) -Or [string]::IsNullOrWhiteSpace($String))
}
function Test-PathExists($String){
    return (-Not (Test-StringEmpty $Local:String) -And (Test-Path $Local:String))
}

# colour terminal output function adapted from http://stackoverflow.com/a/30265949
function Write-Color {
    $color = "White"
    $allColors = ("-Black","-DarkBlue","-DarkGreen","-DarkCyan","-DarkRed","-DarkMagenta","-DarkYellow","-Gray","-Darkgray","-Blue","-Green","-Cyan","-Red","-Magenta","-Yellow","-White")
    foreach($arg in $args) {
        if ($allColors -contains $arg) {$color = $arg.substring(1)}
        else {Write-Host $arg -foreground $color -nonewline}
    }
    Write-Host
}

# make a gui form
function GenerateForm {

    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null

    $form1 = New-Object System.Windows.Forms.Form
    $form1.Name = "form1"
    $form1.StartPosition = "CenterScreen"
    $form1.Text = $Script:guiconfig.windowtitle
    $form1.Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0

    $form_height = 10
    $has_checkboxes = $False

    for ($i=0; $i -lt $Script:guiconfig.components.length; $i++) {

        switch ($Script:guiconfig.components[$i].type) {

            "checkbox" {
                $has_checkboxes = $True
                $Script:guiconfig.components[$i].formobject = New-Object System.Windows.Forms.CheckBox
                $Script:guiconfig.components[$i].formobject.AutoSize = $True
                $System_Drawing_Point = New-Object System.Drawing.Point
                $System_Drawing_Point.X = 10
                $System_Drawing_Point.Y = $form_height
                $form_height += 18
                $Script:guiconfig.components[$i].formobject.Location = $System_Drawing_Point
                $Script:guiconfig.components[$i].formobject.Name = "checkBox"+$i
                $Script:guiconfig.components[$i].formobject.Text = $Script:guiconfig.components[$i].label
                $Script:guiconfig.components[$i].formobject.Checked = $true
            }

            "button" {
                $Script:guiconfig.components[$i].formobject = New-Object System.Windows.Forms.Button
                $System_Drawing_Size = New-Object System.Drawing.Size
                $System_Drawing_Size.Width = 280
                $System_Drawing_Size.Height = 35
                $Script:guiconfig.components[$i].formobject.Size = $System_Drawing_Size
                $System_Drawing_Point = New-Object System.Drawing.Point
                $System_Drawing_Point.X = 10
                $System_Drawing_Point.Y = $form_height
                $form_height += $System_Drawing_Size.Height + 5
                $Script:guiconfig.components[$i].formobject.Location = $System_Drawing_Point
                $Script:guiconfig.components[$i].formobject.Name = "button"+$i
                $Script:guiconfig.components[$i].formobject.Text = $Script:guiconfig.components[$i].label
                # Font styles are: Regular, Bold, Italic, Underline, Strikeout
                $Script:guiconfig.components[$i].formobject.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Regular)
                $Script:guiconfig.components[$i].formobject.add_Click({
                    $form1.Hide()
                    for ($m=0; $m -lt $Script:guiconfig.components.length; $m++) {
                        if($Script:guiconfig.components[$m].formobject.Name -eq $this.Name){
                            for ($n=0; $n -lt $Script:guiconfig.components[$m].commands.length; $n++) {
                                $Script:commandstorun += $Script:guiconfig.components[$m].commands[$n]
                            }
                        }
                    }
                    $form1.Close()
                })
            }

            "label" {
                $Script:guiconfig.components[$i].formobject = New-Object System.Windows.Forms.Label
                $Script:guiconfig.components[$i].formobject.AutoSize = $True
                $System_Drawing_Point = New-Object System.Drawing.Point
                $System_Drawing_Point.X = 10
                $System_Drawing_Point.Y = $form_height+10
                $form_height += 18+10
                $Script:guiconfig.components[$i].formobject.Location = $System_Drawing_Point
                $Script:guiconfig.components[$i].formobject.Name = "label"+$i
                $Script:guiconfig.components[$i].formobject.Text = $Script:guiconfig.components[$i].label
            }

        }

        $Script:guiconfig.components[$i].formobject.TabIndex = $i
        $form1.Controls.Add($Script:guiconfig.components[$i].formobject)
    }

    if ($has_checkboxes) {
        $form_height += 10
        $System_Drawing_Size = New-Object System.Drawing.Size
        $System_Drawing_Size.Width = 280
        $System_Drawing_Size.Height = 35
        $System_Drawing_Point = New-Object System.Drawing.Point
        $System_Drawing_Point.X = 10
        $System_Drawing_Point.Y = $form_height
        $form_height += $System_Drawing_Size.Height + 5
        $button1 = New-Object System.Windows.Forms.Button
        $button1.Size = $System_Drawing_Size
        $button1.Location = $System_Drawing_Point
        $button1.TabIndex = $apps.length+1
        $button1.Name = "button1"
        $button1.Text = "Run selected"
        $button1.Font = New-Object System.Drawing.Font("Arial",10,[System.Drawing.FontStyle]::Regular)
        $button1.UseVisualStyleBackColor = $True
        $button1.DataBindings.DefaultDataSourceUpdateMode = 0
        $button1.add_Click({
            $form1.Hide()
            for ($i=0; $i -lt $Script:guiconfig.components.length; $i++) {
                if ($Script:guiconfig.components[$i].formobject.Checked) {
                    for ($j=0; $j -lt $Script:guiconfig.components[$i].commands.length; $j++) {
                        $Script:commandstorun += $Script:guiconfig.components[$i].commands[$j]
                    }
                }
            }
            $form1.Close()
        })
        $form1.Controls.Add($button1)
    }

    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState

    $OnLoadForm_StateCorrection = {
        $form1.WindowState = $InitialFormWindowState
    }
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Width = 300
    $System_Drawing_Size.Height = $form_height+10
    $form1.ClientSize = $System_Drawing_Size

    $InitialFormWindowState = $form1.WindowState
    $form1.add_Load($OnLoadForm_StateCorrection)
    Write-Color -Gray ' waiting for user...'
    $form1.ShowDialog() | Out-Null
}

# main logic
function Initialize-Shortcutsbat($Local:configlocation) {

    #Clear-Host

    # if no shortcuts config supplied
    If (Test-StringEmpty $Local:configlocation) {

        # set as same dir as bat file
        $Local:shortcutsfile = ('{0}\{1}' -f $pwd, $Script:defaultshortcutsfile)

    } Else {

        # else use supplied file
        $Local:shortcutsfile = $Local:configlocation

    }

    # check shortcuts config file actually exists
    If (-Not (Test-PathExists $Local:shortcutsfile)) {

        Write-Host
        Write-Host " $pwd"
        Write-Color -Magenta (' Config file: "{0}" was not found' -f $Local:shortcutsfile)
        Write-Host
        Exit 404

    } Else {

        #
        # config file exists
        #

        # set up defaults for options
        $Local:shortcutsfile = (Resolve-Path $Local:shortcutsfile | %{$_.Path})
        $Local:wd = Split-Path -Path $Local:shortcutsfile               # set the working dir same as shortcuts config file location
        Set-Location "$Local:wd"                                        # change directory
        $Local:after = ""                                               # set default command that runs afterwards as empty

        # load config file
        $Local:shortcutstxt = Get-Content "$Local:shortcutsfile"

        # overwrite default options 'wd' and 'after'
        Foreach ($Local:line in $Local:shortcutstxt) {

            # if line starts with '##wd='
            If ($Local:line.StartsWith('wd:')) {

                # use the remainder of the line as the new working dir
                $Local:wd = $Local:line -replace 'wd:', ''

            }

            # if line starts with '##after='
            If ($Local:line.StartsWith('##after=')) {

                # use the remainder of the line as 'after'
                $Local:after = $Local:line.Substring(8).Trim()

            }
        }

        # check config has at least one command
        $Local:hascommands = $False
        Foreach ($Local:line in $Local:shortcutstxt) {
            If (-Not (Test-StringEmpty $Local:line) -And -Not $Local:line.StartsWith('#')) {
                $Local:hascommands = $True
                break
            }
        }
        If (-Not $Local:hascommands) {

            Write-Host
            Write-Color -Magenta (' Config file: "{0}" does not contain any commands' -f $Local:shortcutsfile)
            Write-Host
            Exit 500

        } Else {

            #
            # config file exists
            # config contains at least one command
            #

            # check that working dir exists
            If (-Not (Test-PathExists $Local:wd)) {

                Write-Host
                Write-Host " $pwd"
                Write-Color -Magenta (' Working directory: "{0}" was not found' -f $Local:wd)
                Write-Host
                Exit 404

            } Else {

                #
                # config file exists
                # config contains at least one command
                # working directory exists
                #

                # change directory
                Set-Location "$Local:wd"

                # show info in the console
                Write-Host
                Write-Color -Yellow " PS> " -Cyan "md2gui.ps1"

                # show some configuration info (header)
                Write-Color -Gray ' shorcuts from:'   "`t`t" -Green "$Local:shortcutsfile"
                Write-Color -Gray ' working directory:' "`t" -Green "$pwd"

                If ($Local:after -ne "") {
                    Write-Color -Gray ' after each command:' -DarkGreen "`t" '& ' $Local:after
                }

                Write-Color -Gray ' parsing config file...'

                # parse config.md to config hash array

                $Script:guiconfig["windowtitle"] = "default title"
                $Script:guiconfig["components"]=@()
                Foreach ($Local:line in $Local:shortcutstxt) {

                    # not empty lines
                    If (-Not (Test-StringEmpty $Local:line)) {

                        #Write-Color -DarkCyan ($Local:line)

                        # main window title (just one hashtag)
                        If ($Local:line.StartsWith('# ')) {
                            $Script:guiconfig["windowtitle"] = $Local:line -replace '# ', ''
                        }

                        # section labels (two hashtags)
                        If ($Local:line.StartsWith('## ')) {
                            $Script:guiconfig.components += @{
                                "type" = "label"
                                "label" = $Local:line -replace '## ', ''
                            }
                        }

                        # checkboxes
                        If ($Local:line.StartsWith('### checkbox:')) {
                            $Script:guiconfig.components += @{
                                "type" = "checkbox"
                                "label" = $Local:line -replace '### checkbox:', ''
                                "commands" = @()
                            }
                        }

                        # buttons
                        If ($Local:line.StartsWith('### button:')) {
                            $Script:guiconfig.components += @{
                                "type" = "button"
                                "label" = $Local:line -replace '### button:', ''
                                "commands" = @()
                            }
                        }

                        # commands
                        If ($Local:line.StartsWith('`')) {
                            $command = $line -replace '`', ''
                            $Script:guiconfig.components[$Script:guiconfig.components.length-1].commands += $command
                        }



                    }
                }


                # create gui query
                Write-Color -Gray ' building gui...'
                GenerateForm

                # code blocked until form returns
                $Local:num_commands = @($Script:commandstorun).Length
                Write-Color -Gray " gui returned $Local:num_commands command(s)..."
                foreach ($command in $Script:commandstorun) {
                    Write-Host
                    Write-Color -Yellow " PS> " -Cyan "$command"
                    iex $command
                }


                # Initialize-Shortcutsbat function completes here

            } # end working dir exists

        } # end config has commands

    } # end config exists

} # end Initialize-Shortcutsbat function

# start the checks and mainloop (eventually)
If (-Not $Script:arguments) {$Script:arguments=@(); ForEach ($Local:v in $Args) {$Script:arguments += $Local:v}}
Initialize-Shortcutsbat $Script:arguments[0]

Exit $(If ($LASTEXITCODE) {$LASTEXITCODE} Else {200})
