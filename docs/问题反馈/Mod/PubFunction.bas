Attribute VB_Name = "PubFunction"
Option Explicit

Public Function BindCbo(cboName As ComboBox, strWhere As String)
    
    Dim strsql     As String
    Dim rstSource  As New ADODB.Recordset
    
    cboName.Clear
    strsql = "SELECT MingCheng FROM Jczd WHERE LeiBie LIKE '" & strWhere & "'"
    rstSource.Open strsql, conn
    Do While Not rstSource.EOF
        cboName.AddItem (Trim(rstSource("MingCheng")))
        rstSource.MoveNext
    Loop

    Set rstSource = Nothing
End Function

Public Function BindComboBoxData(cboName As ComboBox, strsql As String, strField As String, Optional sReturn As String)

    Dim rstSource As New ADODB.Recordset

    If Trim(strsql) = "" Then
        GoTo PROC_EXIT
    End If
    If Not cboName Is Nothing Then
    cboName.Clear
End If
sReturn = ""
    rstSource.Open strsql, conn
    Do While Not rstSource.EOF
        If Decode(rstSource("quxian2").Value) Like "销售*" Then
            If Not cboName Is Nothing Then
                cboName.AddItem Trim(rstSource("" & strField & ""))     '(Trim(rstSource("usename")))
            End If
            sReturn = sReturn & Trim(rstSource("" & strField & "")) & ";"
        End If
        rstSource.MoveNext
    Loop
PROC_EXIT:
    Set rstSource = Nothing
End Function

Public Function ShouHouGuoQiTS(yiyuanmc As String) As Long
'计算售后的服务期是否过期 BY ZXH 2012-7-19
    Dim str As String
    Dim YYMC As String
    Dim rsyy As New ADODB.Recordset
    YYMC = StringEnDeCodecn(yiyuanmc, 75)
    str = "select isnull(weihuEndtime,'1999-1-1') as enddime from yw_kehuxinxi where yiyuanmc='" & YYMC & "'"
    
    Set rsyy = conn.Execute(str)
    
    If Not rsyy.EOF Then
        If rsyy.Fields("enddime") = "1999-01-01" Then
            ShouHouGuoQiTS = 8888
        Else
         ShouHouGuoQiTS = DateDiff("d", Now, rsyy.Fields("enddime"))
        End If
    Else
        ShouHouGuoQiTS = 9999
        MsgBox "系统中没有该医院的档案，请人工核对后补写客户档案！", vbOKOnly + vbQuestion, "提示"
    End If
End Function
  
Public Function GetSZ(lst As lst) As Variant
    '将LST传为二维数组 进行传递
    Dim a() As Variant
    Dim i As Long
    Dim j As Long
    
    ReDim a(lst.Cols, lst.getMaxRow)
    For i = 0 To lst.getMaxRow
        For j = 0 To lst.Cols - 1
            a(j, i) = lst.TextMatrix(i, j)
        Next j
    Next i
    
    GetSZ = a()
End Function

Public Sub ShowError(strChuangTiM As String, strGuoChengM As String, _
                   lngCuoWuH As Long, strCuoWuxx As String, Optional TS As Boolean = False)
    
    On Error GoTo PROC_ERR
    
    Dim strCuoWuTSXX As String
    Dim strCuoWuTSBT As String
    Dim intRiZhiWJH As Integer
    Dim strCuoWuRZWJJ As String
    Dim strCuoWuRZWJM As String
    Dim fso As Object
    
    ' 1. 创建安全的日志目录
    strCuoWuRZWJJ = App.Path
    If Right(strCuoWuRZWJJ, 1) <> "\" Then
        strCuoWuRZWJJ = strCuoWuRZWJJ & "\"
    End If
    strCuoWuRZWJJ = strCuoWuRZWJJ & "ErrorLog"
    
    ' 确保目录存在
    Set fso = CreateObject("Scripting.FileSystemObject")
    If Not fso.FolderExists(strCuoWuRZWJJ) Then
        fso.CreateFolder strCuoWuRZWJJ
    End If
    
    ' 2. 生成日志文件名
    strCuoWuRZWJM = strCuoWuRZWJJ & "\" & Format(Now, "yyyy-MM-dd") & "_Error.log"
    
    ' 3. 安全写入日志
    intRiZhiWJH = FreeFile()
    Open strCuoWuRZWJM For Append As intRiZhiWJH
    Print #intRiZhiWJH, "[" & Now & "] ERROR " & lngCuoWuH
    Print #intRiZhiWJH, "Module: " & strChuangTiM
    Print #intRiZhiWJH, "Method: " & strGuoChengM
    Print #intRiZhiWJH, "Message: " & strCuoWuxx
    Print #intRiZhiWJH, String(50, "-")
    Close intRiZhiWJH
    
    ' 4. 安全弹窗判断
    If TS Then
        ' 检查当前是否有模态窗口
        Dim bModalActive As Boolean
        bModalActive = False
        On Error Resume Next ' 防止无活动窗体时报错
        If Not Screen.ActiveForm Is Nothing Then
            bModalActive = (Screen.ActiveForm.Modal = True)
        End If
        On Error GoTo PROC_ERR
        
        If Not bModalActive Then
            strCuoWuTSXX = "错误号: " & lngCuoWuH & vbCrLf & _
                         "位置: " & strChuangTiM & "." & strGuoChengM & vbCrLf & _
                         "详情: " & strCuoWuxx
            
            strCuoWuTSBT = "系统错误 - 请联系管理员"
            
            ' 使用API显示非阻塞消息框
            ShowNonModalMsg strCuoWuTSXX, strCuoWuTSBT
        Else
            ' 记录弹窗被跳过
            intRiZhiWJH = FreeFile()
            Open strCuoWuRZWJM For Append As intRiZhiWJH
            Print #intRiZhiWJH, "[" & Now & "] WARNING: 弹窗被跳过（模态冲突）"
            Close intRiZhiWJH
        End If
    End If

PROC_EXIT:
    Set fso = Nothing
    Exit Sub
    
PROC_ERR:
    ' 终极错误处理 - 尝试写入系统临时目录
    Dim sTempFile As String
    sTempFile = Environ("TEMP") & "\ShowError_Fallback.log"
    
    On Error Resume Next ' 防止二次错误
    intRiZhiWJH = FreeFile()
    Open sTempFile For Append As intRiZhiWJH
    Print #intRiZhiWJH, "[" & Now & "] CRITICAL ERROR IN ShowError"
    Print #intRiZhiWJH, "Original Error: " & lngCuoWuH & " - " & strCuoWuxx
    Print #intRiZhiWJH, "New Error: " & Err.Number & " - " & Err.Description
    Close intRiZhiWJH
    
    Resume PROC_EXIT
End Sub

' 使用API显示非模态消息框
Private Sub ShowNonModalMsg(sMsg As String, sTitle As String)
    ' 使用标准MsgBox但确保非阻塞
    MsgBox sMsg, vbInformation + vbSystemModal, sTitle
End Sub
