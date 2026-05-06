VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmJiChuZD 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "基础字典维护"
   ClientHeight    =   4020
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8775
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4020
   ScaleWidth      =   8775
   ShowInTaskbar   =   0   'False
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Height          =   3015
      Left            =   90
      TabIndex        =   10
      Top             =   960
      Width           =   8655
      _ExtentX        =   15266
      _ExtentY        =   5318
      _Version        =   393216
      FixedCols       =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton btnExit 
      Caption         =   "退出"
      Height          =   405
      Left            =   4440
      TabIndex        =   8
      Top             =   510
      Width           =   1005
   End
   Begin VB.CommandButton btnDel 
      Caption         =   "删除"
      Height          =   405
      Left            =   3360
      TabIndex        =   7
      Top             =   510
      Width           =   1005
   End
   Begin VB.CommandButton btnModify 
      Caption         =   "修改"
      Height          =   405
      Left            =   2280
      TabIndex        =   6
      Top             =   510
      Width           =   1005
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "添加"
      Height          =   405
      Left            =   1170
      TabIndex        =   5
      Top             =   510
      Width           =   1005
   End
   Begin VB.CommandButton btnSearch 
      Caption         =   "查询"
      Height          =   405
      Left            =   90
      TabIndex        =   4
      Top             =   510
      Width           =   1005
   End
   Begin VB.TextBox txtMingCheng 
      Height          =   315
      Left            =   3720
      TabIndex        =   3
      Top             =   60
      Width           =   2025
   End
   Begin VB.ComboBox cboShuJv 
      Height          =   300
      Index           =   0
      Left            =   630
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   60
      Width           =   2295
   End
   Begin VB.TextBox txtID 
      Height          =   375
      Left            =   5460
      TabIndex        =   9
      Top             =   2130
      Width           =   1185
   End
   Begin VB.Label lblShuMing 
      Caption         =   "名称"
      Height          =   225
      Index           =   2
      Left            =   3060
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
   Begin VB.Label lblShuMing 
      Caption         =   "类别"
      Height          =   225
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1035
   End
End
Attribute VB_Name = "frmJiChuZD"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim strSql As String
Dim rsnew     As New ADODB.Recordset
Private Sub btnAdd_Click()                                  '添加
    strSql = "INSERT INTO Jczd(LeiBie,MingCheng) VALUES('" & cboShuJv(0).Text & "','" & txtMingCheng.Text & "')"
 
    rsnew.Open strSql, conn
    Set rsnew = Nothing
    MsgBox "添加成功"
    
    '更新查询结果
    Call btnSearch_Click
End Sub

Private Sub btnDel_Click()                                  '删除

    If txtID.Text = "" Then
        MsgBox "没有选中要删除的项目", vbInformation, Me.Caption
        Exit Sub
    End If
    strSql = "DELETE FROM Jczd WHERE ID='" & txtID.Text & "'"
    
    rsnew.Open strSql, conn

    Set rsnew = Nothing
    MsgBox "删除成功"
    
    '更新查询结果
    Call btnSearch_Click
End Sub

Private Sub btnExit_Click()
    Unload Me
End Sub

Private Sub btnModify_Click()                               '修改
    strSql = "Update Jczd SET LeiBie='" & cboShuJv(0).Text & "',MingCheng='" & txtMingCheng.Text & "' WHERE ID='" & txtID.Text & "'"
    rsnew.Open strSql, conn
    Set rsnew = Nothing
    MsgBox "修改成功"
    
    '更新查询结果
    Call btnSearch_Click
End Sub

Private Sub btnSearch_Click()                               '查询
    
    Dim rsnew1     As New ADODB.Recordset
    
    strSql = " SELECT ID as 代码,LeiBie as 类别,MingCheng as 名称 FROM Jczd  "

    If rsnew1.State <> adStateClosed Then
        rsnew1.Close
    End If
    
    rsnew1.Open strSql, conn, adOpenStatic, adLockOptimistic
    Set MSHFlexGrid1.DataSource = rsnew1
    Set rsnew1 = Nothing
End Sub

Private Sub Form_Load()
    cboShuJv(0).AddItem "客户性质"
    cboShuJv(0).AddItem "区域"
    cboShuJv(0).AddItem "客户意向"
    cboShuJv(0).AddItem "洽谈进度"
    cboShuJv(0).AddItem "软件名称"
End Sub

Private Sub MSHFlexGrid1_Click()
   txtID.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 0)
   cboShuJv(0).Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 1)
   txtMingCheng.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 2)
End Sub
