VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmchuangtim 
   BackColor       =   &H00E0E0E0&
   Caption         =   "窗体"
   ClientHeight    =   4095
   ClientLeft      =   2970
   ClientTop       =   3900
   ClientWidth     =   9300
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4095
   ScaleWidth      =   9300
   Begin VB.CommandButton cmdsc 
      Caption         =   "删 除"
      Height          =   375
      Left            =   6720
      TabIndex        =   15
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdqk 
      Caption         =   "清 空"
      Height          =   375
      Left            =   5520
      TabIndex        =   14
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdchaxun 
      Caption         =   "查 询"
      Height          =   375
      Left            =   4320
      TabIndex        =   13
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "窗体列表"
      Height          =   3135
      Left            =   4200
      TabIndex        =   11
      Top             =   360
      Width           =   4935
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfwentilb 
         Height          =   2775
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   4895
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
   Begin VB.ComboBox cbobanbenh 
      Height          =   300
      ItemData        =   "frmchuangtim.frx":0000
      Left            =   1680
      List            =   "frmchuangtim.frx":0002
      TabIndex        =   0
      Text            =   "新版"
      Top             =   840
      Width           =   1455
   End
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "退 出"
      Height          =   375
      Left            =   7920
      TabIndex        =   9
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton cmdtianjia 
      Caption         =   "添 加"
      Height          =   375
      Left            =   1680
      TabIndex        =   8
      Top             =   3600
      Width           =   1095
   End
   Begin VB.TextBox txtchuangtimc 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1680
      TabIndex        =   7
      Top             =   2520
      Width           =   1455
   End
   Begin VB.TextBox txtchuangtidm 
      Appearance      =   0  'Flat
      Height          =   300
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1995
      Width           =   1455
   End
   Begin VB.ComboBox cbomokuai 
      Height          =   300
      Left            =   1680
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "版本号"
      Height          =   180
      Left            =   840
      TabIndex        =   10
      Top             =   960
      Width           =   540
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "窗体名称"
      Height          =   180
      Left            =   600
      TabIndex        =   4
      Top             =   2640
      Width           =   720
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "窗体代码"
      Height          =   180
      Left            =   600
      TabIndex        =   3
      Top             =   2040
      Width           =   720
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "模 块"
      Height          =   180
      Left            =   840
      TabIndex        =   2
      Top             =   1560
      Width           =   450
   End
   Begin VB.Label Labloge 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "窗 体 字 典"
      BeginProperty Font 
         Name            =   "隶书"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   285
      Left            =   1320
      TabIndex        =   1
      Top             =   240
      Width           =   1755
   End
End
Attribute VB_Name = "frmchuangtim"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Dim str As String
Dim str1 As String

Private Sub cbobanbenh_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 13 And cbobanbenh <> "" Then
   cbomokuai.SetFocus
End If
End Sub

Private Sub cbobanbenh_LostFocus()
''释放内存
'Set rs = Nothing
''通过版本号来查找模块
'If Len(cbobanbenh) = 0 Then
'   MsgBox "版本号不能为空！", vbOKOnly, "提示"
'   cbobanbenh.SetFocus
'   Exit Sub
'Else
'    cbomokuai.SetFocus
'    str = "select mokuaimc from zd_mokuai where banben='" & Trim(cbobanbenh.Text) & "'"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'
'    If Not rs.EOF Then
'     For i = 1 To rs.RecordCount
'       cbomokuai.AddItem rs.Fields("mokuaimc").Value
'       rs.MoveNext
'     Next i
'    End If
'      Set rs = Nothing
' End If
End Sub

Private Sub cbomokuai_GotFocus()
'加载模块
cbomokuai.Clear
str = "select mokuaimc from zd_mokuai where banben='" & Trim(cbobanbenh.Text) & "'"
    rs.CursorLocation = adUseClient
    rs.Open str, conn
    
    If Not rs.EOF Then
     For i = 1 To rs.RecordCount
       cbomokuai.AddItem rs.Fields("mokuaimc").Value
       rs.MoveNext
     Next i
    End If
      Set rs = Nothing
