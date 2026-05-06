VERSION 5.00
Begin VB.Form frmmoban 
   Caption         =   "模板"
   ClientHeight    =   4650
   ClientLeft      =   4815
   ClientTop       =   3870
   ClientWidth     =   5085
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4650
   ScaleWidth      =   5085
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退　出"
      Height          =   375
      Left            =   2640
      TabIndex        =   5
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdbaocun 
      Caption         =   "保　存"
      Height          =   375
      Left            =   720
      TabIndex        =   4
      Top             =   4080
      Width           =   1095
   End
   Begin VB.TextBox txtmoban 
      Appearance      =   0  'Flat
      Height          =   2775
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   4695
   End
   Begin VB.ComboBox cbolx 
      Height          =   300
      ItemData        =   "frmmoban.frx":0000
      Left            =   960
      List            =   "frmmoban.frx":000D
      TabIndex        =   1
      Top             =   600
      Width           =   1455
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "模板类型"
      Height          =   180
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   720
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "模　板　设　定"
      BeginProperty Font 
         Name            =   "隶书"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1560
      TabIndex        =   0
      Top             =   120
      Width           =   1785
   End
End
Attribute VB_Name = "frmmoban"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdbaocun_Click()
str = "insert into zd_moban (mobanlx,moban) values ('" & Trim(cbolx.Text) & "','" & Trim(txtmoban.Text) & "')"
If cbolx.Text <> "" And txtmoban.Text <> "" Then
    rs.Open str, conn
    MsgBox "保存成功！", vbOKOnly, "提示"
    cbolx.Text = ""
    txtmoban.Text = ""
    cbolx.SetFocus
    Set rs = Nothing
Else
    MsgBox "数据不完整，请重新录入！", vbOKOnly, "提示"
    Exit Sub
    cbolx.SetFocus
    Set rs = Nothing
End If
End Sub
 
Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub Form_Load()
Me.Width = 5000
Me.Height = 6000
Me.Top = 1800
Me.Left = 5000

End Sub
