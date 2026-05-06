VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form frmshengjirz 
   BackColor       =   &H00E0E0E0&
   Caption         =   "升级日志"
   ClientHeight    =   11865
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   19080
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   11865
   ScaleWidth      =   19080
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdsc 
      BackColor       =   &H00C0C0FF&
      Caption         =   "删除日志"
      Enabled         =   0   'False
      Height          =   435
      Left            =   17940
      Style           =   1  'Graphical
      TabIndex        =   53
      Top             =   8100
      Width           =   855
   End
   Begin VB.CommandButton cmdxg 
      BackColor       =   &H00C0C0FF&
      Caption         =   "修改日志"
      Enabled         =   0   'False
      Height          =   435
      Left            =   16980
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   8100
      Width           =   855
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1080
      Top             =   60
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      UseMaskColor    =   0   'False
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmshengjirz.frx":0000
            Key             =   "z"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmshengjirz.frx":08DA
            Key             =   "zxh"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmshengjirz.frx":12EC
            Key             =   "h"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmshengjirz.frx":87EE
            Key             =   "zx"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdquit 
      BackColor       =   &H00C0FFFF&
      Caption         =   "退　出"
      Height          =   495
      Left            =   6480
      Style           =   1  'Graphical
      TabIndex        =   49
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton cmdrzsh 
      BackColor       =   &H00C0C0FF&
      Caption         =   "日志审核"
      Height          =   495
      Left            =   4080
      Style           =   1  'Graphical
      TabIndex        =   48
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton cmdchaxun 
      BackColor       =   &H00C0E0FF&
      Caption         =   "查　询"
      Height          =   495
      Left            =   2880
      Style           =   1  'Graphical
      TabIndex        =   47
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton cmdqk 
      BackColor       =   &H00FFC0C0&
      Caption         =   "清　空"
      Height          =   495
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   46
      Top             =   7080
      Width           =   1095
   End
   Begin VB.CommandButton cmddaochu 
      BackColor       =   &H00C0C0FF&
      Caption         =   "日志导出"
      Height          =   495
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   45
      Top             =   7080
      Width           =   1095
   End
   Begin RichTextLib.RichTextBox txtrzgs 
      Height          =   4935
      Left            =   4320
      TabIndex        =   29
      ToolTipText     =   "双击目录可查询全部日志"
      Top             =   2100
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   8705
      _Version        =   393217
      BackColor       =   -2147483629
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      BulletIndent    =   8
      Appearance      =   0
      TextRTF         =   $"frmshengjirz.frx":D558
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin RichTextLib.RichTextBox rictxtrz 
      Height          =   4935
      Left            =   7440
      TabIndex        =   28
      Top             =   2100
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   8705
      _Version        =   393217
      BackColor       =   -2147483629
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      BulletIndent    =   8
      Appearance      =   0
      RightMargin     =   2
      TextRTF         =   $"frmshengjirz.frx":D5F5
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "日志录入"
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
      Height          =   11055
      Left            =   14760
      TabIndex        =   6
      Top             =   660
      Width           =   4215
      Begin VB.CommandButton cmdqingkong 
         BackColor       =   &H00C0E0FF&
         Caption         =   "清空"
         Height          =   435
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   27
         Top             =   7440
         Width           =   915
      End
      Begin VB.CommandButton cmdyes 
         BackColor       =   &H00C0E0FF&
         Caption         =   "日志保存"
         Height          =   435
         Left            =   1080
         Style           =   1  'Graphical
         TabIndex        =   26
         Top             =   7440
         Width           =   1035
      End
      Begin VB.ComboBox cbofbr 
         Height          =   300
         ItemData        =   "frmshengjirz.frx":D692
         Left            =   1200
         List            =   "frmshengjirz.frx":D694
         TabIndex        =   23
         Top             =   6960
         Width           =   1215
      End
      Begin VB.ComboBox cbomokuan1 
         Height          =   300
         Left            =   1080
         TabIndex        =   22
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtsjnr 
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
         Height          =   3375
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         Top             =   3480
         Width           =   3975
      End
      Begin VB.OptionButton optno 
         BackColor       =   &H00E0E0E0&
         Caption         =   "不需要测试"
         Height          =   255
         Left            =   2640
         TabIndex        =   18
         Top             =   1440
         Width           =   1215
      End
      Begin VB.OptionButton optyes 
         BackColor       =   &H00E0E0E0&
         Caption         =   "要测试"
         Height          =   255
         Left            =   1320
         TabIndex        =   17
         Top             =   1440
         Width           =   855
      End
      Begin VB.TextBox txtsjgs 
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
         Height          =   1095
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   15
         Top             =   2040
         Width           =   3975
      End
      Begin VB.ComboBox cbochuangti 
         Height          =   300
         ItemData        =   "frmshengjirz.frx":D696
         Left            =   2880
         List            =   "frmshengjirz.frx":D698
         TabIndex        =   12
         Top             =   960
         Width           =   1215
      End
      Begin VB.ComboBox cbobanben 
         Appearance      =   0  'Flat
         Height          =   300
         ItemData        =   "frmshengjirz.frx":D69A
         Left            =   2880
         List            =   "frmshengjirz.frx":D69C
         TabIndex        =   8
         Top             =   480
         Width           =   1215
      End
      Begin VB.ComboBox cbomokuan 
         Height          =   300
         Index           =   0
         Left            =   9120
         TabIndex        =   7
         Top             =   960
         Width           =   1275
      End
      Begin VB.Label txtlsh 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1080
         TabIndex        =   25
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "日志流水号"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   120
         TabIndex        =   24
         Top             =   600
         Width           =   900
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "发部工程师"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Index           =   5
         Left            =   240
         TabIndex        =   21
         Top             =   7080
         Width           =   900
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "升级内容"
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
         Left            =   120
         TabIndex        =   19
         Top             =   3240
         Width           =   780
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "是否需要测试"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Index           =   3
         Left            =   120
         TabIndex        =   16
         Top             =   1440
         Width           =   1080
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "升级概述"
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
         Index           =   2
         Left            =   120
         TabIndex        =   14
         Top             =   1800
         Width           =   780
      End
      Begin VB.Label labchuangti 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "窗体"
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
         Left            =   2400
         TabIndex        =   13
         Top             =   1020
         Width           =   420
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "模　块"
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
         Index           =   1
         Left            =   120
         TabIndex        =   11
         Top             =   1020
         Width           =   630
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
         Height          =   210
         Left            =   2040
         TabIndex        =   10
         Top             =   540
         Width           =   840
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "模 块"
         Height          =   180
         Index           =   0
         Left            =   8520
         TabIndex        =   9
         Top             =   1080
         Width           =   450
      End
   End
   Begin MSComctlLib.TreeView tv1 
      Height          =   4935
      Left            =   120
      TabIndex        =   5
      ToolTipText     =   "单击或取信息"
      Top             =   2100
      Width           =   4035
      _ExtentX        =   7117
      _ExtentY        =   8705
      _Version        =   393217
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      FullRowSelect   =   -1  'True
      HotTracking     =   -1  'True
      SingleSel       =   -1  'True
      BorderStyle     =   1
      Appearance      =   0
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "条件"
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
      Height          =   1095
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   14535
      Begin VB.ComboBox cborzfbr 
         Height          =   300
         Left            =   2280
         TabIndex        =   44
         Top             =   720
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   375
         Left            =   8520
         TabIndex        =   42
         Top             =   600
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Format          =   112328705
         CurrentDate     =   39186
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   375
         Left            =   8520
         TabIndex        =   40
         Top             =   120
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         _Version        =   393216
         Format          =   112328705
         CurrentDate     =   39186
      End
      Begin VB.ComboBox cbocheshibz 
         Height          =   300
         ItemData        =   "frmshengjirz.frx":D69E
         Left            =   4440
         List            =   "frmshengjirz.frx":D6A8
         TabIndex        =   38
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cbomokuai2 
         Height          =   300
         Left            =   4440
         TabIndex        =   36
         Top             =   240
         Width           =   1335
      End
      Begin VB.ComboBox cbobanben2 
         Height          =   300
         Left            =   2280
         TabIndex        =   34
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "发部人"
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
         Left            =   1560
         TabIndex        =   43
         Top             =   720
         Width           =   630
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束时间"
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
         Left            =   7620
         TabIndex        =   41
         Top             =   660
         Width           =   840
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始时间"
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
         Left            =   7620
         TabIndex        =   39
         Top             =   240
         Width           =   840
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "测试标志"
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
         Left            =   3600
         TabIndex        =   37
         Top             =   780
         Width           =   840
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "模块"
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
         TabIndex        =   35
         Top             =   300
         Width           =   420
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "版本号"
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
         Left            =   1680
         TabIndex        =   33
         Top             =   300
         Width           =   630
      End
      Begin VB.Label lbl6 
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   1200
         TabIndex        =   32
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "日志流水号"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   240
         TabIndex        =   31
         Top             =   360
         Width           =   900
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfdaishenglb 
      Height          =   4095
      Left            =   180
      TabIndex        =   50
      Top             =   7620
      Width           =   14415
      _ExtentX        =   25426
      _ExtentY        =   7223
      _Version        =   393216
      ForeColor       =   -2147483646
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   -2147483637
      BackColorBkg    =   12632256
      AllowUserResizing=   3
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
   Begin VB.Label Label13 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "待审核日志列表"
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
      Left            =   180
      TabIndex        =   51
      Top             =   7320
      Width           =   1365
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "日志内容"
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
      TabIndex        =   30
      Top             =   1860
      Width           =   1080
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "日志概述"
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
      Left            =   4380
      TabIndex        =   4
      Top             =   1860
      Width           =   1320
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "日志目录"
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
      Left            =   240
      TabIndex        =   3
      Top             =   1860
      Width           =   780
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
      Left            =   5160
      TabIndex        =   1
      Top             =   120
      Width           =   1725
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "升级日志"
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
      Left            =   6960
      TabIndex        =   0
      Top             =   120
      Width           =   1920
   End
