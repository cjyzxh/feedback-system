VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "mschrt20.ocx"
Begin VB.Form frmcheshizt 
   BackColor       =   &H00E0E0E0&
   Caption         =   "测试状态"
   ClientHeight    =   9345
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9345
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.Frame fra 
      BackColor       =   &H00E0E0E0&
      Caption         =   "查询条件"
      ForeColor       =   &H00FF0000&
      Height          =   735
      Left            =   0
      TabIndex        =   8
      Top             =   840
      Width           =   15135
      Begin VB.ComboBox cbomokuai 
         Height          =   300
         Left            =   2640
         TabIndex        =   14
         Top             =   240
         Width           =   1335
      End
      Begin VB.ComboBox cbocheshiry 
         Height          =   300
         ItemData        =   "frmcheshizt.frx":0000
         Left            =   4800
         List            =   "frmcheshizt.frx":0002
         TabIndex        =   13
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cbojjcd 
         Height          =   300
         ItemData        =   "frmcheshizt.frx":0004
         Left            =   6960
         List            =   "frmcheshizt.frx":0011
         TabIndex        =   12
         Top             =   240
         Width           =   975
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         Left            =   720
         TabIndex        =   9
         Top             =   240
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   375
         Left            =   12360
         TabIndex        =   10
         Top             =   240
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   661
         _Version        =   393216
         Format          =   106037249
         CurrentDate     =   39220
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   375
         Left            =   9360
         TabIndex        =   11
         Top             =   240
         Width           =   1815
         _ExtentX        =   3201
         _ExtentY        =   661
         _Version        =   393216
         Format          =   106037249
         CurrentDate     =   39220
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "模 块"
         Height          =   180
         Left            =   2160
         TabIndex        =   20
         Top             =   360
         Width           =   450
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "测试人"
         Height          =   180
         Left            =   4200
         TabIndex        =   19
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "紧急程度"
         Height          =   180
         Left            =   6240
         TabIndex        =   18
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   8520
         TabIndex        =   17
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   11520
         TabIndex        =   16
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "版 本"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   240
         TabIndex        =   15
         Top             =   360
         Width           =   450
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "分析"
      ForeColor       =   &H00FF0000&
      Height          =   7095
      Left            =   0
      TabIndex        =   4
      Top             =   1680
      Width           =   15135
      Begin VB.Frame Frame2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "图 示"
         ForeColor       =   &H00FF0000&
         Height          =   4785
         Left            =   75
         TabIndex        =   5
         Top             =   2235
         Width           =   15060
         Begin MSChart20Lib.MSChart MSChart1 
            Height          =   4425
            Left            =   90
            OleObjectBlob   =   "frmcheshizt.frx":0025
            TabIndex        =   6
            Top             =   225
            Width           =   14865
         End
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwentilb 
         Height          =   1890
         Left            =   120
         TabIndex        =   7
         Top             =   315
         Width           =   14955
         _ExtentX        =   26379
         _ExtentY        =   3334
         _Version        =   393216
         ForeColor       =   -2147483646
         Cols            =   1
         FixedCols       =   0
         BackColorBkg    =   12632256
         AllowUserResizing=   3
         _NumberOfBands  =   1
         _Band(0).Cols   =   1
      End
   End
   Begin VB.CommandButton cmdchaxun 
      BackColor       =   &H00FFC0C0&
      Caption         =   "查 询"
      Height          =   375
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmddaochu 
      BackColor       =   &H00FFC0FF&
      Caption         =   "导 出"
      Height          =   375
      Left            =   1080
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8880
      Width           =   1095
   End
   Begin VB.CommandButton cmdqingkong 
      BackColor       =   &H00FFC0FF&
      Caption         =   "清 空"
      Height          =   375
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   8880
      Width           =   1095
   End
   Begin VB.CommandButton cmdquit 
      BackColor       =   &H00C0FFFF&
      Caption         =   "退 出"
      Height          =   375
      Left            =   3480
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   8880
      Width           =   1215
   End
   Begin VB.Label labzxh 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "EU-HIS"
      BeginProperty Font 
         Name            =   "Georgia"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   510
      Left            =   4560
      TabIndex        =   22
      Top             =   240
      Width           =   1725
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题测试状态分析"
      BeginProperty Font 
         Name            =   "华文彩云"
         Size            =   21.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   450
      Index           =   1
      Left            =   6360
      TabIndex        =   21
      Top             =   240
      Width           =   3480
   End
