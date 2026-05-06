VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Begin VB.Form frmdiandanold 
   BackColor       =   &H00E0E0E0&
   Caption         =   "产品订单系统"
   ClientHeight    =   9915
   ClientLeft      =   60
   ClientTop       =   1005
   ClientWidth     =   15120
   DrawStyle       =   1  'Dash
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9915
   ScaleWidth      =   15120
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ListView lstMoKuai 
      Height          =   4575
      Left            =   240
      TabIndex        =   74
      Top             =   5340
      Visible         =   0   'False
      Width           =   5355
      _ExtentX        =   9446
      _ExtentY        =   8070
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户列表"
      Height          =   9015
      Left            =   11160
      TabIndex        =   63
      Top             =   600
      Width           =   3855
      Begin VB.TextBox txtKHMC 
         Height          =   375
         Left            =   960
         TabIndex        =   80
         Top             =   7920
         Width           =   2655
      End
      Begin MSFlexGridLib.MSFlexGrid FxGridKH 
         Height          =   4095
         Left            =   120
         TabIndex        =   78
         Top             =   3720
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   7223
         _Version        =   393216
         Rows            =   1
         AllowUserResizing=   1
         FormatString    =   "^  序号  |^       客户名称             "
      End
      Begin mycmd.MyCommand MyCommand2 
         Height          =   375
         Left            =   1440
         TabIndex        =   75
         Top             =   8520
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         Caption         =   "检 索"
      End
      Begin MSFlexGridLib.MSFlexGrid FxGridQy 
         Height          =   2895
         Left            =   120
         TabIndex        =   73
         Top             =   480
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   5106
         _Version        =   393216
         Rows            =   1
         AllowUserResizing=   1
         FormatString    =   "^  序号  |^       客户名称             "
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "客户名称"
         Height          =   180
         Left            =   120
         TabIndex        =   79
         Top             =   8010
         Width           =   720
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "已下订单客户"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2640
         TabIndex        =   77
         Top             =   3480
         Width           =   1080
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "未下订单客户"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2640
         TabIndex        =   76
         Top             =   240
         Width           =   1080
      End
   End
   Begin VB.TextBox Text3 
      Height          =   465
      Left            =   1440
      TabIndex        =   40
      Text            =   "Text3"
      Top             =   150
      Visible         =   0   'False
      Width           =   1725
   End
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   180
      TabIndex        =   39
      Text            =   "Text2"
      Top             =   120
      Visible         =   0   'False
      Width           =   1185
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "订单"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   4275
      Left            =   240
      TabIndex        =   14
      Top             =   5280
      Width           =   10785
      Begin VB.TextBox txtrjk 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Height          =   315
         Left            =   8580
         TabIndex        =   87
         Top             =   1320
         Width           =   2055
      End
      Begin VB.TextBox txtyanshiry 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   9900
         TabIndex        =   83
         Top             =   3300
         Width           =   735
      End
      Begin VB.TextBox Text14 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   375
         Left            =   5400
         Locked          =   -1  'True
         TabIndex        =   69
         Top             =   2760
         Width           =   975
      End
      Begin VB.TextBox Text15 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   1215
         Left            =   2400
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   68
         Top             =   3000
         Width           =   2055
      End
      Begin VB.TextBox Text16 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   375
         Left            =   7560
         Locked          =   -1  'True
         TabIndex        =   67
         Top             =   2760
         Width           =   975
      End
      Begin mycmd.MyCommand MyCommand1 
         Height          =   375
         Left            =   9480
         TabIndex        =   53
         Top             =   3840
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "退 出"
      End
      Begin mycmd.MyCommand Command2 
         Height          =   375
         Left            =   6600
         TabIndex        =   52
         Top             =   3840
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "打印订单"
      End
      Begin mycmd.MyCommand cmdbaocun 
         Height          =   375
         Left            =   8040
         TabIndex        =   51
         Top             =   3840
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "保存订单"
      End
      Begin mycmd.MyCommand cmdscdd 
         Height          =   375
         Left            =   5160
         TabIndex        =   50
         Top             =   3840
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "生成订单"
      End
      Begin VB.TextBox txtbanben 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   8280
         Locked          =   -1  'True
         TabIndex        =   38
         Top             =   3300
         Width           =   735
      End
      Begin VB.TextBox txtsjh 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   9420
         Locked          =   -1  'True
         TabIndex        =   34
         Top             =   780
         Width           =   1245
      End
      Begin VB.TextBox txtkehu 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   285
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   22
         Top             =   795
         Width           =   3585
      End
      Begin VB.TextBox txtlianxiren 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   285
         Left            =   5460
         Locked          =   -1  'True
         TabIndex        =   21
         Top             =   795
         Width           =   870
      End
      Begin VB.TextBox txtphone 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   315
         Left            =   7560
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   780
         Width           =   1200
      End
      Begin VB.TextBox Text7 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   330
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   19
         Top             =   1320
         Width           =   6360
      End
      Begin VB.TextBox Text8 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   735
         Left            =   1080
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   1920
         Width           =   6015
      End
      Begin VB.TextBox Text9 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   1185
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   17
         Top             =   3000
         Width           =   2055
      End
      Begin VB.TextBox Text10 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   330
         Left            =   9480
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   2805
         Width           =   1215
      End
      Begin VB.TextBox Text11 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   330
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   15
         Top             =   3285
         Width           =   2055
      End
      Begin VB.Label lblpj 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   7800
         TabIndex        =   96
         Top             =   2220
         Width           =   90
      End
      Begin VB.Label lblht 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   7800
         TabIndex        =   95
         Top             =   1860
         Width           =   90
      End
      Begin VB.Label Label27 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "票据"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   7380
         TabIndex        =   90
         Top             =   2280
         Width           =   360
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "合同"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   7380
         TabIndex        =   89
         Top             =   1920
         Width           =   360
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件款类别"
         Height          =   180
         Left            =   7620
         TabIndex        =   88
         Top             =   1380
         Width           =   900
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "演示人员"
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
         Left            =   9060
         TabIndex        =   84
         Top             =   3360
         Width           =   780
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件总价"
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
         Index           =   6
         Left            =   4620
         TabIndex        =   72
         Top             =   2850
         Width           =   780
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件付款方式"
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
         Index           =   5
         Left            =   2400
         TabIndex        =   71
         Top             =   2760
         Width           =   1170
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件余款"
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
         Index           =   4
         Left            =   6720
         TabIndex        =   70
         Top             =   2850
         Width           =   780
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件版本"
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
         Left            =   7440
         TabIndex        =   37
         Top             =   3360
         Width           =   780
      End
      Begin VB.Label Label18 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "手机号"
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
         Left            =   8820
         TabIndex        =   33
         Top             =   847
         Width           =   585
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "北京创佳益软件公司软件订单表"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   3120
         TabIndex        =   31
         Top             =   240
         Width           =   3570
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
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
         Left            =   240
         TabIndex        =   30
         Top             =   847
         Width           =   780
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "联系人"
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
         Left            =   4860
         TabIndex        =   29
         Top             =   847
         Width           =   585
      End
      Begin VB.Label Label10 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
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
         Left            =   6660
         TabIndex        =   28
         Top             =   847
         Width           =   780
      End
      Begin VB.Label Label12 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "地址"
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
         Left            =   600
         TabIndex        =   27
         Top             =   1395
         Width           =   390
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "所用模块"
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
         Left            =   240
         TabIndex        =   26
         Top             =   1920
         Width           =   780
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "其它说明"
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
         Left            =   240
         TabIndex        =   25
         Top             =   2760
         Width           =   780
      End
      Begin VB.Label Label15 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
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
         Left            =   8760
         TabIndex        =   24
         Top             =   2880
         Width           =   780
      End
      Begin VB.Label Label16 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间"
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
         Left            =   4560
         TabIndex        =   23
         Top             =   3360
         Width           =   780
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   4515
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   10815
      Begin VB.ComboBox cbopj 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":0000
         Left            =   840
         List            =   "frmdiandanold.frx":0002
         TabIndex        =   94
         Top             =   2640
         Width           =   2355
      End
      Begin VB.ComboBox cboht 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":0004
         Left            =   840
         List            =   "frmdiandanold.frx":0006
         TabIndex        =   93
         Top             =   2160
         Width           =   2355
      End
      Begin VB.ComboBox cborjk 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":0008
         Left            =   3120
         List            =   "frmdiandanold.frx":000A
         TabIndex        =   86
         Top             =   720
         Width           =   1995
      End
      Begin VB.ComboBox cboyanshiry 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":000C
         Left            =   8100
         List            =   "frmdiandanold.frx":000E
         TabIndex        =   81
         Top             =   1320
         Width           =   1035
      End
      Begin VB.CheckBox Check3 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CHS"
         Enabled         =   0   'False
         Height          =   255
         Left            =   2640
         TabIndex        =   66
         Top             =   3060
         Width           =   615
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CRM"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1320
         TabIndex        =   65
         Top             =   3060
         Width           =   615
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "HIS"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   64
         Top             =   3060
         Width           =   615
      End
      Begin VB.TextBox txtRjyk 
         Height          =   375
         Left            =   3030
         TabIndex        =   62
         Top             =   1260
         Width           =   1935
      End
      Begin VB.TextBox txtFkfs 
         Height          =   1395
         Left            =   3720
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   61
         Top             =   1800
         Width           =   2775
      End
      Begin VB.TextBox txtBj 
         Height          =   375
         Left            =   840
         TabIndex        =   60
         Top             =   1260
         Width           =   1215
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   1425
         Left            =   7350
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   58
         Top             =   1800
         Width           =   3195
      End
      Begin VB.TextBox txtMoKuai 
         Height          =   915
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   54
         Top             =   3420
         Width           =   10455
      End
      Begin VB.ComboBox txtxiaoshouren 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":0010
         Left            =   5940
         List            =   "frmdiandanold.frx":0012
         TabIndex        =   49
         Top             =   1320
         Width           =   1215
      End
      Begin VB.CheckBox Check12 
         BackColor       =   &H00E0E0E0&
         Caption         =   "是否升级用户"
         ForeColor       =   &H8000000D&
         Height          =   345
         Left            =   9300
         TabIndex        =   48
         Top             =   1260
         Width           =   1425
      End
      Begin VB.TextBox txtshoujihao 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   9180
         TabIndex        =   47
         Top             =   285
         Width           =   1365
      End
      Begin VB.CheckBox Check36 
         BackColor       =   &H00E0E0E0&
         Caption         =   "患者随访管理"
         Height          =   285
         Left            =   16320
         TabIndex        =   46
         Top             =   3300
         Width           =   1395
      End
      Begin VB.CheckBox Check35 
         BackColor       =   &H00E0E0E0&
         Caption         =   "市场调查"
         Height          =   285
         Left            =   15165
         TabIndex        =   45
         Top             =   3300
         Width           =   1065
      End
      Begin VB.CheckBox Check30 
         BackColor       =   &H00E0E0E0&
         Caption         =   "老年保健"
         Height          =   285
         Left            =   16890
         TabIndex        =   44
         Top             =   2370
         Width           =   1065
      End
      Begin VB.CheckBox Check29 
         BackColor       =   &H00E0E0E0&
         Caption         =   "家床管理"
         Height          =   285
         Left            =   15840
         TabIndex        =   43
         Top             =   2370
         Width           =   1065
      End
      Begin VB.CheckBox Check23 
         BackColor       =   &H00E0E0E0&
         Caption         =   "体检管理"
         Height          =   285
         Left            =   16770
         TabIndex        =   42
         Top             =   1800
         Width           =   1065
      End
      Begin VB.CheckBox Check22 
         BackColor       =   &H00E0E0E0&
         Caption         =   "计划生育"
         Height          =   285
         Left            =   15690
         TabIndex        =   41
         Top             =   1800
         Width           =   1065
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         ItemData        =   "frmdiandanold.frx":0014
         Left            =   840
         List            =   "frmdiandanold.frx":0016
         TabIndex        =   35
         Top             =   705
         Width           =   1215
      End
      Begin VB.TextBox txtdianhua 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   7080
         TabIndex        =   4
         Top             =   285
         Width           =   1425
      End
      Begin VB.TextBox txtfuzheren 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5040
         TabIndex        =   3
         Top             =   285
         Width           =   1050
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   840
         TabIndex        =   2
         Top             =   277
         Width           =   2595
      End
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         Height          =   570
         Left            =   6105
         TabIndex        =   1
         Top             =   690
         Width           =   4440
      End
      Begin MSComCtl2.DTPicker txtsj 
         Height          =   315
         Left            =   840
         TabIndex        =   5
         Top             =   1740
         Width           =   1320
         _ExtentX        =   2328
         _ExtentY        =   556
         _Version        =   393216
         Format          =   112590849
         CurrentDate     =   39105
      End
      Begin VB.Label Label29 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "票据"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   360
         TabIndex        =   92
         Top             =   2700
         Width           =   360
      End
      Begin VB.Label Label28 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "合同"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   360
         TabIndex        =   91
         Top             =   2280
         Width           =   360
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件款类别"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   2160
         TabIndex        =   85
         Top             =   780
         Width           =   900
      End
      Begin VB.Label Label22 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "演示人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   7260
         TabIndex        =   82
         Top             =   1380
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "其它说明"
         Height          =   180
         Index           =   3
         Left            =   6600
         TabIndex        =   59
         Top             =   1800
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件余款"
         Height          =   180
         Index           =   2
         Left            =   2220
         TabIndex        =   57
         Top             =   1350
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件付款方式"
         Height          =   180
         Index           =   1
         Left            =   2640
         TabIndex        =   56
         Top             =   1800
         Width           =   1080
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件总价"
         Height          =   180
         Index           =   0
         Left            =   120
         TabIndex        =   55
         Top             =   1350
         Width           =   720
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   120
         TabIndex        =   36
         Top             =   780
         Width           =   720
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "手机号"
         ForeColor       =   &H00000000&
         Height          =   210
         Left            =   8640
         TabIndex        =   32
         Top             =   322
         Width           =   540
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   6300
         TabIndex        =   11
         Top             =   337
         Width           =   720
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5100
         TabIndex        =   10
         Top             =   1380
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   5
         Left            =   120
         TabIndex        =   9
         Top             =   1800
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院主要负责人"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   4
         Left            =   3720
         TabIndex        =   8
         Top             =   337
         Width           =   1260
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   337
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户地址"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   5280
         TabIndex        =   6
         Top             =   780
         Width           =   720
      End
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "软件订单录入"
      BeginProperty Font 
         Name            =   "华文彩云"
         Size            =   24
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF00FF&
      Height          =   495
      Left            =   7320
      TabIndex        =   13
      Top             =   30
      Width           =   2880
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
      Left            =   5340
      TabIndex        =   12
      Top             =   60
      Width           =   1725
   End
