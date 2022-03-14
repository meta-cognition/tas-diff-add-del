#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileSelectFile, old_file_xls, , % A_ScriptDir "\sources\", Select the OLD TAS report, Excel Files (*.xls; *.xlsx)
if (old_file_xls = "")
	ExitApp

FileSelectFile, new_file_xls, , % A_ScriptDir "\sources\", Select the NEW TAS report, Excel Files (*.xls; *.xlsx)
if (new_file_xls = "")
	ExitApp

SplitPath, old_file_xls, , , , old_date
SplitPath, new_file_xls, , , , new_date

old_file_csv := A_ScriptDir "\" old_date ".csv"
new_file_csv := A_ScriptDir "\" new_date ".csv"

report_file_csv := A_ScriptDir "\" new_date " tas-diff-add-del.csv"
report_file_xlsx := A_ScriptDir "\reports\" new_date " tas-diff-add-del.xlsx"

FileRead, command_txt1, command1_txt.base
FileRead, command_txt2, command2_txt.base
FileRead, command_txt3, command3_txt.base
FileRead, command_cmd, command_cmd.base

StringReplace, command_txt1, command_txt1, % "%OLDFILEXLS%", % old_file_xls, All
StringReplace, command_txt1, command_txt1, % "%NEWFILEXLS%", % new_file_xls, All
StringReplace, command_txt1, command_txt1, % "%OLDFILECSV%", % old_file_csv, All
StringReplace, command_txt1, command_txt1, % "%NEWFILECSV%", % new_file_csv, All
StringReplace, command_txt1, command_txt1, % "%OLDDATE%", % old_date, All
StringReplace, command_txt1, command_txt1, % "%NEWDATE%", % new_date, All
StringReplace, command_txt1, command_txt1, % "%REPORTFILECSV%", % report_file_csv, All
StringReplace, command_txt1, command_txt1, % "%REPORTFILEXLS%", % report_file_xlsx, All

StringReplace, command_txt2, command_txt2, % "%OLDFILEXLS%", % old_file_xls, All
StringReplace, command_txt2, command_txt2, % "%NEWFILEXLS%", % new_file_xls, All
StringReplace, command_txt2, command_txt2, % "%OLDFILECSV%", % old_file_csv, All
StringReplace, command_txt2, command_txt2, % "%NEWFILECSV%", % new_file_csv, All
StringReplace, command_txt2, command_txt2, % "%OLDDATE%", % old_date, All
StringReplace, command_txt2, command_txt2, % "%NEWDATE%", % new_date, All
StringReplace, command_txt2, command_txt2, % "%REPORTFILECSV%", % report_file_csv, All
StringReplace, command_txt2, command_txt2, % "%REPORTFILEXLS%", % report_file_xlsx, All


StringReplace, command_txt3, command_txt3, % "%OLDFILEXLS%", % old_file_xls, All
StringReplace, command_txt3, command_txt3, % "%NEWFILEXLS%", % new_file_xls, All
StringReplace, command_txt3, command_txt3, % "%OLDFILECSV%", % old_file_csv, All
StringReplace, command_txt3, command_txt3, % "%NEWFILECSV%", % new_file_csv, All
StringReplace, command_txt3, command_txt3, % "%OLDDATE%", % old_date, All
StringReplace, command_txt3, command_txt3, % "%NEWDATE%", % new_date, All
StringReplace, command_txt3, command_txt3, % "%REPORTFILECSV%", % report_file_csv, All
StringReplace, command_txt3, command_txt3, % "%REPORTFILEXLS%", % report_file_xlsx, All

StringReplace, command_cmd, command_cmd, % "%OLDFILEXLS%", % old_file_xls, All
StringReplace, command_cmd, command_cmd, % "%NEWFILEXLS%", % new_file_xls, All
StringReplace, command_cmd, command_cmd, % "%OLDFILECSV%", % old_file_csv, All
StringReplace, command_cmd, command_cmd, % "%NEWFILECSV%", % new_file_csv, All
StringReplace, command_cmd, command_cmd, % "%OLDDATE%", % old_date, All
StringReplace, command_cmd, command_cmd, % "%NEWDATE%", % new_date, All
StringReplace, command_cmd, command_cmd, % "%REPORTFILECSV%", % report_file_csv, All
StringReplace, command_cmd, command_cmd, % "%REPORTFILEXLS%", % report_file_xlsx, All

FileDelete, command1.txt
FileDelete, command2.txt
FileDelete, command.cmd

FileAppend, % command_cmd, command.cmd
FileAppend, % command_txt1, command1.txt
FileAppend, % command_txt2, command2.txt
FileAppend, % command_txt3, command3.txt

RunWait, open "command.cmd"

FileDelete, command1.txt
FileDelete, command2.txt
FileDelete, command3.txt
FileDelete, command.cmd
