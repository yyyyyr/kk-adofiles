

# Macros to 'Paste as Values' or 'Paste as Unformatted Text' #
## Microsoft Excel ##
Here is Visual Basic code to use in Microsoft Excel.  Here's the idea: once you have something in your clipboard, I use Control-Shift-V to paste the clipboard contents into my spreadsheet as unformatted text.

Assume there is something in the clipboard.
  1. The code will first try to "Paste as Values." If you have Excel cells copied, it will paste the cells as if you had selected Edit -> Paste Special -> Values -> OK.
  1. If there is an error (e.g. you had hit Copy in another program) it will then try to "Paste as Unformatted Text."  If there is text in your clipboard, it will paste the cells as if you had selected Edit -> Paste Special -> Text -> OK.
  1. If that doesn't work (e.g. you are trying to paste a .jpeg image), it will display the error messages you just generated.
  1. To install the code.  Just create a new macro (Tools -> Macros ).  Assign it to the keyboard command you wish.  Ideally, you would create the macro in the Personal.xls file so the command is available whenever you open excel.  If you don't know about Excel Macros, just google "Excel Macros."  Paste in the following text and save:

```
Sub PasteAsText()
' PasteAsText Macro
' Macro by Keith Kranker 3/4/2008 - Paste Values or Paste as Text
' Keyboard Shortcut: Ctrl+Shift+V

 Dim ErrorRecord1 As Long
 Dim ErrorRecord2 As String

 On Error Resume Next
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks:=False, Transpose:=False
 If Err.Number <> 0 Then
    ErrorRecord1 = Err.Number
    ErrorRecord2 = Err.Description
    On Error Resume Next
    ActiveSheet.PasteSpecial Format:="Text", Link:=False, DisplayAsIcon:=False
    If Err.Number <> 0 Then
        MsgBox "Error Pasting Text:" _
            & Chr(10) & "- Error #" & ErrorRecord1 & " " & ErrorRecord2 _
            & Chr(10) & "- Error #" & Err.Number & " " & Err.Description
        ErrorRecord = 0
    End If
 End If
 'To Clear Clipboard, uncomment next line
 'Application.CutCopyMode = False
End Sub
```


There is one drawback to this method: Running a macro will erase your Undo (Ctrl-Z) history.

## Microsoft Word ##
For Microsoft Word, the code is only slightly different:

```
Sub Paste_unformatted()
' Paste_unformatted Macro
' Macro 2/1/2008 by Keith Kranker
'
On Error Resume Next
    Selection.PasteAndFormat (wdFormatPlainText)
    If Err.Number <> 0 Then
        MsgBox "Error Pasting Text:" _
            & Chr(10) & "- Error #" & Err.Number & " " & Err.Description
        ErrorRecord = 0
    End If
End Sub
```


# Other Stuff #

## Excel comments ##

Reset the size & location of comments in excel:

```
Sub Comments_Reset_Size_Loc()
	' source: http://www.contextures.com/xlcomments03.html
    Dim c  As Object
    For Each c In ActiveSheet.Comments
        c.Shape.Top = c.Parent.Top + 5
        c.Shape.Left = c.Parent.Offset(0, 1).Left + 5
        c.Shape.TextFrame.AutoSize = True
        If c.Shape.Width > 175 Then
            lArea = c.Shape.Width * c.Shape.Height
            c.Shape.Width = 144
            c.Shape.Height = (lArea / 144) * 1.2
      End If
    Next c
End Sub
```

Turn on comments in Excel (show comments)

```
Sub Comments_On()
    ' source http://www.contextures.com/xlcomments03.html
    Dim c As Comment
    For Each c In ActiveSheet.Comments
      c.Visible = True
    Next
End Sub
```

Turn off comments in Excel (hide comments)

```
Sub Comments_Off()
'www.contextures.com\xlcomments03.html
'shows all comments on the active sheet
Dim c As Comment
For Each c In ActiveSheet.Comments
  c.Visible = False
Next
End Sub
```

## outlook:  for got to attach file to an email? ##


This Outlook macro will politely remind you to attach a file if it finds the word "attach" in your email and no actual attached file.
Adding a macro to Outlook is easy. Just copy everything below starting with "Private Sub" through "End Sub." In Outlook, select the "Tools / Macro / Visual Basic Editor" menu option. You may need to expand the project by clicking the plus signs under Project1 until you see ThisOutlookSession, and double-click it. Click into the big white empty page and hit Paste.
Click Save and you'll be all set. If you've previously disabled macros you'll need to enable them.

from http://mark.bird.googlepages.com/home

```
Private Sub Application_ItemSend(ByVal Item As Object, Cancel As Boolean)
' source: http://mark.bird.googlepages.com/home:
Dim m As Variant
Dim strBody As String
Dim intIn As Long
Dim intAttachCount As Integer, intStandardAttachCount As Integer
On Error GoTo handleError
'Edit the following line if you have a signature on your email that includes images or other files. Make intStandardAttachCount equal the number of files in your signature.
intStandardAttachCount = 0
strBody = LCase(Item.Body)
intIn = InStr(1, strBody, "original message")
If intIn = 0 Then intIn = Len(strBody)
intIn = InStr(1, Left(strBody, intIn), "attach")
intAttachCount = Item.Attachments.Count
If intIn > 0 And intAttachCount <= intStandardAttachCount Then
    m = MsgBox("It appears that you mean to send an attachment," & vbCrLf & "but there is no attachment to this message." & vbCrLf & vbCrLf & "Do you still want to send?", vbQuestion + vbYesNo + vbMsgBoxSetForeground)
    If m = vbNo Then Cancel = True
End If

handleError:
If Err.Number <> 0 Then
    MsgBox "Outlook Attachment Reminder Error: " & Err.Description, vbExclamation, "Outlook Attachment Reminder Error"
End If
End Sub

```