End
Attribute VB_Name = "frmshengjirz"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim str2 As String
Dim str3 As String
Dim i As Integer

Private Sub cbochuangti_GotFocus()
'加载窗体名
cbochuangti.Clear                            '循环前清空组合框ITEM
Set Rs = Nothing
str3 = "select chuangtimc from zd_chuangti where mokuai='" & Trim(cbomokuan1.Text) & "'"
Rs.CursorLocation = adUseClient
Rs.Open str3, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
     cbochuangti.AddItem Rs.Fields("chuangtimc").Value
     Rs.MoveNext
  Next i
End If
Rs.Close
End Sub

Private Sub cmdchaxun_Click()

  '构建SQL语句查询数据
str = ""
str = "select rznum,wentibb,mokuai,shengjigs ,shengjinr,rizhifbr,shengjisj from yw_shengjirz where cheshibz='是' "
'If cbobanben2.Text <> "" Then
'    str = str & "and wentibb='" & cbobanben2.Text & "'"
'End If

If cbobanben2.Text <> "" Then
    str = str & "and wentibb='" & cbobanben2.Text & "'"
End If

If cbomokuai2.Text <> "" Then
    str = str & "and mokuai='" & cbomokuai2.Text & "'"
End If

If cborzfbr.Text <> "" Then
    str = str & "and rizhifbr='" & cborzfbr.Text & "'"