End
Attribute VB_Name = "frmdiandanold"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim obj As Object
Dim strSql As String

Public m_strKhbm As String                '客户编码

Private Sub cbobanben_KeyDown(KeyCode As Integer, Shift As Integer)
     If KeyCode = 13 And cbobanben.Text <> "" Then
        Text6.SetFocus
    End If
End Sub

Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim pymstr As String            '查询字符串
    Dim pymint As Integer           '循环变量
    Dim strtiaojian As String       '查询限制条件
    
    If g_strYongHuZT = "3" Then           '销售经理
        strtiaojian = ""                    '" and Xsry='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If
    
    pymstr = ""
    
    If KeyCode = 13 And cboyiyuanmc.Text <> "" Then
        '构建查询语句
        If Check12.Value = 1 Then       '老客户(升级客户)
            pymstr = "select yiyuanmc from zd_yiyuanmc where pym like '%" & conn.Execute("select dbo.fun_getPY('" & Trim(cboyiyuanmc.Text) & "')").Fields(0).Value & "%'" ' GetTextFirstLetter(Trim(cboyiyuanmc.Text))
        Else                            '新客户
            pymstr = "select Khmc from Khxx where pym like '%" & conn.Execute("select dbo.fun_getPY('" & Trim(cboyiyuanmc.Text) & "')").Fields(0).Value & "%' and Qtjd='成交' and isnull(Qdr,'')=''" & strtiaojian
        End If
        
        Set Rs = Nothing
        Rs.CursorLocation = adUseClient
        Rs.Open pymstr, conn
        
        If Rs.RecordCount > 0 Then
            cboyiyuanmc.Clear                          '清空当前LIST记录
            '循环赋傎给组合框的LIST
            If Check12.Value = 1 Then
                For pymint = 1 To Rs.RecordCount
                    cboyiyuanmc.AddItem Rs.Fields("yiyuanmc").Value
                    Rs.MoveNext
                Next pymint
            Else
                For pymint = 1 To Rs.RecordCount
                    cboyiyuanmc.AddItem Decode(Rs.Fields("Khmc").Value)
                    Rs.MoveNext
                Next pymint
            End If
            cboyiyuanmc.ListIndex = 0                  '将第一行的傎赋给TEXT
        End If
        
        Set Rs = Nothing
        txtfuzheren.SetFocus
    End If
