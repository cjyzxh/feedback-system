VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.33#0"; "HISControl1.ocx"
Begin VB.Form frmwenticl 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "问题处理"
   ClientHeight    =   11640
   ClientLeft      =   255
   ClientTop       =   840
   ClientWidth     =   17955
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   11640
   ScaleWidth      =   17955
   WindowState     =   2  'Maximized
   Begin VB.ComboBox Combo1 
      Height          =   300
      ItemData        =   "frmwenticl.frx":0000
      Left            =   10860
      List            =   "frmwenticl.frx":000A
      TabIndex        =   35
      Text            =   "上午"
      Top             =   6000
      Width           =   915
   End
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   0
      TabIndex        =   10
      Top             =   30
      Width           =   17925
      _ExtentX        =   31618
      _ExtentY        =   714
      Caption         =   "问题处理"
   End
   Begin mycmd.MyCommand cmdtuichu 
      Height          =   495
      Left            =   7020
      TabIndex        =   9
      Top             =   5820
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   873
      Caption         =   "退 出"
   End
   Begin mycmd.MyCommand cmddaitl 
      Height          =   495
      Left            =   5940
      TabIndex        =   8
      Top             =   5820
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   873
      Caption         =   "待讨论"
   End
   Begin mycmd.MyCommand cmdbaocun 
      Height          =   495
      Left            =   2289
      TabIndex        =   7
      Top             =   5820
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   873
      Caption         =   "确定处理"
   End
   Begin mycmd.MyCommand cmdchaxun 
      Height          =   495
      Left            =   1212
      TabIndex        =   6
      Top             =   5820
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   873
      Caption         =   "查询问题"
   End
   Begin mycmd.MyCommand cmdqingkong 
      Height          =   495
      Left            =   135
      TabIndex        =   5
      Top             =   5820
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   873
      Caption         =   "清空条件"
   End
   Begin MSComCtl2.DTPicker DTPjieshusj 
      Height          =   345
      Left            =   14700
      TabIndex        =   4
      Top             =   1260
      Width           =   1905
      _ExtentX        =   3360
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Format          =   319619073
      CurrentDate     =   39056
   End
   Begin MSComCtl2.DTPicker DTPkaishisj 
      Height          =   345
      Left            =   14700
      TabIndex        =   3
      Top             =   780
      Width           =   1905
      _ExtentX        =   3360
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Format          =   319619073
      CurrentDate     =   39056
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfgcs 
      Height          =   5085
      Left            =   13500
      TabIndex        =   2
      Top             =   6420
      Width           =   4395
      _ExtentX        =   7752
      _ExtentY        =   8969
      _Version        =   393216
      ForeColor       =   16711680
      Cols            =   1
      FixedCols       =   0
      BackColorBkg    =   -2147483643
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwenticllb 
      Height          =   5040
      Left            =   60
      TabIndex        =   0
      Top             =   6420
      Width           =   13095
      _ExtentX        =   23098
      _ExtentY        =   8890
      _Version        =   393216
      BackColor       =   -2147483634
      ForeColor       =   0
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   -2147483626
      ForeColorFixed  =   0
      BackColorBkg    =   16777215
      AllowUserResizing=   3
      PictureType     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "基本信息"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000A&
      Height          =   5205
      Left            =   30
      TabIndex        =   11
      Top             =   510
      Width           =   17865
      Begin UserControl.cbo cboYYMC 
         Height          =   225
         Left            =   2850
         TabIndex        =   21
         Top             =   300
         Width           =   6135
         _ExtentX        =   10821
         _ExtentY        =   397
         ListWidth       =   5400
         Caption         =   "医院名称"
         TextColumn      =   1
         ForeColor       =   0
         CaptionForeColor=   -2147483640
         CaptionForeColor=   -2147483640
         Caption         =   "医院名称"
         ColumnCaptions  =   "医院名称;拼音码;模块;到期日;备注;"
         ColWidths       =   "2500;0;0;2500;0;"
         ListText        =   ""
      End
      Begin VB.TextBox txtshouzhongcssm 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3135
         Left            =   7860
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         Top             =   1470
         Width           =   3855
      End
      Begin VB.TextBox txtwentism 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   12
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3615
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   1470
         Width           =   7395
      End
      Begin VB.ComboBox xggcs 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   375
         ItemData        =   "frmwenticl.frx":001A
         Left            =   3855
         List            =   "frmwenticl.frx":001C
         TabIndex        =   17
         Top             =   690
         Width           =   1335
      End
      Begin VB.ComboBox cmbshishiry 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   375
         Left            =   900
         TabIndex        =   16
         Top             =   690
         Width           =   1875
      End
      Begin VB.ComboBox cbobanben 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   375
         ItemData        =   "frmwenticl.frx":001E
         Left            =   900
         List            =   "frmwenticl.frx":0020
         TabIndex        =   15
         Top             =   240
         Width           =   1905
      End
      Begin VB.TextBox txtgcsyj 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3135
         Left            =   11820
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         Top             =   1470
         Width           =   3015
      End
      Begin VB.CommandButton CmdKT 
         Caption         =   "查看图片"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   14.25
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3015
         Left            =   14940
         TabIndex        =   13
         Top             =   1500
         Width           =   2325
      End
      Begin UserControl.txt cbomokuan 
         Height          =   225
         Left            =   9060
         TabIndex        =   12
         Top             =   300
         Width           =   2445
         _ExtentX        =   4313
         _ExtentY        =   397
         Caption         =   "模块"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1774672
         ForeColor       =   12582912
         CaptionForeColor=   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
      End
      Begin MSComDlg.CommonDialog cdldaoru 
         Left            =   8460
         Top             =   1980
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin UserControl.num txtwentilsh 
         Height          =   225
         Left            =   11580
         TabIndex        =   20
         Top             =   300
         Width           =   1905
         _ExtentX        =   3360
         _ExtentY        =   397
         XiaoShuWS       =   "0"
         Caption         =   "流水号"
         CaptionWidth    =   630
         Enabled         =   0   'False
         Hwnd            =   1316320
         ForeColor       =   255
         CaptionForeColor=   -2147483630
         Locked          =   -1  'True
      End
      Begin UserControl.txt cbochuangti 
         Height          =   225
         Left            =   9060
         TabIndex        =   22
         Top             =   780
         Width           =   2445
         _ExtentX        =   4313
         _ExtentY        =   397
         Caption         =   "窗体"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1054206
         ForeColor       =   12582912
         CaptionForeColor=   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
      End
      Begin UserControl.txt txtshijian 
         Height          =   225
         Left            =   5220
         TabIndex        =   23
         Top             =   780
         Width           =   3795
         _ExtentX        =   6694
         _ExtentY        =   397
         Caption         =   "录入时间"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1054206
         ForeColor       =   12582912
         CaptionForeColor=   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
      End
      Begin UserControl.txt cbojingjicd 
         Height          =   225
         Left            =   11580
         TabIndex        =   31
         Top             =   780
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   397
         Caption         =   "紧急程度"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1054206
         CaptionForeColor=   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Locked          =   -1  'True
      End
      Begin VB.Label Label15 
         BackStyle       =   0  'Transparent
         Caption         =   "注：工程师"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   7920
         TabIndex        =   46
         Top             =   4800
         Width           =   900
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "张晓华"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   8910
         TabIndex        =   45
         Top             =   4800
         Width           =   540
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "共有全部未处理问题"
         Height          =   180
         Left            =   9540
         TabIndex        =   44
         Top             =   4800
         Width           =   1620
      End
      Begin VB.Label Label18 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "10"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   11280
         TabIndex        =   43
         Top             =   4800
         Width           =   180
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "个，"
         Height          =   180
         Left            =   10785
         TabIndex        =   42
         Top             =   4800
         Width           =   360
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "当前查询条件共有"
         Height          =   180
         Left            =   11610
         TabIndex        =   41
         Top             =   4800
         Width           =   1440
      End
      Begin VB.Label Label21 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "10"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   13170
         TabIndex        =   40
         Top             =   4800
         Width           =   180
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "个问题待处理！"
         Height          =   180
         Left            =   13500
         TabIndex        =   39
         Top             =   4800
         Width           =   1260
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束日期"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   13860
         TabIndex        =   34
         Top             =   900
         Width           =   720
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "测试人员意见"
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   7860
         TabIndex        =   30
         Top             =   1230
         Width           =   2055
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问 题 说 明"
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   1920
         TabIndex        =   29
         Top             =   1230
         Width           =   990
      End
      Begin VB.Label labwentilx 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "修改工程师"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   2895
         TabIndex        =   28
         Top             =   840
         Width           =   900
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "跟进人员"
         Height          =   180
         Left            =   120
         TabIndex        =   27
         Top             =   840
         Width           =   720
      End
      Begin VB.Label labruanjianbb 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   150
         TabIndex        =   26
         Top             =   300
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程师修改说明"
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   11880
         TabIndex        =   25
         Top             =   1230
         Width           =   1260
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始日期"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   13860
         TabIndex        =   24
         Top             =   420
         Width           =   720
      End
   End
   Begin mycmd.MyCommand cmdfenpeibb 
      Height          =   495
      Left            =   4653
      TabIndex        =   32
      Top             =   5820
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   873
      Caption         =   "分配跟进人"
   End
   Begin mycmd.MyCommand cmdxg 
      Height          =   495
      Left            =   3366
      TabIndex        =   33
      Top             =   5820
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   873
      Caption         =   "分配修改人"
   End
   Begin mycmd.MyCommand MyCommand1 
      Height          =   495
      Left            =   11820
      TabIndex        =   36
      Top             =   5820
      Width           =   1425
      _ExtentX        =   2514
      _ExtentY        =   873
      Caption         =   "保存计划时间"
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   315
      Left            =   9360
      TabIndex        =   37
      Top             =   6000
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Format          =   320405505
      CurrentDate     =   39695
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "研发意见模板"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   14760
      TabIndex        =   47
      Top             =   6180
      Width           =   1170
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "计划修改时间"
      ForeColor       =   &H00FF0000&
      Height          =   180
      Left            =   8220
      TabIndex        =   38
      Top             =   6060
      Width           =   1080
   End
   Begin VB.Label labshijian 
      AutoSize        =   -1  'True
      BackColor       =   &H00C000C0&
      Caption         =   "时 间"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   9120
      TabIndex        =   1
      Top             =   1560
      Width           =   495
   End