End If

If DTPicker1.Value <> "" Then
    str = str & "and (shengjisj between '" & DTPicker1.Value & " 00:00:00" & "' and '" & DTPicker2.Value & " 23:59:59" & "')"
End If


Set Rs = conn.Execute(str)


Call ric                             '按规则加载内容
Call loadshu                         '更新树
tv1.SetFocus
End Sub
Public Sub ric()
    Dim i As Integer
    Dim a As String      '定义数据集返回变量
    Dim b As String
    Dim c As String
    Dim D As String
    Dim e As String
    Dim f As String
    Dim strlen() As String      '变量个数
    Dim strlong As String
    Dim MySelStart As Integer, MySelLength As Integer
    
    
rictxtrz.Text = ""
'查询赋傎
If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
                a = Rs.Fields("wentibb").Value
                b = Rs.Fields("mokuai").Value
                c = Rs.Fields("shengjisj").Value
                D = Rs.Fields("shengjigs").Value
                e = Rs.Fields("shengjinr").Value
                
                '升级时间起始位
                strlong = strlong & Len(rictxtrz.Text) + Len(a) + 3 + Len(b) + 3 & ";"
                '升级概述起始位
                strlong = strlong & Len(rictxtrz.Text) + Len(a) + 8 + Len(b) + 3 + Len(CStr(c)) & ";"
                
                '升级内容起始位
                strlong = strlong & Len(rictxtrz.Text) + Len(a) + 8 + Len(b) + 8 + Len(CStr(c)) + 4 + Len(D) & ";"
                
                '则排列后给TEXT
                rictxtrz.Text = rictxtrz.Text & " " & a & "---" & b & Chr(13) & Chr(10) & "升级时间：" & c & Chr(13) & _
                                Chr(10) & "升级概述：" & D & Chr(13) & Chr(10) & "升级内容：" & Chr(13) & Chr(10) & e & Chr(13) & Chr(10) & Chr(13) & Chr(10) & Chr(13) & Chr(10)
             
                Rs.MoveNext
                

       Next i
       
       '记录每个变量的傎并用分号格开
       strlen = Split(strlong, ";")
       
       'UBound返回Split函数的个数，然后循环
       For i = 0 To UBound(strlen) - 1
                        rictxtrz.SelStart = strlen(i)
                If i Mod 3 = 0 Then
                  rictxtrz.SelLength = 5
                  rictxtrz.SelBold = True
                Else
                  rictxtrz.SelLength = 7
                  rictxtrz.SelBold = True
                End If
                        
                    '恢复之前的光标位置和选定长度
            rictxtrz.SelStart = MySelStart
            rictxtrz.SelLength = MySelLength
        Next i
       txtrzgs.Text = "当前条件的所有日志已全部显示在下表中，可按导出日志按钮导出所选日志！"
       
