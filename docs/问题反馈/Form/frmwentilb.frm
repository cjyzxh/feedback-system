VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmwentilb 
   BackColor       =   &H00FFFFFF&
   Caption         =   "问题列表"
   ClientHeight    =   10395
   ClientLeft      =   60
   ClientTop       =   1725
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   10395
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.PictureBox Command1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   11880
      Picture         =   "frmwentilb.frx":0000
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   66
      Top             =   4590
      Width           =   1230
   End
   Begin VB.PictureBox cmdtuichu 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   9285
      Picture         =   "frmwentilb.frx":0B7B
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   65
      Top             =   4590
      Width           =   1230
   End
   Begin VB.PictureBox Command3 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   7935
      Picture         =   "frmwentilb.frx":146E
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   64
      Top             =   4590
      Width           =   1230
   End
   Begin VB.PictureBox Command2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   10560
      Picture         =   "frmwentilb.frx":202C
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   63
      Top             =   4590
      Width           =   1230
   End
   Begin VB.PictureBox cmddaying 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   6555
      Picture         =   "frmwentilb.frx":298E
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   62
      Top             =   4590
      Width           =   1230
   End
   Begin VB.PictureBox cmdchaxun 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   5190
      Picture         =   "frmwentilb.frx":357B
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   61
      Top             =   4575
      Width           =   1230
   End
   Begin VB.PictureBox cmdqingkong 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   3900
      Picture         =   "frmwentilb.frx":3EC5
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   59
      Top             =   4575
      Width           =   1230
   End
   Begin VB.Frame Frame4 
      BackColor       =   &H00FFFFFF&
      Caption         =   "查询条件三"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   3960
      TabIndex        =   48
      Top             =   3600
      Width           =   11055
      Begin VB.TextBox txtxgsj 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   9000
         TabIndex        =   58
         Top             =   600
         Width           =   1935
      End
      Begin VB.TextBox txtlrsj 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   9000
         TabIndex        =   57
         Top             =   240
         Width           =   1935
      End
      Begin VB.TextBox txtlsh 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   6960
         TabIndex        =   54
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox txtbanbenh 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   4920
         TabIndex        =   51
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtchaxun 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   1800
         TabIndex        =   50
         Top             =   240
         Width           =   2295
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题修改时间"
         Height          =   180
         Left            =   7800
         TabIndex        =   56
         Top             =   720
         Width           =   1080
      End
      Begin VB.Label Label19 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "问题录入时间"
         ForeColor       =   &H80000008&
         Height          =   180
         Index           =   1
         Left            =   7800
         TabIndex        =   55
         Top             =   360
         Width           =   1080
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "流水号"
         Height          =   180
         Left            =   6360
         TabIndex        =   53
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "版本号"
         Height          =   180
         Left            =   4320
         TabIndex        =   52
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "原始问题模糊查询"
         Height          =   180
         Left            =   240
         TabIndex        =   49
         Top             =   360
         Width           =   1440
      End
   End
   Begin VB.TextBox txtwtlx 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   60
      TabIndex        =   47
      Top             =   9120
      Width           =   3735
   End
   Begin VB.TextBox txt4 
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
      Height          =   1635
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   38
      Top             =   7140
      Width           =   3735
   End
   Begin VB.TextBox txt3 
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
      Height          =   1635
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   37
      Top             =   5100
      Width           =   3735
   End
   Begin VB.TextBox txt2 
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
      Height          =   1635
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   36
      Top             =   3060
      Width           =   3735
   End
   Begin VB.TextBox txt1 
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
      Height          =   1635
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   35
      Top             =   1020
      Width           =   3735
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00FFFFFF&
      Caption         =   "查询条件二"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   3960
      TabIndex        =   12
      Top             =   2040
      Width           =   11055
      Begin VB.OptionButton Option3 
         BackColor       =   &H8000000B&
         Caption         =   "Option3"
         Height          =   255
         Left            =   6720
         TabIndex        =   73
         Top             =   1155
         Width           =   255
      End
      Begin VB.OptionButton Option2 
         BackColor       =   &H8000000B&
         Caption         =   "Option2"
         Height          =   180
         Left            =   3960
         TabIndex        =   72
         Top             =   1200
         Width           =   255
      End
      Begin VB.OptionButton Option1 
         BackColor       =   &H8000000B&
         Caption         =   "Option1"
         Height          =   180
         Left            =   960
         TabIndex        =   71
         Top             =   1200
         Width           =   255
      End
      Begin VB.OptionButton optsh 
         BackColor       =   &H8000000B&
         Caption         =   "Option3"
         Height          =   255
         Left            =   5400
         TabIndex        =   30
         Top             =   360
         Width           =   255
      End
      Begin VB.OptionButton optsz 
         BackColor       =   &H8000000B&
         Caption         =   "Option2"
         Height          =   255
         Left            =   240
         TabIndex        =   29
         Top             =   360
         Width           =   255
      End
      Begin VB.OptionButton optgcs 
         BackColor       =   &H8000000B&
         Caption         =   "Option1"
         Height          =   255
         Left            =   2640
         TabIndex        =   28
         Top             =   360
         Width           =   255
      End
      Begin VB.ComboBox cbojingjicd 
         ForeColor       =   &H00FF0000&
         Height          =   300
         ItemData        =   "frmwentilb.frx":47D4
         Left            =   9240
         List            =   "frmwentilb.frx":47E1
         TabIndex        =   26
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cboshouhoucs 
         Height          =   300
         Left            =   6480
         TabIndex        =   24
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cboshouzhongcs 
         Height          =   300
         Left            =   1320
         TabIndex        =   22
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox cbogongcs 
         Height          =   300
         ItemData        =   "frmwentilb.frx":47F5
         Left            =   3840
         List            =   "frmwentilb.frx":47F7
         TabIndex        =   19
         Top             =   240
         Width           =   1335
      End
      Begin VB.ComboBox cboshouhoubz 
         Height          =   300
         ItemData        =   "frmwentilb.frx":47F9
         Left            =   6480
         List            =   "frmwentilb.frx":4803
         TabIndex        =   18
         Top             =   720
         Width           =   1095
      End
      Begin VB.ComboBox cbogcsbz 
         Height          =   300
         ItemData        =   "frmwentilb.frx":480F
         Left            =   3840
         List            =   "frmwentilb.frx":4819
         TabIndex        =   16
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cboshouzhongbz 
         Enabled         =   0   'False
         Height          =   300
         ItemData        =   "frmwentilb.frx":4825
         Left            =   1320
         List            =   "frmwentilb.frx":482F
         TabIndex        =   14
         Text            =   "是"
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "按问题测试时间查询"
         Height          =   180
         Left            =   7080
         TabIndex        =   70
         Top             =   1200
         Width           =   1620
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "按问题处理时间查询"
         Height          =   180
         Left            =   4320
         TabIndex        =   69
         Top             =   1200
         Width           =   1620
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "按问题录入时间查询"
         Height          =   180
         Left            =   1320
         TabIndex        =   68
         Top             =   1200
         Width           =   1620
      End
      Begin VB.Label labshuliang 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   210
         Left            =   9720
         TabIndex        =   34
         Top             =   840
         Width           =   120
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "个"
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
         Left            =   10080
         TabIndex        =   33
         Top             =   840
         Width           =   195
      End
      Begin VB.Label txtshuliang 
         Alignment       =   2  'Center
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
         Left            =   12240
         TabIndex        =   32
         Top             =   240
         Width           =   120
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "当前问题数量："
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
         Left            =   8280
         TabIndex        =   27
         Top             =   840
         Width           =   1365
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "紧急程度"
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
         Left            =   8280
         TabIndex        =   25
         Top             =   360
         Width           =   780
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "售后测试"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5640
         TabIndex        =   23
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "售中测试"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   0
         Left            =   480
         TabIndex        =   21
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "修改工程师"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   2880
         TabIndex        =   20
         Top             =   360
         Width           =   900
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "售后标志"
         Height          =   180
         Left            =   5640
         TabIndex        =   17
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "工程师标志"
         Height          =   180
         Left            =   2880
         TabIndex        =   15
         Top             =   840
         Width           =   900
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "售中标志"
         Height          =   180
         Left            =   480
         TabIndex        =   13
         Top             =   840
         Width           =   720
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "查询条件一"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   3960
      TabIndex        =   0
      Top             =   720
      Width           =   11055
      Begin VB.ComboBox cbowentilx 
         ForeColor       =   &H00C00000&
         Height          =   300
         ItemData        =   "frmwentilb.frx":483B
         Left            =   1080
         List            =   "frmwentilb.frx":4851
         TabIndex        =   45
         Top             =   720
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dtpjssj 
         Height          =   375
         Left            =   6240
         TabIndex        =   43
         Top             =   720
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         _Version        =   393216
         Format          =   310575105
         CurrentDate     =   39058
      End
      Begin MSComCtl2.DTPicker dtpkssj 
         Height          =   375
         Left            =   3600
         TabIndex        =   42
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         _Version        =   393216
         Format          =   310378497
         CurrentDate     =   39058
      End
      Begin VB.Frame Frame1 
         Caption         =   "Frame1"
         Height          =   15
         Left            =   0
         TabIndex        =   11
         Top             =   1200
         Width           =   11055
      End
      Begin VB.ComboBox cbomokuan 
         Height          =   300
         Left            =   9240
         TabIndex        =   4
         Top             =   240
         Width           =   1275
      End
      Begin VB.ComboBox cmbshishiry 
         Height          =   300
         Left            =   7200
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   3240
         TabIndex        =   2
         Top             =   240
         Width           =   2895
      End
      Begin VB.ComboBox cbobanben 
         Appearance      =   0  'Flat
         Height          =   300
         ItemData        =   "frmwentilb.frx":489B
         Left            =   1080
         List            =   "frmwentilb.frx":48AE
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题类型"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   240
         TabIndex        =   44
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5400
         TabIndex        =   10
         Top             =   840
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   12720
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   2760
         TabIndex        =   9
         Top             =   840
         Width           =   720
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "模 块"
         Height          =   180
         Left            =   8640
         TabIndex        =   8
         Top             =   360
         Width           =   450
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Left            =   6360
         TabIndex        =   7
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labyiyuanmc 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "医院名称"
         Height          =   180
         Left            =   2400
         TabIndex        =   6
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labruanjianbb 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         Height          =   180
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   720
      End
      Begin VB.Image pic1 
         BorderStyle     =   1  'Fixed Single
         Height          =   2175
         Left            =   12240
         Stretch         =   -1  'True
         Top             =   1560
         Width           =   2655
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfwentilb 
      Height          =   4215
      Left            =   3900
      TabIndex        =   31
      Top             =   5100
      Width           =   11235
      _ExtentX        =   19817
      _ExtentY        =   7435
      _Version        =   393216
      BackColor       =   -2147483634
      ForeColor       =   14841123
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
      AllowUserResizing=   3
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
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
   Begin VB.Label Label18 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "按问题录入时间查询"
      Height          =   180
      Left            =   5280
      TabIndex        =   67
      Top             =   3240
      Width           =   1620
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   4
      Left            =   360
      Picture         =   "frmwentilb.frx":48E5
      Top             =   8790
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   3
      Left            =   360
      Picture         =   "frmwentilb.frx":4DD9
      Top             =   6780
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   2
      Left            =   360
      Picture         =   "frmwentilb.frx":52CD
      Top             =   4740
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   1
      Left            =   360
      Picture         =   "frmwentilb.frx":57C1
      Top             =   2700
      Width           =   450
   End
   Begin VB.Label Label12 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "原始问题说明"
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
      Left            =   840
      TabIndex        =   60
      Top             =   720
      Width           =   1170
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   0
      Left            =   360
      Picture         =   "frmwentilb.frx":5CB5
      Top             =   660
      Width           =   450
   End
   Begin VB.Image Image1 
      Height          =   690
      Left            =   4920
      Picture         =   "frmwentilb.frx":61A9
      Top             =   60
      Width           =   5445
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题类型"
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
      Index           =   1
      Left            =   900
      TabIndex        =   46
      Top             =   8850
      Width           =   780
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "修改后测试说明"
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
      Index           =   0
      Left            =   840
      TabIndex        =   41
      Top             =   6840
      Width           =   1365
   End
   Begin VB.Label Label14 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "工程师修改说明"
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
      Left            =   840
      TabIndex        =   40
      Top             =   4800
      Width           =   1365
   End
   Begin VB.Label Label13 
      AutoSize        =   -1  'True
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
      ForeColor       =   &H00000000&
      Height          =   180
      Left            =   840
      TabIndex        =   39
      Top             =   2760
      Width           =   1170
   End