End
Attribute VB_Name = "frmwenticl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Rs As New ADODB.Recordset
Private str1 As String
Private Rs1 As New ADODB.Recordset
Dim dqwt As Integer      '当前问题数
Dim qbwt As Integer      '全部问题数
Dim QP As New ClsBubble    '气泡类
Dim m_xggcs As String
Dim m_gjr As String



'Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
'Dim pymstr As String            '查询字符串
'Dim pymint As Integer           '循环变量
'
'   If KeyCode = 13 And cboYYMC.Text <> "" Then
'        pymstr = ""
'        '构建查询语句
'        pymstr = "select yiyuanmc from st_yw_kehuxinxi where pym like '%" & Trim(cboYYMC.Text) & "%'"
'        rs.CursorLocation = adUseClient
'     rs.Open pymstr, conn
'        If Not rs.EOF Then
'           cboyiyuanmc.Clear                          '清空当前LIST记录
'           '循环赋傎给组合框的LIST
'        For pymint = 1 To rs.RecordCount
'            cboyiyuanmc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'            rs.MoveNext
'          Next pymint
'           cboyiyuanmc.ListIndex = 0                  '将第一行的傎赋给TEXT
'        End If
'
'    End If
'     If KeyCode = 13 And cboYYMC.Text <> "" Then
'        cmbshishiry.SetFocus
'     End If
'          Set rs = Nothing
'End Sub

