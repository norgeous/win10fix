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
							"text"="Install these packages?`n`
* 7zip`n`
* winrar`n`
* ccleaner`n`
* defraggler`n`
* vlc`n`
* libreoffice`n`
* sublimetext3`n`
* irfanview`n`
* autohotkey`n`
* itunes`n`
* skype`n`
							";
							"action"={
								Switch(Prompt-Choice @('&Yes','&Choose','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing all packages...";
											"action"={
												choco install -y 7zip winrar ccleaner defraggler vlc libreoffice sublimetext3 irfanviewautohotkey  itunes skype
											}
										}
									}
									1{
										Write-Host "`n"
										Write-Host "Choose packages one-by-one..."
										Write-Host "`n"
										Make-Page @{
											"text"="Install 7zip?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing 7zip...";
															"action"={choco install -y 7zip}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping 7zip"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install winrar?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing winrar...";
															"action"={choco install -y winrar}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping winrar"
													}
												}
											}
										}

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

										Make-Page @{
											"text"="Install irfanview?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing irfanview...";
															"action"={choco install -y irfanview}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping irfanview"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install autohotkey?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing autohotkey...";
															"action"={choco install -y autohotkey}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping autohotkey"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install itunes?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing itunes...";
															"action"={choco install -y itunes}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping itunes"
													}
												}
											}
										}

										Make-Page @{
											"text"="Install skype?";
											"action"={
												Switch(Prompt-Choice @('&Yes','&No')){
													0{
														DoAndDisplay @{
															"title"="Installing skype...";
															"action"={choco install -y skype}
														}
													}
													1{
														Write-Host "`n"
														Write-Host "Skipping skype"
													}
												}
											}
										}
									}
									2{
										Write-Host "`n"
										Write-Host "Skipping packages"
										Write-Host "`n"
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
										Write-Host "`n"
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
										Write-Host "`n"
									}
								}
							}
						}

						Make-Page @{
							"text"="Install tightvnc blender sysinternals procexp procmon filezilla nodejs putty git github virtualbox grepwin?";
							"action"={
								Switch(Prompt-Choice @('&Yes','&No')){
									0{
										DoAndDisplay @{
											"title"="Installing tightvnc blender sysinternals procexp procmon filezilla nodejs putty git github virtualbox grepwin...";
											"action"={choco install -y tightvnc blender sysinternals procexp procmon filezilla nodejs putty git github virtualbox grepwin}
										}
									}
									1{
										Write-Host "`n"
										Write-Host "Skipping tightvnc blender sysinternals procexp procmon filezilla nodejs putty git github virtualbox grepwin"
										Write-Host "`n"
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
				Write-Host "`n"
			}
		}
	}
}

# do not work:
# choco install -y avirafreeantivirus glasswire steam handbrake