End Sub


Private Sub cboyiyuanmc_LostFocus()                 '查询当前客户的联系信息
    Dim strSql As String
    Dim lngRow As Long
    
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    cbobanben.Text = ""
    Text6.Text = ""
    txtBj.Text = ""
    txtxiaoshouren.Text = ""
    txtMoKuai.Text = ""
    
    txtRjyk.Text = ""
    Text4.Text = ""
    txtFkfs.Text = ""
    
    Dim strtiaojian As String       '查询限制条件
    
    If Trim(cboyiyuanmc.Text) <> "" Then
        If Check12.Value = 1 Then       '老客户(升级客户)
            If g_strYongHuZT = "3" Then           '销售经理
                strtiaojian = ""                    '" and Xsry='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
            Else    'If g_strYongHuZT = "2" Then       '普通销售人员
                strtiaojian = " and xiaoshoury='" & StringEnDeCodecn(user, 75) & "'"                           '查询当前登录用户的客户信息
            End If
            
            strSql = "select * from yw_kehuxinxi where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'" & strtiaojian
            Set Rs = Nothing
            Rs.Open strSql, conn, adOpenStatic
            
            If Rs.RecordCount > 0 Then
                On Error Resume Next
                
                If Rs.RecordCount > 1 Then
                    With FrmKeHu
                        .strType = "Old"
                        .Show 1
                    End With
                Else
                    txtfuzheren.Text = StringEnDeCodecn(Rs("yiyuanfuzher").Value, 75)
                    txtdianhua.Text = decipher(Rs("gudingdh").Value)
                    txtshoujihao.Text = decipher(Rs("shoujihao").Value)
                    cbobanben.Text = Rs("banben").Value
                    Text6.Text = StringEnDeCodecn(Rs("dizhi").Value, 75)
    
                    txtxiaoshouren.Text = StringEnDeCodecn(Rs("xiaoshoury").Value, 75)
                    txtMoKuai.Text = Rs("yiyuanmokuai").Value
                    txtBj.Text = StringEnDeCodecn(Rs("ruanjianzj").Value, 75)
                    txtRjyk.Text = StringEnDeCodecn(Rs("ruanjianyk").Value, 75)
                    txtFkfs.Text = StringEnDeCodecn(Rs("fukuanfs").Value, 75)
                    Text4.Text = StringEnDeCodecn(Rs("qtsm").Value, 75)
                End If
            Else
                txtxiaoshouren.Text = user
            End If
            Set Rs = Nothing
        Else
            If g_strYongHuZT = "3" Then           '销售经理
                strtiaojian = ""                    '" and Xsry='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
            Else    'If g_strYongHuZT = "2" Then       '普通销售人员
                strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
            End If
            
            strSql = "select Khbm,isnull(Khmc,'') as Khmc from khxx where Qtjd='成交' and isnull(Qdr,'')=''" & strtiaojian
            Set Rs = Nothing
            Rs.Open strSql, conn, adOpenStatic
            
            If Rs.RecordCount > 0 Then
                For lngRow = 0 To Rs.RecordCount - 1
                    If Decode(Rs("Khmc").Value) = cboyiyuanmc.Text Then
                        Exit For
                    End If
                    Rs.MoveNext
                Next lngRow
                
                If lngRow < Rs.RecordCount Then
                    strSql = "select * from khxx where khbm='" & Rs("Khbm").Value & "'"
                    Set Rs = Nothing
                    Rs.Open strSql, conn, adOpenStatic
                    If Rs.RecordCount > 0 Then
                        On Error Resume Next
                        
                        If Rs.RecordCount > 1 Then
                            With FrmKeHu
                                .strType = "New"
                                .Show 1
                            End With
                        Else
                            txtfuzheren.Text = Decode(Rs("fzr").Value)
                            txtdianhua.Text = Decode(Rs("gddh").Value)
                            txtshoujihao.Text = Decode(Rs("sj").Value)
                            cbobanben.Text = Rs("banben").Value
                            Text6.Text = Decode(Rs("khdz").Value)
                            txtBj.Text = Decode(Rs("bj").Value)
                            txtxiaoshouren.Text = Rs("xsry").Value
                            txtMoKuai.Text = Rs("sxmk").Value
                        End If
                        
