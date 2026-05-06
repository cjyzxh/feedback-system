VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Begin VB.Form frmxgsj 
   Caption         =   "Form1"
   ClientHeight    =   9405
   ClientLeft      =   450
   ClientTop       =   450
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   ScaleHeight     =   9405
   ScaleWidth      =   15240
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "基本信息"
      Height          =   3855
      Left            =   45
      TabIndex        =   8
      Top             =   600
      Width           =   15015
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
         Height          =   2175
         Left            =   7020
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         Top             =   1620
         Width           =   2295
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   960
         TabIndex        =   15
         Top             =   270
         Width           =   2310
      End
      Begin VB.ComboBox cmbshishiry 
         Height          =   300
         Left            =   4140
         TabIndex        =   14
         Top             =   240
         Width           =   1185
      End
      Begin VB.ComboBox xggcs 
         Height          =   300
         ItemData        =   "frmxgsj.frx":0000
         Left            =   6060
         List            =   "frmxgsj.frx":0002
         TabIndex        =   13
         Top             =   240
         Width           =   1215
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
         Height          =   2175
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         Top             =   1620
         Width           =   3975
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
         Height          =   2175
         Left            =   4140
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         Top             =   1620
         Width           =   2775
      End
      Begin VB.TextBox txtshijian 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         ForeColor       =   &H000000FF&
         Height          =   270
         Left            =   1080
         TabIndex        =   10
         Top             =   840
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
         Height          =   2175
         Left            =   9420
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   1620
         Width           =   2415
      End
      Begin MSComDlg.CommonDialog cdldaoru 
         Left            =   8460
         Top             =   1980
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label Label9 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "待查"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   10140
         TabIndex        =   37
         Top             =   840
         Width           =   2295
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题计划修改时间"
         Height          =   180
         Left            =   9840
         TabIndex        =   36
         Top             =   360
         Width           =   1440
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
         Left            =   7560
         TabIndex        =   29
         Top             =   1320
         Width           =   1365
      End
      Begin VB.Label labyiyuanmc 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "医院名称"
         Height          =   180
         Left            =   150
         TabIndex        =   28
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Left            =   3420
         TabIndex        =   27
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labwentilx 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "工程师"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   5460
         TabIndex        =   26
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "录入时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   180
         TabIndex        =   25
         Top             =   840
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   15000
         Y1              =   1200
         Y2              =   1200
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
         Left            =   1320
         TabIndex        =   24
         Top             =   1320
         Width           =   1095
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
         Left            =   4560
         TabIndex        =   23
         Top             =   1320
         Width           =   2055
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
         Left            =   9840
         TabIndex        =   22
         Top             =   1320
         Width           =   1170
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
         Left            =   13080
         TabIndex        =   21
         Top             =   1320
         Width           =   780
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "修改时间"
         Height          =   180
         Index           =   0
         Left            =   4605
         TabIndex        =   20
         Top             =   840
         Width           =   720
      End
      Begin VB.Image pic1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   2175
         Left            =   12000
         Stretch         =   -1  'True
         Top             =   1620
         Width           =   2895
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题反馈人"
         Height          =   180
         Left            =   7440
         TabIndex        =   19
         Top             =   360
         Width           =   900
      End
      Begin VB.Label txtxgsj 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         ForeColor       =   &H000000C0&
         Height          =   180
         Left            =   5400
         TabIndex        =   18
         Top             =   810
         Width           =   90
      End
      Begin VB.Label txtwtfkr 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00800000&
         Height          =   180
         Left            =   8400
         TabIndex        =   17
         Top             =   330
         Width           =   90
      End
   End
   Begin mycmd.MyCommand cmdqingkong 
      Height          =   420
      Left            =   14085
      TabIndex        =   0
      Top             =   4965
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "清 空"
   End
   Begin mycmd.MyCommand cmdchaxun 
      Height          =   420
      Left            =   14085
      TabIndex        =   1
      Top             =   5490
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "查询问题"
   End
   Begin mycmd.MyCommand cmdbaocun 
      Height          =   420
      Left            =   14085
      TabIndex        =   2
      Top             =   6000
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "保 存"
   End
   Begin mycmd.MyCommand cmdxiougai 
      Height          =   420
      Left            =   14085
      TabIndex        =   3
      Top             =   6525
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "修改说明"
   End
   Begin mycmd.MyCommand Command1 
      Height          =   420
      Left            =   14085
      TabIndex        =   4
      Top             =   7050
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "删除问题"
   End
   Begin mycmd.MyCommand cmdfanghui 
      Height          =   420
      Left            =   14085
      TabIndex        =   5
      Top             =   7560
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "返回问题"
   End
   Begin mycmd.MyCommand cmdfh 
      Height          =   420
      Left            =   14085
      TabIndex        =   6
      Top             =   8085
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "待讨论"
   End
   Begin mycmd.MyCommand cmdtuichu 
      Height          =   420
      Left            =   14085
      TabIndex        =   7
      Top             =   8610
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "退 出"
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwenticllb 
      Height          =   4425
      Left            =   60
      TabIndex        =   30
      Top             =   4800
      Width           =   13875
      _ExtentX        =   24474
      _ExtentY        =   7805
      _Version        =   393216
      BackColor       =   -2147483639
      ForeColor       =   -2147483646
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   12632256
      BackColorBkg    =   12632256
      AllowUserResizing=   3
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
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
      Left            =   9075
      TabIndex        =   35
      Top             =   1440
      Width           =   495
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
      Left            =   5475
      TabIndex        =   34
      Top             =   0
      Width           =   1725
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题计划修改时间查询"
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
      Height          =   435
      Index           =   1
      Left            =   7275
      TabIndex        =   33
      Top             =   0
      Width           =   4350
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题列表"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   180
      Left            =   75
      TabIndex        =   32
      Top             =   4560
      Width           =   780
   End
   Begin VB.Label lbl1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Left            =   7830
      TabIndex        =   31
      Top             =   9015
      Width           =   90
   End
End
Attribute VB_Name = "frmxgsj"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
