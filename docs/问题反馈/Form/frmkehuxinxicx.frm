VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.25#0"; "HISControl1.ocx"
Begin VB.Form frmkehuxinxicx 
   BackColor       =   &H00E0E0E0&
   Caption         =   "客户信息查询"
   ClientHeight    =   9090
   ClientLeft      =   270
   ClientTop       =   855
   ClientWidth     =   15165
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9090
   ScaleWidth      =   15165
   WindowState     =   2  'Maximized
   Begin mycmd.MyCommand MyCommand6 
      Height          =   375
      Left            =   1848
      TabIndex        =   20
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "清 空"
   End
   Begin mycmd.MyCommand MyCommand5 
      Height          =   375
      Left            =   4824
      TabIndex        =   19
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "查询已过期"
   End
   Begin mycmd.MyCommand MyCommand4 
      Height          =   375
      Left            =   3336
      TabIndex        =   18
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "查询未过期"
   End
   Begin mycmd.MyCommand MyCommand3 
      Height          =   375
      Left            =   9330
      TabIndex        =   7
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "退 出"
   End
   Begin mycmd.MyCommand MyCommand2 
      Height          =   375
      Left            =   6312
      TabIndex        =   6
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "导 出"
   End
   Begin mycmd.MyCommand MyCommand1 
      Height          =   375
      Left            =   360
      TabIndex        =   5
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "查 询"
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "详细信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3045
      Left            =   240
      TabIndex        =   4
      Top             =   5880
      Width           =   14775
      Begin VB.TextBox txtmokuai 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   975
         Left            =   1260
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   62
         Text            =   "frmkehuxinxicx.frx":0000
         Top             =   1590
         Width           =   7755
      End
      Begin VB.Label Label50 
         BackStyle       =   0  'Transparent
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
         Left            =   6000
         TabIndex        =   74
         Top             =   960
         Width           =   705
      End
      Begin VB.Label Label49 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "维护费"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   5160
         TabIndex        =   73
         Top             =   960
         Width           =   630
      End
      Begin VB.Label Label48 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   795
         TabIndex        =   71
         Top             =   960
         Width           =   1605
      End
      Begin VB.Label Label33 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "备注"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   195
         TabIndex        =   70
         Top             =   945
         Width           =   420
      End
      Begin VB.Label Label46 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   13410
         TabIndex        =   64
         Top             =   1710
         Visible         =   0   'False
         Width           =   180
      End
      Begin VB.Label Label47 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "付款方式"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   12390
         TabIndex        =   63
         Top             =   1710
         Visible         =   0   'False
         Width           =   720
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackColor       =   &H00FF8080&
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         BeginProperty Font 
            Name            =   "华文新魏"
            Size            =   18
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF00FF&
         Height          =   375
         Left            =   11640
         TabIndex        =   61
         Top             =   2040
         Width           =   375
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         BeginProperty Font 
            Name            =   "华文隶书"
            Size            =   36
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   720
         Left            =   9360
         TabIndex        =   60
         Top             =   2010
         Width           =   735
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         BeginProperty Font 
            Name            =   "华文新魏"
            Size            =   15.75
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   315
         Left            =   9420
         TabIndex        =   59
         Top             =   1560
         Width           =   330
      End
      Begin VB.Line Line3 
         X1              =   9480
         X2              =   14760
         Y1              =   1500
         Y2              =   1500
      End
      Begin VB.Line Line2 
         X1              =   9180
         X2              =   9180
         Y1              =   1470
         Y2              =   4050
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   9480
         Y1              =   1500
         Y2              =   1500
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户基本资料详细信息"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   5400
         TabIndex        =   58
         Top             =   240
         Width           =   2550
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   1440
         TabIndex        =   57
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label45 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "地址"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   10530
         TabIndex        =   56
         Top             =   660
         Width           =   360
      End
      Begin VB.Label Label44 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   10920
         TabIndex        =   55
         Top             =   600
         Width           =   180
      End
      Begin VB.Label Label43 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "其它说明"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   9420
         TabIndex        =   54
         Top             =   2685
         Width           =   720
      End
      Begin VB.Label Label42 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   10410
         TabIndex        =   53
         Top             =   2640
         Width           =   180
      End
      Begin VB.Label Label41 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "管理员手机"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   12360
         TabIndex        =   52
         Top             =   1200
         Width           =   1050
      End
      Begin VB.Label Label40 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   13440
         TabIndex        =   51
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label39 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "管理员电话"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   9840
         TabIndex        =   50
         Top             =   1200
         Width           =   1050
      End
      Begin VB.Label Label38 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   10920
         TabIndex        =   49
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label37 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   8940
         TabIndex        =   48
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label36 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "系统管理员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   7800
         TabIndex        =   47
         Top             =   1200
         Width           =   1050
      End
      Begin VB.Label Label35 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   11580
         TabIndex        =   46
         Top             =   1560
         Visible         =   0   'False
         Width           =   210
      End
      Begin VB.Label Label34 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   10680
         TabIndex        =   45
         Top             =   1560
         Visible         =   0   'False
         Width           =   840
      End
      Begin VB.Label Label32 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "所用模块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   300
         TabIndex        =   44
         Top             =   1590
         Width           =   840
      End
      Begin VB.Label Label31 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   1260
         TabIndex        =   43
         Top             =   2640
         Width           =   180
      End
      Begin VB.Label Label30 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "乘车路线"
         ForeColor       =   &H00C00000&
         Height          =   180
         Left            =   330
         TabIndex        =   42
         Top             =   2640
         Width           =   720
      End
      Begin VB.Label Label29 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   210
         Left            =   6510
         TabIndex        =   41
         Top             =   660
         Width           =   105
      End
      Begin VB.Label Label28 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "维护结束时间"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   5190
         TabIndex        =   40
         Top             =   660
         Width           =   1260
      End
      Begin VB.Label Label27 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
         Height          =   180
         Left            =   5700
         TabIndex        =   39
         Top             =   1680
         Visible         =   0   'False
         Width           =   180
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施结束时间"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   4320
         TabIndex        =   38
         Top             =   1680
         Visible         =   0   'False
         Width           =   1260
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   1500
         TabIndex        =   37
         Top             =   1680
         Visible         =   0   'False
         Width           =   210
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施开始时间"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   120
         TabIndex        =   36
         Top             =   1680
         Visible         =   0   'False
         Width           =   1260
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   6360
         TabIndex        =   35
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "负责人电话"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   5220
         TabIndex        =   34
         Top             =   1200
         Width           =   1050
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   3780
         TabIndex        =   33
         Top             =   1200
         Width           =   210
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "负责人手机号"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   2460
         TabIndex        =   32
         Top             =   1200
         Width           =   1260
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院负责人"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   300
         TabIndex        =   31
         Top             =   1200
         Width           =   1050
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   13440
         TabIndex        =   30
         Top             =   1560
         Visible         =   0   'False
         Width           =   210
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   12540
         TabIndex        =   29
         Top             =   1560
         Visible         =   0   'False
         Width           =   840
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   9420
         TabIndex        =   26
         Top             =   1560
         Visible         =   0   'False
         Width           =   210
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   8460
         TabIndex        =   25
         Top             =   1560
         Visible         =   0   'False
         Width           =   840
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   6660
         TabIndex        =   24
         Top             =   1560
         Visible         =   0   'False
         Width           =   210
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "所用版本"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   5760
         TabIndex        =   23
         Top             =   1560
         Visible         =   0   'False
         Width           =   840
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "无"
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
         Left            =   1080
         TabIndex        =   22
         Top             =   660
         Width           =   210
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   180
         TabIndex        =   21
         Top             =   660
         Width           =   840
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "查询结果"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4275
      Left            =   210
      TabIndex        =   3
      Top             =   1470
      Width           =   14835
      Begin TabDlg.SSTab SSTab1 
         Height          =   1845
         Left            =   60
         TabIndex        =   65
         Top             =   120
         Width           =   14715
         _ExtentX        =   25956
         _ExtentY        =   3254
         _Version        =   393216
         Style           =   1
         TabHeight       =   520
         BackColor       =   14737632
         TabCaption(0)   =   "全部"
         TabPicture(0)   =   "frmkehuxinxicx.frx":0003
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "MSHFlexGrid3"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "已过期"
         TabPicture(1)   =   "frmkehuxinxicx.frx":001F
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "MSHFlexGrid1"
         Tab(1).ControlCount=   1
         TabCaption(2)   =   "未过期"
         TabPicture(2)   =   "frmkehuxinxicx.frx":003B
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "MSHFlexGrid2"
         Tab(2).ControlCount=   1
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid3 
            Height          =   1335
            Left            =   120
            TabIndex        =   66
            Top             =   360
            Width           =   14595
            _ExtentX        =   25744
            _ExtentY        =   2355
            _Version        =   393216
            ForeColor       =   -2147483646
            Cols            =   1
            FixedCols       =   0
            BackColorBkg    =   12632256
            AllowUserResizing=   3
            _NumberOfBands  =   1
            _Band(0).Cols   =   1
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
            Height          =   1425
            Left            =   -74940
            TabIndex        =   67
            Top             =   360
            Width           =   14595
            _ExtentX        =   25744
            _ExtentY        =   2514
            _Version        =   393216
            ForeColor       =   -2147483646
            Cols            =   1
            FixedCols       =   0
            BackColorBkg    =   12632256
            AllowUserResizing=   3
            _NumberOfBands  =   1
            _Band(0).Cols   =   1
         End
         Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid2 
            Height          =   1365
            Left            =   -74940
            TabIndex        =   68
            Top             =   360
            Width           =   14595
            _ExtentX        =   25744
            _ExtentY        =   2408
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
      Begin UserControl.lst lst1 
         Height          =   2115
         Left            =   90
         TabIndex        =   69
         Top             =   1920
         Width           =   14715
         _ExtentX        =   25956
         _ExtentY        =   3731
         MergeCells      =   4
         Cols            =   12
         Rows            =   6
         BackColorFrozen =   16763080
         BackColorSel    =   49152
         RowHeightMin    =   300
         ColumnCaptions  =   "软件版本;模块内容;余款;订单金额;销售员;实施人员;其它说明;合同;下单时间;款类别;票据;演示人员"
         ColWidths       =   "1000;7000;1000;1000;1000;1000;1000;1500"
         ColumnName      =   "软件版本;模块内容;余款;订单金额;销售员;实施人员;其它说明;合同;下单时间;款类别;票据;演示人员"
         RecordCounts    =   5
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "查询条件"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   240
      TabIndex        =   2
      Top             =   720
      Width           =   14835
      Begin VB.ComboBox cboxs 
         Height          =   300
         Left            =   12960
         TabIndex        =   17
         Top             =   180
         Width           =   1335
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   315
         Left            =   10200
         TabIndex        =   14
         Top             =   180
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   556
         _Version        =   393216
         Format          =   113377281
         CurrentDate     =   39561
      End
      Begin VB.ComboBox cbossry 
         Height          =   300
         Left            =   7320
         TabIndex        =   13
         Top             =   180
         Width           =   1275
      End
      Begin VB.ComboBox cbokehumc 
         Height          =   300
         Left            =   3600
         TabIndex        =   11
         Top             =   180
         Width           =   2715
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         Left            =   840
         TabIndex        =   8
         Top             =   180
         Width           =   1665
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   3
         Left            =   12180
         TabIndex        =   16
         Top             =   300
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "过期时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   2
         Left            =   9360
         TabIndex        =   15
         Top             =   300
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   1
         Left            =   6540
         TabIndex        =   12
         Top             =   300
         Width           =   720
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   60
         TabIndex        =   10
         Top             =   300
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   0
         Left            =   2820
         TabIndex        =   9
         Top             =   300
         Width           =   720
      End
   End
   Begin MSComDlg.CommonDialog cdldaoru 
      Left            =   810
      Top             =   180
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Filter          =   "excel文件|*.xls|所有文件|*.*"
   End
   Begin mycmd.MyCommand MyCommand7 
      Height          =   375
      Left            =   7800
      TabIndex        =   72
      Top             =   8880
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      Caption         =   "打  印"
   End
   Begin VB.Label Label10 
      Caption         =   "Label4"
      Height          =   315
      Left            =   8700
      TabIndex        =   28
      Top             =   4980
      Width           =   1395
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "客户名称"
      ForeColor       =   &H00000000&
      Height          =   180
      Left            =   7920
      TabIndex        =   27
      Top             =   5100
      Width           =   720
   End
   Begin VB.Label Label21 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "客户信息查询"
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
      Left            =   5760
      TabIndex        =   1
      Top             =   180
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
      Left            =   3600
      TabIndex        =   0
      Top             =   180
      Width           =   1725
   End
