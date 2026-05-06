VERSION 5.00
Begin VB.Form frmshujvlj 
   Caption         =   "数据库连接"
   ClientHeight    =   4545
   ClientLeft      =   5670
   ClientTop       =   4155
   ClientWidth     =   4035
   LinkTopic       =   "Form1"
   ScaleHeight     =   4545
   ScaleWidth      =   4035
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   495
      Left            =   2280
      TabIndex        =   10
      Top             =   3480
      Width           =   975
   End
   Begin VB.CommandButton cmdqueding 
      Caption         =   "确 定"
      Height          =   495
      Left            =   720
      TabIndex        =   9
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox txtmima 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   1680
      TabIndex        =   8
      Top             =   2520
      Width           =   1695
   End
   Begin VB.TextBox txtsa 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   1680
      TabIndex        =   7
      Text            =   "sa"
      Top             =   1880
      Width           =   1695
   End
   Begin VB.TextBox txtdatabase 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   1680
      TabIndex        =   6
      Top             =   1240
      Width           =   1695
   End
   Begin VB.TextBox txtserver 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   1680
      TabIndex        =   5
      Top             =   600
      Width           =   1695
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "密码"
      Height          =   180
      Left            =   480
      TabIndex        =   4
      Top             =   2640
      Width           =   360
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "登录用户"
      Height          =   180
      Left            =   480
      TabIndex        =   3
      Top             =   1960
      Width           =   720
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "数据库名"
      Height          =   180
      Left            =   480
      TabIndex        =   2
      Top             =   1280
      Width           =   720
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "服务器名"
      Height          =   180
      Left            =   480
      TabIndex        =   1
      Top             =   600
      Width           =   720
   End
   Begin VB.Label labbiaoqian 
      AutoSize        =   -1  'True
      Caption         =   "数据库连接设置"
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
      Left            =   840
      TabIndex        =   0
      Top             =   120
      Width           =   2205
   End
End
Attribute VB_Name = "frmshujvlj"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
''调用API
'Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
'Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Dim inti As Integer       '循环变量

Private Sub cmdqueding_Click()
Dim strFilePath As String
strFilePath = App.Path & "\cjyboot.ini"
If Dir(strFilePath) <> "" Then
    Kill strFilePath
End If
'循环写进值到INI文件
Dim saveset(3) As String        '键傎
Dim keycaptoin(3) As String     '键标题
   saveset(0) = Trim(txtserver.Text)
   saveset(1) = Trim(txtdatabase.Text)
   saveset(2) = Trim(txtsa.Text)
   saveset(3) = Trim(txtmima.Text)
    keycaptoin(0) = Label1.Caption
    keycaptoin(1) = Label2.Caption
    keycaptoin(2) = Label3.Caption
    keycaptoin(3) = Label4.Caption
   '循环写入INI文件
For inti = 0 To 3 Step 1
   Call WritePrivateProfileString("savestring", keycaptoin(inti), saveset(inti), App.Path & "\cjyboot.ini")
Next inti
MsgBox "数据连接保存成功！", vbOKOnly, "提示"
Unload Me
Unload frmzxh
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim inti As Integer
Dim strini(3) As String
Dim keycaptoin(3) As String

Me.Width = 5000
Me.Height = 6000
Me.Top = 1800
Me.Left = 5000

    keycaptoin(0) = Label1.Caption
    keycaptoin(1) = Label2.Caption
    keycaptoin(2) = Label3.Caption
    keycaptoin(3) = Label4.Caption
For inti = 0 To 3 Step 1
   strini(inti) = String(512, 0)
   Call GetPrivateProfileString("savestring", keycaptoin(inti), "", strini(inti), 512, App.Path & "\cjyboot.ini")
Next inti
'Call GetDataBase
    txtserver.Text = Trim(strini(0))
    txtdatabase.Text = Trim(strini(1))
    txtsa.Text = Trim(strini(2))
    txtmima.Text = Trim(strini(3))
    
End Sub

