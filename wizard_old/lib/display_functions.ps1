function DoAndDisplay([array]$options){
	Write-Host "`n"
	Write-Host $options.title
	Write-Host "`n"
	& $options.action
	Write-Host "`n"
	Write-Host "completed!"
	Write-Host "`n"
}

function Prompt-Choice([array]$options){
	$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
	Foreach ($option in $options) {
		$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList $option))
	}
	return $Host.UI.PromptForChoice("", "", $choices, 0)
}

function Make-Page([array]$options){
	#clear
	Write-Host "`n"
	Write-Host $options.text
	Write-Host "`n"
	& $options.action
}