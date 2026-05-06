VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "mschrt20.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmxiaolvfx 
   BackColor       =   &H00E0E0E0&
   Caption         =   "状态查询"
   ClientHeight    =   9540
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9540
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdshejibb 
      BackColor       =   &H00FFC0FF&
      Caption         =   "设计报表"
      Height          =   375
      Left            =   5220
      Style           =   1  'Graphical
      TabIndex        =   43
      Top             =   9120
      Visible         =   0   'False
      Width           =   1140
   End
   Begin VB.CommandButton cmdquit 
      BackColor       =   &H00C0FFFF&
      Caption         =   "退 出"
      Height          =   375
      Left            =   3720
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   9120
      Width           =   1215
   End
   Begin VB.CommandButton cmdqingkong 
      BackColor       =   &H00FFC0FF&
      Caption         =   "清 空"
      Height          =   375
      Left            =   2520
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   9120
      Width           =   1095
   End
   Begin VB.CommandButton cmddaochu 
      BackColor       =   &H00FFC0FF&
      Caption         =   "打　印"
      Height          =   375
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   9120
      Width           =   1095
   End
   Begin VB.CommandButton cmdchaxun 
      BackColor       =   &H00FFC0C0&
      Caption         =   "查 询"
      Height          =   375
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   9120
      Width           =   975
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "分析"
      ForeColor       =   &H00FF0000&
      Height          =   7095
      Left            =   270
      TabIndex        =   12
      Top             =   1890
      Width           =   14775
      Begin VB.OptionButton Option4 
         BackColor       =   &H00E0E0E0&
         Caption         =   "待讨论"
         Height          =   600
         Left            =   7065
         TabIndex        =   45
         Top             =   1575
         Width           =   1545
      End
      Begin VB.OptionButton Option3 
         BackColor       =   &H00E0E0E0&
         Caption         =   "待修改"
         Height          =   510
         Left            =   7065
         TabIndex        =   44
         Top             =   855
         Value           =   -1  'True
         Width           =   1500
      End
      Begin MSChart20Lib.MSChart MSChart2 
         Height          =   2685
         Left            =   8865
         OleObjectBlob   =   "frmxiaolvfx.frx":0000
         TabIndex        =   21
         Top             =   180
         Width           =   5700
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "图 示"
         ForeColor       =   &H00FF0000&
         Height          =   4155
         Left            =   90
         TabIndex        =   20
         Top             =   2835
         Width           =   14580
         Begin TabDlg.SSTab SSTab1 
            Height          =   3930
            Left            =   90
            TabIndex        =   22
            Top             =   180
            Width           =   14415
            _ExtentX        =   25426
            _ExtentY        =   6932
            _Version        =   393216
            Style           =   1
            Tab             =   1
            TabHeight       =   520
            BackColor       =   14737632
            TabCaption(0)   =   "状态图表"
            TabPicture(0)   =   "frmxiaolvfx.frx":2334
            Tab(0).ControlEnabled=   0   'False
            Tab(0).Control(0)=   "MSChart1"
            Tab(0).ControlCount=   1
            TabCaption(1)   =   "问题列表"
            TabPicture(1)   =   "frmxiaolvfx.frx":2350
            Tab(1).ControlEnabled=   -1  'True
            Tab(1).Control(0)=   "msfwentilb"
            Tab(1).Control(0).Enabled=   0   'False
            Tab(1).ControlCount=   1
            TabCaption(2)   =   "问题详细信息"
            TabPicture(2)   =   "frmxiaolvfx.frx":236C
            Tab(2).ControlEnabled=   0   'False
            Tab(2).Control(0)=   "Label3(0)"
            Tab(2).Control(1)=   "Label3(1)"
            Tab(2).Control(2)=   "Label3(2)"
            Tab(2).Control(3)=   "Label3(4)"
            Tab(2).Control(4)=   "Label3(5)"
            Tab(2).Control(5)=   "lbl1"
            Tab(2).Control(6)=   "Label3(7)"
            Tab(2).Control(7)=   "lbl3"
            Tab(2).Control(8)=   "lbl2"
            Tab(2).Control(9)=   "Label7"
            Tab(2).Control(10)=   "lbl4"
            Tab(2).Control(11)=   "txt2"
            Tab(2).Control(12)=   "txt3"
            Tab(2).Control(13)=   "txt1"
            Tab(2).Control(14)=   "Command1"
            Tab(2).ControlCount=   15
            Begin VB.CommandButton Command1 
               BackColor       =   &H00E0E0E0&
               Caption         =   "查看图片"
               Height          =   690
               Left            =   -63300
               Style           =   1  'Graphical
               TabIndex        =   39
               ToolTipText     =   "点击查看图片"
               Top             =   2520
               Width           =   1995
            End
            Begin RichTextLib.RichTextBox txt1 
               Height          =   2445
               Left            =   -74865
               TabIndex        =   38
               Top             =   945
               Width           =   4020
               _ExtentX        =   7091
               _ExtentY        =   4313
               _Version        =   393217
               Enabled         =   -1  'True
               ScrollBars      =   2
               DisableNoScroll =   -1  'True
               Appearance      =   0
               TextRTF         =   $"frmxiaolvfx.frx":2388
            End
            Begin RichTextLib.RichTextBox txt3 
               Height          =   2400
               Left            =   -67305
               TabIndex        =   26
               Top             =   945
               Width           =   3300
               _ExtentX        =   5821
               _ExtentY        =   4233
               _Version        =   393217
               Enabled         =   -1  'True
               ScrollBars      =   2
               DisableNoScroll =   -1  'True
               Appearance      =   0
               TextRTF         =   $"frmxiaolvfx.frx":2425
            End
            Begin RichTextLib.RichTextBox txt2 
               Height          =   2400
               Left            =   -70635
               TabIndex        =   25
               Top             =   945
               Width           =   3030
               _ExtentX        =   5345
               _ExtentY        =   4233
               _Version        =   393217
               Enabled         =   -1  'True
               ScrollBars      =   2
               DisableNoScroll =   -1  'True
               Appearance      =   0
               TextRTF         =   $"frmxiaolvfx.frx":24C2
            End
            Begin MSChart20Lib.MSChart MSChart1 
               Height          =   3525
               Left            =   -75000
               OleObjectBlob   =   "frmxiaolvfx.frx":255F
               TabIndex        =   23
               Top             =   360
               Width           =   14340
            End
            Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfwentilb 
               Height          =   3495
               Left            =   90
               TabIndex        =   24
               Top             =   405
               Width           =   14295
               _ExtentX        =   25215
               _ExtentY        =   6165
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
            Begin VB.Label lbl4 
               AutoSize        =   -1  'True
               ForeColor       =   &H000000FF&
               Height          =   180
               Left            =   -62310
               TabIndex        =   37
               Top             =   2070
               Width           =   90
            End
            Begin VB.Label Label7 
               AutoSize        =   -1  'True
               Caption         =   "是否返回问题: "
               Height          =   180
               Left            =   -63660
               TabIndex        =   36
               Top             =   2115
               Width           =   1260
            End
            Begin VB.Label lbl2 
               AutoSize        =   -1  'True
               ForeColor       =   &H00FF0000&
               Height          =   180
               Left            =   -62400
               TabIndex        =   35
               Top             =   1440
               Width           =   90
            End
            Begin VB.Label lbl3 
               AutoSize        =   -1  'True
               ForeColor       =   &H00FF0000&
               Height          =   180
               Left            =   -62355
               TabIndex        =   34
               Top             =   1755
               Width           =   90
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "修改工程师: "
               Height          =   180
               Index           =   7
               Left            =   -63480
               TabIndex        =   33
               Top             =   1755
               Width           =   1080
            End
            Begin VB.Label lbl1 
               AutoSize        =   -1  'True
               ForeColor       =   &H00FF0000&
               Height          =   180
               Left            =   -62400
               TabIndex        =   32
               Top             =   1035
               Width           =   90
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "问题流水号: "
               Height          =   180
               Index           =   5
               Left            =   -63480
               TabIndex        =   31
               Top             =   1035
               Width           =   1080
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "问题录入时间: "
               Height          =   180
               Index           =   4
               Left            =   -63660
               TabIndex        =   30
               Top             =   1440
               Width           =   1260
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "工程师修改说明"
               Height          =   180
               Index           =   2
               Left            =   -66270
               TabIndex        =   29
               Top             =   675
               Width           =   1260
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "测试人员说明"
               Height          =   180
               Index           =   1
               Left            =   -69735
               TabIndex        =   28
               Top             =   630
               Width           =   1080
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "问题原始说明"
               Height          =   180
               Index           =   0
               Left            =   -73560
               TabIndex        =   27
               Top             =   630
               Width           =   1080
            End
         End
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwentilb 
         Height          =   2415
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   4260
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
   Begin VB.Frame fra 
      BackColor       =   &H00E0E0E0&
      Caption         =   "查询条件"
      ForeColor       =   &H00FF0000&
      Height          =   960
      Left            =   240
      TabIndex        =   2
      Top             =   855
      Width           =   14775
      Begin VB.OptionButton Option2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "按问题修改时间"
         Height          =   240
         Left            =   9135
         TabIndex        =   42
         Top             =   585
         Width           =   2310
      End
      Begin VB.OptionButton Option1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "按问题录入时间"
         Height          =   195
         Left            =   9135
         TabIndex        =   41
         Top             =   225
         Value           =   -1  'True
         Width           =   2310
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   330
         Left            =   12330
         TabIndex        =   40
         Top             =   495
         Width           =   1365
         _ExtentX        =   2408
         _ExtentY        =   582
         _Version        =   393216
         Format          =   21430273
         CurrentDate     =   39326
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         Left            =   720
         TabIndex        =   19
         Top             =   240
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   330
         Left            =   12330
         TabIndex        =   10
         Top             =   135
         Width           =   1320
         _ExtentX        =   2328
         _ExtentY        =   582
         _Version        =   393216
         Format          =   21430273
         CurrentDate     =   39220
      End
      Begin VB.ComboBox cbojjcd 
         Height          =   300
         ItemData        =   "frmxiaolvfx.frx":41B3
         Left            =   6960
         List            =   "frmxiaolvfx.frx":41C0
         TabIndex        =   8
         Top             =   240
         Width           =   975
      End
      Begin VB.ComboBox cbogongcs 
         Height          =   300
         ItemData        =   "frmxiaolvfx.frx":41D4
         Left            =   4800
         List            =   "frmxiaolvfx.frx":41D6
         TabIndex        =   6
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cbomokuai 
         Height          =   300
         Left            =   2640
         TabIndex        =   4
         Top             =   240
         Width           =   1335
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "版 本"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   240
         TabIndex        =   18
         Top             =   360
         Width           =   450
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   11520
         TabIndex        =   11
         Top             =   630
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   11475
         TabIndex        =   9
         Top             =   270
         Width           =   720
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "紧急程度"
         Height          =   180
         Left            =   6240
         TabIndex        =   7
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程师"
         Height          =   180
         Left            =   4200
         TabIndex        =   5
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "模 块"
         Height          =   180
         Left            =   2160
         TabIndex        =   3
         Top             =   360
         Width           =   450
      End
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题修改状态分析"
      BeginProperty Font 
         Name            =   "宋体"
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
      Left            =   6600
      TabIndex        =   1
      Top             =   240
      Width           =   3480
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
      Left            =   4800
      TabIndex        =   0
      Top             =   240
      Width           =   1725
   End