Public Function LoadYYMC(cboZhuangZai As cbo, Optional strTiaoJian As String = "") As Boolean
Dim strSQL As String
   '* 功    能：装载患者类别2
   '* 参    数： 1.组合框
   '*            2.条件,如DaiMa='01'
   '* 返 回 值：是否加载成功
   '* 创 建 人：WangLiguo
   '* 修 改 人：
   '* 修改日期：

   On Error GoTo PROC_ERR
   
   '装载患者类别2
   strSQL = "select YHMC,dbo.fn_GetPy(YHMC) PYM,MK,SYQ,BeiZhu from xt_ConfigServer where ZuoFeiBZ='否' and qy<>'内部'"
          
   '有条件传入时
   If strTiaoJian <> "" Then
      strSQL = strSQL & Chr(13) _
            & "WHERE 1=1" & Chr(13) _
            & "AND " & strTiaoJian
   End If
   
   '代码;拼音码;名称;
   LoadYYMC = objFormSetting.LoadcboData(cboZhuangZai, recorddata, strSQL)

PROC_EXIT:
   Exit Function

PROC_ERR:
   If ERR.Number <> 0 Then
      LoadYYMC = False
      Call ShowError(Me.Caption, "LoadYYMC", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

Private Sub cmdbaocun_Click()

Dim strxinxi As String
txtgcsyj.Text = Replace(Trim(txtgcsyj.Text), "'", "''")        '替换文本中的单引号

If txtgcsyj.Text <> "" Then
    str = "update yw_wentilb set gongcscs='" & Trim(txtgcsyj.Text) & "',shishiry='" & Trim(cmbshishiry.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
    Rs1.Open str, conn
    MSHwenticllb.TextMatrix(MSHwenticllb.row, 8) = txtgcsyj.Text

    If MsgBox("问题是否是处理完成？", vbYesNo + vbQuestion, "提示") = vbYes Then
        str = "update yw_wentilb set gongchengsbz='是',xgsj=getdate() where lsh='" & Trim(txtwentilsh.Text) & "'"
        Rs1.Open str, conn
        
        Call QiPao_WT(Trim(txtwentilsh.Text), Trim(cmbshishiry.Text), cboYYMC.Text, "待测试", Trim(cmbshishiry.Text))
        
        MsgBox "问题修改完成！", vbOKOnly + vbInformation, "提示"
        Set Rs1 = Nothing
    
    Else
       MsgBox "该问题还没有完全处理，但“工程师说明”已保存", vbOKOnly + vbInformation, "提示"
       
    End If
Else
    MsgBox "请录入意见后再保存，谢谢！", vbOKOnly + vbInformation, "提示"
    Exit Sub
    txtgcsyj.SetFocus
End If
  Set Rs1 = Nothing
  
  cboYYMC.Text = ""
  cmbshishiry.Text = ""
  cbomokuan.Text = ""
  cbochuangti.Text = ""
  xggcs.Text = user
  cbojingjicd.Text = ""
  txtwentism.Text = ""
  txtshouzhongcssm.Text = ""
  txtgcsyj.Text = ""
  cbobanben.Text = ""
  txtwentilsh.Text = ""
  CmdKT.Enabled = False
'  pic1.Picture = LoadPicture()
'  MSHwenticllb.RemoveItem Row
  Call cmdchaxun_Click
  
  '取当前操作员的全部问题
str = "select count(lsh) as lsh from yw_wentilb where xggcs='" & user & "'and gongchengsbz='否'"
    Rs.Open str, conn
If Not Rs.EOF Then
    qbwt = Rs.Fields("lsh").Value
    Set Rs = Nothing
Else
    qbwt = 0
    Set Rs = Nothing
End If
'将全部问题数加载
Label18.Caption = qbwt
End Sub

Private Sub QiPao_WT(strWTlsh As String, strJSGCS As String, strYYMC As String, strLB As String, strGJRY As String)
    Dim colInfo As New Collection
        colInfo.Add strWTlsh   '问题流水号
        colInfo.Add strJSGCS   '接收人员
        colInfo.Add strYYMC    '医院名称
        colInfo.Add strLB      '业务类别:待修改-待测试-返回修改
        colInfo.Add strGJRY    '当前业务发布人员
        Call QP.InsertQiPao_WT(colInfo)
End Sub

Private Sub cmdchaxun_Click()
 Dim str1 As String                             '定义查询条件变量
 
 MSHwenticllb.Clear                             '当二次查询时清空列表
' msfgcs.Clear
 str1 = "1=1"
'根据不同的条件从库中查询记录并赋给网格
 str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',lvrusj as '录入时间',xggcs as '工程师',jingjicd as '紧急程度',szcsgcs as '测试人员',DATEDIFF(day, lvrusj, getdate()) as '问题天数'from yw_wentilb where shouzhongbz='是' and gongchengsbz='否' and taolunbz='否'"
 If cboYYMC.Text <> "" Then
    str1 = str1 & "and yiyuanmc='" & Trim(cboYYMC.Text) & "'"
 End If
 If cmbshishiry.Text <> "" Then
    str1 = str1 & "and shishiry='" & Trim(cmbshishiry.Text) & "'"
 End If
 If cbomokuan.Text <> "" Then
    str1 = str1 & "and mokuai='" & Trim(cbomokuan.Text) & "'"
End If
If cbochuangti.Text <> "" Then
    str1 = str1 & "and chuangtimc='" & Trim(cbochuangti.Text) & "'"
End If
If xggcs.Text <> "" Then
    str1 = str1 & "and xggcs='" & Trim(xggcs.Text) & "'"
End If
If cbojingjicd.Text <> "" Then
    str1 = str1 & "and jingjicd='" & Trim(cbojingjicd.Text) & "'"
End If
If DTPkaishisj.Value <> "" Then
    str1 = str1 & "and lvrusj between '" & DTPkaishisj.Value & " 00:00:01" & "' and '" & DTPjieshusj.Value & " 23:59:59" & "'"
End If
If cbobanben.Text <> "" Then
    str1 = str1 & "and banben='" & Trim(cbobanben.Text) & "'"
Else
'    If MsgBox("请注意你没有选择当前要处理的版本,是否要选择？（选“否”将查询本时间段内全部版本问题）", vbYesNo + vbInformation, "友情提示") = vbYes Then
'        cbobanben.SetFocus
'        Exit Sub
'    End If
End If
    '打开记录集将傎赋给网格
          Rs.Open str1, conn, 1, 3
    If Not Rs.EOF Then
        Set MSHwenticllb.DataSource = Rs
        Rs.Close
    Else
        MsgBox "没有待处理的问题，请查看其它时间段！", vbOKOnly + vbInformation, "提示"
        Rs.Close
    End If
    
    '取当前问题数量
If MSHwenticllb.TextMatrix(0, 0) <> "" Then
    dqwt = MSHwenticllb.Rows - 1
Else
    dqwt = 0
End If

Set Rs = Nothing
Label21.Caption = dqwt

End Sub

Private Sub cmddaitl_Click()
If txtwentilsh.Text <> "" Then
    cmddaitl.Enabled = True
    str = "update yw_wentilb set taolunbz='是',gongchengsbz='否',taolunsj='" & Now & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
    
    If MsgBox("确定要将问题放入待讨论区吗？", vbYesNo + vbQuestion, "友情提示") = vbYes Then
        Set Rs = conn.Execute(str)
        MsgBox "问题已经转移到待讨论区！", vbOKOnly + vbInformation, "提示"
        MSHwenticllb.RemoveItem MSHwenticllb.row
        
    Else
        Exit Sub
    End If
        
Else
    Exit Sub
End If
End Sub

Private Sub cmdfenpeibb_Click()
If txtgcsyj.Text <> "" And cmbshishiry.Text <> "" Then
    str = "update yw_wentilb set gongcscs='" & Trim(txtgcsyj.Text) & "',shishiry='" & Trim(cmbshishiry.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
    If MsgBox("确定现在要重新分配问题跟进人员吗？", vbYesNo + vbQuestion, "提示") = vbYes Then
        Rs.Open str, conn
        MsgBox "分配成功，该问题已被分配到 [" & Trim(cmbshishiry.Text) & "] 中，请通知相关测试人员！", vbOKOnly + vbInformation, "提示"
    '    Me.MSHwenticllb.CellForeColor = vbRed
        Me.MSHwenticllb.CellBackColor = vbGreen
         MSHwenticllb.TextMatrix(MSHwenticllb.row, 1) = cbobanben.Text
        Set Rs = Nothing
        
    End If
Else
    MsgBox "“跟进人员”和“工程师说明”必须填写！", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If
End Sub

Private Sub cmdqingkong_Click()
    MSHwenticllb.Clear
    MSHwenticllb.Rows = 2
    cboYYMC.Text = ""
    cmbshishiry.Text = ""
    cbomokuan.Text = ""
    cbochuangti.Text = ""
    xggcs.Text = user
    cbojingjicd.Text = ""
'    cbocsry.Text = ""
    txtwentism.Text = ""
    txtshouzhongcssm.Text = ""
    txtgcsyj.Text = ""
    cbobanben.Text = ""
    txtwentilsh.Text = ""
    CmdKT.Enabled = False
    txtshijian.Text = ""
'    pic1.Picture = LoadPicture()
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub cmdtuixiangck_Click()

End Sub

'Private Sub cmdtuixiangck_Click()
''查看图片
'  Dim prs1 As New ADODB.Stream
'    Rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
'   If Not Rs.EOF Then
'       With prs1
'       .Type = adTypeBinary                   '定义流对象变量的类型为二进制
'       .Mode = adModeReadWrite
'       .Open
'       .Write Rs.Fields("pic1")
'       .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
'       End With
'      pic1.Picture = LoadPicture(App.Path & ".jpg")
''      frmchakantp.Show vbModal
'      Set Rs = Nothing
'    End If
'End Sub

Private Sub cmdxg_Click()
Dim strSQL As String
    txtgcsyj.Text = Replace(Trim(txtgcsyj.Text), "'", "''")        '替换文本中的单引号

    If MsgBox("确定要将此问题分配给其它工程师吗？此操作也将同时修改工程师说明内容", vbYesNo + vbQuestion, "提示") = vbYes Then
        str = "update yw_wentilb set gongcscs='" & Trim(txtgcsyj.Text) & "',xggcs='" & Trim(xggcs.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
        Set Rs = New ADODB.Recordset
        Rs.Open str, conn
        '   Call cmdchaxun_Click

        MSHwenticllb.TextMatrix(MSHwenticllb.row, 8) = txtgcsyj.Text
        If MSHwenticllb.row = 1 And MSHwenticllb.Rows = 2 Then
            MSHwenticllb.Clear
        Else
            MSHwenticllb.RemoveItem MSHwenticllb.row
        End If
        Set Rs = Nothing
        
        Call QiPao_WT(Trim(txtwentilsh.Text), Trim(xggcs.Text), cboYYMC.Text, "待修改", Trim(user))
        strSQL = "delete from yw_QiPaoTishi where Wtlsh='" & txtwentilsh.Text & "' and WentiJSRMC='" & m_xggcs & "'"
        Call objExecuteSQL.ExecuteSQL(strSQL)
        
        MsgBox "恭喜，修改成功！～", vbOKOnly + vbInformation, "提示"
    Else

        Exit Sub
    End If
End Sub

Private Sub CmdKT_Click()

   tplsh = txtwentilsh.Text
    frmchakantp.Show
End Sub

Private Sub Form_Load()
'frmwenticl.Width = frmzxh.ScaleWidth
'frmwenticl.Height = frmzxh.ScaleHeight - 750
Dim i As Integer
Dim str As String
Dim str1 As String
Dim str2 As String
Dim str3 As String

'初始化问题数量
dqwt = 0
qbwt = 0
Label21.Caption = "0"
cmddaitl.Enabled = False
'加载时间
DTPkaishisj.Value = Format(Now - 365, "yyyy-mm-dd")
DTPjieshusj.Value = Format(Now, "yyyy-mm-dd")

'加载当前操作员
Label16.Caption = user

Call LoadYYMC(cboYYMC)

'默认当前工程师
str = "select quxian from [user] where usename ='" & user & "'"
Rs.Open str, conn
    If Not Rs.EOF Then
      If Rs.Fields("quxian").Value = "工程师" Then
        xggcs.Text = user
      Else
        xggcs.Text = ""
      End If
    End If
    Set Rs = Nothing
    
    
      '加载版本
Set Rs = Nothing
str1 = "SELECT  banben FROM yw_banben"
Rs.CursorLocation = adUseClient
Rs.Open str1, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cbobanben.AddItem Rs.Fields("banben").Value
      Rs.MoveNext
  Next i
  Rs.Close
End If

    
''加载医院名称
'Set rs = Nothing
'str = "select yiyuanmc from st_yw_kehuxinxi"
'rs.CursorLocation = adUseClient
'rs.Open str, conn
'If Not rs.EOF Then
'  For i = 1 To rs.RecordCount
'     cboyiyuanmc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'     rs.MoveNext
'  Next i
'  rs.Close
'End If


'加载工程师名称
Set Rs = Nothing
str = "select usename from [user] where quxian='工程师'  and zhuangtai='1'"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
     xggcs.AddItem Rs.Fields("usename").Value
     Rs.MoveNext
  Next i
  Set Rs = Nothing
End If


'加载人员
Set Rs = Nothing
str1 = "select xingming from zd_jishuyuan where zhuangtai='1'and zhiwu<>'销售人员'"
Rs.CursorLocation = adUseClient
Rs.Open str1, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cmbshishiry.AddItem Rs.Fields("xingming").Value
      Rs.MoveNext
  Next i
  Rs.Close
End If

''加载测试人员
'Set rs = Nothing
'str1 = "select usename from [user] where quxian<>'工程师'"
'rs.CursorLocation = adUseClient
'rs.Open str1, conn
'If Not rs.EOF Then
'  For i = 1 To rs.RecordCount
'      cbocsry.AddItem rs.Fields("usename").Value
'      rs.MoveNext
'  Next i
'  rs.Close
'End If
  

''加载模块
'Set rs = Nothing
'str2 = "select mokuaimc from zd_mokuai where banben='" & Trim(cbobanben.Text) & "'"
'rs.CursorLocation = adUseClient
'rs.Open str2, conn
'If Not rs.EOF Then
'  For i = 1 To rs.RecordCount
'    cbomokuan.AddItem rs.Fields("mokuaimc").Value
'    rs.MoveNext
'  Next i
'End If
'rs.Close

'取当前操作员的全部问题
Set Rs = Nothing
str = "select count(lsh) as lsh from yw_wentilb where xggcs='" & user & "'and gongchengsbz='否'"
    Rs.Open str, conn
If Not Rs.EOF Then
    qbwt = Rs.Fields("lsh").Value
    Set Rs = Nothing
Else
    qbwt = 0
    Set Rs = Nothing
End If
'将全部问题数加载
Label18.Caption = qbwt

   '加载模板
   Set Rs = Nothing
msfgcs.ColWidth(0) = 4000
 str1 = "select moban as 模板 from zd_moban where mobanlx='工程师意见'"

    Rs.Open str1, conn, 1, 3
    Set msfgcs.DataSource = Rs
    Rs.Close
    
Call cmdchaxun_Click

End Sub



Private Sub Form_Resize()
On Error GoTo CJY
    Frame2.Width = Me.ScaleWidth - 50
    pic1.Width = Me.ScaleWidth
    
'    msfgcs.Height = Me.ScaleHeight - msfgcs.Top - 100
'    MSHwenticllb.Height = msfgcs.Height
'    MSHwenticllb.Width = Me.ScaleWidth - MSHwenticllb.Left - 50
    
    MSHwenticllb.Height = Me.ScaleHeight - MSHwenticllb.Top - 50
    msfgcs.Height = MSHwenticllb.Height
    msfgcs.Top = MSHwenticllb.Top
    MSHwenticllb.Width = Me.ScaleWidth - msfgcs.Width - 100
    msfgcs.Left = MSHwenticllb.Left + MSHwenticllb.Width + 40
    Label13.Left = msfgcs.Left

CJY:
End Sub

Private Sub msfgcs_DblClick()
txtgcsyj.Text = msfgcs.TextMatrix(msfgcs.row, 0)
End Sub

Private Sub MSHwenticllb_Click()
'使当前行的背景色突出显示

 Me.MSHwenticllb.FocusRect = flexFocusNone
  Me.MSHwenticllb.SelectionMode = flexSelectionByRow
  Me.MSHwenticllb.BackColorSel = 8421631

If MSHwenticllb.Rows > 1 And MSHwenticllb.TextMatrix(MSHwenticllb.row, 0) <> "" Then
    txtwentilsh.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 0)
    cbobanben.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 1)
    cboYYMC.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 2)
    cmbshishiry.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 3)
    cbomokuan.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 4)
    cbochuangti.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 5)
    txtwentism.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 6)
    txtshouzhongcssm.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 7)
    txtgcsyj.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 8)
    txtshijian.Text = Left(MSHwenticllb.TextMatrix(MSHwenticllb.row, 9), 19)
    xggcs.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 10)
    cbojingjicd.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 11)
    
    m_xggcs = MSHwenticllb.TextMatrix(MSHwenticllb.row, 10)
    m_gjr = MSHwenticllb.TextMatrix(MSHwenticllb.row, 3)
    
