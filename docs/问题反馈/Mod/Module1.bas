Attribute VB_Name = "zxh_main"

Public conn As New ADODB.Connection
Public str As String
Public strsql As String
Public rs As New ADODB.Recordset
Public Rs1 As New ADODB.Recordset
Public rs3 As New ADODB.Recordset
Public user As String
Public strini(3) As String
Public saveset(3) As String
Public tplsh As Integer
Public sqlDataString As String
Public objExecuteSQL As New PublicProc.clsExecuteSQL         '执行SQL
Public g_strYongHuZT As String          '用户状态：0=无效 1=有效 2=普通销售人员 3=销售经理
Public objFormSetting As New PublicProc.clsFormSetting

'下面是公用函数声明
Public Grf As New Grf_Lib.ClsGrf                             '新报表（锐浪）
Public g_intDaYinYLDZT As Integer                '打印预览的状态

'调用API
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Sub Main()

'问题反馈程序启动入口
    If GetDataBase = True Then
       Grf.InitGrf (sqlDataString)
       frmain.Show
    Else
       frmshujvlj.Show
       Exit Sub
    End If
End Sub

'获取配置文件数据

Public Function GetDataBase() As Boolean
Dim keycaptoin(3) As String
Dim inti As Long
'Dim server As String
'读入INI文件
    keycaptoin(0) = "服务器名"
    keycaptoin(1) = "数据库名"
    keycaptoin(2) = "登录用户"
    keycaptoin(3) = "密码"
For inti = 0 To 3 Step 1
   strini(inti) = String(512, 0)
   Call GetPrivateProfileString("savestring", keycaptoin(inti), "", strini(inti), 512, App.Path & "\cjyboot.ini")
   saveset(inti) = Trim(strini(inti))
Next inti

 
 '连接数据库
    On Error GoTo zxh
    sqlDataString = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=" & Replace(Trim(saveset(2)), Chr(0), "") & ";Password=" & Replace(Trim(saveset(3)), Chr(0), "") & ";Initial Catalog=" & Replace(Trim(saveset(1)), Chr(0), "") & ";Data Source=" & Replace(Trim(saveset(0)), Chr(0), "") & ";Timeout = 5"
     conn.ConnectionString = sqlDataString
     objExecuteSQL.ConnectionServer sqlDataString
     conn.CursorLocation = adUseClient
     conn.CommandTimeout = 30
     conn.ConnectionTimeout = 15
     conn.Open

     
     
    
    GetDataBase = True             '连接成功傎为TRUE
    Exit Function                  '连接成功退出函数
zxh:
    GetDataBase = False
    Exit Function

End Function

'判断版本号是否和数据库一致

Public Sub banbenjc()
    str = "select banben from ok"
    Set rs = conn.Execute(str)
    If Not rs.EOF Then
        If rs.Fields("banben").Value <> "5.3.0.24" Then
            MsgBox "您使用的主程序不是最新，为避免产生错误数据请先到192.168.0.10上更新主程序！谢谢", vbInformation + vbOKOnly, "提示"
            Exit Sub
        Else
            frmzxh.Show
        End If
 
    End If
    Set rs = Nothing
End Sub


'加密函数
  Public Function Encode(ByVal s As String) As String
  On Error GoTo acd
          If Len(s) = 0 Then Exit Function
          Dim Buff()     As Byte
          Buff = StrConv(s, vbFromUnicode)
          Dim i     As Long
          Dim J     As Byte
          Dim k     As Byte, m       As Byte
          Dim mstr     As String
          mstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
          Dim outs     As String
          i = UBound(Buff) + 1
          outs = Space(2 * i)
          Dim Temps     As String
          For i = 0 To UBound(Buff)
                  Randomize Time
                  J = CByte(5 * (Math.Rnd()) + 0)
                  Buff(i) = Buff(i) Xor J
                  k = Buff(i) Mod Len(mstr)
                  m = Buff(i) \ Len(mstr)
                  m = m * 2 ^ 3 + J
                  Temps = Mid(mstr, k + 1, 1) + Mid(mstr, m + 1, 1)
                  Mid(outs, 2 * i + 1, 2) = Temps
            Next
            Encode = outs
  Exit Function
acd:
  End Function
    
    
  '解密函数
  Public Function Decode(ByVal s As String) As String
          On Error GoTo acd
          Dim i     As Long
          Dim J     As Byte
          Dim k     As Byte
          Dim m     As Byte
          Dim mstr     As String
          mstr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"
          Dim t1     As String, t2       As String
          Dim Buff()     As Byte
          Dim n     As Long
          n = 0
          For i = 1 To Len(s) Step 2
                  t1 = Mid(s, i, 1)
                  t2 = Mid(s, i + 1, 1)
                  k = InStr(1, mstr, t1) - 1
                  m = InStr(1, mstr, t2) - 1
                  J = m \ 2 ^ 3
                  m = m - J * 2 ^ 3
                  ReDim Preserve Buff(n)
                  Buff(n) = J * Len(mstr) + k
                  Buff(n) = Buff(n) Xor m
                  n = n + 1
            Next
            Decode = StrConv(Buff, vbUnicode)
            Exit Function
acd:
            Decode = ""
  End Function

'另外一个算法