End
Attribute VB_Name = "frmkehuxinxicx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim n As Integer
Dim i As Integer
Public ExcelApp As Excel.Application
Public ExcelBook As Excel.Workbook
Public ExcelSheet As Excel.Worksheet
'Dim obj As proBaoBiaoGG.clsRpt_LIB
Dim blnReturn As Boolean
Private Sub cbokehumc_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim pymstr As String            '查询字符串
    Dim pymint As Integer           '循环变量

    If KeyCode = 13 And cbokehumc.Text <> "" Then
        pymstr = ""
        '构建查询语句
        pymstr = "select  distinct yiyuanmc from st_yw_kehuxinxi where pym like '%" & Trim(cbokehumc.Text) & "%'"
        rs.CursorLocation = adUseClient
        rs.Open pymstr, conn
        If Not rs.EOF Then
            cbokehumc.Clear                          '清空当前LIST记录
            '循环赋傎给组合框的LIST
            For pymint = 1 To rs.RecordCount
                cbokehumc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
                rs.MoveNext
            Next pymint
            cbokehumc.ListIndex = 0                  '将第一行的傎赋给TEXT
        End If
    End If
    Set rs = Nothing
End Sub

Private Sub Form_Load()
    Dim str1 As String
    Dim i As Integer
    '加载版本
    Set rs = Nothing
    str1 = "SELECT DISTINCT banben FROM zd_mokuai"
    rs.CursorLocation = adUseClient
    rs.Open str1, conn
    If Not rs.EOF Then
        For i = 1 To rs.RecordCount
            cbobanben.AddItem rs.Fields("banben").Value
            rs.MoveNext
        Next i
        rs.Close
    End If