'    cbocsry.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 12)
    txtgcsyj.SetFocus
Else
    Exit Sub
End If

'If txtwentilsh.Text <> "" Then
'    cmdtuixiangck.Enabled = True
'End If

If MSHwenticllb.Rows > 2 And txtwentilsh.Text <> "" Then
    cmddaitl.Enabled = True
End If

'If txtwentilsh.Text <> "" Then
'    CmdKT.Enabled = True
'Else
'    CmdKT.Enabled = False
'End If


'查看图片
    Set Rs = New ADODB.Recordset
    Rs.Open "select lsh from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
   If Rs.RecordCount > 0 Then
        CmdKT.Enabled = True
   Else
        CmdKT.Enabled = False
   End If
   Set Rs = Nothing
    
    '如果是返回问题的说明，则突出显示
If txtgcsyj.Text <> "" Then
    txtgcsyj.ForeColor = vbBlue
    MsgBox "注意！该问题是测试人员测试后返回的问题，请查看说明！", vbOKOnly + vbInformation, "提示"
End If
 
End Sub

Private Sub MyCommand1_Click()
    str = "update yw_wentilb set jihuasj='" & Format(DTPicker1.Value, "yyyy-mm-dd") & "',data='" & Trim(Combo1.Text) & "' where lsh='" & MSHwenticllb.TextMatrix(MSHwenticllb.row, 0) & "'"
    Rs.Open str, conn, 1, 3
    Set Rs = Nothing
    MsgBox "操作成功！", vbOKOnly + vbInformation, "提示"
End Sub



Private Sub txt1_Click()

End Sub