End
Attribute VB_Name = "frmwentilb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim str1 As String
Private Sub cmdchaxun_Click()

msfwentilb.Clear


                       '根据不同情况选择查询时间的种类
If cbogongcs.Text <> "" And cbogcsbz.Text = "是" Then
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型' from yw_wentilb where (xgsj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') "
Else
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

'If cboshouzhongcs.Text <> "" Then
'str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
'End If

If cboshouhoucs.Text <> "" And cboshouhoubz.Text = "是" Then
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (cssj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
Else
    'str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '1900-1-1 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

If cbogongcs.Text = "" And cboshouhoucs.Text = "" Then
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

'开始查询,根据所选条件判断SQL语句
'str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb"
'str1 = str1 & " where 1=1"
 If cbobanben.Text <> "" Then
    str1 = str1 & "and banben='" & Trim(cbobanben.Text) & "'"
 End If
 If cboyiyuanmc.Text <> "" Then
    str1 = str1 & "and yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
 End If
 If cmbshishiry.Text <> "" Then
    str1 = str1 & "and shishiry='" & Trim(cmbshishiry.Text) & "'"
End If
If cbomokuan.Text <> "" Then
    str1 = str1 & "and mokuai='" & Trim(cbomokuan.Text) & "'"
End If
If cboshouzhongbz.Text <> "" Then
    str1 = str1 & "and shouzhongbz='" & Trim(cboshouzhongbz.Text) & "'"
End If

If cbogcsbz.Text <> "" Then
    str1 = str1 & "and gongchengsbz='" & Trim(cbogcsbz.Text) & "'"
End If
If cboshouhoubz.Text <> "" Then
    str1 = str1 & "and shouhoubz='" & Trim(cboshouhoubz.Text) & "'"
End If
If cboshouzhongbz.Text <> "" Then
    str1 = str1 & "and shouzhongbz='" & Trim(cboshouzhongbz.Text) & "'"
End If
If cbogongcs.Text <> "" Then
    str1 = str1 & "and xggcs='" & Trim(cbogongcs.Text) & "'"
End If
If cboshouzhongcs.Text <> "" Then
    str1 = str1 & "and szcsgcs='" & Trim(cboshouzhongcs.Text) & "'"
End If

If cbojingjicd.Text <> "" Then
    str1 = str1 & "and jingjicd='" & Trim(cbojingjicd.Text) & "'"
End If
If cboshouhoucs.Text <> "" Then
    str1 = str1 & "and shcsgcs='" & Trim(cboshouhoucs.Text) & "'"
End If
If cbowentilx.Text <> "" Then
    str1 = str1 & "and wentilx='" & Trim(cbowentilx.Text) & "'"
End If

If txtbanbenh.Text <> "" Then
    str1 = str1 & "and shouhoucs like '%" & Trim(txtbanbenh.Text) & "%'"
End If

If txtchaxun.Text <> "" Then
    str1 = str1 & "and wentism like '%" & Trim(txtchaxun.Text) & "%'"
End If


If txtlsh.Text <> "" Then
    str1 = str1 & "and lsh='" & Trim(txtlsh.Text) & "'"
End If

 '打开记录集，加载数据到网格

  Rs.Open str1, conn, 1, 3
    If Not Rs.EOF Then
        Set msfwentilb.DataSource = Rs
        Rs.Close
    Else
        msfwentilb.Rows = 2
        MsgBox "没有满足条件的数据", vbOKOnly + vbInformation, "提示"
        Rs.Close
    End If
'取当前问题数量
If msfwentilb.TextMatrix(0, 0) <> "" Then
    labshuliang.Caption = msfwentilb.Rows - 1
Else
    labshuliang.Caption = 0
End If
End Sub

Private Sub cmdchaxun_GotFocus()
cmdchaxun.Picture = LoadPicture(App.Path & "\pic\按妞－查-询1.jpg")
End Sub

Private Sub cmdchaxun_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdchaxun.Picture = LoadPicture(App.Path & "\pic\按妞－查-询.jpg")
End Sub

Private Sub cmddaying_Click()
str1 = "1=1"                        '根据不同情况选择查询时间的种类
If cbogongcs.Text <> "" Then
str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师' from yw_wentilb where (xgsj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

If cboshouzhongcs.Text <> "" Then
str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师' from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

If cboshouhoucs.Text <> "" Then
str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师' from yw_wentilb where (cssj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

If cbogongcs.Text = "" And cboshouzhongcs.Text = "" And cboshouhoucs.Text = "" Then
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师' from yw_wentilb where (lvrusj between '1900-1-1 00:00:01' and '" & dtpjssj.Value & " 23:59:59')"
End If

'开始查询,根据所选条件判断SQL语句

 If cbobanben.Text <> "" Then
    str1 = str1 & "and banben='" & Trim(cbobanben.Text) & "'"
 End If
 If cboyiyuanmc.Text <> "" Then
    str1 = str1 & "and yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
 End If
 If cmbshishiry.Text <> "" Then
    str1 = str1 & "and shishiry='" & Trim(cmbshishiry.Text) & "'"
End If
If cbomokuan.Text <> "" Then
    str1 = str1 & "and mokuai='" & Trim(cbomokuan.Text) & "'"
End If
If cboshouzhongbz.Text <> "" Then
    str1 = str1 & "and shouzhongbz='" & Trim(cboshouzhongbz.Text) & "'"
End If

If cbogcsbz.Text <> "" Then
    str1 = str1 & "and gongchengsbz='" & Trim(cbogcsbz.Text) & "'"
End If
If cboshouhoubz.Text <> "" Then
    str1 = str1 & "and shouhoubz='" & Trim(cboshouhoubz.Text) & "'"
End If
If cboshouzhongbz.Text <> "" Then
    str1 = str1 & "and shouzhongbz='" & Trim(cboshouzhongbz.Text) & "'"
End If
If cbogongcs.Text <> "" Then
    str1 = str1 & "and xggcs='" & Trim(cbogongcs.Text) & "'"
End If
If cboshouzhongcs.Text <> "" Then
    str1 = str1 & "and szcsgcs='" & Trim(cboshouzhongcs.Text) & "'"
End If

If cbojingjicd.Text <> "" Then
    str1 = str1 & "and jingjicd='" & Trim(cbojingjicd.Text) & "'"
End If
If cboshouhoucs.Text <> "" Then
    str1 = str1 & "and shcsgcs='" & Trim(cboshouhoucs.Text) & "'"
End If
If cbowentilx.Text <> "" Then
    str1 = str1 & "and wentilx='" & Trim(cbowentilx.Text) & "'"
End If
 '打开记录集，加载数据到网格

  Rs.Open str1, conn, 1, 3
    If Not Rs.EOF Then
        Set msfwentilb.DataSource = Rs
        Rs.Close
    Else
        MsgBox "没有满足条件的数据", vbOKOnly + vbInformation, "提示"
        Rs.Close
    End If
Call PrintList
End Sub
Private Sub PrintList()

Dim strSource, strDestination As String

Dim asTempArray()

Dim INumRows As Long

Dim objExcel As Excel.Application

Dim objRange As Excel.Range

On Error GoTo ExcelError

Set objExcel = New Excel.Application '新建一个Excel

Dim Rs As New ADODB.Recordset

Set Rs = conn.Execute(str1) 'sqlall是查询语句

If Not Rs.EOF Then

     objExcel.Workbooks.Open App.Path & "\report\cjysoft.xls"

     MsgBox "查询结果导出后，请将其另存为一个.xls文件，使cjysoft.xls中的内容为空，确保后面查询结果的正确导出。", vbOKOnly + vbInformation, "友情提示"

    INumRows = FillDataArray(asTempArray, Rs) '调填充数组函数

    objExcel.Cells(1, 1) = "查询结果"    '填表头

    Set objRange = objExcel.Range(objExcel.Cells(2, 1), objExcel.Cells(INumRows, Rs.Fields.Count))
    

    objRange.Value = asTempArray                '填数据

 

End If

    objExcel.Visible = True                      '显示Excel

    objExcel.DisplayAlerts = True                '提示保存Excel
'    objRange.Value = objExcel.Application.WorksheetFunction.Substitute(objRange.Value, " ", "")

    Exit Sub

ExcelError:

  If Err <> 432 And Err > 0 Then

    MsgBox Error$

    Set objExcel = Nothing

    Exit Sub

  Else

    Resume Next

  End If

End Sub

Private Sub cmddaying_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmddaying.Picture = LoadPicture(App.Path & "\pic\按妞－导出XLS表.jpg")
End Sub

Private Sub cmdqingkong_Click()
txt1.Text = ""
txt2.Text = ""
txt3.Text = ""
txt4.Text = ""
txtwtlx.Text = ""
msfwentilb.Clear
msfwentilb.Rows = 2
cbobanben.Text = ""
cboyiyuanmc.Text = ""
cmbshishiry.Text = ""
cbomokuan.Text = ""
cbowentilx.Text = ""
cboshouzhongcs.Text = ""
cboshouzhongbz.Text = ""
cbogongcs.Text = ""
cbogcsbz.Text = ""
cboshouhoucs.Text = ""
cboshouhoubz.Text = ""
cbojingjicd.Text = ""
labshuliang.Caption = ""
txtlsh.Text = ""
End Sub





Private Sub cmdqingkong_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdqingkong.Picture = LoadPicture(App.Path & "\pic\按妞－清空.jpg")
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub



Private Sub cmdtuichu_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdtuichu.Picture = LoadPicture(App.Path & "\pic\按妞－退-出.jpg")
End Sub

Private Sub Command1_Click()
If txt1.Text = "" Then
    Exit Sub
End If

tplsh = msfwentilb.TextMatrix(msfwentilb.row, 0)
Rs.Open "select lsh from yw_wentitp where lsh='" & tplsh & "'", conn
If Not Rs.EOF Then
    frmchakantp.Show
Else
    MsgBox "当前问题没有图片！", vbOKOnly + vbInformation, "友情提示"
End If
    Set Rs = Nothing
End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command1.Picture = LoadPicture(App.Path & "\pic\按妞－查看图片.jpg")
End Sub

Private Sub Command2_Click()
str = ""
str = "update yw_wentilb set shouhoucs='" & Trim(txt4.Text) & "' where lsh='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 0)) & "'"
If MsgBox("确定要修改吗？注：只能修改“修改后测试说明！”", vbYesNo + vbQuestion, "友情提示") = vbYes Then
    
    Set Rs = conn.Execute(str)
    msfwentilb.TextMatrix(msfwentilb.row, 9) = txt4.Text
    MsgBox "修改成功！", vbOKOnly + vbInformation, "提示"
End If

End Sub





Private Sub Command2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Command2.Picture = LoadPicture(App.Path & "\pic\按妞－修改.jpg")
End Sub

Private Sub Command3_Click()
str = ""
str = "update yw_wentilb set gongcscs='" & Trim(txt3.Text) & "',gongchengsbz='否',shouhoubz='否' where lsh='" & Trim(msfwentilb.TextMatrix(msfwentilb.row, 0)) & "'"
If MsgBox("确定要返回问题吗？注：请将返回问题的理由填入“工程师修改说明后”面", vbYesNo + vbInformation, "提示") = vbYes Then
    Set Rs = conn.Execute(str)
    MsgBox "问题返回成功，请通知工程师查看！", vbOKOnly + vbInformation, "提示"
    Call cmdchaxun_Click
End If
End Sub

Private Sub Command3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Command3.Picture = LoadPicture(App.Path & "\pic\按妞－返回问题.jpg")
End Sub

Private Sub Form_Load()
Command1.Visible = False
'Command1.Enabled = False
dtpkssj.Value = Date
dtpjssj.Value = Date
Command2.Visible = False               '初始化修改按钮为不可用

optgcs.Value = True
cboshouhoucs.Enabled = False
cboshouzhongcs.Enabled = False

'加载工程师名称
Set Rs = Nothing
str = "select usename from [user] where quxian='工程师'"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
     cbogongcs.AddItem Rs.Fields("usename").Value
     Rs.MoveNext
  Next i
  Set Rs = Nothing
End If

'加载医院名称
Set Rs = Nothing
str = "select yiyuanmc from st_yw_kehuxinxi"
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
     cboyiyuanmc.AddItem StringEnDeCodecn(Rs("yiyuanmc").Value, 75)
     Rs.MoveNext
  Next i
  Rs.Close
End If

'加载医院名称
Set Rs = Nothing
str = "select yiyuanmc from yw_kehuxinxi  with(nolock)  "
Rs.CursorLocation = adUseClient
Rs.Open str, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
     cboyiyuanmc.AddItem StringEnDeCodecn(Rs("yiyuanmc").Value, 75)
     Rs.MoveNext
  Next i
  Rs.Close
End If


'加载人员
Set Rs = Nothing
str1 = "select xingming from zd_jishuyuan where zhiwu<>'销售人员'"
Rs.CursorLocation = adUseClient
Rs.Open str1, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
      cmbshishiry.AddItem Rs.Fields("xingming").Value
      Rs.MoveNext
  Next i
  Rs.Close
End If
  

'加载模块
Set Rs = Nothing
str2 = "select mokuaimc from zd_mokuai"
Rs.CursorLocation = adUseClient
Rs.Open str2, conn
If Not Rs.EOF Then
  For i = 1 To Rs.RecordCount
    cbomokuan.AddItem Rs.Fields("mokuaimc").Value
    Rs.MoveNext
  Next i
End If
Rs.Close
'加载售中售后人员
    str = "select * from [user]"
    Rs.CursorLocation = adUseClient
     Rs.Open str, conn
    If Not Rs.EOF Then

        For i = 1 To Rs.RecordCount
            cboshouzhongcs.AddItem Rs.Fields("usename").Value
            Rs.MoveNext
        Next i
    End If
    Set Rs = Nothing
    
    '加载售中售后人员
    Set Rs = Nothing
    str = "select * from [user]"
    Rs.CursorLocation = adUseClient
     Rs.Open str, conn
    If Not Rs.EOF Then

        For i = 1 To Rs.RecordCount
            cboshouhoucs.AddItem Rs.Fields("usename").Value
            Rs.MoveNext
        Next i
    End If
     Rs.Close
    

End Sub



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdqingkong.Picture = LoadPicture(App.Path & "\pic\按妞－清空1.jpg")
cmdchaxun.Picture = LoadPicture(App.Path & "\pic\按妞－查-询1.jpg")
cmddaying.Picture = LoadPicture(App.Path & "\pic\按妞－导出XLS表1.jpg")
Command2.Picture = LoadPicture(App.Path & "\pic\按妞－修改1.jpg")
Command3.Picture = LoadPicture(App.Path & "\pic\按妞－返回问题1.jpg")
cmdtuichu.Picture = LoadPicture(App.Path & "\pic\按妞－退-出1.jpg")
Command1.Picture = LoadPicture(App.Path & "\pic\按妞－查看图片1.jpg")
'cmddaying.Picture = LoadPicture(App.Path & "\按妞－修改1.jpg")
End Sub

Private Sub Form_Resize()
On Error GoTo CJY

    Frame2.Width = Me.Width - Frame2.Left - 50
    Frame3.Width = Frame2.Width
    Frame4.Width = Frame2.Width
    
    msfwentilb.Height = Me.ScaleHeight - msfwentilb.Top
    msfwentilb.Width = Frame2.Width
CJY:
End Sub

Private Sub msfwentilb_Click()

'使当前行的背景色突出显示
 Me.msfwentilb.FocusRect = flexFocusNone
  Me.msfwentilb.SelectionMode = flexSelectionByRow
  Me.msfwentilb.BackColorSel = 8421631
  
  '网格赋傎给窗体上的控件
If msfwentilb.Rows > 1 And msfwentilb.TextMatrix(msfwentilb.row, 0) <> "" Then
    txt1.Text = msfwentilb.TextMatrix(msfwentilb.row, 6)
    txt2.Text = msfwentilb.TextMatrix(msfwentilb.row, 7)
    txt3.Text = msfwentilb.TextMatrix(msfwentilb.row, 8)
    txt4.Text = msfwentilb.TextMatrix(msfwentilb.row, 9)
    txtwtlx.Text = msfwentilb.TextMatrix(msfwentilb.row, 13)
    txtlrsj.Text = msfwentilb.TextMatrix(msfwentilb.row, 10)
    txtxgsj.Text = msfwentilb.TextMatrix(msfwentilb.row, 11)
Else
    Exit Sub
End If

'如果当前问题有图片，则查看图片按钮可用。

str = "select lsh as lsh from yw_wentitp where lsh='" & msfwentilb.TextMatrix(msfwentilb.row, 0) & " ' "
Rs.Open str, conn
If Not Rs.EOF Then
    Command1.Visible = True
    Set Rs = Nothing
Else
    Command1.Visible = False
    Set Rs = Nothing
End If

'如果问题没有测试过，那么测试意见不能修改
If txt4.Text <> "" Then
    Command2.Visible = True
Else
    Command2.Visible = False
End If
End Sub



Private Sub Option1_Click()
'选择查询条件
If optsz.Value = True Then
    cboshouzhongcs.Enabled = True
    cbogongcs.Text = ""
    cboshouhoucs.Text = ""
    cbogongcs.Enabled = False
    cboshouhoucs.Enabled = False
Else
    cboshouzhongcs.Text = ""
End If
End Sub

Private Sub Option2_Click()
'选择查询条件
If optgcs.Value = True Then
    cbogongcs.Enabled = True
    cboshouzhongcs.Text = ""
    cboshouhoucs.Text = ""
    cboshouzhongcs.Enabled = False
    cboshouhoucs.Enabled = False
Else
    cbogongcs.Text = ""
End If
End Sub

Private Sub Option3_Click()
'选择查询条件
If optsh.Value = True Then
    cboshouhoucs.Enabled = True
    cbogongcs.Text = ""
    cboshouzhongcs.Text = ""
    cbogongcs.Enabled = False
    cboshouzhongcs.Enabled = False
Else
    cboshouhoucs.Text = ""
End If
End Sub

Private Sub Text4_Change()

End Sub
