VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmyiyuanmc 
   Caption         =   "医院名称"
   ClientHeight    =   3750
   ClientLeft      =   5370
   ClientTop       =   4545
   ClientWidth     =   8700
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3750
   ScaleWidth      =   8700
   Begin VB.CommandButton Command3 
      Caption         =   "删 除"
      Height          =   375
      Left            =   7320
      TabIndex        =   13
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "清 空"
      Height          =   375
      Left            =   5880
      TabIndex        =   12
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "查 询"
      Height          =   375
      Left            =   4560
      TabIndex        =   11
      Top             =   3240
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Caption         =   "列表"
      Height          =   2895
      Left            =   4200
      TabIndex        =   9
      Top             =   240
      Width           =   4455
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfwentilb 
         Height          =   2535
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   4471
         _Version        =   393216
         BackColor       =   -2147483634
         ForeColor       =   14841123
         Cols            =   1
         FixedCols       =   0
         BackColorFixed  =   -2147483638
         BackColorBkg    =   12632256
         AllowUserResizing=   3
         _NumberOfBands  =   1
         _Band(0).Cols   =   1
      End
   End
   Begin VB.TextBox txtpym 
      Height          =   375
      Left            =   1560
      TabIndex        =   8
      Top             =   2040
      Width           =   2055
   End
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   375
      Left            =   2400
      TabIndex        =   6
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton cmdtianjia 
      Caption         =   "添 加"
      Height          =   375
      Left            =   960
      TabIndex        =   5
      Top             =   3240
      Width           =   1095
   End
   Begin VB.TextBox txtmingcheng 
      Height          =   375
      Left            =   1560
      TabIndex        =   4
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox txtdaima 
      Height          =   375
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   1080
      Width           =   2055
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "录完医院名称后按回车自动生成拼音码"
      ForeColor       =   &H000000C0&
      Height          =   180
      Left            =   630
      TabIndex        =   14
      Top             =   2700
      Width           =   3060
   End
   Begin VB.Label Label1 
      Caption         =   "拼音码"
      Height          =   255
      Left            =   840
      TabIndex        =   7
      Top             =   2160
      Width           =   735
   End
   Begin VB.Label labdaima 
      AutoSize        =   -1  'True
      Caption         =   "代 码"
      Height          =   180
      Left            =   960
      TabIndex        =   2
      Top             =   1200
      Width           =   450
   End
   Begin VB.Label labyiyuanmc 
      AutoSize        =   -1  'True
      Caption         =   "医院名称"
      Height          =   180
      Left            =   720
      TabIndex        =   1
      Top             =   1680
      Width           =   720
   End
   Begin VB.Label labloge 
      AutoSize        =   -1  'True
      Caption         =   "医 院 名 称 维 护"
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
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   2715
   End
End
Attribute VB_Name = "frmyiyuanmc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdtianjia_Click()
Set Rs = Nothing
'限制代码和名称不能为空
If Len(txtdaima.Text) = 0 Then
  MsgBox "代码不能为空！", vbOKOnly + vbInformation, "提示"
  Exit Sub
ElseIf Len(txtMingCheng.Text) = 0 Then
  MsgBox "医院名称不能为空！", vbOKOnly + vbInformation, "提示"
  Exit Sub
ElseIf Len(txtpym.Text) = 0 Then
  MsgBox "拼音码不能为空，目前只能手工填写！", vbOKOnly + vbInformation, "提示"
  Exit Sub
End If

'判断代码不能重复
Rs.Open "select daima from zd_yiyuanmc where daima='" & Trim(txtdaima.Text) & "'", conn
If Not Rs.EOF Then
 MsgBox "代码不能重复", vbOKOnly, "提示"
 Rs.Close
 txtdaima.Text = ""
 txtMingCheng.Text = ""
 txtpym.Text = ""
 txtdaima.SetFocus
 Exit Sub
End If
Rs.Close
'向数据库中添加记录
str = "insert into zd_yiyuanmc (daima,yiyuanmc,pym) values ('" & Trim(txtdaima.Text) & "','" & Trim(txtMingCheng.Text) & "','" & Trim(txtpym.Text) & "')"
Rs.Open str, conn
MsgBox "记录添加成功！", vbOKOnly + vbInformation, "提示"
 txtdaima.Text = txtdaima.Text + 1
 txtMingCheng.Text = ""
 txtpym.Text = ""
 txtdaima.SetFocus
 Call Command1_Click
Set Rs = Nothing
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub Command1_Click()
msfwentilb.ColWidth(1) = 2700
str = "select daima as '代码',yiyuanmc as '医院名称' from zd_yiyuanmc where 1=1"
If txtMingCheng.Text <> "" Then
    str = str & " and yiyuanmc like '" & Trim(txtMingCheng.Text) & "'"
End If
Set msfwentilb.DataSource = conn.Execute(str)


End Sub

Private Sub Command2_Click()
msfwentilb.Clear
msfwentilb.Rows = 2
End Sub

Private Sub Command3_Click()
If MsgBox("确定要删除吗？", vbYesNo + vbQuestion, "提示") = vbYes And msfwentilb.TextMatrix(msfwentilb.row, 0) <> "" Then
    str = "select yiyuanmc from yw_wentilb where yiyuanmc='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 1)) & "'"
    Set Rs = conn.Execute(str)
    If Rs.EOF Then
        str = "delete from zd_yiyuanmc where daima='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 0)) & "'"
        Set Rs = conn.Execute(str)
        MsgBox "删除成功！", vbOKOnly + vbQuestion, "提示"
        Call Command1_Click
    Else
        MsgBox "数据已被引用不能删除！", vbOKOnly + vbQuestion, "提示"
    End If

End If
End Sub

Private Sub Form_Load()
Me.Width = 8820
Me.Height = 4260
Me.Top = 1800
Me.Left = 2500

Set Rs = Nothing
Rs.Open "select isnull(max(daima),'0') as lsh from zd_yiyuanmc", conn
If Not Rs.EOF Then
    txtdaima.Text = Rs.Fields("lsh").Value + 1
Else
    txtdaima.Text = 1
End If
Set Rs = Nothing
End Sub

Private Sub msfwentilb_Click()
'使当前行的背景色突出显示
 Me.msfwentilb.FocusRect = flexFocusNone
  Me.msfwentilb.SelectionMode = flexSelectionByRow
  Me.msfwentilb.BackColorSel = 8421631
End Sub

Private Sub txtdaima_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtdaima.Text <> "" Then
  txtMingCheng.SetFocus
End If

End Sub

Private Sub txtmingcheng_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtMingCheng.Text <> "" Then
  txtpym.SetFocus
End If
txtpym.Text = conn.Execute("select dbo.fun_getPY('" & Trim(txtMingCheng.Text) & "')").Fields(0).Value ' GetTextFirstLetter(Trim(txtMingCheng.Text))
End Sub



Private Sub txtpym_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtpym.Text <> "" Then
  cmdtianjia.SetFocus
End If
End Sub