End
Attribute VB_Name = "frmcheshizt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim inti As Integer
Dim row As Integer

Private Sub cmdchaxun_Click()
str = "select szcsgcs as '工程师',count(0) as '问题总数',(select count (0) from yw_wentilb where shouhoubz='是' and a.szcsgcs=csgcs) as '已测试',(select count(0) from yw_wentilb where gongchengsbz='是' and shouhoubz='否' and a.szcsgcs=yw_wentilb.szcsgcs) as '待测试问题' from yw_wentilb a where 1=1"
If cbobanben.Text <> "" Then
    str = str & " and banben='" & Trim(cbobanben.Text) & "'"
End If

'根据不同的条件构造SQL语句
If cbomokuai.Text <> "" Then
    'str = "select szcsgcs as '工程师',count(0) as '问题总数',(select count (0) from yw_wentilb where shouhoubz='是' and a.szcsgcs=csgcs and mokuai='" & Trim(cbomokuai.Text) & "') as '已测试',(select count(0) from yw_wentilb where gongchengsbz='是' and shouhoubz='否' and a.szcsgcs=yw_wentilb.szcsgcs) as '待测试问题' from yw_wentilb a where 1=1"
    str = str & " and mokuai='" & Trim(cbomokuai.Text) & "'"
End If

If cbocheshiry.Text <> "" Then
    str = str & " and szcsgcs='" & Trim(cbocheshiry.Text) & "'"
End If

If cbojjcd.Text <> "" Then
    str = str & " and jingjicd='" & Trim(cbojjcd.Text) & "'"
End If

If DTPicker1.Value <> "1900-1-1" Then
    str = str & "and lvrusj between '" & DTPicker1.Value & " 00:00:01' and  '" & DTPicker2.Value & "'"
End If
str = str & " group by szcsgcs"

Set rs = conn.Execute(str)

Set MSHwentilb.DataSource = rs

'加载条形图
 With MSChart1
       
       .Refresh
       .Visible = True
       .TitleText = "问题测试状态分析"
       .ColumnCount = MSHwentilb.Cols - 1     '所有列
       .RowCount = MSHwentilb.Rows - 1        '每一列的行数
       
       '循环给图赋值
       For inti = 1 To MSHwentilb.Rows - 1
            .row = inti                           '指定行
            .RowLabel = MSHwentilb.TextMatrix(inti, 0)
          For row = 1 To MSHwentilb.Cols - 1
            .Column = row                         '指定列
            .ColumnLabel = MSHwentilb.TextMatrix(0, row)
            .Data = MSHwentilb.TextMatrix(inti, row)            '数据源
          Next row
          
          .ShowLegend = True
       Next inti

   End With
End Sub

Private Sub cmdquit_Click()
    Unload Me
End Sub

Private Sub Form_Load()
Dim i As Integer
DTPicker1.Value = "1900-1-1"
DTPicker2.Value = Now

'加载工程师名称
Set rs = Nothing
str = "select usename from [user] where quxian='测试员'"
rs.CursorLocation = adUseClient
rs.Open str, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
     cbocheshiry.AddItem rs.Fields("usename").Value
     rs.MoveNext
  Next i
  Set rs = Nothing
End If

'加载模块
Set rs = Nothing
str = "select mokuaimc from zd_mokuai"
rs.CursorLocation = adUseClient
rs.Open str, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
    cbomokuai.AddItem rs.Fields("mokuaimc").Value
    rs.MoveNext
  Next i
End If
Set rs = Nothing


'加载版本
Set rs = Nothing
str = "select banben from yw_banben"
rs.CursorLocation = adUseClient
rs.Open str, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
      cbobanben.AddItem rs.Fields("banben").Value
      rs.MoveNext
  Next i
End If
  Set rs = Nothing


'加载测试人员
    Unload frmsystem
    frmcheshizt.Show

End Sub