'
'  Set obj = CreateObject("proBaoBiaoGG.clsRpt_LIB")
'    '2初始化连接
'  obj.initConn sqlDataString
    

    '加载实施人员
    Set rs = Nothing
    str1 = "select xingming from zd_jishuyuan where  zhiwu<>'销售人员' and zhuangtai='1'"
    rs.CursorLocation = adUseClient
    rs.Open str1, conn
    If Not rs.EOF Then
        For i = 1 To rs.RecordCount
            cbossry.AddItem rs.Fields("xingming").Value
            rs.MoveNext
        Next i
        rs.Close
    End If

    '加载销售人员
'    Set Rs = Nothing
    str1 = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where 1=1 and zhuangtai='1'"
    Call BindComboBoxData(cboxs, str1, "usename")
'    Rs.CursorLocation = adUseClient
'    Rs.Open str1, conn
'    If Not Rs.EOF Then
'        For i = 1 To Rs.RecordCount
'            cboxs.AddItem Rs.Fields("usename").Value
'            Rs.MoveNext
'        Next i
'        Rs.Close
'    End If

    '加载默认时间
    DTPicker1.Value = Now
    '重新设置窗体上的控件大小
    '    rsz.ReadXY Me, 15360, 9975
End Sub
Private Sub Form_Resize()
' rsz.ReSetXY Me
End Sub

'选择对应LST明细
Private Sub lSTMX()
Dim msg As Integer
    '使当前行的背景色突出显示
'    Me.MSHFlexGrid1.FocusRect = flexFocusNone
'    Me.MSHFlexGrid1.SelectionMode = flexSelectionByRow
'    Me.MSHFlexGrid1.BackColorSel = 8421631
       
'        Label6.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 2)
'    Label42.Caption = lst1.TextMatrix(lst1.getSelectedRow, 0) '版本
    Label42.Caption = lst1.TextMatrix(lst1.getSelectedRow, 6) '其它说明
    '实施人员
    '下单时间
    '实施开始时间
    '实施结束时间
    '医院模块
    txtmokuai.Text = lst1.TextMatrix(lst1.getSelectedRow, 1)
    '销售人员
    '付款方式
    If MSHFlexGrid1.row <> "0" And MSHFlexGrid1.Cols > 1 Then
        Label17.Caption = ""
        '医院名称
        Label4.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 3)

        '实施人员
        Label8.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 4)
        '下单时间
        Label12.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 5)
        '医院负责人
        Label13.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 6)
        '医院负责人手机号
        Label20.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 7)
        '医院负责人电话
        Label23.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 8)
        '实施开始时间
        Label25.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 9)
        '实施结束时间
        Label27.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 10)
        '维护截止时间
        Label29.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 11)
        '乘车路线
        Label31.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 12)
        '医院模块
