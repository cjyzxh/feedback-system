VERSION 5.00
Begin VB.Form frmxiougaimm 
   Caption         =   "修改密码"
   ClientHeight    =   3900
   ClientLeft      =   5460
   ClientTop       =   3540
   ClientWidth     =   4095
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3900
   ScaleWidth      =   4095
   Begin VB.CommandButton cmdquedian 
      Caption         =   "确 定"
      Height          =   495
      Left            =   585
      TabIndex        =   10
      Top             =   3000
      Width           =   975
   End
   Begin VB.TextBox txtcfmm 
      Appearance      =   0  'Flat
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   1680
      PasswordChar    =   "*"
      TabIndex        =   9
      Top             =   2280
      Width           =   1455
   End
   Begin VB.TextBox txtxmm 
      Appearance      =   0  'Flat
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   1680
      PasswordChar    =   "*"
      TabIndex        =   8
      Top             =   1800
      Width           =   1455
   End
   Begin VB.TextBox txtymm 
      Appearance      =   0  'Flat
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   1680
      PasswordChar    =   "*"
      TabIndex        =   7
      Top             =   1320
      Width           =   1455
   End
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   495
      Index           =   1
      Left            =   2400
      TabIndex        =   6
      Top             =   3000
      Width           =   1095
   End
   Begin VB.ComboBox cboyonghu 
      Height          =   300
      Left            =   1680
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   840
      Width           =   1455
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "重复新密码"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Index           =   3
      Left            =   480
      TabIndex        =   4
      Top             =   2400
      Width           =   900
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "原密码"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Index           =   2
      Left            =   480
      TabIndex        =   3
      Top             =   1365
      Width           =   540
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "新密码"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Index           =   1
      Left            =   480
      TabIndex        =   2
      Top             =   1875
      Width           =   540
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "用户名"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Index           =   0
      Left            =   480
      TabIndex        =   1
      Top             =   840
      Width           =   540
   End
   Begin VB.Label labbiaoqian 
      AutoSize        =   -1  'True
      Caption         =   "用户密码修改"
      BeginProperty Font 
         Name            =   "隶书"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   1320
      TabIndex        =   0
      Top             =   240
      Width           =   1890
   End
End
Attribute VB_Name = "frmxiougaimm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private rs As New ADODB.Recordset
Private i As Integer
Private str As String

Private Sub cboyonghu_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And cboyonghu.Text <> "" Then
  txtymm.SetFocus
End If
End Sub

Private Sub cmdquedian_Click()
Dim Key As String
Dim i As Integer
'打开记录集，取对应用户的密码
rs.Open "select pwd from [user] where usename='" & Trim(cboyonghu.Text) & " '", conn
If Not rs.EOF Then
'判断密码是否相符，及二个新密码是否一致，修改数据库记录

  If Len(txtxmm.Text) < 6 Then
    MsgBox "密码长度不能小于6位！", vbOKOnly + vbInformation, "提示"
    Set rs = Nothing
    Exit Sub
 End If
 
 
  txtymm.Text = cipher(txtymm.Text)
  If Trim(txtymm.Text) = rs.Fields("pwd").Value Then
     If txtxmm.Text = txtcfmm.Text Then
       rs.Close
       
         
       txtcfmm.Text = cipher(txtcfmm.Text)
       
       str = "update [user] set pwd='" & Trim(txtcfmm.Text) & "' where usename='" & Trim(cboyonghu.Text) & "'"
       
       
       rs.Open str, conn
       MsgBox "密码修改成功！", vbOKOnly, "友情提示"
       Call Allclear
       cboyonghu.SetFocus
     Else
       MsgBox "二次新密码不同！", vbOKOnly, "友情提示"
       Call Allclear
       cboyonghu.SetFocus
       rs.Close
       Exit Sub
     End If
  Else
     MsgBox "密码不正确请重新录入！", vbOKOnly, "友情提示"
     Call Allclear
     txtymm.SetFocus
     rs.Close
  End If
End If

End Sub
Private Sub Allclear()
       txtymm.Text = ""
       txtxmm.Text = ""
       txtcfmm.Text = ""
End Sub


Private Sub cmdtuichu_Click(Index As Integer)
Unload Me
End Sub

Private Sub Form_Load()
Me.Width = 5000
Me.Height = 6000
Me.Top = 1800
Me.Left = 5000

    Dim i As Integer
    Dim str As String
    '建立数据库连接
       
    str = "select * from [user]"
    rs.CursorLocation = adUseClient
     rs.Open str, conn
    If rs.EOF Then
        
    Else
        For i = 1 To rs.RecordCount
            cboyonghu.AddItem rs.Fields("usename").Value
            rs.MoveNext
        Next i
    End If
    rs.Close
  
End Sub

Private Sub Text2_Change()

End Sub

Private Sub txtcfmm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtcfmm.Text <> "" Then
  cmdquedian.SetFocus
End If
End Sub

Private Sub txtxmm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtxmm.Text <> "" Then
  txtcfmm.SetFocus
End If
End Sub

Private Sub txtymm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtymm.Text <> "" Then
  txtxmm.SetFocus
End If
End Sub
