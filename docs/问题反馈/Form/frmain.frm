VERSION 5.00
Object = "{F6B9D3BC-3953-4A68-AD1A-BD05206D76A9}#1.0#0"; "CjyButton.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.33#0"; "HISControl1.ocx"
Begin VB.Form frmain 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "登录"
   ClientHeight    =   4665
   ClientLeft      =   4395
   ClientTop       =   3180
   ClientWidth     =   6780
   ForeColor       =   &H00FF0000&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmain.frx":0000
   ScaleHeight     =   4665
   ScaleWidth      =   6780
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin VB.Timer T_EFM 
      Interval        =   10000
      Left            =   1380
      Top             =   3960
   End
   Begin UserControl.EFM EFM1 
      Left            =   960
      Top             =   4020
      _ExtentX        =   423
      _ExtentY        =   397
      IconTooltipText =   "HIS程序"
   End
   Begin VB.TextBox txtmima 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   3480
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   4080
      Width           =   1755
   End
   Begin 黑马按钮控件.dcButton cmdtuichu 
      Height          =   435
      Left            =   5400
      TabIndex        =   2
      Top             =   4080
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   767
      BackColor       =   1228031
      ButtonStyle     =   11
      Caption         =   "退  出"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin 黑马按钮控件.dcButton cmddenglu 
      Height          =   435
      Left            =   5400
      TabIndex        =   1
      Top             =   3540
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   767
      BackColor       =   1228031
      ButtonStyle     =   11
      Caption         =   "登  录"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.ComboBox CboUser 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmain.frx":A02E
      Left            =   3480
      List            =   "frmain.frx":A030
      TabIndex        =   0
      Top             =   3600
      Width           =   1815
   End
End
Attribute VB_Name = "frmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Rs As New ADODB.Recordset

Private Sub CboUser_KeyDown(KeyCode As Integer, Shift As Integer)
    '如果按下回车自动跳到下一个控件
    If KeyCode = 13 And CboUser.Text <> "" Then
        txtmima.SetFocus
    End If
End Sub

Private Sub CboUser_LostFocus()
    user = CboUser.Text
End Sub

'" &  & "'连接字符串
Private Sub cmddenglu_Click()
      '打开记录集，判断密码是否正确
  
    Rs.Open "select pwd,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where usename='" & Trim(CboUser.Text) & "'", conn
    If Not Rs.EOF Then
'        rs.Fields选择该记录集的哪个字段

        If txtmima.Text = "" Then
        
            MsgBox "密码不能为空！", vbOKOnly + vbInformation, "提示"
            Set Rs = Nothing
            Exit Sub
        End If
        
        txtmima.Text = cipher(txtmima.Text)
        
        If Trim(txtmima.Text) = Rs.Fields("pwd").Value Then
            '分配权限
            If Decode(Rs("quxian2").Value) = "销售经理" Then
                g_strYongHuZT = "3"
            ElseIf Decode(Rs("quxian2").Value) = "销售人员" Then
                g_strYongHuZT = "2"
            Else
                g_strYongHuZT = ""
            End If
            
            Call banbenjc
'           frmzxh.Show
            frmain.Hide
        Else
           MsgBox "密码错误，请重新录入！", vbOKOnly + vbInformation, "提示"
           txtmima.Text = ""
           txtmima.SetFocus
        End If
    End If
    Rs.Close

End Sub

Private Sub cmdtuichu_Click()

Unload Me
End Sub



Private Sub EFM1_BalloonStateChanged(ByVal StateCode As Integer, ByVal BalloonTitle As String, ByVal BalloonMessage As String)
Dim strSQL As String
Dim strLSH As String
Dim rst As ADODB.Recordset
Dim str() As String
Dim str2() As String
Dim i As Integer
    If StateCode = 0 Then
        str() = Split(BalloonMessage, vbCrLf)

        For i = 0 To UBound(str()) - 1
            str2() = Split(str(i), "|")
            strLSH = str2(0)
            strSQL = "delete from yw_QiPaoTishi where WentiJSRMC='" & user & "' and YeWuLB='" & strLSH & "'"
            If objExecuteSQL.ExecuteSQL(strSQL) = True Then
                If strLSH = "待修改" Then
                    If IsFormLoadedByName("frmwenticl") = False Then
                        frmwenticl.Show
                    End If
                    
                ElseIf strLSH = "待测试" Then
                    If IsFormLoadedByName("frmwentics") = False Then
                        frmwentics.Show
                    End If
                End If

            End If
        Next i

    End If
End Sub

Private Function IsFormLoadedByName(ByVal formName As String) As Boolean
    Dim frm As Form
    
    ' 遍历Forms集合，不区分大小写对比名称
    For Each frm In Forms
        If UCase(frm.Name) = UCase(formName) Then
            IsFormLoadedByName = True
            Exit Function
        End If
    Next frm
    
    IsFormLoadedByName = False
End Function

Private Sub T_EFM_Timer()
    Call SQLNeiRong   '生成提示消息
    Call QP
End Sub

Function QP() As Boolean
        If g_Message <> "" Then
            With EFM1
                .TimeOut = 30
                .ShengYinWenJian = "d:\程序\msg.wav"
                Call .PopupBalloon("您有以下业务待处理", g_Message)
            End With
            g_Message = ""
        End If
End Function

Private Sub SQLNeiRong()
Dim sql As String
Dim rst2 As ADODB.Recordset '模块中业务类别数
Dim i As Long '拼接行数
Dim YeWuLB As String

On Error GoTo PRC_EXIT

    Set rst3 = New ADODB.Recordset
    sql = "select COUNT(1)as sl,YeWuLB from (select  YeWuLB from yw_QiPaoTishi where WentiJSRMC='" & user & "') t group by YeWuLB"
    Set rst3 = New ADODB.Recordset
    Set rst3 = objExecuteSQL.GetRs(sql)

     g_Message = ""
    rst3.MoveFirst
    For i = 1 To rst3.RecordCount

            If g_Message = "" Then
                g_Message = rst3.Fields(1) & "|" & rst3.Fields(0)
            Else
                g_Message = g_Message & vbCrLf & rst3.Fields(1) & "|" & rst3.Fields(0)
            End If
            
            rst3.MoveNext
      
            
    Next i
    
    g_Message = g_Message & vbCrLf
    
    Exit Sub
PRC_EXIT:

End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim str As String
    '建立数据库连接
 ' Call OpenDb
    
    str = "select * from [user] with(nolock) where zhuangtai='1'"
    Rs.CursorLocation = adUseClient
     Rs.Open str, conn
    If Not Rs.EOF Then

        For i = 1 To Rs.RecordCount
            CboUser.AddItem Rs.Fields("usename").Value
            Rs.MoveNext
        Next i
    End If
    Rs.Close
    
    If EFM1 Is Nothing Then
        MsgBox "EFM1 控件未初始化，请检查控件引用！", vbExclamation
        Exit Sub
    End If
        With EFM1
           Set .TrayIcon = frmain.Icon
            .IconTooltipText = App.EXEName
            .Visible = True
        End With
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    EFM1.Visible = False
End Sub

Private Sub txtmima_GotFocus()
user = CboUser.Text
End Sub

Private Sub txtmima_KeyDown(KeyCode As Integer, Shift As Integer)
    '如果按下回车自动跳到下一个控件
    If KeyCode = 13 Then
        Call cmddenglu_Click
    End If
End Sub