'        txtmokuai.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 13)
        '销售人员
        Label35.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 14)
        '系统管理员
        Label37.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 15)
        '系统管理员电话
        Label38.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 16)
        '系统管理员手机
        Label40.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 17)
        '其它说明
'        Label42.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 18)
        '地址
        Label44.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 19)
           '付款方式
        Label46.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 20)
        MyCommand1Click2 MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 1)
        Label16.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 3) & " " & Label6.Caption

    
    End If



    If Label29.Caption <> "" Then
        msg = DateDiff("d", Now, (Label29.Caption))
    End If
    If msg > 0 Then
        Label17.Caption = "未过期"
        Label17.ForeColor = 16711680
        Label18.Caption = ""
        Label18.Caption = "还有" & msg & "天过期"
    ElseIf msg = 0 Then
        Label17.Caption = "未知"
        Label18.Caption = ""
    ElseIf msg < 0 Then
        Label17.Caption = "已过期"
        Label17.ForeColor = 255
        Label18.Caption = ""
        Label18.Caption = "已过期" & msg & "天"
    End If
End Sub

Private Sub lst1_Click()
    If lst1.Rows > 0 Then
       Call lSTMX
    End If

End Sub


Private Sub MSHFlexGrid1_Click()
    Dim msg As Integer
    '使当前行的背景色突出显示
    Me.MSHFlexGrid1.FocusRect = flexFocusNone
    Me.MSHFlexGrid1.SelectionMode = flexSelectionByRow
    Me.MSHFlexGrid1.BackColorSel = 8421631



    If MSHFlexGrid1.row <> "0" And MSHFlexGrid1.Cols > 1 Then
        Label17.Caption = ""
        '医院名称
        Label4.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 3)
        '版本
        Label6.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 2)
        '实施人员
        Label8.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 4)
        '下单时间
        Label12.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 5)
        '医院负责人
        Label13.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 6)
        '医院负责人手机号
        Label20.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 7)
        '医院负责人电话
        Label23.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 8)
        '实施开始时间
        Label25.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 9)
        '实施结束时间
        Label27.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 10)
        '维护截止时间
        Label29.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 11)
        '乘车路线
        Label31.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 12)
        '医院模块
        txtmokuai.Text = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 13)
        '销售人员
        Label35.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 14)
        '系统管理员
        Label37.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 15)
        '系统管理员电话
        Label38.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 16)
        '系统管理员手机
        Label40.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 17)
        '其它说明
        Label42.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 18)
        '地址
        Label44.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 19)
           '付款方式
        Label46.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 20)
        MyCommand1Click2 MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 1)
        Label16.Caption = MSHFlexGrid1.TextMatrix(MSHFlexGrid1.row, 3) & " " & Label6.Caption

    
    End If



    If Label29.Caption <> "" Then
        msg = DateDiff("d", Now, (Label29.Caption))
    End If
    If msg > 0 Then
        Label17.Caption = "未过期"
        Label17.ForeColor = 16711680
        Label18.Caption = ""
        Label18.Caption = "还有" & msg & "天过期"
    ElseIf msg = 0 Then
        Label17.Caption = "未知"
        Label18.Caption = ""
    ElseIf msg < 0 Then
        Label17.Caption = "已过期"
        Label17.ForeColor = 255
        Label18.Caption = ""
        Label18.Caption = "已过期" & msg & "天"
    End If
End Sub

Private Sub MSHFlexGrid1_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown, Txt
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyC Then    ' 显示键组合.
        If CtrlDown Then
            CopyFile MSHFlexGrid1
        End If

    End If

End Sub
Private Sub CopyFile(MSHFlexGrid3 As MSHFlexGrid)
    Dim i As Long, J As Long
    Dim str1 As String
    str1 = ""
    With MSHFlexGrid3

        For i = 0 To .Rows - 1
            For J = 0 To .Cols - 1
                str1 = str1 & Replace(.TextMatrix(i, J), vbCrLf, "") & vbTab
            Next J
            str1 = str1 & vbCrLf
        Next i


    End With
    Clipboard.SetText str1
End Sub

Private Sub MSHFlexGrid2_Click()
    Dim msg As Integer
    '使当前行的背景色突出显示
    Me.MSHFlexGrid2.FocusRect = flexFocusNone
    Me.MSHFlexGrid2.SelectionMode = flexSelectionByRow
    Me.MSHFlexGrid2.BackColorSel = 8421631

    If MSHFlexGrid2.row <> "0" And MSHFlexGrid2.Cols > 1 Then
        Label17.Caption = "无"
        '医院名称
        Label4.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 3)
        '版本
        Label6.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 2)
        '实施人员
        Label8.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 4)
        '下单时间
        Label12.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 5)
        '医院负责人
        Label13.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 6)
        '医院负责人手机号
        Label20.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 7)
        '医院负责人电话
        Label23.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 8)
        '实施开始时间
        Label25.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 9)
        '实施结束时间
        Label27.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 10)
        '维护截止时间
        Label29.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 11)
        '乘车路线
        Label31.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 12)
        '医院模块
        txtmokuai.Text = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 13)
        '销售人员
        Label35.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 14)
        '系统管理员
        Label37.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 15)
        '系统管理员电话
        Label38.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 16)
        '系统管理员手机
        Label40.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 17)
        '其它说明
        Label42.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 18)
        '地址
        Label44.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 19)
        '付款方式
        Label46.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 20)

        Label16.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 3)
        MyCommand1Click2 MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 1)
        Label16.Caption = MSHFlexGrid2.TextMatrix(MSHFlexGrid2.row, 3) & " " & Label6.Caption

    End If

    If Label29.Caption <> "" Then
        msg = DateDiff("d", Now, (Label29.Caption))
    End If
    If msg > 0 Then
        Label17.Caption = "未过期"
        Label17.ForeColor = 16711680
        Label18.Caption = ""
        Label18.Caption = "还有" & msg & "天过期"
    ElseIf msg = 0 Then
        Label17.Caption = "未知"
        Label18.Caption = ""
    ElseIf msg < 0 Then
        Label17.Caption = "已过期"
        Label17.ForeColor = 255
        Label18.Caption = ""
        Label18.Caption = "已过期" & msg & "天"
    End If