'------------------------------------------------------------------------------------------
'                        txtxiaoshouren.Text = rs("xsry").Value
'                        txtsj.Value = IIf(IsDate(rs("Qdsj").Value), rs("Qdsj").Value, Now())
                    Else
                        txtxiaoshouren.Text = user
                    End If
                Else
                    txtxiaoshouren.Text = user
                End If
            Else
                txtxiaoshouren.Text = user
            End If
            Set Rs = Nothing
        End If
    End If
End Sub

Private Sub Check1_Click()                      'HIS
    Dim strMokuai() As String
    Dim strTmp() As String
    Dim k As Integer
    Dim lngItem As Long
    Dim strMk As String
    Dim i As Integer
    Dim J As Integer
    
    '将模块分类（HIS、CRM、CHS）
    strTmp = Split(txtMoKuai.Text, vbCrLf)
    
    If Check1.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strSql = "select mokuai  from xt_mokuai where xt='his' order by mokuai"
        Set Rs = Nothing
        Rs.Open strSql, conn
        
        If Rs.RecordCount > 0 Then
            For i = 1 To Rs.RecordCount
                lstMoKuai.ListItems.Add i, "his" & i, Rs("mokuai")
                Rs.MoveNext
            Next i
        End If
        
        'HIS模块去掉字符，判断选中
        If UBound(strTmp) >= 0 Then
            For k = LBound(strTmp) To UBound(strTmp)
                If Left(strTmp(k), 5) = "HIS模块" Then
                    '去掉附加字符
                    strTmp(k) = Mid(strTmp(k), 7)
                    '拆分模块
                    strMokuai = Split(strTmp(k), " ")
                    '选中匹配的
                    For i = LBound(strMokuai) To UBound(strMokuai)
                        For J = 1 To lstMoKuai.ListItems.Count
                            If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                                lstMoKuai.ListItems(J).Checked = True
                                Exit For
                            End If
                        Next J
                    Next i
                    Exit For
                End If
            Next k
        End If
        Set Rs = Nothing
        lstMoKuai.Visible = True
    Else                                        '非选中状态
        If lstMoKuai.Visible = True Then
            If UBound(strTmp) >= 0 Then
                For k = LBound(strTmp) To UBound(strTmp)
                    If Left(strTmp(k), 5) = "HIS模块" Then
                        Exit For
                    End If
                Next k
                
                If k > UBound(strTmp) Then      '说明尚未存在HIS模块数据
                    ReDim Preserve strTmp(UBound(strTmp) + 1)
                    k = UBound(strTmp)
                End If
            Else
                ReDim Preserve strTmp(UBound(strTmp) + 1)
                k = UBound(strTmp)
            End If
            
            strTmp(k) = "HIS模块："
            '保存选中的模块
            For lngItem = 1 To lstMoKuai.ListItems.Count
                If lstMoKuai.ListItems(lngItem).Checked = True Then
                    strTmp(k) = strTmp(k) & "■" & lstMoKuai.ListItems(lngItem).Text & " "
                End If
            Next lngItem
            
            strTmp(k) = Trim(strTmp(k))
            If Len(strTmp(k)) = 6 Then
                strTmp(k) = ""
            End If
            
            '重新组合数据
            For k = LBound(strTmp) To UBound(strTmp)
                If strTmp(k) <> "" Then
                    If strMk <> "" Then
                        strMk = strMk & vbCrLf & strTmp(k)
                    Else
                        strMk = strTmp(k)
                    End If
                End If
            Next k
            
            txtMoKuai.Text = strMk
            lstMoKuai.Visible = False
        End If
    End If
End Sub

Private Sub Check2_Click()                      'CRM
    Dim strMokuai() As String
    Dim strTmp() As String
    Dim k As Integer
    Dim lngItem As Long
    Dim strMk As String
    Dim i As Integer
    Dim J As Integer
    
    '将模块分类（HIS、CRM、CHS）
    strTmp = Split(txtMoKuai.Text, vbCrLf)
    
    If Check2.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strSql = "select mokuai  from xt_mokuai where xt='crm' order by mokuai"
        Set Rs = Nothing
        Rs.Open strSql, conn
        
        If Rs.RecordCount > 0 Then
            For i = 1 To Rs.RecordCount
                lstMoKuai.ListItems.Add i, "crm" & i, Rs("mokuai")
                Rs.MoveNext
            Next i
        End If
        
        'CRM模块去掉字符，判断选中
        If UBound(strTmp) >= 0 Then
            For k = LBound(strTmp) To UBound(strTmp)
                If Left(strTmp(k), 5) = "CRM模块" Then
                    '去掉附加字符
                    strTmp(k) = Mid(strTmp(k), 7)
                    '拆分模块
                    strMokuai = Split(strTmp(k), " ")
                    '选中匹配的
                    For i = LBound(strMokuai) To UBound(strMokuai)
                        For J = 1 To lstMoKuai.ListItems.Count
                            If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                                lstMoKuai.ListItems(J).Checked = True
                                Exit For
                            End If
                        Next J
                    Next i
                    Exit For
                End If
            Next k
        End If
        Set Rs = Nothing
        lstMoKuai.Visible = True
    Else                                        '非选中状态
        If lstMoKuai.Visible = True Then
            If UBound(strTmp) >= 0 Then
                For k = LBound(strTmp) To UBound(strTmp)
                    If Left(strTmp(k), 5) = "CRM模块" Then
                        Exit For
                    End If
                Next k
                
                If k > UBound(strTmp) Then      '说明尚未存在CRM模块数据
                    ReDim Preserve strTmp(UBound(strTmp) + 1)
                    k = UBound(strTmp)
                End If
            Else
                ReDim Preserve strTmp(UBound(strTmp) + 1)
                k = UBound(strTmp)
            End If
            
            strTmp(k) = "CRM模块："
            '保存选中的模块
            For lngItem = 1 To lstMoKuai.ListItems.Count
                If lstMoKuai.ListItems(lngItem).Checked = True Then
                    strTmp(k) = strTmp(k) & "■" & lstMoKuai.ListItems(lngItem).Text & " "
                End If
            Next lngItem
            
            strTmp(k) = Trim(strTmp(k))
            If Len(strTmp(k)) = 6 Then
                strTmp(k) = ""
            End If
            
            '重新组合数据
            For k = LBound(strTmp) To UBound(strTmp)
                If strTmp(k) <> "" Then
                    If strMk <> "" Then
                        strMk = strMk & vbCrLf & strTmp(k)
                    Else
                        strMk = strTmp(k)
                    End If
                End If
            Next k
            
            txtMoKuai.Text = strMk
            lstMoKuai.Visible = False
        End If
    End If
End Sub