End
Attribute VB_Name = "frmxiaolvfx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Dim blnReturn
Dim obj As Object

Private Sub cmdchaxun_Click()
Dim i As Integer     '网格列
Dim sum As Long      '网格合计变量
Dim n As Integer     '网格行
Dim inti As Integer  '行
Dim row As Integer   '列

'DTPicker2.Value = Now
SSTab1.Tab = 0
'构建SQL语句
str = ""
str = "select a.xggcs as '工程师',count(case gongchengsbz when '是' then '0' end )-(count(case shouhoubz when '否' then '0' end )-count(case gongchengsbz when '否' then '0' end)) as '已修改',count(case gongchengsbz when '否' then '0' end) as '待修改',count(case shouhoubz when '否' then '0' end )-count(case gongchengsbz when '否' then '0' end) as '已修改待测试' ,count(case taolunbz when '是' then '0' end ) as '待讨论',convert(numeric(18,0),(count(case gongchengsbz when '是' then '0' end)*100) /count(0)) as '修改率%' from st_wentilb a where 1=1 and taolunbz='否'"
'判断条件
If cbobanben.Text <> "" Then
    str = str & " and banben='" & Trim(cbobanben.Text) & "'"
End If

If cbomokuai.Text <> "" Then
    str = str & " and mokuai='" & Trim(cbomokuai.Text) & "'"