'还原RichTextBox的光标位置和选定长度
    MySelStart = rictxtrz.SelStart
    MySelLength = rictxtrz.SelLength

       
    Else
        txtrzgs.Text = ""
        rictxtrz.Text = ""
        MsgBox "当前查询没有记录！", vbOKOnly + vbInformation, "提示"
        
    End If
End Sub


Private Sub cmddaochu_Click()
   rictxtrz.SaveFile "升级日志.txt", 1
   MsgBox "日志导出成功，在程序根目录下！", vbOKOnly + vbQuestion, "提示"
End Sub

Private Sub cmdqingkong_Click()
txtlsh.Caption = ""
cbobanben.Text = ""
cbomokuan1.Text = ""
cbochuangti.Text = ""
txtsjgs.Text = ""
txtsjnr.Text = ""
cmdxg.Enabled = False
cmdsc.Enabled = False
End Sub

Private Sub cmdqk_Click()
 Call clearrizhi
 tv1.Nodes.Clear
 Call loadshu
 txtlsh.Caption = ""
 txtsjgs.Text = ""
 txtsjnr.Text = ""
 cmdxg.Enabled = False
cmdsc.Enabled = False
tv1.SetFocus
End Sub

Private Sub cmdquit_Click()
Unload Me
End Sub

Private Sub cmdrzsh_Click()
If lbl6.Caption <> "" Then

    If MsgBox("确定要审核吗？", vbYesNo + vbQuestion, "提示") = vbYes Then
        str = "update yw_shengjirz set cheshibz='是' where rznum='" & Trim(lbl6.Caption) & "'"
        Set Rs = conn.Execute(str)
        Call clearrizhi
        MsgBox "日志审核成功！", vbOKOnly + vbInformation, "提示"
    End If
Else
    MsgBox "请先选择一个待审核的日志！", vbInformation + vbOKOnly, "提示"
End If
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub cmdsc_Click()

If txtlsh.Caption <> "" Then
    If MsgBox("确定要删除日志吗？它将不可恢复！", vbYesNo + vbQuestion, "提示") = vbYes Then
    
      Set Rs = conn.Execute("delete from yw_shengjirz where rznum='" & Trim(txtlsh.Caption & "'"))
      Call loadshu
      txtsjgs.Text = ""
      txtsjnr.Text = ""
      txtlsh.Caption = ""
      Call loadshu
      tv1.SetFocus
      MsgBox "日志删除成功！", vbOKOnly + vbInformation, "提示"
    Else
        Exit Sub
    End If
End If
End Sub

