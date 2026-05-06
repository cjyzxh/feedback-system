VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.33#0"; "HISControl1.ocx"
Begin VB.Form frmwentics 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "问题测试"
   ClientHeight    =   10935
   ClientLeft      =   60
   ClientTop       =   1530
   ClientWidth     =   17985
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   10935
   ScaleWidth      =   17985
   WindowState     =   2  'Maximized
   Begin VB.CheckBox Check2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "包含待讨论"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   10680
      TabIndex        =   44
      Top             =   4560
      Width           =   1605
   End
   Begin UserControl.cbo cboYYMC 
      Height          =   225
      Left            =   2580
      TabIndex        =   41
      Top             =   840
      Width           =   5115
      _ExtentX        =   9022
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
   Begin UserControl.pic pic2 
      Height          =   405
      Left            =   60
      TabIndex        =   40
      Top             =   0
      Width           =   17775
      _ExtentX        =   31353
      _ExtentY        =   714
      Caption         =   "问题测试"
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "售后处理"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   255
      Left            =   10680
      TabIndex        =   31
      Top             =   4920
      Width           =   1305
   End
   Begin mycmd.MyCommand cmdqingkong 
      Height          =   600
      Left            =   60
      TabIndex        =   30
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "清 空"
   End
   Begin mycmd.MyCommand cmdchaxun 
      Height          =   600
      Left            =   1200
      TabIndex        =   29
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "查询问题"
   End
   Begin mycmd.MyCommand cmdbaocun 
      Height          =   600
      Left            =   2340
      TabIndex        =   28
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "保 存"
   End
   Begin mycmd.MyCommand cmdxiougai 
      Height          =   600
      Left            =   3480
      TabIndex        =   27
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "修改说明"
   End
   Begin mycmd.MyCommand Command1 
      Height          =   600
      Left            =   4620
      TabIndex        =   26
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "删除问题"
   End
   Begin mycmd.MyCommand cmdfanghui 
      Height          =   600
      Left            =   7200
      TabIndex        =   25
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "返回问题"
   End
   Begin mycmd.MyCommand cmdfh 
      Height          =   600
      Left            =   8340
      TabIndex        =   24
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "待讨论"
   End
   Begin mycmd.MyCommand cmdtuichu 
      Height          =   600
      Left            =   9480
      TabIndex        =   23
      Top             =   4560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   1058
      Caption         =   "退 出"
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "基本信息"
      Height          =   3975
      Left            =   90
      TabIndex        =   1
      Top             =   540
      Width           =   17775
      Begin UserControl.txt txtwtfkr 
         Height          =   225
         Left            =   15660
         TabIndex        =   43
         Top             =   420
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   397
         Caption         =   "反馈人"
         CaptionWidth    =   630
         Enabled         =   0   'False
         Hwnd            =   332180
         ForeColor       =   0
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
         Height          =   2235
         Left            =   14880
         TabIndex        =   42
         Top             =   1560
         Width           =   2685
      End
      Begin VB.ComboBox cbocsry 
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "frmwentics.frx":0000
         Left            =   6315
         List            =   "frmwentics.frx":0007
         TabIndex        =   20
         Top             =   720
         Width           =   1320
      End
      Begin VB.ComboBox cbowentilx 
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "frmwentics.frx":0015
         Left            =   3300
         List            =   "frmwentics.frx":002B
         TabIndex        =   18
         Top             =   720
         Width           =   2115
      End
      Begin VB.TextBox txtshouhoucs 
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
         Height          =   2295
         Left            =   12360
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         Top             =   1560
         Width           =   2295
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
         Height          =   2295
         Left            =   6180
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         Top             =   1560
         Width           =   3735
      End
      Begin VB.TextBox txtwentism 
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
         Height          =   2295
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         Top             =   1560
         Width           =   5955
      End
      Begin VB.ComboBox cmbshishiry 
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "frmwentics.frx":0075
         Left            =   915
         List            =   "frmwentics.frx":0077
         TabIndex        =   4
         Top             =   720
         Width           =   1455
      End
      Begin VB.ComboBox cbobanben 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "frmwentics.frx":0079
         Left            =   915
         List            =   "frmwentics.frx":007B
         TabIndex        =   3
         Top             =   240
         Width           =   1455
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
         Height          =   2295
         Left            =   10020
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   1560
         Width           =   2295
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
         Left            =   13740
         TabIndex        =   32
         Top             =   420
         Width           =   1845
         _ExtentX        =   3254
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
      Begin UserControl.txt cbomokuan 
         Height          =   225
         Left            =   11280
         TabIndex        =   33
         Top             =   420
         Width           =   2385
         _ExtentX        =   4207
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
      Begin UserControl.txt cbochuangti 
         Height          =   225
         Left            =   11280
         TabIndex        =   34
         Top             =   840
         Width           =   2385
         _ExtentX        =   4207
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
         Left            =   7740
         TabIndex        =   35
         Top             =   420
         Width           =   3435
         _ExtentX        =   6059
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
         Left            =   13740
         TabIndex        =   36
         Top             =   840
         Width           =   1815
         _ExtentX        =   3201
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
      Begin UserControl.txt xggcs 
         Height          =   225
         Left            =   15660
         TabIndex        =   37
         Top             =   840
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   397
         Caption         =   "修改人"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1054206
         ForeColor       =   0
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
      Begin UserControl.txt txtXGSJ 
         Height          =   225
         Left            =   7740
         TabIndex        =   38
         Top             =   840
         Width           =   3435
         _ExtentX        =   6059
         _ExtentY        =   397
         Caption         =   "修改时间"
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
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "测试人员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   210
         Left            =   5460
         TabIndex        =   19
         Top             =   840
         Width           =   840
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题类型"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   210
         Left            =   2460
         TabIndex        =   17
         Top             =   840
         Width           =   840
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "图片预览"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   15840
         TabIndex        =   16
         Top             =   1320
         Width           =   780
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "售后测试意见"
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
         Left            =   12360
         TabIndex        =   15
         Top             =   1320
         Width           =   1170
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "测试人员意见"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   6240
         TabIndex        =   11
         Top             =   1320
         Width           =   1275
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问 题 说 明"
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
         Left            =   120
         TabIndex        =   10
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   17580
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "跟进人员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   90
         TabIndex        =   9
         Top             =   840
         Width           =   840
      End
      Begin VB.Label labruanjianbb 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   210
         Left            =   90
         TabIndex        =   8
         Top             =   360
         Width           =   840
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程师修改意见"
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
         Left            =   10020
         TabIndex        =   7
         Top             =   1320
         Width           =   1365
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfshouhou 
      Height          =   5745
      Left            =   13845
      TabIndex        =   0
      Top             =   5220
      Width           =   4020
      _ExtentX        =   7091
      _ExtentY        =   10134
      _Version        =   393216
      BackColor       =   -2147483628
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
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
      Height          =   5685
      Left            =   45
      TabIndex        =   12
      Top             =   5280
      Width           =   13695
      _ExtentX        =   24156
      _ExtentY        =   10028
      _Version        =   393216
      BackColor       =   16777215
      ForeColor       =   -2147483647
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
      AllowUserResizing=   3
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty FontFixed {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin mycmd.MyCommand cmdfenpeibb 
      Height          =   600
      Left            =   5700
      TabIndex        =   39
      Top             =   4560
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   1058
      Caption         =   "分配跟进人员"
   End
   Begin VB.Label lbl1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Left            =   7875
      TabIndex        =   22
      Top             =   9135
      Width           =   90
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "测试意见模板"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   14640
      TabIndex        =   21
      Top             =   4980
      Width           =   1170
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
      TabIndex        =   13
      Top             =   1560
      Width           =   495
   End
End
Attribute VB_Name = "frmwentics"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim str1 As String
Dim QP As New ClsBubble    '气泡类
Dim m_xggcs As String



'Private Sub cbochuangti_GotFocus()
'    Dim i As Integer
'    '加载窗体名
'    cbochuangti.Clear                            '循环前清空组合框ITEM
'    Set rs = Nothing
'    str = "select chuangtimc from zd_chuangti where mokuai='" & Trim(cbomokuan.Text) & "'"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cbochuangti.AddItem rs.Fields("chuangtimc").Value
'            rs.MoveNext
'        Next i
'    End If
'    rs.Close
'End Sub





'Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
'    Dim pymstr As String            '查询字符串
'    Dim pymint As Integer           '循环变量
'
'    If KeyCode = 13 And cboYYMC.Text <> "" Then
'        pymstr = ""
'        '构建查询语句
'        pymstr = "select yiyuanmc from st_yw_kehuxinxi where pym like '%" & Trim(cboYYMC.Text) & "%'"
'        rs.CursorLocation = adUseClient
'        rs.Open pymstr, conn
'        If Not rs.EOF Then
'            cboyiyuanmc.Clear                          '清空当前LIST记录
'            '循环赋傎给组合框的LIST
'            For pymint = 1 To rs.RecordCount
'                cboyiyuanmc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'                rs.MoveNext
'            Next pymint
'            cboyiyuanmc.ListIndex = 0                  '将第一行的傎赋给TEXT
'        End If
'
'    End If
'    If KeyCode = 13 And cboYYMC.Text <> "" Then
'        cmbshishiry.SetFocus
'    End If
'    Set rs = Nothing
'End Sub

Private Sub cmdbaocun_Click()
'先替换文本中的单引号
    txtshouhoucs.Text = Replace(Trim(txtshouhoucs.Text), "'", "''")
    Set Rs = Nothing
    If txtshouhoucs.Text <> "" And cbowentilx.Text <> "" Then  '
        str = "update yw_wentilb set csbaocunsj=case when csbaocunsj is null then getdate() else csbaocunsj end, shouhoucs='" & Trim(txtshouhoucs.Text) & "',csgcs='" & Trim(user) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
        conn.Execute (str)
        MSHwenticllb.TextMatrix(MSHwenticllb.row, 9) = txtshouhoucs.Text

        If MsgBox("问题是否是处理完成？", vbYesNo + vbInformation, "提示") = vbYes Then
            str = "update yw_wentilb set shouhoubz='是',cssj=getdate(),shcsgcs='" & Trim(user) & "',shishiry='" & Trim(cmbshishiry.Text) & "',wentilx='" & Trim(cbowentilx.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
            Call objExecuteSQL.ExecuteSQL(str)
            str = "delete from yw_QiPaoTishi where Wtlsh='" & txtwentilsh.Text & "'"
            Call objExecuteSQL.ExecuteSQL(str)
            MsgBox "保存成功", vbOKOnly + vbInformation, "提示"

        Else
            MsgBox "该问题还没有完全处理，但“测试说明”已保存", vbOKOnly + vbInformation, "提示"
        End If
    Else
        MsgBox "请录入“售后测试意见”和“问题类型”后再保存，谢谢！", vbOKOnly + vbInformation, "提示"
        Exit Sub
        txtgcsyj.SetFocus
    End If
    cboYYMC.Text = ""
    cmbshishiry.Text = ""
    cbomokuan.Text = ""
    cbochuangti.Text = ""
    xggcs.Text = ""
    txtwentism.Text = ""
    txtshouzhongcssm.Text = ""
    txtgcsyj.Text = ""
    txtshouhoucs.Text = ""
    cbowentilx.Text = ""
    cbobanben.Text = ""
    txtwentilsh.Text = ""
    txtXGSJ.Text = ""
    cbojingjicd.Text = ""
'    pic1.Picture = LoadPicture()
    CmdKT.Enabled = False
    Call cmdchaxun_Click
End Sub

Private Sub cmdchaxun_Click()
    Dim str1 As String
    MSHwenticllb.Clear
    str1 = "1=1"
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明'" & Chr(13) & _
           ",gongcscs as '工程师说明',shouhoucs as '售后测试',convert(char(19),lvrusj,21) as '问题录入时间',convert(char(19),xgsj,21) as '修改时间',DATEDIFF(day, lvrusj, xgsj) as '修改天数',DATEDIFF(day, xgsj, GETDATE()) as '待测试天数',xggcs as '修改人员',szcsgcs as '测试人员',wentiFKR as '反馈人',jingjicd as '紧急程度' from yw_wentilb where  1=1 "

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
    If cbocsry.Text <> "" Then
        str1 = str1 & "and szcsgcs='" & Trim(cbocsry.Text) & "'"
    End If
    If cbobanben.Text <> "" Then
        str1 = str1 & "and banben='" & Trim(cbobanben.Text) & "'"
    Else
        '    If MsgBox("请注意你没有选择当前要处理的版本,是否要选择？（选“否”将查询本时间段内全部版本问题）", vbYesNo + vbInformation, "友情提示") = vbYes Then
        '        cbobanben.SetFocus
        '        Exit Sub
        '    End If
    End If
    
    str1 = str1 & "and  shouzhongbz='是' and gongchengsbz='是' and shouhoubz='否'"
    
    If Check1.Value = 1 Then
        str1 = str1 & " and yanfaXG='否'"
    Else
        str1 = str1 & " and yanfaXG='是'"
    End If
    
    If Check2.Value = 1 Then
        str1 = str1 & " and taolunbz='是'"
    Else
        str1 = str1 & " and taolunbz='否'"
    End If
    
    Set Rs = conn.Execute(str1)
    Set MSHwenticllb.DataSource = Rs
    lbl1.Caption = "当前共有" & MSHwenticllb.Rows - 2 & "个问题待测试"
    
    MSHwenticllb.ColWidth(10) = 2500
    MSHwenticllb.ColWidth(11) = 2500

    Set Rs = Nothing
    '        MSHwenticllb.Rows = 2
    '        MsgBox "没有待测试的问题，请查看其它时间段！", vbOKOnly + vbInformation, "提示"


End Sub

Private Sub cmdfanghui_Click()

    txtshouhoucs.Text = Replace(Trim(txtshouhoucs.Text), "'", "''")        '替换文本中的单引号

    If MsgBox("确定要返回问题吗？", vbYesNo + vbQuestion, "提示") = vbYes And txtwentism.Text <> "" Then
        Rs.Open "update yw_wentilb set gongchengsbz='否',xggcs='" & Trim(xggcs.Text) & "',gongcscs='" & Trim(txtgcsyj.Text) & Chr(13) & Chr(10) & Trim(txtshouhoucs.Text) & " ' where lsh='" & Trim(txtwentilsh.Text) & "'", conn
        MsgBox "返回问题成功，请工程师查看！", vbOKOnly + vbInformation, "提示"
        Set Rs = Nothing
        Call QiPao_WT(Trim(txtwentilsh.Text), Trim(xggcs.Text), cboYYMC.Text, "待修改", Trim(cmbshishiry.Text))
    Else
        Exit Sub
    End If
'    MSHwenticllb.Clear
    Call cmdqingkong_Click
    Call cmdchaxun_Click
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
            Call QiPao_WT(Trim(txtwentilsh.Text), Trim(cmbshishiry.Text), cboYYMC.Text, "待测试", Trim(cmbshishiry.Text))
            strSQL = "delete from yw_QiPaoTishi where Wtlsh='" & txtwentilsh.Text & "' and WentiJSRMC='" & m_xggcs & "'"
            Call objExecuteSQL.ExecuteSQL(strSQL)
        End If
    Else
        MsgBox "“跟进人员”和“工程师说明”必须填写！", vbOKOnly + vbInformation, "提示"
    End If
End Sub

Private Sub cmdfh_Click()
    If txtwentilsh.Text <> "" Then
        cmdfh.Enabled = True
        str = "update yw_wentilb set iFanhuicishu =isnull(iFanhuicishu,0)+1, taolunbz='是',taolunsj='" & Now & "' where lsh='" & Trim(txtwentilsh.Text) & "'"

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

Private Sub CmdKT_Click()
   tplsh = txtwentilsh.Text
    frmchakantp.Show
End Sub

Private Sub cmdqingkong_Click()
    MSHwenticllb.Clear
    MSHwenticllb.Rows = 2
    txtwentism.Text = ""
    txtshouzhongcssm.Text = ""
    txtgcsyj.Text = ""
    txtshouhoucs.Text = ""
    cboYYMC.Text = ""
    cmbshishiry.Text = ""
    cbomokuan.Text = ""
    cbochuangti.Text = ""
    xggcs.Text = ""
    txtshijian.Text = ""
    txtXGSJ.Text = ""
    cbocsry.Text = ""
    cbobanben.Text = ""
    txtwentilsh.Text = ""
    cbojingjicd.Text = ""
'    pic1.Picture = LoadPicture()
    CmdKT.Enabled = False
End Sub

Private Sub cmdtuichu_Click()
    Unload Me
End Sub

'Private Sub cmdtuixiangck_Click()
'    Dim prs1 As New ADODB.stream
'    rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
'    If Not rs.EOF Then
'        With prs1
'            .Type = adTypeBinary                   '定义流对象变量的类型为二进制
'            .Mode = adModeReadWrite
'            .Open
'            .Write rs.Fields("pic1")
'            .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
'        End With
'        pic1.Picture = LoadPicture(App.Path & ".jpg")
'        '      frmchakantp.Show vbModal
'        Set rs = Nothing
'    End If
'End Sub

Private Sub cmdxiougai_Click()
    If MsgBox("确定要修改售后测试意见吗？", vbYesNo + vbInformation, "友情提示") = vbYes Then
        Rs.Open "update yw_wentilb set shouhoucs='" & Trim(txtshouhoucs.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'", conn
        MsgBox "修改售后测试说明成功！", vbOKOnly + vbInformation, "提示"
    End If
    Set Rs = Nothing
End Sub

Private Sub Command1_Click()

'删除不要的问题
    If MsgBox("确定要删除问题吗？它将不可恢复！", vbYesNo + vbQuestion, "提示") = vbYes Then
        str = "delete from yw_wentilb where lsh='" & Trim(txtwentilsh.Text) & "'"
        Call objExecuteSQL.ExecuteSQL(str)
        str1 = "delete from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'"
        Call objExecuteSQL.ExecuteSQL(str1)
        str = "delete from yw_QiPaoTishi where Wtlsh='" & txtwentilsh.Text & "'"
        Call objExecuteSQL.ExecuteSQL(str)
        MsgBox "问题成功删除！", vbOKOnly + vbInformation, "提示"
        Call cmdqingkong_Click
        Call cmdchaxun_Click
    Else
        Exit Sub
    End If
End Sub

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
      Call ShowError("modLoadData", "LoadHuanZheLB2", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

Private Sub Form_Load()
    frmwentics.Height = frmzxh.ScaleHeight - 750
    frmwentics.Width = frmzxh.ScaleWidth
    Dim i As Integer
    Dim str As String
    Dim str1 As String
    Dim str2 As String
    Dim str3 As String


    cmdxiougai.Enabled = False

    '加载版本
    Set Rs = Nothing
    str = "select banben from yw_banben "
    Rs.CursorLocation = adUseClient
    Rs.Open str, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cbobanben.AddItem Rs.Fields("banben").Value
            Rs.MoveNext
        Next i
        Set Rs = Nothing
    End If
    
        '加载模板
    msfshouhou.ColWidth(0) = 4000
    str = "select moban as 模板 from zd_moban where mobanlx='修改后测试'"

    Rs.Open str, conn
    Set msfshouhou.DataSource = Rs
    Rs.Close

'    '加载工程师名称
'    Set rs = Nothing
'    str = "select usename from [user] where quxian='工程师'"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            xggcs.AddItem rs.Fields("usename").Value
'            rs.MoveNext
'        Next i
'        Set rs = Nothing
'    End If

'    '加载医院名称
'    Set rs = Nothing
'    str = "select yiyuanmc from yw_kehuxinxi  with(nolock)  "
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cboyiyuanmc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'            rs.MoveNext
'        Next i
'        rs.Close
'    End If

    Call LoadYYMC(cboYYMC)

    '当前登录者
'    txtcsry.Text = user

    '加载人员
    Set Rs = Nothing
    str1 = "select xingming from zd_jishuyuan where zhuangtai='1' and zhiwu<>'销售人员'"
    Rs.CursorLocation = adUseClient
    Rs.Open str1, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cmbshishiry.AddItem Rs.Fields("xingming").Value
            cbocsry.AddItem Rs.Fields("xingming").Value
            Rs.MoveNext
        Next i
        Rs.Close
    End If
    
    cmbshishiry.Text = user
    cbocsry.Text = user

'    '加载测试人员
'    Set rs = Nothing
'    str1 = "select xingming from zd_jishuyuan where zhuangtai='1' and zhiwu<>'销售人员'"
'    rs.CursorLocation = adUseClient
'    rs.Open str1, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cbocsry.AddItem rs.Fields("xingming").Value
'            rs.MoveNext
'        Next i
'        rs.Close
'    End If


'    '加载模块
'    Set rs = Nothing
'    str2 = "select mokuaimc from zd_mokuai"
'    rs.CursorLocation = adUseClient
'    rs.Open str2, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cbomokuan.AddItem rs.Fields("mokuaimc").Value
'            rs.MoveNext
'        Next i
'    End If
'    rs.Close

    ''加载模板
    'msfgcs.ColWidth(0) = 2000
    ' str1 = "select moban as 模板 from zd_moban where mobanlx='工程师意见'"
    '
    '    rs.Open str1, conn
    '    Set msfgcs.DataSource = rs
    '    Set rs = Nothing
End Sub

Private Sub Form_Resize()
On Error GoTo CJY
    pic2.Width = Me.ScaleWidth
    Frame2.Width = Me.Width - 50

    
    MSHwenticllb.Height = Me.ScaleHeight - MSHwenticllb.Top - 50
    msfshouhou.Height = MSHwenticllb.Height
    msfshouhou.Top = MSHwenticllb.Top
    MSHwenticllb.Width = Me.ScaleWidth - msfshouhou.Width - 100
    msfshouhou.Left = MSHwenticllb.Left + MSHwenticllb.Width + 50
    Label13.Left = msfshouhou.Left
CJY:
End Sub

Private Sub msfshouhou_DblClick()
    txtshouhoucs.Text = msfshouhou.TextMatrix(msfshouhou.row, 0)
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
        txtshouhoucs.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 9)
        
        txtshijian.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 10)
        txtXGSJ.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 11)
        
        m_xggcs = MSHwenticllb.TextMatrix(MSHwenticllb.row, 14)
        
        xggcs.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 14)
        txtwtfkr.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 16)
        
        cbojingjicd.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 17)



        txtshouhoucs.SetFocus
    Else
        Exit Sub
    End If


    If txtshouhoucs.Text <> "" Then
        cmdxiougai.Enabled = True
    Else
        cmdxiougai.Enabled = False
    End If
    
    Set Rs = New ADODB.Recordset
    Rs.Open "select lsh from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
   If Rs.RecordCount > 0 Then
        CmdKT.Enabled = True
   Else
        CmdKT.Enabled = False
   End If
   Set Rs = Nothing

'    '查看图片
'    Set rs = Nothing
'    Dim prs1 As New ADODB.stream
'    rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
'    If Not rs.EOF Then
'        With prs1
'            .Type = adTypeBinary                   '定义流对象变量的类型为二进制
'            .Mode = adModeReadWrite
'            .Open
'            .Write rs.Fields("pic1")
'            .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
'        End With
'        pic1.Picture = LoadPicture(App.Path & ".jpg")
'        '      frmchakantp.img1(0).Picture = LoadPicture(App.Path & ".jpg")
'        Kill App.Path & ".jpg"                   '删除临时图片
'    Else
'        pic1.Picture = LoadPicture()
'
'    End If
'    rs.Close


End Sub


'
'Private Sub pic1_DblClick()
'    If pic1.Picture = LoadPicture() Then
'        Exit Sub
'    Else
'        tplsh = txtwentilsh.Text
'        frmchakantp.Show
'    End If
'End Sub

Private Sub txtshouhoucs_Change()
    If txtshouhoucs.Text <> "" Then
        cmdxiougai.Enabled = True
    End If
End Sub