End If

If cbogongcs.Text <> "" Then
    str = str & " and xggcs='" & Trim(cbogongcs.Text) & "'"
End If

If cbojjcd.Text <> "" Then
    str = str & " and jingjicd='" & Trim(cbojjcd.Text) & "'"
End If

If DTPicker1.Value <> "1900-1-1" Then
    If Option1.Value = True Then
        str = str & "and lvrusj between '" & DTPicker1.Value & " 00:00:01' and  '" & DTPicker2.Value & " 23:59:59'"
    Else
        str = str & "and xgsj between '" & DTPicker1.Value & " 00:00:01' and  '" & DTPicker2.Value & " 23:59:59'"
    End If
End If
str = str & "group by a.xggcs"
'执行语句
Set rs = conn.Execute(str)
'赋傎给网格
Set MSHwentilb.DataSource = rs

'格式化比例
For i = 1 To MSHwentilb.Rows - 1
    MSHwentilb.TextMatrix(i, 5) = MSHwentilb.TextMatrix(i, 5)
Next i

'重新赋傎待讨论问题给网格，不按时间查询全部
Dim m As Integer
For m = 1 To MSHwentilb.Rows - 2
    str = "select count(0) as 'zxh' from yw_wentilb where xggcs='" & Trim(MSHwentilb.TextMatrix(m, 0)) & "' and taolunbz='是'"
    Set rs = conn.Execute(str)
    MSHwentilb.TextMatrix(m, 4) = rs.Fields("zxh").Value
