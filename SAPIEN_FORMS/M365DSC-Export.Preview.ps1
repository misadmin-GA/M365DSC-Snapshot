#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-M365DSC-Export_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Data, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('PresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formWizard = New-Object 'System.Windows.Forms.Form'
	$buttonCancel = New-Object 'System.Windows.Forms.Button'
	$buttonBack = New-Object 'System.Windows.Forms.Button'
	$buttonFinish = New-Object 'System.Windows.Forms.Button'
	$tabcontrolWizard = New-Object 'System.Windows.Forms.TabControl'
	$tabpageStep1 = New-Object 'System.Windows.Forms.TabPage'
	$exportPasswordBox = New-Object 'System.Windows.Forms.TextBox'
	$labelEnterPassword = New-Object 'System.Windows.Forms.Label'
	$exportUsernameBox = New-Object 'System.Windows.Forms.TextBox'
	$labelExportUserName = New-Object 'System.Windows.Forms.Label'
	$tabpageStep2 = New-Object 'System.Windows.Forms.TabPage'
	$checkboxCheckToContinue = New-Object 'System.Windows.Forms.CheckBox'
	$tabpageStep3 = New-Object 'System.Windows.Forms.TabPage'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$radiobuttonOption3 = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonOption2 = New-Object 'System.Windows.Forms.RadioButton'
	$radiobuttonOption1 = New-Object 'System.Windows.Forms.RadioButton'
	$buttonNext = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formWizard.SuspendLayout()
	$tabcontrolWizard.SuspendLayout()
	$tabpageStep1.SuspendLayout()
	$tabpageStep2.SuspendLayout()
	$tabpageStep3.SuspendLayout()
	$groupbox1.SuspendLayout()
	#
	# formWizard
	#
	$formWizard.Controls.Add($buttonCancel)
	$formWizard.Controls.Add($buttonBack)
	$formWizard.Controls.Add($buttonFinish)
	$formWizard.Controls.Add($tabcontrolWizard)
	$formWizard.Controls.Add($buttonNext)
	$formWizard.AcceptButton = $buttonFinish
	$formWizard.AutoScaleDimensions = New-Object System.Drawing.SizeF(6, 13)
	$formWizard.AutoScaleMode = 'Font'
	$formWizard.CancelButton = $buttonCancel
	$formWizard.ClientSize = New-Object System.Drawing.Size(537, 329)
	$formWizard.FormBorderStyle = 'FixedDialog'
	$formWizard.MaximizeBox = $False
	$formWizard.Name = 'formWizard'
	$formWizard.StartPosition = 'CenterScreen'
	$formWizard.Text = 'Wizard'
	$formWizard.add_Load($formWizard_Load)
	#
	# buttonCancel
	#
	$buttonCancel.Anchor = 'Bottom, Right'
	$buttonCancel.DialogResult = 'Cancel'
	$buttonCancel.Location = New-Object System.Drawing.Point(369, 294)
	$buttonCancel.Name = 'buttonCancel'
	$buttonCancel.Size = New-Object System.Drawing.Size(75, 23)
	$buttonCancel.TabIndex = 4
	$buttonCancel.Text = '&Cancel'
	$buttonCancel.UseCompatibleTextRendering = $True
	$buttonCancel.UseVisualStyleBackColor = $True
	#
	# buttonBack
	#
	$buttonBack.Anchor = 'Bottom, Left'
	$buttonBack.Location = New-Object System.Drawing.Point(13, 294)
	$buttonBack.Name = 'buttonBack'
	$buttonBack.Size = New-Object System.Drawing.Size(75, 23)
	$buttonBack.TabIndex = 1
	$buttonBack.Text = '< &Back'
	$buttonBack.UseCompatibleTextRendering = $True
	$buttonBack.UseVisualStyleBackColor = $True
	$buttonBack.add_Click($buttonBack_Click)
	#
	# buttonFinish
	#
	$buttonFinish.Anchor = 'Bottom, Right'
	$buttonFinish.DialogResult = 'OK'
	$buttonFinish.Location = New-Object System.Drawing.Point(450, 294)
	$buttonFinish.Name = 'buttonFinish'
	$buttonFinish.Size = New-Object System.Drawing.Size(75, 23)
	$buttonFinish.TabIndex = 3
	$buttonFinish.Text = '&Finish'
	$buttonFinish.UseCompatibleTextRendering = $True
	$buttonFinish.UseVisualStyleBackColor = $True
	$buttonFinish.add_Click($buttonFinish_Click)
	#
	# tabcontrolWizard
	#
	$tabcontrolWizard.Controls.Add($tabpageStep1)
	$tabcontrolWizard.Controls.Add($tabpageStep2)
	$tabcontrolWizard.Controls.Add($tabpageStep3)
	$tabcontrolWizard.Anchor = 'Top, Bottom, Left, Right'
	$tabcontrolWizard.Location = New-Object System.Drawing.Point(13, 12)
	$tabcontrolWizard.Name = 'tabcontrolWizard'
	$tabcontrolWizard.SelectedIndex = 0
	$tabcontrolWizard.Size = New-Object System.Drawing.Size(512, 276)
	$tabcontrolWizard.TabIndex = 0
	$tabcontrolWizard.add_SelectedIndexChanged($tabcontrolWizard_SelectedIndexChanged)
	$tabcontrolWizard.add_Selecting($tabcontrolWizard_Selecting)
	$tabcontrolWizard.add_Deselecting($tabcontrolWizard_Deselecting)
	#
	# tabpageStep1
	#
	$tabpageStep1.Controls.Add($exportPasswordBox)
	$tabpageStep1.Controls.Add($labelEnterPassword)
	$tabpageStep1.Controls.Add($exportUsernameBox)
	$tabpageStep1.Controls.Add($labelExportUserName)
	$tabpageStep1.Location = New-Object System.Drawing.Point(4, 22)
	$tabpageStep1.Name = 'tabpageStep1'
	$tabpageStep1.Padding = '3, 3, 3, 3'
	$tabpageStep1.Size = New-Object System.Drawing.Size(504, 250)
	$tabpageStep1.TabIndex = 0
	$tabpageStep1.Text = 'Step 1'
	$tabpageStep1.UseVisualStyleBackColor = $True
	#
	# exportPasswordBox
	#
	$exportPasswordBox.Location = New-Object System.Drawing.Point(90, 46)
	$exportPasswordBox.Name = 'exportPasswordBox'
	$exportPasswordBox.Size = New-Object System.Drawing.Size(259, 20)
	$exportPasswordBox.TabIndex = 3
	#
	# labelEnterPassword
	#
	$labelEnterPassword.AutoSize = $True
	$labelEnterPassword.Location = New-Object System.Drawing.Point(11, 46)
	$labelEnterPassword.Name = 'labelEnterPassword'
	$labelEnterPassword.Size = New-Object System.Drawing.Size(57, 17)
	$labelEnterPassword.TabIndex = 2
	$labelEnterPassword.Text = 'Password:'
	$labelEnterPassword.UseCompatibleTextRendering = $True
	#
	# exportUsernameBox
	#
	$exportUsernameBox.Location = New-Object System.Drawing.Point(90, 11)
	$exportUsernameBox.Name = 'exportUsernameBox'
	$exportUsernameBox.Size = New-Object System.Drawing.Size(259, 20)
	$exportUsernameBox.TabIndex = 1
	$exportUsernameBox.add_TextChanged($exportUsernameBox_TextChanged)
	#
	# labelExportUserName
	#
	$labelExportUserName.AutoSize = $True
	$labelExportUserName.Location = New-Object System.Drawing.Point(9, 14)
	$labelExportUserName.Name = 'labelExportUserName'
	$labelExportUserName.Size = New-Object System.Drawing.Size(60, 17)
	$labelExportUserName.TabIndex = 0
	$labelExportUserName.Text = 'Username:'
	$labelExportUserName.UseCompatibleTextRendering = $True
	$labelExportUserName.add_Click($labelExportUserName_Click)
	#
	# tabpageStep2
	#
	$tabpageStep2.Controls.Add($checkboxCheckToContinue)
	$tabpageStep2.Location = New-Object System.Drawing.Point(4, 22)
	$tabpageStep2.Name = 'tabpageStep2'
	$tabpageStep2.Padding = '3, 3, 3, 3'
	$tabpageStep2.Size = New-Object System.Drawing.Size(504, 250)
	$tabpageStep2.TabIndex = 1
	$tabpageStep2.Text = 'Step 2'
	$tabpageStep2.UseVisualStyleBackColor = $True
	#
	# checkboxCheckToContinue
	#
	$checkboxCheckToContinue.Location = New-Object System.Drawing.Point(6, 6)
	$checkboxCheckToContinue.Name = 'checkboxCheckToContinue'
	$checkboxCheckToContinue.Size = New-Object System.Drawing.Size(238, 24)
	$checkboxCheckToContinue.TabIndex = 0
	$checkboxCheckToContinue.Text = 'Check to Continue'
	$checkboxCheckToContinue.UseCompatibleTextRendering = $True
	$checkboxCheckToContinue.UseVisualStyleBackColor = $True
	$checkboxCheckToContinue.add_CheckedChanged($checkboxCheckToContinue_CheckedChanged)
	#
	# tabpageStep3
	#
	$tabpageStep3.Controls.Add($groupbox1)
	$tabpageStep3.Location = New-Object System.Drawing.Point(4, 22)
	$tabpageStep3.Name = 'tabpageStep3'
	$tabpageStep3.Size = New-Object System.Drawing.Size(504, 250)
	$tabpageStep3.TabIndex = 2
	$tabpageStep3.Text = 'Step 3'
	$tabpageStep3.UseVisualStyleBackColor = $True
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($radiobuttonOption3)
	$groupbox1.Controls.Add($radiobuttonOption2)
	$groupbox1.Controls.Add($radiobuttonOption1)
	$groupbox1.Location = New-Object System.Drawing.Point(13, 15)
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = New-Object System.Drawing.Size(272, 174)
	$groupbox1.TabIndex = 0
	$groupbox1.TabStop = $False
	$groupbox1.Text = 'Select an Option'
	$groupbox1.UseCompatibleTextRendering = $True
	#
	# radiobuttonOption3
	#
	$radiobuttonOption3.Location = New-Object System.Drawing.Point(20, 79)
	$radiobuttonOption3.Name = 'radiobuttonOption3'
	$radiobuttonOption3.Size = New-Object System.Drawing.Size(104, 24)
	$radiobuttonOption3.TabIndex = 2
	$radiobuttonOption3.TabStop = $True
	$radiobuttonOption3.Text = 'Option 3'
	$radiobuttonOption3.UseCompatibleTextRendering = $True
	$radiobuttonOption3.UseVisualStyleBackColor = $True
	$radiobuttonOption3.add_CheckedChanged($radiobuttonOption_CheckedChanged)
	#
	# radiobuttonOption2
	#
	$radiobuttonOption2.Location = New-Object System.Drawing.Point(20, 49)
	$radiobuttonOption2.Name = 'radiobuttonOption2'
	$radiobuttonOption2.Size = New-Object System.Drawing.Size(104, 24)
	$radiobuttonOption2.TabIndex = 1
	$radiobuttonOption2.TabStop = $True
	$radiobuttonOption2.Text = 'Option 2'
	$radiobuttonOption2.UseCompatibleTextRendering = $True
	$radiobuttonOption2.UseVisualStyleBackColor = $True
	$radiobuttonOption2.add_CheckedChanged($radiobuttonOption_CheckedChanged)
	#
	# radiobuttonOption1
	#
	$radiobuttonOption1.Location = New-Object System.Drawing.Point(20, 19)
	$radiobuttonOption1.Name = 'radiobuttonOption1'
	$radiobuttonOption1.Size = New-Object System.Drawing.Size(104, 24)
	$radiobuttonOption1.TabIndex = 0
	$radiobuttonOption1.TabStop = $True
	$radiobuttonOption1.Text = 'Option 1'
	$radiobuttonOption1.UseCompatibleTextRendering = $True
	$radiobuttonOption1.UseVisualStyleBackColor = $True
	$radiobuttonOption1.add_CheckedChanged($radiobuttonOption_CheckedChanged)
	#
	# buttonNext
	#
	$buttonNext.Anchor = 'Bottom, Right'
	$buttonNext.Location = New-Object System.Drawing.Point(288, 294)
	$buttonNext.Name = 'buttonNext'
	$buttonNext.Size = New-Object System.Drawing.Size(75, 23)
	$buttonNext.TabIndex = 2
	$buttonNext.Text = '&Next >'
	$buttonNext.UseCompatibleTextRendering = $True
	$buttonNext.UseVisualStyleBackColor = $True
	$buttonNext.add_Click($buttonNext_Click)
	$groupbox1.ResumeLayout()
	$tabpageStep3.ResumeLayout()
	$tabpageStep2.ResumeLayout()
	$tabpageStep1.ResumeLayout()
	$tabcontrolWizard.ResumeLayout()
	$formWizard.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formWizard.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formWizard.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formWizard.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formWizard.ShowDialog()

} #End Function

#Call the form
Show-M365DSC-Export_psf | Out-Null