Private Sub Check3_Click()                      'CHS
    Dim strMokuai() As String
    Dim strTmp() As String
    Dim k As Integer
    Dim lngItem As Long
    Dim strMk As String
    Dim i As Integer
    Dim J As Integer
    
    '将模块分类（HIS、CRM、CHS）
    strTmp = Split(txtMoKuai.Text, vbCrLf)
    
    If Check3.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strSql = "select mokuai  from xt_mokuai where xt='chs' order by mokuai"
        Set Rs = Nothing
        Rs.Open strSql, conn
        
        If Rs.RecordCount > 0 Then
            For i = 1 To Rs.RecordCount
                lstMoKuai.ListItems.Add i, "chs" & i, Rs("mokuai")
                Rs.MoveNext
            Next i
        End If
        
        'HIS模块去掉字符，判断选中
        If UBound(strTmp) >= 0 Then
            For k = LBound(strTmp) To UBound(strTmp)
                If Left(strTmp(k), 5) = "CHS模块" Then
                    '去掉附加字符
                    strTmp(k) = Mid(strTmp(k), 7)
                    '拆分模块
                    strMokuai = Split(strTmp(k), " ")
                    '选中匹配的
                    For i = LBound(strMokuai) To UBound(strMokuai)
                        For J = 1 To lstMoKuai.ListItems.Count
                            If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                                lstMoKuai.ListItems(J).Checked = True
                                Exit For
                            End If
                        Next J
                    Next i
                    Exit For
                End If
            Next k
        End If
        Set Rs = Nothing
        lstMoKuai.Visible = True
    Else                                        '非选中状态
        If lstMoKuai.Visible = True Then
            If UBound(strTmp) >= 0 Then
                For k = LBound(strTmp) To UBound(strTmp)
                    If Left(strTmp(k), 5) = "CHS模块" Then
                        Exit For
                    End If
                Next k
                
                If k > UBound(strTmp) Then      '说明尚未存在CHS模块数据
                    ReDim Preserve strTmp(UBound(strTmp) + 1)
                    k = UBound(strTmp)
                End If
            Else
                ReDim Preserve strTmp(UBound(strTmp) + 1)
                k = UBound(strTmp)
            End If
            
            strTmp(k) = "CHS模块："
            '保存选中的模块
            For lngItem = 1 To lstMoKuai.ListItems.Count
                If lstMoKuai.ListItems(lngItem).Checked = True Then
                    strTmp(k) = strTmp(k) & "■" & lstMoKuai.ListItems(lngItem).Text & " "
                End If
            Next lngItem
            
            strTmp(k) = Trim(strTmp(k))
            If Len(strTmp(k)) = 6 Then
                strTmp(k) = ""
            End If
            
            '重新组合数据
            For k = LBound(strTmp) To UBound(strTmp)
                If strTmp(k) <> "" Then
                    If strMk <> "" Then
                        strMk = strMk & vbCrLf & strTmp(k)
                    Else
                        strMk = strTmp(k)
                    End If
                End If
            Next k
            
            txtMoKuai.Text = strMk
            lstMoKuai.Visible = False
        End If
    End If
End Sub

Private Sub Check12_Click()                     '是否升级用户
    If Check12.Value = 1 Then
        Check1.Enabled = True       'HIS
        Check2.Enabled = True       'CRM
        Check3.Enabled = True       'CHS
    Else
        Check1.Enabled = False
        Check2.Enabled = False
        Check3.Enabled = False
    End If
    
    txtMoKuai.Text = ""
    Check1.Value = 0
    Check2.Value = 0
    Check3.Value = 0
End Sub

Private Sub cmdbaocun_Click()                           '保存订单
    Dim strkhmc As String           '客户名称
    Dim strLXR As String            '联系人
    Dim strDZ As String             '地址
    Dim strSYMK As String           '所用模块
    Dim strQTSM As String           '其它说明
    Dim strXsry As String           '销售人员
    Dim strXDSJ As String           '下单时间
    Dim strBB As String             '版本
    Dim strRJZJ As String           '软件总价
    Dim strRJFKFS As String         '软件付款方式
    Dim strRJYK As String           '软件余款
    Dim strGDDH As String           '固定电话
    Dim strSJ As String             '手机
    
    Dim strqy As String             '区域
    
    '保存前加密数据
    strkhmc = StringEnDeCodecn(Trim(txtkehu.Text), 75)
    strLXR = StringEnDeCodecn(Trim(txtlianxiren.Text), 75)
    strDZ = StringEnDeCodecn(Trim(Text7.Text), 75)
    'Text8.Text = StringEnDeCodecn(Trim(Text8.Text), 75)
    strSYMK = Trim(Text8.Text)                                          'StringEnDeCodecn(trim(text8.Text),75)
    strQTSM = StringEnDeCodecn(Trim(Text9.Text), 75)
    strXsry = StringEnDeCodecn(Trim(Text10.Text), 75)
    strXDSJ = Trim(Text11.Text)
    'txtbanben.Text = StringEnDeCodecn(Trim(txtbanben.Text), 75)
    strBB = Trim(txtbanben.Text)
    
    strRJZJ = StringEnDeCodecn(Text14.Text, 75)         '软件总价
    strRJFKFS = StringEnDeCodecn(Text15.Text, 75)       '软件付款方式
    strRJYK = StringEnDeCodecn(Text16.Text, 75)         '软件余款
    
    strGDDH = cipher(txtphone.Text)
    strSJ = cipher(txtsjh.Text)
    
    '判断是否升级用户
'    str = "select * from yw_kehuxinxi where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'"
'    Set rs = Nothing
'    rs.Open str, conn, adOpenStatic
'
'    If rs.RecordCount > 0 Then                  '说明是升级用户
'        str = "update yw_kehuxinxi set "
'        str = str & "banben='" & Trim(strBB) & "',yiyuanmc='" & Trim(strKhmc) & "',yiyuanfuzher='" & Trim(strLXR) & "',"
'        str = str & "shoujihao='" & Trim(strSJ) & "',gudingdh='" & Trim(strGDDH) & "',xiadansj='" & Trim(strXDSJ) & "',"
'        str = str & "yiyuanmokuai='" & rs("yiyuanmokuai").Value & vbCrLf & vbCrLf & Trim(strSYMK) & "',xiaoshoury='" & Trim(strXSRY) & "',qtsm='" & Trim(strQTSM) & "',zhuangtai='下单',"
'        str = str & "dizhi='" & Trim(strDZ) & "',ruanjianzj='" & Trim(strRJZJ) & "',fukuanfs='" & Trim(strRJFKFS) & "',ruanjianyk='" & Trim(strRJYK) & "'"
'        str = str & " where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'"
'    Else                                        '说明是新用户
        str = "insert into yw_kehuxinxi (banben,yiyuanmc,yiyuanfuzher,shoujihao,gudingdh,xiadansj,yiyuanmokuai,xiaoshoury,qtsm,zhuangtai,dizhi,ruanjianzj,fukuanfs,ruanjianyk,rjklb,hetong,piaoju)"
        str = str & " values ('" & Trim(strBB) & "','" & Trim(strkhmc) & "','" & Trim(strLXR) & "','" & Trim(strSJ) & "','"
        str = str & Trim(strGDDH) & "','" & Trim(strXDSJ) & "','" & Trim(strSYMK) & "','"
        str = str & Trim(strXsry) & "','" & Trim(strQTSM) & "','下单','" & Trim(strDZ) & "','" & Trim(strRJZJ) & "','" & Trim(strRJFKFS) & "','" & Trim(strRJYK) & "','" & Trim(txtrjk.Text) & "','" & Trim(lblht.Caption) & "','" & Trim(lblpj.Caption) & "')"