Next m

'加合计列
 MSHwentilb.AddItem (" 合 计")               '新增一行 用来显示合计
sum = 0                                     '初始化合计傎
For i = 1 To MSHwentilb.Cols - 2            '循环所要合计的列
    For n = 1 To MSHwentilb.Rows - 2        '循环所要合计的行
        sum = sum + MSHwentilb.TextMatrix(n, i)
    Next n
       MSHwentilb.TextMatrix(MSHwentilb.Rows - 1, i) = sum
       sum = 0
Next i



'加载条形图
 With MSChart1
       
       .Refresh
       .Visible = True
       .TitleText = "问题修改效率分析"
       .ColumnCount = MSHwentilb.Cols - 2      '所有列
       .RowCount = MSHwentilb.Rows - 2         '每一列的行数
       
       '循环给图赋值
       For inti = 1 To MSHwentilb.Rows - 2
            .row = inti                           '指定行
            .RowLabel = MSHwentilb.TextMatrix(inti, 0)
          For row = 1 To MSHwentilb.Cols - 2
            .Column = row                         '指定列
            .ColumnLabel = MSHwentilb.TextMatrix(0, row)
            .Data = MSHwentilb.TextMatrix(inti, row)            '数据源
          Next row
          
          .ShowLegend = True
       Next inti

   End With
   
 '加载饼图
 With MSChart2
    .Refresh
    .Visible = True
    .TitleText = "问题情况分部"
    .RowCount = 1
'    .ColumnCount = MSHwentilb.Cols - 2
 For inti = 1 To MSHwentilb.Cols - 2
    .Column = inti
    .ColumnLabel = MSHwentilb.TextMatrix(0, inti)
    .Data = MSHwentilb.TextMatrix(MSHwentilb.Rows - 1, inti)
 Next inti
     .RowLabel = ""
    .ShowLegend = True
 End With
Set rs = Nothing
End Sub

Private Sub cmddaochu_Click()

   Dim col As New Collection
   col.Add "开始时间"
   col.Add DTPicker1.Value
   col.Add "结束时间"
   col.Add DTPicker2.Value
   col.Add "版本"
   col.Add cbobanben.Text
   col.Add "模块"
   col.Add cbomokuai.Text
   col.Add "工程师"
   col.Add cbogongcs.Text
   col.Add "紧急程度"
   col.Add cbojjcd.Text
   col.Add "操作员"
   col.Add user
    Call Grf.ReportDes_Auto(0, col, App.Path & "\Report\效率分析.grf")
End Sub

Private Sub cmdquit_Click()
    Unload Me
End Sub

'Private Sub cmdshejibb_Click()
'   Dim col As New Collection
'   col.Add "开始时间"
'   col.Add DTPicker1.Value
'   col.Add "结束时间"
'   col.Add DTPicker2.Value
'   col.Add "版本"
'   col.Add cbobanben.Text
'   col.Add "模块"
'   col.Add cbomokuai.Text
'   col.Add "工程师"
'   col.Add cbogongcs.Text
'   col.Add "紧急程度"
'   col.Add cbojjcd.Text
'   col.Add "操作员"
'   col.Add user
'   '...
'   '3传参数
'   blnReturn = obj.PutVariant(col)
'   '4设计和预览的参数名要一致
'   blnReturn = obj.ReportDesign(str, App.Path & "\report\效率分析.frf")
'End Sub

