if WScript.Arguments.Count < 2 Then
    WScript.Echo "Error! Please specify the source path and the destination. Usage: XlsToCsv SourcePath.xls Destination.csv"
    Wscript.Quit
End If

Dim oExcel
Set oExcel = CreateObject("Excel.Application")

Dim oBook
Set oBook = oExcel.Workbooks.Open(Wscript.Arguments.Item(0))



Dim oSheet
Set oSheet = oBook.ActiveSheet

With oSheet.Columns("A")
    .ColumnWidth = 15
End With
With oSheet.Columns("B:E")
    .ColumnWidth = 15
End With
With oSheet.Columns("F")
    .ColumnWidth = 65
End With
With oSheet.Columns("G")
    .ColumnWidth = 23
End With
With oSheet.Columns("H")
    .ColumnWidth = 10
End With
With oSheet.Columns("I:M")
    .ColumnWidth = 15
End With
With oSheet.Columns("M")
    .ColumnWidth = 100
End With
With oSheet.Rows("1")
    .Font.Bold = True
End With

'set header row gray
    oSheet.Rows(1).Interior.ColorIndex = 15
    '-0.249977111117893

    For intRowCounter = 2 to oSheet.usedRange.Rows.Count 'Skip header row
        For intColumnCounter = 1 to oSheet.usedRange.Columns.Count
            If instr(1, oSheet.Cells(intRowCounter, intColumnCounter).Value, "ADDED", 1) > 0 AND intColumnCounter = 2 Then
                oSheet.Cells(intRowCounter, intColumnCounter).Interior.ColorIndex = 35 'Shade of Yellow 27, 44 , 36 also can be used 
            End If
        Next
    Next
    For intRowCounter = 2 to oSheet.usedRange.Rows.Count 'Skip header row
        For intColumnCounter = 1 to oSheet.usedRange.Columns.Count
            If instr(1, oSheet.Cells(intRowCounter, intColumnCounter).Value, "DELETED", 1) > 0 AND intColumnCounter = 2 Then
                oSheet.Cells(intRowCounter, intColumnCounter).Interior.ColorIndex = 38 'Shade of Yellow 27, 44 , 36 also can be used 
            End If
        Next
    Next
    For intRowCounter = 2 to oSheet.usedRange.Rows.Count 'Skip header row
        For intColumnCounter = 1 to oSheet.usedRange.Columns.Count
            If instr(1, oSheet.Cells(intRowCounter, intColumnCounter).Value, "ANTADVDT", 1) > 0 AND intColumnCounter = 2 Then
                oSheet.Cells(intRowCounter, intColumnCounter).Interior.ColorIndex = 40 'Shade of Yellow 27, 44 , 36 also can be used 
            End If
        Next
    Next
    For intRowCounter = 2 to oSheet.usedRange.Rows.Count 'Skip header row
        For intColumnCounter = 1 to oSheet.usedRange.Columns.Count
            If instr(1, "REPORTDATE|PROJID|PROJNAME|STATENUM|FEDNUM|REGION|LOCATION|PROJMAN|PHONENUM|DESCRIPTION|ADDLINFO|ENGEST", oSheet.Cells(intRowCounter, intColumnCounter).Value, 1) > 0 AND intColumnCounter = 2 Then
                oSheet.Cells(intRowCounter, intColumnCounter).Interior.ColorIndex = 36 'Shade of Yellow 27, 44 , 36 also can be used 
            End If
        Next
    Next


oSheet.Columns("C").HorizontalAlignment = -4131
oSheet.Columns("D").HorizontalAlignment = -4131
oSheet.Columns("G").HorizontalAlignment = -4131

With oSheet.Rows("1:" & oSheet.usedRange.Rows.Count )
    .RowHeight = 14.40
End With

   
'REPORTDATE|PROJID|PROJNAME|STATENUM|FEDNUM|REGION|LOCATION|PROJMAN|PHONENUM|ANTADVDT|DESCRIPTION|ADDLINFO|ENGEST



oBook.SaveAs WScript.Arguments.Item(1), 51

oBook.Close False
oExcel.Quit
'WScript.Echo "Done"