'    End If
    
    '执行更新或插入操作
    Set Rs = Nothing
    Rs.Open str, conn
    MsgBox "订单保存成功,客户名称保存成功!", vbOKOnly + vbInformation, "提示"
    cmdbaocun.Enabled = False
    
    '向库中取最大的流水号
    str = "select * from zd_yiyuanmc where yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
    Set Rs = Nothing
    Rs.Open str, conn
    
    If Rs.RecordCount <= 0 Then
        Set Rs = Nothing
        Rs.Open "select isnull(max(daima),'0') as lsh from zd_yiyuanmc", conn
        If Not Rs.EOF Then
            Text2.Text = Rs.Fields("lsh").Value + 1
        Else
            Text2.Text = 1
        End If
        Text3.Text = conn.Execute("select dbo.fun_getPY('" & Trim(cboyiyuanmc.Text) & "')").Fields(0).Value ' GetTextFirstLetter(cboyiyuanmc.Text)
        str = "insert into zd_yiyuanmc (daima,yiyuanmc,pym) values ('" & Trim(Text2.Text) & "','" & Trim(cboyiyuanmc.Text) & "','" & Trim(Text3.Text) & "')"
        Set Rs = Nothing
        Rs.Open str, conn
        Set Rs = Nothing
    End If
    
    '更新签单人和签单时间
    Set Rs = Nothing
    str = "select Khbm,Khmc,Qy from Khxx where isnull(Qdr,'')=''"
    Rs.Open str, conn, adOpenStatic
    
    Do While Not Rs.EOF
        If Decode(Rs("Khmc").Value) = Trim(cboyiyuanmc.Text) Then
            strqy = Rs("qy").Value                  '保存区域值
            
            str = "update Khxx set Qdr='" & txtxiaoshouren.Text & "',Qdsj='" & Now() & "' where Khbm='" & Rs("Khbm").Value & "'"
            Set Rs = Nothing
            Rs.Open str, conn
            
            '更新区域
            str = "update yw_kehuxinxi set qy='" & strqy & "' where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'"
            Set Rs = Nothing
            Rs.Open str, conn
            
            Set Rs = Nothing
            Exit Do
        End If
        Rs.MoveNext
    Loop
    
    Set Rs = Nothing
    
    Call adidas
    
    Call MyCommand2_Click
    
''-------------------------------------------------------------------------------------------------------------------------------------
'    '查询名称是否被用过
'    If Check12.Value = 1 Then                   '升级用户
'
'    Else                                        '新用户
'        Set rs = Nothing
'        str = "select yiyuanmc from zd_yiyuanmc where yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
'        rs.Open str, conn
'        If Not rs.EOF Then
'            MsgBox "医院名称已存在请重新输入!", vbOKOnly + vbInformation, "提示"
'            cmdbaocun.Enabled = False
'            Exit Sub
'        End If
'        Set rs = Nothing
'    End If
'
''保存前加密数据
'txtkehu.Text = StringEnDeCodecn(Trim(txtkehu.Text), 75)
'txtlianxiren.Text = StringEnDeCodecn(Trim(txtlianxiren.Text), 75)
'Text7.Text = StringEnDeCodecn(Trim(Text7.Text), 75)
''Text8.Text = StringEnDeCodecn(Trim(Text8.Text), 75)
'Text9.Text = StringEnDeCodecn(Trim(Text9.Text), 75)
'Text10.Text = StringEnDeCodecn(Trim(Text10.Text), 75)
''txtbanben.Text = StringEnDeCodecn(Trim(txtbanben.Text), 75)
'
'txtphone.Text = cipher(txtphone.Text)
'txtsjh.Text = cipher(txtsjh.Text)
'    '插入数据
'    Set rs = Nothing
'    str = "insert into yw_kehuxinxi (banben,yiyuanmc,yiyuanfuzher,shoujihao,gudingdh,xiadansj,yiyuanmokuai,xiaoshoury,qtsm,zhuangtai,dizhi)"
'    str = str & " values ('" & Trim(txtbanben.Text) & "','" & Trim(txtkehu.Text) & "','" & Trim(txtlianxiren.Text) & "','" & Trim(txtsjh.Text) & "',"
'    str = str & " '" & Trim(txtphone.Text) & " ','" & Trim(Text11.Text) & "','" & Trim(Text8.Text) & "',"
'    str = str & "'" & Trim(Text10.Text) & " ','" & Trim(Text9.Text) & "','下单','" & Trim(Text7.Text) & "')"
'rs.Open str, conn
'MsgBox "订单保存成功,客户名称保存成功!", vbOKOnly + vbInformation, "提示"
'cmdbaocun.Enabled = False
'
''向库中取最大的流水号
'Set rs = Nothing
'rs.Open "select isnull(max(daima),'0') as lsh from zd_yiyuanmc", conn
'If Not rs.EOF Then
'    Text2.Text = rs.Fields("lsh").Value + 1
'Else
'    Text2.Text = 1
'End If
'Set rs = Nothing
'Text3.Text = GetTextFirstLetter(cboyiyuanmc.Text)
'str = "insert into zd_yiyuanmc (daima,yiyuanmc,pym) values ('" & Trim(Text2.Text) & "','" & Trim(cboyiyuanmc.Text) & "','" & Trim(Text3.Text) & "')"
'rs.Open str, conn
'Set rs = Nothing
'
'Call adidas
End Sub