End Sub

Private Sub MSHFlexGrid2_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown, Txt
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyC Then    ' 显示键组合.
        If CtrlDown Then
            CopyFile MSHFlexGrid2
        End If

    End If
End Sub

Private Sub MSHFlexGrid3_Click()
    Dim msg As Integer
    '使当前行的背景色突出显示
    Me.MSHFlexGrid3.FocusRect = flexFocusNone
    Me.MSHFlexGrid3.SelectionMode = flexSelectionByRow
    Me.MSHFlexGrid3.BackColorSel = 8421631
    If MSHFlexGrid3.row <> "0" And MSHFlexGrid3.Cols > 1 Then
        Label17.Caption = ""
        '医院名称
        Label4.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 3)
        '版本
        Label6.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 2)
        '实施人员
        Label8.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 4)
        '下单时间
        Label12.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 5)
        '医院负责人
        Label13.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 6)
        '医院负责人手机号
        Label20.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 7)
        '医院负责人电话
        Label23.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 8)
        '实施开始时间
        Label25.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 9)
        '实施结束时间
        Label27.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 10)
        '维护截止时间
        Label29.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 11)
        '乘车路线
        Label31.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 12)
        '医院模块
        txtmokuai.Text = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 13)
        '销售人员
        Label35.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 14)
        '系统管理员
        Label37.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 15)
        '系统管理员电话
        Label38.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 16)
        '系统管理员手机
        Label40.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 17)
        '其它说明
        Label42.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 18)
        '地址
        Label44.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 19)
        '付款方式
        Label46.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 20)
        MyCommand1Click2 MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 1)
        Label16.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 3) & " " & Label6.Caption
         '备注
        Label48.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 23)
        Label50.Caption = MSHFlexGrid3.TextMatrix(MSHFlexGrid3.row, 24)
        Label42.Caption = lst1.TextMatrix(1, 6)
        
    End If




    If Label29.Caption <> "" Then
        msg = DateDiff("d", Now, (Label29.Caption))
    End If
    If msg > 0 Then
        Label17.Caption = "未过期"
        Label17.ForeColor = 16711680
        Label18.Caption = ""
        Label18.Caption = "还有" & msg & "天过期"
    ElseIf msg = 0 Then
        Label17.Caption = "未知"
        Label18.Caption = ""
    ElseIf msg < 0 Then
        Label17.Caption = "已过期"
        Label17.ForeColor = 255
        Label18.Caption = ""
        Label18.Caption = "已过期" & msg & "天"
    End If
End Sub

Private Sub MSHFlexGrid3_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown, Txt
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyC Then    ' 显示键组合.
        If CtrlDown Then
            CopyFile MSHFlexGrid3
        End If

    End If
End Sub