Private Sub cmdxg_Click()
If MsgBox("确定要修改日志吗？", vbYesNo + vbQuestion, "提示") = vbYes Then
    If txtlsh.Caption <> "" Then
        Set Rs = conn.Execute("update yw_shengjirz set shengjigs='" & Trim(txtsjgs.Text) & "',shengjinr='" & Trim(txtsjnr.Text) & "'where rznum='" & Trim(txtlsh.Caption) & "'")
        Call loadshu
        txtsjgs.Text = ""
        txtsjnr.Text = ""
        txtlsh.Caption = ""
        Call loadshu
        tv1.SetFocus
        MsgBox "日志修改成功", vbOKOnly + vbInformation, "提示"
    End If
End If
End Sub

Private Sub cmdyes_Click()
 txtsjgs.Text = Replace(Trim(txtsjgs.Text), "'", "''")          '替换文本中的单引号
 txtsjnr.Text = Replace(Trim(txtsjnr.Text), "'", "''")
 
'判断各必录项不能为空
If cbobanben.Text = "" Then
    MsgBox "版本不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If

If cbomokuan1.Text = "" Then
    MsgBox "模块不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If

If cbochuangti.Text = "" Then
    MsgBox "窗体不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If

If txtsjgs.Text = "" Then
    MsgBox "日志概述不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If

If txtsjnr.Text = "" Then
    MsgBox "日志内容不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If

If cbofbr.Text = "" Then
    MsgBox "日志发表人不能为空", vbOKOnly + vbInformation, "提示"
    Exit Sub
End If



'从库中取出最大流水号＋1
str = "select rzlsh from ok"
Rs.Open str, conn
    If Not Rs.EOF Then
        Rs.MoveFirst
        txtlsh.Caption = Rs.Fields("rzlsh").Value + 1
    End If
    Set Rs = Nothing
    
  '更新OK表的最大日志流水号
  Set Rs = conn.Execute("update ok set rzlsh='" & Trim(txtlsh.Caption) & "'")
    
'向库中写入日志数据
str = ""
str = "insert into yw_shengjirz (wentibb,mokuai,chuangti,csyesno,shengjigs,shengjinr,shengjisj,rizhifbr,cheshibz,rznum)  values "
str = str & "('" & Trim(cbobanben.Text) & "','" & Trim(cbomokuan1.Text) & "','" & Trim(cbochuangti.Text) & "','是'"
str = str & ",'" & Trim(txtsjgs.Text) & "','" & Trim(txtsjnr.Text) & "','" & Now & "','" & Trim(cbofbr.Text) & "','否','" & Trim(txtlsh.Caption) & "')"

Rs.Open str, conn
Set Rs = Nothing

'如果不需要测试则修改相应标志
If optyes.Value = False Then
    str = ""
    str = "update yw_shengjirz set csyesno='否',cheshibz='是' where rznum='" & Trim(txtlsh.Caption) & "'"
    
    Set Rs = conn.Execute(str)

End If

  MsgBox "日志成功保存！", vbOKOnly + vbInformation, "友情提示"
  
  Call cmdqingkong_Click         '调用清空过程
  Set Rs = Nothing
End Sub

Private Sub Form_Load()
Dim iten As ListItem
Dim i As Integer
Dim inod As Integer
Dim myNod As Node
Dim str1 As String
Dim Rs1 As New ADODB.Recordset

DTPicker1.Value = "2007-1-1"
DTPicker2.Value = Format(Now, "yyyy-mm-dd")
optno.Value = True
cbofbr.Text = user
cmddaochu.Enabled = False
'加载模块
Set Rs = Nothing
str2 = "select mokuaimc from zd_mokuai"
Rs.CursorLocation = adUseClient
Rs.Open str2, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
    cbomokuan1.AddItem Rs.Fields("mokuaimc").Value
    Rs.MoveNext
  Next i
End If
Rs.Close


'加载版本
Set Rs = Nothing
str = "select banben from yw_banben"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cbobanben2.AddItem Rs.Fields("banben").Value
      Rs.MoveNext
  Next i
End If
  Set Rs = Nothing
  
    '加载版本