Private Sub cmdscdd_Click()                     '生成订单
    If cboyiyuanmc.Text = "" Then
        MsgBox "客户名称不能为空"
        cboyiyuanmc.SetFocus
        Exit Sub
    End If
    
    If txtfuzheren.Text = "" Then
        MsgBox "医院主要负责人不能为空"
        txtfuzheren.SetFocus
        Exit Sub
    End If
    
    If txtdianhua.Text = "" And txtshoujihao.Text = "" Then
        MsgBox "联系电话和手机号不能同时为空"
        txtdianhua.SetFocus
        Exit Sub
    End If
    
    If txtxiaoshouren.Text = "" Then
        MsgBox "销售人员不能为空"
        txtxiaoshouren.SetFocus
        Exit Sub
    End If
    
    If Text6.Text = "" Then
        MsgBox "客户地址不能为空"
        Text6.SetFocus
        Exit Sub
    End If
    
    If cbobanben.Text = "" Then
        MsgBox "软件版本不能为空"
        cbobanben.SetFocus
        Exit Sub
    End If
    
    If txtBj.Text = "" Then
        MsgBox "请输入软件总价"
        txtBj.SetFocus
        Exit Sub
    End If
    
    If txtFkfs.Text = "" Then
        MsgBox "请输入软件付款方式"
        txtFkfs.SetFocus
        Exit Sub
    End If
    
    If txtRjyk.Text = "" Then
        MsgBox "请输入软件余款"
        txtRjyk.SetFocus
        Exit Sub
    End If
    
    If txtMoKuai.Text = "" Then
        MsgBox "请选择所需模块"
        txtMoKuai.SetFocus
        Exit Sub
    End If
    
    '传傎
    txtkehu.Text = cboyiyuanmc.Text
    txtlianxiren.Text = txtfuzheren.Text
    txtphone.Text = txtdianhua.Text
    txtsjh.Text = txtshoujihao.Text
    Text7.Text = Text6.Text
    Text8.Text = txtMoKuai.Text
    Text9.Text = Text4.Text
    Text10.Text = txtxiaoshouren.Text
    Text11.Text = txtsj.Value
    txtbanben.Text = cbobanben.Text
    '新增部分
    Text14.Text = txtBj.Text
    Text15.Text = txtFkfs.Text
    Text16.Text = txtRjyk.Text
    txtyanshiry.Text = cboyanshiry.Text    '演示人员
    txtrjk.Text = cborjk.Text              '软件款
    lblht.Caption = cboht.Text             '合同
    lblpj.Caption = cbopj.Text             '票据
    
    
'    '调用清空函数
'    Call ddd
    
'cmdbaocun.Enabled = True
End Sub
Public Sub ddd()
   txtMoKuai.Text = ""
   Text8.Text = ""
   
End Sub
Public Sub adidas()
    txtkehu.Text = ""
    txtlianxiren.Text = ""
    txtphone.Text = ""
    txtsjh.Text = ""
    Text7.Text = ""
    Text8.Text = ""
    Text9.Text = ""
    Text10.Text = ""
    Text11.Text = ""
    txtbanben.Text = ""
    
    Text14.Text = ""
    Text15.Text = ""
    Text16.Text = ""
    
    
    cboyiyuanmc.Text = ""
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    txtxiaoshouren.Text = ""
    cbobanben.Text = ""
    Text6.Text = ""
    txtMoKuai.Text = ""
    Text4.Text = ""
'    Text1.Text = ""
    
    txtBj.Text = ""
    txtFkfs.Text = ""
    txtRjyk.Text = ""
End Sub


Private Sub Command2_Click()                                '打印订单

cmdbaocun.Enabled = True

If MsgBox("是否确认要打印?", vbYesNo + vbQuestion, "提示") = vbYes Then
    If Text8.Text <> "" Then

          Dim col As New Collection
         col.Add "客户名称"
         col.Add txtkehu.Text
         
         col.Add "联系人"
         col.Add txtlianxiren.Text
         
         col.Add "联系电话"
         col.Add txtphone.Text
        
         col.Add "手机号"
         col.Add txtsjh.Text
         
         col.Add "地址"
         col.Add Text7.Text
         
         col.Add "所用模块"
         col.Add Text8.Text
         
         col.Add "其它说明"
         col.Add Text9.Text
         
         col.Add "销售人员"
         col.Add Text10.Text
         
         col.Add "演示人员"
         col.Add txtyanshiry.Text
         
         col.Add "下单时间"
         col.Add Text11.Text
         
         col.Add "软件版本"
         col.Add txtbanben.Text
         
          col.Add "软件余款"
         col.Add Text16.Text
         
          col.Add "软件总价"
         col.Add Text14.Text
         
          col.Add "软件付款方式"
         col.Add Text15.Text
         
         col.Add "软件款类别"
         col.Add txtrjk.Text
         
         col.Add "合同"
         col.Add lblht.Caption
         
         col.Add "票据"
         col.Add lblpj.Caption
         
         col.Add user
         
         '...ReportDesign 设计 ReportPreview 预览
         '3传参数
         blnReturn = obj.PutVariant(col)
         '4设计和预览的参数名要一致
         blnReturn = obj.ReportPreview(str, App.Path & "\report\订单.frf")
     Else
        Exit Sub
     End If
Else
    Exit Sub
End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
'        SendKeys "{Tab}"        '敲的是回车键，使下一个控件获得焦点
    ElseIf KeyAscii = vbKeyEscape Then
        If MsgBox("确定要清除当前客户信息吗？", vbQuestion + vbYesNo) = vbYes Then
            Dim TmpCtrl As Control
            
            For Each TmpCtrl In Me
                If TypeOf TmpCtrl Is TextBox Then
                    TmpCtrl.Text = ""
                End If
                
                If TypeOf TmpCtrl Is ComboBox Then
                    TmpCtrl.ListIndex = -1
                End If
                
                If (TypeOf TmpCtrl Is MSHFlexGrid) Or (TypeOf TmpCtrl Is MSFlexGrid) Then
                    TmpCtrl.Rows = 1
                End If
            Next
            
            lstMoKuai.ListItems.Clear
            lstMoKuai.Visible = False
            
            txtxiaoshouren.Text = user
            txtsj.Value = Now()
        End If
    End If
End Sub

Private Sub Form_Load()
    cmdbaocun.Enabled = False
    txtsj.Value = Now
    
    
    '1创建对象
    Set obj = CreateObject("proBaoBiaoGG.clsRpt_LIB")
    '2初始化连接
    blnReturn = obj.initConn(sqlDataString)
    
    
'    '加载医院名称
'    Set rs = Nothing
'    str = "select yiyuanmc from zd_yiyuanmc"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cboyiyuanmc.AddItem rs.Fields("yiyuanmc").Value
'            rs.MoveNext
'        Next i
'        rs.Close
'    End If
    
    
    '版本
    Set Rs = Nothing
    str = "select banben from yw_banben"
    Rs.CursorLocation = adUseClient
    Rs.Open str, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cbobanben.AddItem Rs.Fields("banben").Value
            Rs.MoveNext
        Next i
        Rs.Close
    End If
    
    '销售人员
'    Set rs = Nothing
'    str = "select xingming from zd_jishuyuan where zhiwu='销售人员'"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'      For i = 1 To rs.RecordCount
'         txtxiaoshouren.AddItem rs.Fields("xingming").Value
'         rs.MoveNext
'      Next i
'      rs.Close
'    End If
    str = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user]"
    Call BindComboBoxData(txtxiaoshouren, str, "usename")            '销售人员
    
    Call MyCommand2_Click
    
    '判断是否是新客户进入
    If m_strKhbm <> "" Then
        str = "select * from Khxx where Khbm='" & m_strKhbm & "'"
        Set Rs = Nothing
        Rs.Open str, conn, adOpenStatic
        
        If Rs.RecordCount > 0 Then
            cboyiyuanmc.Text = Decode(Rs("khmc").Value)
            txtfuzheren.Text = Decode(Rs("fzr").Value)
            txtdianhua.Text = Decode(Rs("gddh").Value)
            txtshoujihao.Text = Decode(Rs("sj").Value)
            Text6.Text = Decode(Rs("khdz").Value)
            txtBj.Text = Decode(Rs("bj").Value)
            txtxiaoshouren.Text = Rs("xsry").Value
            txtMoKuai.Text = Rs("sxmk").Value
        End If
        
        Set Rs = Nothing
    Else
        txtxiaoshouren.Text = user
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set obj = Nothing
End Sub