Private Sub MyCommand1Click(MSHFlexGrid3 As MSHFlexGrid, Optional iTab As Integer = 0, Optional Sand As String = " and  1=1")
    Dim password As String
    SSTab1.Tab = iTab

    str = "SELECT zhuangtai AS 当前状态, ID AS 流水号, banben AS 版本, yiyuanmc AS 医院名称,shishiry AS 实施人员, xiadansj AS 下单时间, yiyuanfuzher AS 医院负责人,"
    '7
    str = str & "shoujihao AS 手机号, gudingdh AS 固定电话, sskaishisj AS 实施开始时间,ssjieshusj AS 实施结束时间, weihuEndtime AS 维护截止时间, cclx AS 乘车路线,"
    str = str & "yiyuanmokuai AS 医院模块, xiaoshoury AS 销售人员, xitonggly AS 系统管理员,glydh AS 管理员电话, glysj AS 管理员手机, qtsm AS 其它说明, dizhi AS 地址,fukuanfs AS 付款方式,ruanjianzj1 AS 合计金额,weihuEndtime as 维护截止日期,qtsm as 备注 "
    str = str & ",weihufei as 维护费"
    str = str & " FROM st_yw_kehuxinxi WHERE (1 = 1)" & Sand
    '构建SQL语句
    If cbobanben.Text <> "" Then
        '    password = StringEnDeCodecn(Trim(cbobanben.Text), 75)
        str = str & " and banben='" & Trim(cbobanben.Text) & "'"
    End If



    If cbokehumc.Text <> "" Then
        password = StringEnDeCodecn(Trim(cbokehumc.Text), 75)
        str = str & " and yiyuanmc like '%" & password & "%'"
    End If

    If cbossry.Text <> "" Then
        password = StringEnDeCodecn(Trim(cbossry.Text), 75)
        str = str & " and shishiry='" & password & "'"
    End If

    If cboxs.Text <> "" Then
        password = StringEnDeCodecn(Trim(cboxs.Text), 75)
        str = str & " and xiaoshoury='" & password & "'"
    End If

    Set MSHFlexGrid3.DataSource = conn.Execute(str)
    MSHFlexGrid3.ColWidth(0) = 0
    MSHFlexGrid3.ColWidth(1) = 0
    MSHFlexGrid3.ColWidth(2) = 0

    MSHFlexGrid3.ColWidth(4) = 0
    MSHFlexGrid3.ColWidth(5) = 0

    MSHFlexGrid3.ColWidth(9) = 0
    MSHFlexGrid3.ColWidth(10) = 0
    MSHFlexGrid3.ColWidth(11) = 0
    MSHFlexGrid3.ColWidth(12) = 0
    MSHFlexGrid3.ColWidth(13) = 0
    MSHFlexGrid3.ColWidth(14) = 0
    MSHFlexGrid3.ColWidth(15) = 0
    MSHFlexGrid3.ColWidth(16) = 0
    MSHFlexGrid3.ColWidth(17) = 0
    MSHFlexGrid3.ColWidth(18) = 0
    MSHFlexGrid3.ColWidth(19) = 0
    MSHFlexGrid3.ColWidth(20) = 0



    '客户名称|医院负责人|手机号|电话|合计金额
    MSHFlexGrid3.ColWidth(3) = 2500
    MSHFlexGrid3.ColWidth(6) = 1000
    MSHFlexGrid3.ColWidth(7) = 2000
    MSHFlexGrid3.ColWidth(8) = 2000
    MSHFlexGrid3.ColWidth(21) = 1000


    '解密汉字
    For i = 1 To MSHFlexGrid3.Rows - 1
        For n = 3 To 4
            MSHFlexGrid3.TextMatrix(i, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, n), 75)
        Next n
    Next i
    For i = 1 To MSHFlexGrid3.Rows - 1
        For n = 14 To 15
            MSHFlexGrid3.TextMatrix(i, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, n), 75)
        Next n
    Next i

    For i = 1 To MSHFlexGrid3.Rows - 1
        For n = 18 To 20
            MSHFlexGrid3.TextMatrix(i, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, n), 75)
        Next n
    Next i

    For i = 1 To MSHFlexGrid3.Rows - 1

        MSHFlexGrid3.TextMatrix(i, 12) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, 12), 75)
        MSHFlexGrid3.TextMatrix(i, 6) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, 6), 75)
       MSHFlexGrid3.TextMatrix(i, 23) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, 23), 75)
       MSHFlexGrid3.TextMatrix(i, 24) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(i, 24), 75)
        '解密数字
        MSHFlexGrid3.TextMatrix(i, 7) = decipher(MSHFlexGrid3.TextMatrix(i, 7))
        MSHFlexGrid3.TextMatrix(i, 8) = decipher(MSHFlexGrid3.TextMatrix(i, 8))
        MSHFlexGrid3.TextMatrix(i, 16) = decipher(MSHFlexGrid3.TextMatrix(i, 16))
        MSHFlexGrid3.TextMatrix(i, 17) = decipher(MSHFlexGrid3.TextMatrix(i, 17))
        '合计金额
     ' MSHFlexGrid3.TextMatrix(i, 21) = decipher(MSHFlexGrid3.TextMatrix(i, 21))
    Next i



End Sub
Private Sub MyCommand1Click2(iID As Long)
    Dim password As String
    Dim i As Long, n As Long
    Dim rs As New ADODB.Recordset
    
    str = "SELECT  b.banben as  软件版本,b.yiyuanmokuai as 模块内容,b.ruanjianyk as 余款,b.ruanjianzj as 订单金额,"
    '7
    str = str & " b.xiaoshoury as 销售员,a.shishiry as 实施人员,b.qtsm as 其它说明,b.hetong 合同,b.xiadansj as 下单时间  "
    str = str & ", b.rjklb as 款类别, b.piaoju as 票据,b.yanshiry as 演示人员"
    str = str & " FROM [yw_kehuxinxiMingxi]  b with(nolock) left join yw_kehuxinxi a with(nolock) on a.id=b.id where  isnull(b.bShanchu,0)=0 and  b.id=" & iID

txtmokuai.Text = ""
    objFormSetting.FillList Me.lst1, str
    '解密汉字
    For i = 1 To lst1.Rows - 1
        For n = 5 To 7
            lst1.TextMatrix(i, n) = StringEnDeCodecn(lst1.TextMatrix(i, n), 75)
        Next n
         txtmokuai.Text = txtmokuai.Text & lst1.TextMatrix(i, 1)
    Next i
    '    '客户名称|医院负责人|手机号|电话|合计金额
    '    MSHFlexGrid3.ColWidth(3) = 2500
    '    MSHFlexGrid3.ColWidth(6) = 1000
    '    MSHFlexGrid3.ColWidth(7) = 2000
    '    MSHFlexGrid3.ColWidth(8) = 2000
    '    MSHFlexGrid3.ColWidth(21) = 1000
    '
    '
    '    '解密汉字
    '    For I = 1 To MSHFlexGrid3.Rows - 1
    '        For n = 3 To 4
    '            MSHFlexGrid3.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, n), 75)
    '        Next n
    '    Next I
    '    For I = 1 To MSHFlexGrid3.Rows - 1
    '        For n = 14 To 15
    '            MSHFlexGrid3.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, n), 75)
    '        Next n
    '    Next I
    '
    '    For I = 1 To MSHFlexGrid3.Rows - 1
    '        For n = 18 To 20
    '            MSHFlexGrid3.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, n), 75)
    '        Next n
    '    Next I
    '
    '    For I = 1 To MSHFlexGrid3.Rows - 1
    '
    '        MSHFlexGrid3.TextMatrix(I, 12) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, 12), 75)
    '        MSHFlexGrid3.TextMatrix(I, 6) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, 6), 75)
    '        '解密数字
    '        MSHFlexGrid3.TextMatrix(I, 7) = decipher(MSHFlexGrid3.TextMatrix(I, 7))
    '        MSHFlexGrid3.TextMatrix(I, 8) = decipher(MSHFlexGrid3.TextMatrix(I, 8))
    '        MSHFlexGrid3.TextMatrix(I, 16) = decipher(MSHFlexGrid3.TextMatrix(I, 16))
    '        MSHFlexGrid3.TextMatrix(I, 17) = decipher(MSHFlexGrid3.TextMatrix(I, 17))
    '        MSHFlexGrid3.TextMatrix(I, 21) = StringEnDeCodecn(MSHFlexGrid3.TextMatrix(I, 21), 75)
    '    Next I