Function cipher(stext As String)    '加密程序
    Const min_asc = 32
    Const max_asc = 126
    Const num_asc = max_asc - min_asc + 1
    Dim offset As Long
    Dim strlen As Integer
    Dim i As Integer
    Dim ch As Integer
    offset = ABCDEFGHIJKLMNOPQRSTUVWXYZ012345678913693339991abcdefghijklmnopqrstuvwxyz
    Rnd (-1)
    Randomize (offset)
    strlen = Len(stext)
    For i = 1 To strlen
       ch = Asc(Mid(stext, i, 1))
       If ch >= min_asc And ch <= max_asc Then
           ch = ch - min_asc
           offset = Int((num_asc + 1) * Rnd())
           ch = ((ch + offset) Mod num_asc)
           ch = ch + min_asc
           ptext = ptext & Chr(ch)
       End If
    Next i
    cipher = ptext
End Function

Function decipher(stext As String)      '解密程序
    Const min_asc = 32
    Const max_asc = 126
    Const num_asc = max_asc - min_asc + 1
    Dim offset As Long
    Dim strlen As Integer
    Dim i As Integer
    Dim ch As Integer
    offset = ABCDEFGHIJKLMNOPQRSTUVWXYZ012345678913693339991abcdefghijklmnopqrstuvwxyz
    Rnd (-1)
    Randomize (offset)
    strlen = Len(stext)
    For i = 1 To strlen
       ch = Asc(Mid(stext, i, 1))
       If ch >= min_asc And ch <= max_asc Then
           ch = ch - min_asc
           offset = Int((num_asc + 1) * Rnd())
           ch = ((ch - offset) Mod num_asc)
           If ch < 0 Then
               ch = ch + num_asc
           End If
           ch = ch + min_asc
           ptext = ptext & Chr(ch)
       End If
    Next i
    decipher = ptext
End Function

'中文加密函数
Public Function StringEnDeCodecn(strSource As String, MA) As String
'该函数只对中西文起到加密作用
'参数为：源文件，密码
On Error GoTo ErrEnDeCode
Dim X As Single
Dim CHARNUM As Long, RANDOMINTEGER As Integer
Dim SINGLECHAR As String * 1
Dim strTmp As String
If MA < 0 Then
MA = MA * (-1)
End If
X = Rnd(-MA)
For i = 1 To Len(strSource) Step 1 '取单字节内容
SINGLECHAR = Mid(strSource, i, 1)
CHARNUM = Asc(SINGLECHAR)
g: RANDOMINTEGER = Int(127 * Rnd)
If RANDOMINTEGER < 30 Or RANDOMINTEGER > 100 Then GoTo g
CHARNUM = CHARNUM Xor RANDOMINTEGER
strTmp = strTmp & Chr(CHARNUM)
Next i
StringEnDeCodecn = strTmp
Exit Function
ErrEnDeCode:
StringEnDeCodecn = ""
MsgBox Err.Number & "\" & Err.Description
End Function
'使用方法:
'tmp = stringendecn("中华人民共和国", 75)
'如果要解密的话，只须键入以下语句：
'tmp1 = stringendecn(tmp, 75)

Public Function GetTextFirstLetter(strText As String) As String
'求出一字串的全部首字母
Dim t As Integer
Dim strTempLetters As String
For t = 1 To Len(Trim(strText))
    strTempLetters = strTempLetters + GetCharFirstLetter(Asc(Mid(strText, t, 1)))
Next
GetTextFirstLetter = strTempLetters
End Function

Private Function GetCharFirstLetter(intChar As Integer) As String
'求出单个汉字的首字母，内部调用
'输入汉字asc码，输出首字母
Select Case intChar
Case Is >= 0:          GetCharFirstLetter = Chr(intChar)
Case Is >= -10246:     GetCharFirstLetter = " "
Case Is >= -11055:     GetCharFirstLetter = "Z"
Case Is >= -11847:     GetCharFirstLetter = "Y"
Case Is >= -12556:     GetCharFirstLetter = "X"
Case Is >= -12838:     GetCharFirstLetter = "W"
Case Is >= -13318:     GetCharFirstLetter = "T"
Case Is >= -14090:     GetCharFirstLetter = "S"
Case Is >= -14149:     GetCharFirstLetter = "R"
Case Is >= -14630:     GetCharFirstLetter = "Q"
Case Is >= -14914:     GetCharFirstLetter = "P"
Case Is >= -14922:     GetCharFirstLetter = "O"
Case Is >= -15165:     GetCharFirstLetter = "N"
Case Is >= -15640:     GetCharFirstLetter = "M"
Case Is >= -16212:     GetCharFirstLetter = "L"
Case Is >= -16474:     GetCharFirstLetter = "K"
Case Is >= -17417:     GetCharFirstLetter = "J"
Case Is >= -17922:     GetCharFirstLetter = "H"
Case Is >= -18239:     GetCharFirstLetter = "G"
Case Is >= -18526:     GetCharFirstLetter = "F"
Case Is >= -18710:     GetCharFirstLetter = "E"
Case Is >= -19218:     GetCharFirstLetter = "D"
Case Is >= -19775:     GetCharFirstLetter = "C"
Case Is >= -20283:     GetCharFirstLetter = "B"
Case Is >= -20319:     GetCharFirstLetter = "A"
Case Else:             GetCharFirstLetter = " "
End Select
End Function