Private Sub FxGridKH_DblClick()             '已下订单客户
    Dim strYYMC As String       '医院名称
    Dim strID As String         'ID
    Dim strSql As String
    
    If FxGridKH.row > 0 Then
        strID = FxGridKH.TextMatrix(FxGridKH.row, 0)
        strYYMC = FxGridKH.TextMatrix(FxGridKH.row, 1)
        
        strSql = "select * from yw_kehuxinxi where yiyuanmc='" & StringEnDeCodecn(strYYMC, 75) & "' and ID='" & strID & "'"
        Set Rs = Nothing
        Rs.Open strSql, conn, adOpenStatic
        
        If Rs.RecordCount > 0 Then
          txtkehu.Text = ""
            txtlianxiren.Text = ""
            txtphone.Text = ""
            txtsjh.Text = ""
            Text7.Text = ""
            Text8.Text = ""
            Text9.Text = ""
            Text10.Text = ""
            Text11.Text = ""
            txtbanben.Text = ""
            txtrjk.Text = ""
            
            Text14.Text = ""
            Text15.Text = ""
            Text16.Text = ""
            lblht.Caption = ""
            lblpj.Caption = ""
            
            On Error Resume Next
            
            txtkehu.Text = strYYMC
            txtlianxiren.Text = StringEnDeCodecn(Rs("yiyuanfuzher").Value, 75)
            txtphone.Text = decipher(Rs("gudingdh").Value)
            txtsjh.Text = decipher(Rs("shoujihao").Value)
            Text7.Text = StringEnDeCodecn(Rs("dizhi").Value, 75)
            Text8.Text = Rs("yiyuanmokuai").Value
            Text9.Text = StringEnDeCodecn(Rs("qtsm").Value, 75)
            Text10.Text = StringEnDeCodecn(Rs("xiaoshoury").Value, 75)
            Text11.Text = Rs("xiadansj").Value
            txtbanben.Text = Rs("banben").Value
            txtrjk.Text = Rs("rjklb").Value
            lblht.Caption = Rs("hetong").Value
            lblpj.Caption = Rs("piaoju").Value
            
            Text14.Text = StringEnDeCodecn(Rs("ruanjianzj").Value, 75)
            Text15.Text = StringEnDeCodecn(Rs("fukuanfs").Value, 75)
            Text16.Text = StringEnDeCodecn(Rs("ruanjianyk").Value, 75)
        Else
            txtkehu.Text = ""
            txtlianxiren.Text = ""
            txtphone.Text = ""
            txtsjh.Text = ""
            Text7.Text = ""
            Text8.Text = ""
            Text9.Text = ""
            Text10.Text = ""
            Text11.Text = ""
            txtbanben.Text = ""
            
            Text14.Text = ""
            Text15.Text = ""
            Text16.Text = ""
             lblht.Caption = ""
            lblpj.Caption = ""
        End If
    End If
End Sub

Private Sub FxGridQy_DblClick()             '未下订单客户
    If FxGridQy.row > 0 Then
        Check12.Value = 0
        cboyiyuanmc.Text = FxGridQy.TextMatrix(FxGridQy.row, 1)
        cboyiyuanmc.SetFocus
        txtfuzheren.SetFocus
    End If
End Sub

Private Sub MyCommand1_Click()
    Unload Me
End Sub

Private Sub MyCommand2_Click()                  '检 索（KHXX表中洽谈进度为“成交”的医院名称
    Dim strtiaojian As String
    Dim strSql As String
    
    If g_strYongHuZT = "3" Then           '销售经理
        strtiaojian = ""                    '" and Xsry='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
        txtxiaoshouren.Enabled = True
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
        txtxiaoshouren.Enabled = False
    End If
    
    '清除原有记录
    FxGridQy.Rows = 1       '未下订单客户列表
    FxGridKH.Rows = 1       '已下订单客户列表
    
    '查询洽谈进度为成交的未下订单客户名称
    strSql = "select Khmc,Khbm from Khxx where Qtjd='成交' and isnull(Qdr,'')=''" & strtiaojian
    Set Rs = Nothing
    Rs.Open strSql, conn, adOpenStatic
    
    If Rs.RecordCount > 0 Then
        With FxGridQy
'            .ColWidth(2) = 0
            Do While Not Rs.EOF
                .Rows = .Rows + 1
                .TextMatrix(.Rows - 1, 0) = .Rows - 1
                .TextMatrix(.Rows - 1, 1) = Decode(Rs("Khmc").Value)
'                .TextMatrix(.Rows - 1, 2) = rs("khbm").Value
                Rs.MoveNext
            Loop
        End With
    End If
    Set Rs = Nothing
    
    
    '查询已下订单客户
    If g_strYongHuZT = "3" Then           '销售经理
        strtiaojian = ""                    '" and xiaoshoury='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
        txtxiaoshouren.Enabled = True
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and xiaoshoury='" & StringEnDeCodecn(user, 75) & "'"                           '查询当前登录用户的客户信息
        txtxiaoshouren.Enabled = False
    End If
    
    If Trim(txtKHMC.Text) <> "" Then
        strtiaojian = strtiaojian & " and yiyuanmc like '%" & StringEnDeCodecn(Trim(txtKHMC.Text), 75) & "%'"
    End If
    
    strSql = "select ID,yiyuanmc from yw_kehuxinxi where 1=1" & strtiaojian
    Set Rs = Nothing
    Rs.Open strSql, conn, adOpenStatic
    
    If Rs.RecordCount > 0 Then
        With FxGridKH
            Do While Not Rs.EOF
                .Rows = .Rows + 1
                .TextMatrix(.Rows - 1, 0) = Rs("ID").Value      '.Rows - 1
                .TextMatrix(.Rows - 1, 1) = StringEnDeCodecn(Rs("yiyuanmc").Value, 75)
                Rs.MoveNext
            Loop
        End With
    End If
    Set Rs = Nothing
End Sub

Private Sub txtdianhua_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And txtdianhua.Text <> "" Then
        txtshoujihao.SetFocus
    End If
End Sub

Private Sub txtfuzheren_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And txtfuzheren.Text <> "" Then
        txtdianhua.SetFocus
    End If
End Sub



Private Sub txtshoujihao_KeyDown(KeyCode As Integer, Shift As Integer)
      If KeyCode = 13 And txtshoujihao.Text <> "" Then
        txtxiaoshouren.SetFocus
    End If
End Sub



Private Sub txtxiaoshouren_KeyDown(KeyCode As Integer, Shift As Integer)
      If KeyCode = 13 And txtxiaoshouren.Text <> "" Then
        cbobanben.SetFocus
    End If
End Sub