End Sub




Private Sub MyCommand1_Click()
    MyCommand1Click MSHFlexGrid3
End Sub

Private Sub MyCommand2_Click()
    On Error GoTo e01
    Dim FileName As String
    Dim i As Long, J As Long
    Set ExcelApp = CreateObject("excel.application")
    Dim MSHFlexGrid As MSHFlexGrid
    Select Case SSTab1.Tab
    Case 0
        Set MSHFlexGrid = MSHFlexGrid3
    Case 1
        Set MSHFlexGrid = MSHFlexGrid1
    Case 2
        Set MSHFlexGrid = MSHFlexGrid2
    End Select
    If MSHFlexGrid.Rows > 1 And MSHFlexGrid.Cols > 1 Then

    Else
        Exit Sub
    End If

    cdldaoru.ShowSave
    FileName = cdldaoru.FileName
    If FileName = "" Then
        Exit Sub
    Else
        ExcelApp.Visible = False
        ExcelApp.SheetsInNewWorkbook = 1
        Set ExcelBook = ExcelApp.Workbooks.Add
        Set ExcelSheet = ExcelBook.Worksheets(1)
        With MSHFlexGrid
            For i = 0 To .Rows - 1
                For J = 0 To .Cols - 1
                    ExcelSheet.Cells(i + 1, J + 1) = .TextMatrix(i, J)
                Next J
            Next i
        End With
        ExcelSheet.SaveAs FileName
        MsgBox "保存成功！"
    End If
    ExcelBook.Close
    ExcelApp.Quit
    Set ExcelApp = Nothing
    Set ExcelBook = Nothing
    Exit Sub
e01:
    MsgBox "导出文件出错:" & Err.Description
End Sub

Private Sub MyCommand3_Click()
    Unload Me
End Sub

Private Sub MyCommand4_Click()
    MyCommand1Click MSHFlexGrid2, 2, "and enddime>'" & DTPicker1.Value & "'"
End Sub

Private Sub MyCommand5_Click()
    MyCommand1Click MSHFlexGrid1, 1, "and  ( enddime<'" & DTPicker1.Value & "' or enddime is null)"

End Sub

