Attribute VB_Name = "Module1"
Public FrmQP As Form                                '气泡提醒对象
Public g_Message As String               '气泡内容(系统消息提醒公共内容）
Public g_strTiaoJian As String
Public g_strSQL As String
Public g_strXSELSH As String

'写入日志文件
Public Sub ProWriteLOG(strNeiRong As String, strLeiXing As String)
    Dim FileNM As Variant
    Dim strFileName As String
    Dim fso As New FileSystemObject

    strFileName = Trim(g_strYongHuMC) & "-" & Format(objStandData.getSystemDate, "yyyyMMdd") 'lz2022-08-23 按时分秒生成日志,文件太多
    strFileName = App.Path & "\系统日志\" & Trim(strFileName) & ".log"

    '当文件夹不存在时自动创建文件夹
    If Dir(App.Path & "\系统日志", vbDirectory) = "" Then
        Set fso = CreateObject("Scripting.FileSystemObject")
        fso.CreateFolder (App.Path & "\系统日志")
    End If

    FileNM = FreeFile()

    Open strFileName For Append As FileNM

    If Trim(strLeiXing) <> "" Then
        Write #FileNM, "【" & strLeiXing & "】" & Format(objStandData.getSystemDate, "yyyy-MM-dd hh:MM:ss") 'lz2021-04-22 添加时间,方便后续分析问题
    End If

    Write #FileNM, "[" & strNeiRong & "]" & Chr(13)

    Close #FileNM
End Sub
Private Sub Decode(Length As Integer, OutputBuffer() As Long, InputBuffer() As Byte)
          Dim intDblIndex     As Integer, intByteIndex       As Integer, dblSum       As Double
          For intByteIndex = 0 To Length - 1 Step 4
                  dblSum = InputBuffer(intByteIndex) + InputBuffer(intByteIndex + 1) * 256# + InputBuffer(intByteIndex + 2) * 65536# + InputBuffer(intByteIndex + 3) * 16777216#
                  OutputBuffer(intDblIndex) = UnsignedToLong(dblSum)
                  intDblIndex = intDblIndex + 1
          Next intByteIndex
  End Sub
  Private Function FF(a As Long, B As Long, c As Long, D As Long, X As Long, s As Long, ac As Long) As Long
          a = LongOverflowAdd4(a, (B And c) Or (Not (B) And D), X, ac)
          a = LongLeftRotate(a, s)
          a = LongOverflowAdd(a, B)
  End Function
  Private Function GG(a As Long, B As Long, c As Long, D As Long, X As Long, s As Long, ac As Long) As Long
          a = LongOverflowAdd4(a, (B And D) Or (c And Not (D)), X, ac)
          a = LongLeftRotate(a, s)
          a = LongOverflowAdd(a, B)
  End Function
  Private Function HH(a As Long, B As Long, c As Long, D As Long, X As Long, s As Long, ac As Long) As Long
          a = LongOverflowAdd4(a, B Xor c Xor D, X, ac)
          a = LongLeftRotate(a, s)
          a = LongOverflowAdd(a, B)
  End Function
  Private Function II(a As Long, B As Long, c As Long, D As Long, X As Long, s As Long, ac As Long) As Long
          a = LongOverflowAdd4(a, c Xor (B Or Not (D)), X, ac)
          a = LongLeftRotate(a, s)
          a = LongOverflowAdd(a, B)
  End Function
    
  Function LongLeftRotate(Value As Long, Bits As Long) As Long
          Dim lngSign     As Long, lngI       As Long
          Bits = Bits Mod 32
          If Bits = 0 Then LongLeftRotate = Value:                 Exit Function
          For lngI = 1 To Bits
                  lngSign = Value And &HC0000000
                  Value = (Value And &H3FFFFFFF) * 2
                  Value = Value Or ((lngSign < 0) And 1) Or (CBool(lngSign And &H40000000) And &H80000000)
          Next
          LongLeftRotate = Value
  End Function
  Private Function LongOverflowAdd(Val1 As Long, Val2 As Long) As Long
          Dim lngHighWord     As Long, lngLowWord       As Long, lngOverflow       As Long
          lngLowWord = (Val1 And &HFFFF&) + (Val2 And &HFFFF&)
          lngOverflow = lngLowWord \ 65536
          lngHighWord = (((Val1 And &HFFFF0000) \ 65536) + ((Val2 And &HFFFF0000) \ 65536) + lngOverflow) And &HFFFF&
          LongOverflowAdd = UnsignedToLong((lngHighWord * 65536#) + (lngLowWord And &HFFFF&))
  End Function
  Private Function LongOverflowAdd4(Val1 As Long, Val2 As Long, val3 As Long, val4 As Long) As Long
          Dim lngHighWord     As Long, lngLowWord       As Long, lngOverflow       As Long
          lngLowWord = (Val1 And &HFFFF&) + (Val2 And &HFFFF&) + (val3 And &HFFFF&) + (val4 And &HFFFF&)
          lngOverflow = lngLowWord \ 65536
          lngHighWord = (((Val1 And &HFFFF0000) \ 65536) + ((Val2 And &HFFFF0000) \ 65536) + ((val3 And &HFFFF0000) \ 65536) + ((val4 And &HFFFF0000) \ 65536) + lngOverflow) And &HFFFF&
          LongOverflowAdd4 = UnsignedToLong((lngHighWord * 65536#) + (lngLowWord And &HFFFF&))
  End Function
    
  Private Function UnsignedToLong(Value As Double) As Long
          If Value < 0 Or Value >= OFFSET_4 Then Error 6
          If Value <= MAXINT_4 Then UnsignedToLong = Value Else UnsignedToLong = Value - OFFSET_4
  End Function
  Private Function LongToUnsigned(Value As Long) As Double
          If Value < 0 Then LongToUnsigned = Value + OFFSET_4 Else LongToUnsigned = Value
  End Function

