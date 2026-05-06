VERSION 5.00
Begin VB.Form frmsssy 
   Caption         =   "实施人员"
   ClientHeight    =   3945
   ClientLeft      =   5370
   ClientTop       =   5130
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3945
   ScaleWidth      =   4680
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   495
      Left            =   2400
      TabIndex        =   8
      Top             =   2640
      Width           =   975
   End
   Begin VB.CommandButton cmdtianjia 
      Caption         =   "添 加"
      Height          =   495
      Left            =   960
      TabIndex        =   7
      Top             =   2640
      Width           =   975
   End
   Begin VB.ComboBox cbozhiwu 
      Height          =   300
      ItemData        =   "frmsssy.frx":0000
      Left            =   1800
      List            =   "frmsssy.frx":0010
      TabIndex        =   6
      Text            =   "技术员"
      Top             =   1800
      Width           =   1335
   End
   Begin VB.TextBox txtxingming 
      Height          =   270
      Left            =   1800
      TabIndex        =   5
      Top             =   1320
      Width           =   1335
   End
   Begin VB.TextBox txtgonghao 
      Height          =   270
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   840
      Width           =   1335
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "职 务"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   840
      TabIndex        =   3
      Top             =   1800
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "姓 名"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   840
      TabIndex        =   2
      Top             =   1320
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "工 号"
      BeginProperty Font 
         Name            =   "楷体_GB2312"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   840
      TabIndex        =   1
      Top             =   840
      Width           =   495
   End
   Begin VB.Label Labloge 
      AutoSize        =   -1  'True
      Caption         =   "公司技术人员名单"
      BeginProperty Font 
         Name            =   "隶书"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   285
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   2640
   End
End
Attribute VB_Name = "frmsssy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cbozhiwu_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And cbozhiwu.Text <> "" Then
   cmdtianjia.SetFocus
End If
End Sub

Private Sub cmdtianjia_Click()
'限制工号，姓名等不能为空
If Len(txtgonghao) = 0 Then
   MsgBox "工号不能为空，请重新输入！", vbOKOnly, "提示"
ElseIf Len(txtxingming) = 0 Then
   MsgBox "姓名不能为空，请重新输入！", vbOKOnly, "提示"
ElseIf Len(cbozhiwu) = 0 Then
   MsgBox "职务不能为空，请重新输入！", vbOKOnly, "提示"
End If


'判断工号不能重复
rs.Open "select gonghao from zd_jishuyuan where gonghao='" & Trim(txtgonghao.Text) & "'", conn
'当记录集为真时，提示工号重复
If Not rs.EOF Then
  MsgBox "工号重复，请重新输入！", vbOKOnly, "提示"
  rs.Close
   
  txtxingming.Text = ""
  txtgonghao.SetFocus
  Exit Sub
Else
  rs.Close
End If


'向数据库中添加数据
str = "insert into zd_jishuyuan (gonghao,xingming,zhiwu) values ('" & Trim(txtgonghao.Text) & "','" & Trim(txtxingming.Text) & "','" & Trim(cbozhiwu.Text) & "')"
rs.Open str, conn
  MsgBox "记录添加成功！", vbOKOnly, "提示"
    txtgonghao.Text = txtgonghao.Text + 1
  txtxingming.Text = ""
  txtgonghao.SetFocus
  Set rs = Nothing
  End Sub
  
Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub Form_Load()
Me.Width = 5000
Me.Height = 6000
Me.Top = 1800
Me.Left = 5000

str = "select isnull(max(gonghao),'0') as gh from zd_jishuyuan"
Set rs = Nothing
rs.Open str, conn
    If Not rs.EOF Then
        txtgonghao.Text = rs.Fields("gh").Value + 1
    Else
        txtgonghao.Text = 1
    End If
Set rs = Nothing
End Sub

Private Sub txtgonghao_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtgonghao.Text <> "" Then
   txtxingming.SetFocus
End If
End Sub

Private Sub txtxingming_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtxingming.Text <> "" Then
   cbozhiwu.SetFocus
End If
End Sub
