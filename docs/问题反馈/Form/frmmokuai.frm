VERSION 5.00
Begin VB.Form frmmokuai 
   Caption         =   "模块"
   ClientHeight    =   3735
   ClientLeft      =   5775
   ClientTop       =   3765
   ClientWidth     =   3855
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3735
   ScaleWidth      =   3855
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   375
      Left            =   2190
      TabIndex        =   8
      Top             =   2730
      Width           =   975
   End
   Begin VB.CommandButton cmdtianjia 
      Caption         =   "添加模块"
      Height          =   375
      Left            =   1170
      TabIndex        =   7
      Top             =   2730
      Width           =   975
   End
   Begin VB.TextBox txtmkdm 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1320
      Width           =   1695
   End
   Begin VB.TextBox txtmokuai 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1680
      TabIndex        =   4
      Top             =   1800
      Width           =   1695
   End
   Begin VB.ComboBox cbobanbenh 
      Height          =   300
      ItemData        =   "frmmokuai.frx":0000
      Left            =   1680
      List            =   "frmmokuai.frx":0002
      Sorted          =   -1  'True
      TabIndex        =   2
      Text            =   "HIS"
      Top             =   810
      Width           =   1695
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "模块代码"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   360
      TabIndex        =   5
      Top             =   1320
      Width           =   900
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "模 块"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   600
      TabIndex        =   3
      Top             =   1920
      Width           =   570
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "版本号"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   600
      TabIndex        =   1
      Top             =   840
      Width           =   675
   End
   Begin VB.Label Labloge 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "软 件 模 块"
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
      Left            =   1320
      TabIndex        =   0
      Top             =   240
      Width           =   1755
   End
End
Attribute VB_Name = "frmmokuai"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Private Sub cbobanbenh_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And cbobanbenh.Text <> "" Then
   txtmkdm.SetFocus
End If
End Sub

Private Sub cmdtianjia_Click()
'判断模块代码不能重复
Dim i As Integer
'rs.Open "select mokuaidm from zd_mokuai where mokuaidm='" & Trim(txtmkdm.Text) & "'", conn
'If Not rs.EOF Then
'   MsgBox "模块代码不能重复！", vbOKOnly, "提示"
'   rs.Close
'   txtmkdm.Text = ""
'   txtmokuai.Text = ""
'   cbobanbenh.SetFocus
'   Exit Sub
'Else
'   rs.Close
'End If

'判断版本号等不能为空
If Len(cbobanbenh) = 0 Then
   MsgBox "版本号不能为空！", vbOKOnly, "提示"
ElseIf Len(txtmokuai) = 0 Then
   MsgBox "版本号不能为空！", vbOKOnly, "提示"
ElseIf Len(txtmkdm) = 0 Then
   MsgBox "版本号不能为空！", vbOKOnly, "提示"
End If

'向数据库中写入记录
str = "insert into zd_mokuai (banben,mokuaimc,mokuaidm) values ('" & Trim(cbobanbenh.Text) & "','" & Trim(txtmokuai.Text) & "','" & Trim(txtmkdm.Text) & "')"
rs.Open str, conn
MsgBox "保存成功！", vbOKOnly, "提示"
txtmokuai.Text = ""
txtmkdm.Text = txtmkdm.Text + 1
cbobanbenh.SetFocus

Set rs = Nothing
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

'Private Sub Command1_Click()
'str = ""
'str = "insert into yw_banben (banben) values ('" & Trim(cbobanbenh.Text) & "')"
'Set rs = conn.Execute(str)
'MsgBox "版本增加成功！", vbInformation + vbOKOnly, "提示"
'End Sub

Private Sub Form_Load()
Dim rs As New ADODB.Recordset
Dim str As String
Dim i As Integer

Me.Width = 5000
Me.Height = 6000
Me.Top = 1800
Me.Left = 5000

    str = "SELECT ISNULL(MAX(mokuaidm), '0') AS lsh from zd_mokuai "
    rs.Open str, conn
If Not rs.EOF Then
    txtmkdm.Text = rs.Fields("lsh").Value + 1
Else
    txtmkdm.Text = 1
End If
Set rs = Nothing

'加载版本
'Set rs = Nothing
'    str = "select banben from yw_banben "
'rs.CursorLocation = adUseClient
'rs.Open str, conn
'If Not rs.EOF Then
'  For i = 1 To rs.RecordCount
'     cbobanbenh.AddItem rs.Fields("banben").Value
'     rs.MoveNext
'  Next i
'  Set rs = Nothing
'End If
End Sub

Private Sub txtmkdm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtmkdm <> "" Then
  txtmokuai.SetFocus
End If
End Sub

Private Sub txtmokuai_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtmokuai.Text <> "" Then
  cmdtianjia.SetFocus
End If
End Sub