Set Rs = Nothing
str1 = "select banben from yw_banben"
Rs.CursorLocation = adUseClient
Rs.Open str1, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cbobanben.AddItem Rs.Fields("banben").Value
      Rs.MoveNext
  Next i
  Rs.Close
End If
  
  '加载模块
Set Rs = Nothing
str = "select mokuaimc from zd_mokuai"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cbomokuai2.AddItem Rs.Fields("mokuaimc").Value
      Rs.MoveNext
  Next i
End If
  Set Rs = Nothing
  
    '加载日志人员
Set Rs = Nothing
str = "select usename from [user] where zhuangtai='1'"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cborzfbr.AddItem Rs.Fields("usename").Value
      Rs.MoveNext
  Next i
End If
  Set Rs = Nothing
  
  '加载人员
Set Rs = Nothing
str = "select usename from [user]"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cbofbr.AddItem Rs.Fields("usename").Value
      Rs.MoveNext
  Next i
End If
  Set Rs = Nothing
  
'加载树
Call loadshu
'加载待测试列表
Call daishengrz
End Sub
Public Sub loadshu()
    Dim myNod As Node
    Dim inod As Integer
    Dim str1 As String
    Dim Rs1 As ADODB.Recordset
    
   tv1.Nodes.Clear                            '先清空树
   
  Set tv1.ImageList = ImageList1                             '绑定IMAGELIST控件
  Set myNod = tv1.Nodes.Add(, tvwChild, "NEW", "EU-HIS 系统", "zx")
    
str = ""
str = "select banben from yw_banben"
'rs.CursorLocation = adUseClient
Set Rs = conn.Execute(str)

If Not Rs.EOF Then
    Rs.MoveFirst
    '循环插入树根节点
    For inod = 1 To Rs.RecordCount
       
       Set myNod = tv1.Nodes.Add("NEW", tvwChild, "n" & inod, Rs.Fields("banben").Value, "zxh")
       '构建SQL语句
       str1 = "select shengjisj from yw_shengjirz where wentibb='" & Trim(Rs.Fields("banben").Value) & "' and cheshibz='是' "
'            If cbobanben2.Text <> "" Then
'                str1 = "select shengjisj from yw_shengjirz where wentibb='" & Trim(cbobanben2.Text) & "' and cheshibz='是'"
'            End If
            
            If cbomokuai2.Text <> "" Then
                str1 = str1 & "and mokuai='" & cbomokuai2.Text & "'"
            End If
            
            If cborzfbr.Text <> "" Then
                str1 = str1 & "and rizhifbr='" & cborzfbr.Text & "'"
            End If
            
            If DTPicker1.Value <> "" Then
                str1 = str1 & "and (shengjisj between '" & DTPicker1.Value & " 00:00:00" & "' and '" & DTPicker2.Value & " 23:59:59" & "')"
            End If
           str1 = str1 & "order by shengjisj DESC"
      Set Rs1 = conn.Execute(str1)
       If Not Rs1.EOF Then
            Rs1.MoveFirst
            '循环插入树对应的子节点
            For i = 1 To Rs1.RecordCount
                
                Set myNod = tv1.Nodes.Add("n" & inod, tvwChild, "n" & inod & i, Rs1.Fields("shengjisj").Value, "z")
                Rs1.MoveNext
            Next i
            Set Rs1 = Nothing
       End If
          Rs.MoveNext
    Next inod
End If
End Sub
Public Sub daishengrz()
'定义加载网格过程
str = "select rznum as '流水号',wentibb as '版本',mokuai as '模块',shengjigs as '升级概述',shengjinr as '升级内容',rizhifbr as '日志发部人',shengjisj as '升级时间' from yw_shengjirz where cheshibz='否'"
Set Rs = conn.Execute(str)
Set msfdaishenglb.DataSource = Rs
msfdaishenglb.ColWidth(0) = 700
msfdaishenglb.ColWidth(3) = 2000
msfdaishenglb.ColWidth(4) = 3300
msfdaishenglb.ColWidth(5) = 2000
End Sub
Public Sub clearrizhi()
'定义清空过程
    lbl6.Caption = ""
    cbobanben2.Text = ""
    cbomokuai2.Text = ""
    cborzfbr.Text = ""
    cbocheshibz.Text = ""
    txtrzgs.Text = ""
    rictxtrz.Text = ""
    Call daishengrz