''Private Sub MyCommand4_Click()
''    Dim password As String
''    SSTab1.Tab = 1
''    str = "SELECT zhuangtai AS 当前状态, ID AS 流水号, banben AS 版本, yiyuanmc AS 医院名称,shishiry AS 实施人员, xiadansj AS 下单时间, yiyuanfuzher AS 医院负责人,"
''    str = str & "shoujihao AS 手机号, gudingdh AS 固定电话, sskaishisj AS 实施开始时间,ssjieshusj AS 实施结束时间, enddime AS 维护截止时间, cclx AS 乘车路线,"
''    str = str & "yiyuanmokuai AS 医院模块, xiaoshoury AS 销售人员, xitonggly AS 系统管理员,glydh AS 管理员电话, glysj AS 管理员手机, qtsm AS 其它说明, dizhi AS 地址,fukuanfs AS 付款方式"
''    str = str & " FROM yw_kehuxinxi WHERE (1 = 1) and enddime>'" & DTPicker1.Value & "'"
''    '构建SQL语句
''    If cbobanben.Text <> "" Then
''        str = str & " and banben='" & Trim(cbobanben.Text) & "'"
''    End If
''
''    If cbokehumc.Text <> "" Then
''        password = StringEnDeCodecn(Trim(cbokehumc.Text), 75)
''        str = str & " and yiyuanmc like '%" & password & "%'"
''    End If
''
''    If cbossry.Text <> "" Then
''        password = StringEnDeCodecn(Trim(cbossry.Text), 75)
''        str = str & " and shishiry='" & password & "'"
''    End If
''
''    If cboxs.Text <> "" Then
''        password = StringEnDeCodecn(Trim(cboxs.Text), 75)
''        str = str & " and xiaoshoury='" & password & "'"
''    End If
''
''    Set MSHFlexGrid1.DataSource = conn.Execute(str)
''
''    '解密汉字
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        For n = 3 To 4
''            MSHFlexGrid1.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid1.TextMatrix(I, n), 75)
''        Next n
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        MSHFlexGrid1.TextMatrix(I, 6) = StringEnDeCodecn(MSHFlexGrid1.TextMatrix(I, 6), 75)
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        For n = 14 To 15
''            MSHFlexGrid1.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid1.TextMatrix(I, n), 75)
''        Next n
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        For n = 18 To 20
''            MSHFlexGrid1.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid1.TextMatrix(I, n), 75)
''        Next n
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''
''        MSHFlexGrid1.TextMatrix(I, 12) = StringEnDeCodecn(MSHFlexGrid1.TextMatrix(I, 12), 75)
''
''    Next I
''    '解密数字
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        MSHFlexGrid1.TextMatrix(I, 7) = decipher(MSHFlexGrid1.TextMatrix(I, 7))
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        MSHFlexGrid1.TextMatrix(I, 8) = decipher(MSHFlexGrid1.TextMatrix(I, 8))
''    Next I
''
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        MSHFlexGrid1.TextMatrix(I, 16) = decipher(MSHFlexGrid1.TextMatrix(I, 16))
''    Next I
''    For I = 1 To MSHFlexGrid1.Rows - 1
''        MSHFlexGrid1.TextMatrix(I, 17) = decipher(MSHFlexGrid1.TextMatrix(I, 17))
''    Next I
''End Sub
''
'Private Sub MyCommand5_Click()
'    Dim password As String
'    SSTab1.Tab = 2
'    str = "SELECT zhuangtai AS 当前状态, ID AS 流水号, banben AS 版本, yiyuanmc AS 医院名称,shishiry AS 实施人员, xiadansj AS 下单时间, yiyuanfuzher AS 医院负责人,"
'    str = str & "shoujihao AS 手机号, gudingdh AS 固定电话, sskaishisj AS 实施开始时间,ssjieshusj AS 实施结束时间, enddime AS 维护截止时间, cclx AS 乘车路线,"
'    str = str & "yiyuanmokuai AS 医院模块, xiaoshoury AS 销售人员, xitonggly AS 系统管理员,glydh AS 管理员电话, glysj AS 管理员手机, qtsm AS 其它说明, dizhi AS 地址,fukuanfs AS 付款方式"
'    str = str & " FROM yw_kehuxinxi WHERE (1 = 1) and enddime<'" & DTPicker1.Value & "' or enddime is null"
'    '构建SQL语句
'    If cbobanben.Text <> "" Then
'        str = str & " and banben='" & Trim(cbobanben.Text) & "'"
'    End If
'
'    If cbokehumc.Text <> "" Then
'        password = StringEnDeCodecn(Trim(cbokehumc.Text), 75)
'        str = str & " and yiyuanmc like '%" & password & "%'"
'    End If
'
'    If cbossry.Text <> "" Then
'        password = StringEnDeCodecn(Trim(cbossry.Text), 75)
'        str = str & " and shishiry='" & password & "'"
'    End If
'
'    If cboxs.Text <> "" Then
'        password = StringEnDeCodecn(Trim(cboxs.Text), 75)
'        str = str & " and xiaoshoury='" & password & "'"
'    End If
'
'    Set MSHFlexGrid2.DataSource = conn.Execute(str)
'
'    '解密汉字
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        For n = 3 To 4
'            MSHFlexGrid2.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid2.TextMatrix(I, n), 75)
'        Next n
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        MSHFlexGrid2.TextMatrix(I, 6) = StringEnDeCodecn(MSHFlexGrid2.TextMatrix(I, 6), 75)
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        For n = 14 To 15
'            MSHFlexGrid2.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid2.TextMatrix(I, n), 75)
'        Next n
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        For n = 18 To 20
'            MSHFlexGrid2.TextMatrix(I, n) = StringEnDeCodecn(MSHFlexGrid2.TextMatrix(I, n), 75)
'        Next n
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'
'        MSHFlexGrid2.TextMatrix(I, 12) = StringEnDeCodecn(MSHFlexGrid2.TextMatrix(I, 12), 75)
'
'    Next I
'    '解密数字
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        MSHFlexGrid2.TextMatrix(I, 7) = decipher(MSHFlexGrid2.TextMatrix(I, 7))
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        MSHFlexGrid2.TextMatrix(I, 8) = decipher(MSHFlexGrid2.TextMatrix(I, 8))
'    Next I
'
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        MSHFlexGrid2.TextMatrix(I, 16) = decipher(MSHFlexGrid2.TextMatrix(I, 16))
'    Next I
'    For I = 1 To MSHFlexGrid2.Rows - 1
'        MSHFlexGrid2.TextMatrix(I, 17) = decipher(MSHFlexGrid2.TextMatrix(I, 17))
'    Next I
'End Sub
'
Private Sub MyCommand6_Click()
'Dim s As Control
    cbobanben.Text = ""
    cbokehumc.Text = ""
    cbossry.Text = ""
    cboxs.Text = ""
    MSHFlexGrid3.Clear
    MSHFlexGrid3.Rows = 2
    MSHFlexGrid1.Clear
    MSHFlexGrid1.Rows = 2
    MSHFlexGrid2.Clear
    MSHFlexGrid2.Rows = 2
    Label4.Caption = "无"
    Label6.Caption = "无"
    Label8.Caption = "无"
    Label35.Caption = "无"
    Label12.Caption = "无"
    Label13.Caption = "无"
    Label20.Caption = "无"
    Label23.Caption = "无"
    Label37.Caption = "无"
    Label38.Caption = "无"
    Label40.Caption = "无"
    Label25.Caption = "无"
    Label27.Caption = "无"
    Label29.Caption = ""
    txtmokuai.Text = "无"
    Label42.Caption = "无"
    Label31.Caption = "无"
    Label44.Caption = "无"
    Label46.Caption = "无"
    Label17.Caption = "无"
    Label4.Caption = ""
    Label18.Caption = ""


    'For Each s In Me.Controls
    ' If TypeOf s Is Label Then s.Caption = ""
    'Next
    '
End Sub

Private Sub MyCommand7_Click()
    Dim col As New Collection
    Dim MGrid As MSHFlexGrid
    Select Case SSTab1.Tab
    Case 0
        Set MGrid = MSHFlexGrid3
     Case 1
        Set MGrid = MSHFlexGrid1
    Case 2
        Set MGrid = MSHFlexGrid2
       
        
    End Select
    
    With MGrid
        For i = 0 To .Cols - 1
            col.Add .TextMatrix(0, i)
            col.Add .TextMatrix(.row, i)
        Next i
    End With
    
    With lst1
        For i = 0 To .Cols - 1
            col.Add .cellValue(0, i)
            col.Add .cellValue(.getSelectedRow, i)
        Next
    End With
    
    col.Add "其它说明明细"
    col.Add Label42.Caption

    Call Grf.ReportDes_Auto(0, col, App.Path & "\Report\订单明细.grf")
End Sub
