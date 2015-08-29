Make-Page @{
	"text"="Install Chocolatey?";
	"action"={
		Switch(Prompt-Choice @('&Yes','&No')){
			0{
				DoAndDisplay @{
					"title"="Installing Chocolatey...";
					"action"={

						iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

						Make-Page @{
							"text"="Install chocolateygui?";
							"action"={
								Switch(Prompt-Choice @('&Yes','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing chocolateygui...";
											"action"={choco install -y chocolateygui}
										}
									}
									1{
										Write-Host "`n"
										Write-Host "Skipping chocolateygui"
									}
								}
							}
						}

						Make-Page @{
							"text"="Install all packages?";
							"action"={
								Switch(Prompt-Choice @('&Yes','&Choose','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing all packages...";
											"action"={
												choco install -y ccleaner defraggler vlc libreoffice sublimetext3
											}
										}
									}
									1{
										Write-Host "`n"
										Write-Host "Choose packages one-by-one..."
										Make-Page @{
											"text"="Install ccleaner?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing ccleaner...";
															"action"={choco install -y ccleaner}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping ccleaner"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install defraggler?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing defraggler...";
															"action"={choco install -y defraggler}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping defraggler"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install vlc?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing vlc...";
															"action"={choco install -y vlc}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping vlc"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install libreoffice?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing libreoffice...";
															"action"={choco install -y libreoffice}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping libreoffice"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install sublimetext3?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing sublimetext3...";
															"action"={choco install -y sublimetext3}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping sublimetext3"
													}
												}
											}
										}
									}
									2{
										Write-Host "`n"
										Write-Host "Skipping packages"
									}
								}
							}
						}

						Make-Page @{
							"text"="Install browsers? (firefox, google-chrome-x64, opera)";
							"action"={
								Switch(Prompt-Choice @('&Yes','&Choose','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing all browsers...";
											"action"={choco install -y firefox google-chrome-x64 opera}
										}
									}
									1{
										Make-Page @{
											"text"="Install firefox?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing firefox...";
															"action"={choco install -y firefox}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping firefox"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install google-chrome-x64?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing google-chrome-x64...";
															"action"={choco install -y google-chrome-x64}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping google-chrome-x64"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install opera?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing opera...";
															"action"={choco install -y opera}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping opera"
													}
												}
											}
										}
									}
									2{
										Write-Host "`n"
										Write-Host "Skipping allbrowsers"
									}
								}
							}
						}

						Make-Page @{
							"text"="Install geforce-experience?";
							"action"={
								Switch(Prompt-Choice @('&Yes','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing geforce-experience...";
											"action"={choco install -y geforce-experience}
										}
									}
									1{
										Write-Host "`n"
										Write-Host "Skipping geforce-experience"
									}
								}
							}
						}
					}
				}
			}
			1{
				Write-Host "`n"
				Write-Host "Skipping Chocolatey"
			}
		}
	}
}


################## ADD LATER
# choco install -y tightvnc sandboxie geforce-experience ccleaner defraggler vlc itunes libreoffice blender sysinternals procexp procmon
# choco install -y allbrowsers sublimetext3 filezilla nodejs putty github virtualbox autohotkey grepwin
# choco install -y adb
# :: choco install -y jdk7 android-sdk
# :: choco install -y kodi
# :: choco install -y phantomjs
# :: didnt work
# :: avirafreeantivirus glasswire steam skype 7zip winrar handbrake