End Sub

Private Sub mshdaishenghe_Click()

End Sub

Private Sub Form_Resize()
On Error GoTo CJY
    Frame2.Width = Me.Width - Frame2.Left - 50
    Frame2.Height = Me.ScaleHeight - Frame2.Top
    msfdaishenglb.Height = Me.ScaleHeight - msfdaishenglb.Top
CJY:
End Sub

Private Sub msfdaishenglb_Click()
'使当前行的背景色突出显示
 Me.msfdaishenglb.FocusRect = flexFocusNone
  Me.msfdaishenglb.SelectionMode = flexSelectionByRow
  Me.msfdaishenglb.BackColorSel = 8421631
  
  
  '装载数据
  If Me.msfdaishenglb.TextMatrix(msfdaishenglb.row, 0) = "流水号" Then
    Exit Sub
  End If
If Me.msfdaishenglb.TextMatrix(msfdaishenglb.row, 1) <> "" Then
    cbobanben2.Text = msfdaishenglb.TextMatrix(msfdaishenglb.row, 1)
    lbl6.Caption = msfdaishenglb.TextMatrix(msfdaishenglb.row, 0)
    cbomokuai2.Text = msfdaishenglb.TextMatrix(msfdaishenglb.row, 2)
    cborzfbr.Text = msfdaishenglb.TextMatrix(msfdaishenglb.row, 5)
    cbocheshibz.Text = "否"
    txtrzgs.Text = cbobanben2.Text & "---" & cbomokuai2.Text & Chr(13) & Chr(10) & "升级时间：" & _
    msfdaishenglb.TextMatrix(msfdaishenglb.row, 6) & Chr(13) & Chr(10) & "升级概述：" & Chr(13) & Chr(10) & _
    msfdaishenglb.TextMatrix(msfdaishenglb.row, 3)
    rictxtrz.Text = "升级内容：" & Chr(13) & Chr(10) & msfdaishenglb.TextMatrix(msfdaishenglb.row, 4)
End If
End Sub



Private Sub rictxtrz_Change()
If rictxtrz.Text <> "" Then
    cmddaochu.Enabled = True
Else
    cmddaochu.Enabled = False
End If
End Sub

Private Sub tv1_Click()



cmdxg.Enabled = True         '初始化按钮
cmdsc.Enabled = True

'查询日志并显示

str = "select shengjisj,wentibb,mokuai,shengjigs,shengjinr,rznum from yw_shengjirz where shengjisj = '" & Trim(tv1.SelectedItem.Text) & "' "
    On Error GoTo zxh
Set Rs = conn.Execute(str)

If Not Rs.EOF Then
    txtrzgs.Text = Rs.Fields("wentibb").Value & "---" & Rs.Fields("mokuai").Value & Chr(13) & Chr(10) & _
    "日志时间：" & Rs.Fields("shengjisj").Value & Chr(13) & Chr(10) & "日志概述：" & Rs.Fields("shengjigs").Value
    
    rictxtrz.Text = "日志内容：" & Chr(13) & Chr(10) & Rs.Fields("shengjinr").Value
    
    txtsjgs.Text = Rs.Fields("shengjigs").Value     '赋傎
    txtsjnr.Text = Rs.Fields("shengjinr").Value
    txtlsh.Caption = Rs.Fields("rznum").Value

End If
  Exit Sub
zxh:
  str = "select shengjisj,wentibb,mokuai,shengjigs,shengjinr,rznum from yw_shengjirz where shengjisj = '1900-1-1' "
    rictxtrz.Text = ""
    txtrzgs.Text = ""
    txtsjgs.Text = ""
    txtsjnr.Text = ""
    txtlsh.Caption = ""
 Exit Sub
End Sub

Private Sub tv1_DblClick()


cmdxg.Enabled = False       '初始化按钮
cmdsc.Enabled = False

rictxtrz.Text = ""        '清空文本框

'双击节点时，将查询到的内容加到TEXT中
    str = ""
    str = "select shengjisj,wentibb,mokuai,shengjigs,shengjinr from yw_shengjirz where wentibb='" & tv1.SelectedItem.Text & "' "
Set Rs = conn.Execute(str)

Call ric
    
End Sub