str = ""
str = "select isnull(max(chuangtidm),'0') as lsh from zd_chuangti"
      rs.Open str, conn
          If Not rs.EOF Then
            txtchuangtidm.Text = rs.Fields("lsh").Value + 1
          Else
            txtchuangtidm.Text = 1
          End If
Set rs = Nothing
End Sub

Private Sub cbomokuai_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And cbomokuai <> "" Then
   txtchuangtidm.SetFocus
End If
End Sub

Private Sub cmdchaxun_Click()
    str = "select chuangtidm as '代码',banbenh as '版本',mokuai as '模块',chuangtimc as '窗体' from zd_chuangti where 1=1"
If cbobanbenh.Text <> "" Then
    str = str & " and banbenh='" & Trim(cbobanbenh.Text) & "'"
End If
If cbomokuai.Text <> "" Then
    str = str & " and mokuai='" & Trim(cbomokuai.Text) & "'"
End If

Set msfwentilb.DataSource = conn.Execute(str)
End Sub

Private Sub cmdqk_Click()
    msfwentilb.Clear
    msfwentilb.Rows = 2
End Sub

Private Sub cmdsc_Click()
If MsgBox("确定要删除吗？", vbYesNo + vbQuestion, "提示") = vbYes And msfwentilb.TextMatrix(msfwentilb.row, 0) <> "" Then
    str = "select * from yw_wentilb where chuangtimc='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 3)) & "'"
    Set rs = conn.Execute(str)
    If rs.EOF Then
        str = "delete from zd_chuangti where chuangtidm='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 0)) & "'"
        Set rs = conn.Execute(str)
        Call cmdchaxun_Click
        MsgBox "删除成功", vbOKOnly + vbInformation, "提示"
    Else
        MsgBox "数据已被引用不能删除！", vbInformation + vbOKOnly, "提示"
    End If
End If
End Sub

Private Sub cmdtianjia_Click()
'代码相同时不能保存
'Set rs = Nothing
'rs.Open "select * from zd_chuangti where chuangtidm='" & Trim(txtchuangtidm.Text) & "'", conn
'If Not rs.EOF Then
'   MsgBox "代码不能重复！"
'
'  txtchuangtidm.Text = txtchuangtidm.Text + 1
'  txtchuangtimc.Text = ""
'  cbobanbenh.SetFocus
'  Set rs = Nothing
'Else
'  Set rs = Nothing
'End If

'向数据库中写入数据
str = "insert into zd_chuangti (banbenh,mokuai,chuangtidm,chuangtimc) values ('" & Trim(cbobanbenh.Text) & "','" & Trim(cbomokuai.Text) & "','" & Trim(txtchuangtidm.Text) & "','" & Trim(txtchuangtimc.Text) & "')"
rs.Open str, conn
  MsgBox "保存成功！", vbOKOnly, "提示"
'  cbobanbenh.Text = ""
  
  txtchuangtidm.Text = txtchuangtidm.Text + 1
  txtchuangtimc.Text = ""
  cbobanbenh.SetFocus
Set rs = Nothing
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub Form_Load()
Me.Width = 9300
Me.Height = 4600
Me.Top = 1800
Me.Left = 2500

  '加载版本
  cbobanbenh.Clear
Set rs = Nothing
str1 = "SELECT banben FROM yw_banben"
rs.CursorLocation = adUseClient
rs.Open str1, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
      cbobanbenh.AddItem rs.Fields("banben").Value
      rs.MoveNext
  Next i
  rs.Close
End If


End Sub

Private Sub msfwentilb_Click()
 Me.msfwentilb.FocusRect = flexFocusNone
  Me.msfwentilb.SelectionMode = flexSelectionByRow
  Me.msfwentilb.BackColorSel = 8421631
End Sub

Private Sub txtchuangtidm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtchuangtidm <> "" Then
   txtchuangtimc.SetFocus
End If
End Sub

Private Sub txtchuangtimc_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtchuangtimc <> "" Then
   cmdtianjia.SetFocus
End If
End Sub