Private Sub Command1_Click()
tplsh = lbl1.Caption
Set rs = Nothing
    rs.Open "select lsh from yw_wentitp where lsh='" & tplsh & "'", conn
If Not rs.EOF Then
    frmchakantp.Show
Else
    MsgBox "当前问题没有图片！", vbOKOnly + vbInformation, "友情提示"
End If
    Set rs = Nothing
End Sub

Private Sub Form_Load()

DTPicker1.Value = "1900-1-1"
DTPicker2.Value = Format(Now(), "yy-MM-dd")

 '1创建对象
' Set obj = CreateObject("proBaoBiaoGG.clsRpt_LIB")
' '2初始化连接
' blnReturn = obj.initConn(sqlDataString)

'加载工程师名称
Set rs = Nothing
str = "select usename from [user] where quxian='工程师'"
rs.CursorLocation = adUseClient
rs.Open str, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
     cbogongcs.AddItem rs.Fields("usename").Value
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

End Sub

Private Sub Form_Unload(Cancel As Integer)
Set obj = Nothing
End Sub

Private Sub msfwentilb_Click()

'使当前行的背景色突出显示
 Me.msfwentilb.FocusRect = flexFocusNone
  Me.msfwentilb.SelectionMode = flexSelectionByRow
  Me.msfwentilb.BackColorSel = 8421631
End Sub

Private Sub msfwentilb_DblClick()
    SSTab1.Tab = 2
      '网格赋傎给窗体上的控件
If msfwentilb.Rows > 1 And msfwentilb.TextMatrix(msfwentilb.row, 0) <> "" Then
    txt1.Text = msfwentilb.TextMatrix(msfwentilb.row, 7)
    txt2.Text = msfwentilb.TextMatrix(msfwentilb.row, 8)
    txt3.Text = msfwentilb.TextMatrix(msfwentilb.row, 9)
    
    lbl2.Caption = msfwentilb.TextMatrix(msfwentilb.row, 10)
    lbl1.Caption = msfwentilb.TextMatrix(msfwentilb.row, 0)
    lbl3.Caption = msfwentilb.TextMatrix(msfwentilb.row, 12)
Else
    Exit Sub
End If

'判断是否返回的问题
If txt3.Text <> "" Then
    lbl4.Caption = "是"
Else
    lbl4.Caption = "否"
End If

'判断问题是否有图片
str = "select lsh from yw_wentitp where lsh='" & Trim(lbl1.Caption) & "'"
    Set rs = conn.Execute(str)
If Not rs.EOF Then
    Command1.Enabled = True
Else
    Command1.Enabled = False
End If
End Sub

Private Sub MSHwentilb_Click()

'使当前行的背景色突出显示
 Me.MSHwentilb.FocusRect = flexFocusNone
  Me.MSHwentilb.SelectionMode = flexSelectionByRow
  Me.MSHwentilb.BackColorSel = 8421631


End Sub

Private Sub MSHwentilb_DblClick()
SSTab1.Tab = 1
'判断查询条件,加载问题列表
If Option3.Value = True Then

    str = "select lsh AS '流水号',banben as '版本',taolunbz as '讨论标志', yiyuanmc as '医院名称', szcsgcs as '问题反馈人', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型' from yw_wentilb where (lvrusj between '" & DTPicker1.Value & " 00:00:01' and '" & DTPicker2.Value & " 23:59:59') and gongchengsbz='否' and xggcs='" & MSHwentilb.TextMatrix(MSHwentilb.row, 0) & "'and taolunbz='否'"
Else
    str = "select lsh AS '流水号',banben as '版本',taolunbz as '讨论标志', yiyuanmc as '医院名称', szcsgcs as '问题反馈人', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型' from yw_wentilb where  gongchengsbz='否' and xggcs='" & MSHwentilb.TextMatrix(MSHwentilb.row, 0) & "' and taolunbz='是'"
End If

If MSHwentilb.TextMatrix(MSHwentilb.row, 0) = " 合 计" Then
    Exit Sub
End If

Set msfwentilb.DataSource = conn.Execute(str)

End Sub


