VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmyixgcx 
   ClientHeight    =   12255
   ClientLeft      =   60
   ClientTop       =   2205
   ClientWidth     =   21375
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   12255
   ScaleWidth      =   21375
   WindowState     =   2  'Maximized
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
      Left            =   3900
      TabIndex        =   34
      Top             =   720
      Width           =   11055
      Begin VB.ComboBox cbobanben 
         Appearance      =   0  'Flat
         Height          =   300
         ItemData        =   "frmyixgcx.frx":0000
         Left            =   1080
         List            =   "frmyixgcx.frx":0013
         TabIndex        =   42
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   3240
         TabIndex        =   41
         Top             =   240
         Width           =   2895
      End
      Begin VB.ComboBox cmbshishiry 
         Height          =   300
         Left            =   7200
         TabIndex        =   40
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cbomokuan 
         Height          =   300
         Left            =   9240
         TabIndex        =   39
         Top             =   240
         Width           =   1275
      End
      Begin VB.Frame Frame1 
         Caption         =   "Frame1"
         Height          =   15
         Left            =   0
         TabIndex        =   38
         Top             =   1200
         Width           =   11055
      End
      Begin VB.ComboBox cbowentilx 
         ForeColor       =   &H00C00000&
         Height          =   300
         ItemData        =   "frmyixgcx.frx":004A
         Left            =   1080
         List            =   "frmyixgcx.frx":0060
         TabIndex        =   35
         Top             =   720
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker dtpjssj 
         Height          =   330
         Left            =   6240
         TabIndex        =   36
         Top             =   720
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   582
         _Version        =   393216
         Format          =   400949249
         CurrentDate     =   39058
      End
      Begin MSComCtl2.DTPicker dtpkssj 
         Height          =   330
         Left            =   3600
         TabIndex        =   37
         Top             =   720
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   582
         _Version        =   393216
         Format          =   400949249
         CurrentDate     =   39058
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Label9"
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
         Left            =   8280
         TabIndex        =   63
         Top             =   765
         Width           =   630
      End
      Begin VB.Image pic1 
         BorderStyle     =   1  'Fixed Single
         Height          =   2175
         Left            =   12240
         Stretch         =   -1  'True
         Top             =   1560
         Width           =   2655
      End
      Begin VB.Label labruanjianbb 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         Height          =   180
         Left            =   240
         TabIndex        =   49
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
         TabIndex        =   48
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Left            =   6360
         TabIndex        =   47
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labmokuan 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "模 块"
         Height          =   180
         Left            =   8640
         TabIndex        =   46
         Top             =   360
         Width           =   450
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "开始时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   2760
         TabIndex        =   45
         Top             =   840
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   12720
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "结束时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5400
         TabIndex        =   44
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题类型"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   240
         TabIndex        =   43
         Top             =   840
         Width           =   720
      End
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
      Left            =   3915
      TabIndex        =   23
      Top             =   2025
      Width           =   11055
      Begin VB.ComboBox cboCSBZ 
         Height          =   300
         ItemData        =   "frmyixgcx.frx":00AA
         Left            =   4680
         List            =   "frmyixgcx.frx":00B4
         TabIndex        =   66
         Text            =   "是"
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cboshouhoucs 
         Height          =   300
         Left            =   7740
         TabIndex        =   58
         Top             =   135
         Visible         =   0   'False
         Width           =   1500
      End
      Begin VB.ComboBox cboshouzhongcs 
         Height          =   300
         Left            =   4770
         TabIndex        =   57
         Top             =   180
         Width           =   1500
      End
      Begin VB.ComboBox cbogcsbz 
         Height          =   300
         ItemData        =   "frmyixgcx.frx":00C0
         Left            =   1545
         List            =   "frmyixgcx.frx":00CA
         TabIndex        =   26
         Text            =   "是"
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cbogongcs 
         Height          =   300
         ItemData        =   "frmyixgcx.frx":00D6
         Left            =   1545
         List            =   "frmyixgcx.frx":00D8
         TabIndex        =   25
         Top             =   240
         Width           =   1335
      End
      Begin VB.ComboBox cbojingjicd 
         ForeColor       =   &H00FF0000&
         Height          =   300
         ItemData        =   "frmyixgcx.frx":00DA
         Left            =   7530
         List            =   "frmyixgcx.frx":00E7
         TabIndex        =   24
         Top             =   945
         Width           =   1500
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "测试标志"
         Height          =   180
         Left            =   3900
         TabIndex        =   67
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题测试人员"
         Height          =   180
         Left            =   6615
         TabIndex        =   60
         Top             =   225
         Visible         =   0   'False
         Width           =   1080
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题发部人员"
         Height          =   180
         Left            =   3600
         TabIndex        =   59
         Top             =   315
         Width           =   1080
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "修改标志"
         Height          =   180
         Left            =   765
         TabIndex        =   33
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "修改工程师"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   585
         TabIndex        =   32
         Top             =   360
         Width           =   900
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "紧急程度"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   6630
         TabIndex        =   31
         Top             =   1035
         Width           =   720
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
         Left            =   7470
         TabIndex        =   30
         Top             =   525
         Width           =   1365
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
         TabIndex        =   29
         Top             =   240
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
         Left            =   10170
         TabIndex        =   28
         Top             =   525
         Width           =   195
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
         TabIndex        =   27
         Top             =   525
         Width           =   120
      End
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
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   22
      Top             =   1020
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
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   21
      Top             =   3060
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
      Left            =   60
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   20
      Top             =   5100
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
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   19
      Top             =   7140
      Width           =   3735
   End
   Begin VB.TextBox txtwtlx 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   0
      TabIndex        =   18
      Top             =   9120
      Width           =   3735
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
      Left            =   3900
      TabIndex        =   7
      Top             =   3600
      Width           =   16455
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   9300
         TabIndex        =   64
         Top             =   660
         Width           =   2835
      End
      Begin VB.TextBox txtchaxun 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   1800
         TabIndex        =   12
         Top             =   240
         Width           =   2295
      End
      Begin VB.TextBox txtbanbenh 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   4920
         TabIndex        =   11
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtlsh 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   6960
         TabIndex        =   10
         Top             =   240
         Width           =   1515
      End
      Begin VB.TextBox txtlrsj 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   1380
         TabIndex        =   9
         Top             =   660
         Width           =   2415
      End
      Begin VB.TextBox txtxgsj 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   5100
         TabIndex        =   8
         Top             =   660
         Width           =   2835
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题测试时间"
         Height          =   180
         Left            =   8100
         TabIndex        =   65
         Top             =   720
         Width           =   1080
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "原始问题模糊查询"
         Height          =   180
         Left            =   240
         TabIndex        =   17
         Top             =   360
         Width           =   1440
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "版本号"
         Height          =   180
         Left            =   4320
         TabIndex        =   16
         Top             =   360
         Width           =   540
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "流水号"
         Height          =   180
         Left            =   6360
         TabIndex        =   15
         Top             =   360
         Width           =   540
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
         Left            =   240
         TabIndex        =   14
         Top             =   720
         Width           =   1080
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题修改时间"
         Height          =   180
         Left            =   3900
         TabIndex        =   13
         Top             =   720
         Width           =   1080
      End
   End
   Begin VB.PictureBox cmdqingkong 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   3900
      Picture         =   "frmyixgcx.frx":00FB
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   6
      Top             =   4650
      Width           =   1230
   End
   Begin VB.PictureBox cmdchaxun 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   5250
      Picture         =   "frmyixgcx.frx":0A0A
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   5
      Top             =   4635
      Width           =   1230
   End
   Begin VB.PictureBox cmddaying 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   6615
      Picture         =   "frmyixgcx.frx":1354
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   4
      Top             =   4650
      Width           =   1230
   End
   Begin VB.PictureBox Command2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   10620
      Picture         =   "frmyixgcx.frx":1F41
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   3
      Top             =   4650
      Width           =   1230
   End
   Begin VB.PictureBox Command3 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   7995
      Picture         =   "frmyixgcx.frx":28A3
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   2
      Top             =   4650
      Width           =   1230
   End
   Begin VB.PictureBox cmdtuichu 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   9345
      Picture         =   "frmyixgcx.frx":3461
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   1
      Top             =   4650
      Width           =   1230
   End
   Begin VB.PictureBox Command1 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   405
      Left            =   11940
      Picture         =   "frmyixgcx.frx":3D54
      ScaleHeight     =   405
      ScaleWidth      =   1230
      TabIndex        =   0
      Top             =   4650
      Width           =   1230
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfwentilb 
      Height          =   3855
      Left            =   3915
      TabIndex        =   50
      Top             =   5100
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   6800
      _Version        =   393216
      BackColor       =   -2147483634
      ForeColor       =   0
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   14737632
      BackColorSel    =   12648447
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
      Left            =   5625
      TabIndex        =   62
      Top             =   135
      Width           =   1725
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问 题 修 改 状 态"
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
      Left            =   7425
      TabIndex        =   61
      Top             =   135
      Width           =   3135
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
      Left            =   765
      TabIndex        =   56
      Top             =   2760
      Width           =   1170
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
      Left            =   780
      TabIndex        =   55
      Top             =   4800
      Width           =   1365
   End
   Begin VB.Label Label15 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "修改后测试结果"
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
      Left            =   780
      TabIndex        =   54
      Top             =   6840
      Width           =   1365
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
      Left            =   840
      TabIndex        =   53
      Top             =   8850
      Width           =   780
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   0
      Left            =   300
      Picture         =   "frmyixgcx.frx":48CF
      Top             =   660
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
      Left            =   780
      TabIndex        =   52
      Top             =   720
      Width           =   1170
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   1
      Left            =   300
      Picture         =   "frmyixgcx.frx":4DC3
      Top             =   2700
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   2
      Left            =   300
      Picture         =   "frmyixgcx.frx":52B7
      Top             =   4740
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   3
      Left            =   300
      Picture         =   "frmyixgcx.frx":57AB
      Top             =   6780
      Width           =   450
   End
   Begin VB.Image Image2 
      Height          =   315
      Index           =   4
      Left            =   300
      Picture         =   "frmyixgcx.frx":5C9F
      Top             =   8790
      Width           =   450
   End
   Begin VB.Label Label18 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "按问题录入时间查询"
      Height          =   180
      Left            =   5220
      TabIndex        =   51
      Top             =   3240
      Width           =   1620
   End
End
Attribute VB_Name = "frmyixgcx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim str1 As String

Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
Dim pymstr As String            '查询字符串
Dim pymint As Integer           '循环变量

   If KeyCode = 13 And cboyiyuanmc.Text <> "" Then
        pymstr = ""
        '构建查询语句
        pymstr = "select yiyuanmc from st_yw_kehuxinxi where pym like '%" & Trim(cboyiyuanmc.Text) & "%'"
        Rs.CursorLocation = adUseClient
     Rs.Open pymstr, conn
        If Not Rs.EOF Then
           cboyiyuanmc.Clear                          '清空当前LIST记录
           '循环赋傎给组合框的LIST
        For pymint = 1 To Rs.RecordCount
            cboyiyuanmc.AddItem StringEnDeCodecn(Rs("yiyuanmc").Value, 75)
            Rs.MoveNext
          Next pymint
           cboyiyuanmc.ListIndex = 0                  '将第一行的傎赋给TEXT
        End If
   
    End If
     If KeyCode = 13 And cboyiyuanmc.Text <> "" Then
        cmbshishiry.SetFocus
     End If
          Set Rs = Nothing
End Sub

Private Sub cmdchaxun_Click()

msfwentilb.Clear


    '根据不同情况选择查询时间的种类
'If cbogcsbz.Text = "否" Then
'    Label10.Caption = "当前未修改的问题数量："
'    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', szcsgcs as '问题反馈人', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',DATEDIFF(day, lvrusj, xgsj) as '修改天数',xggcs as '修改工程师',wentilx as '问题类型' from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') and gongchengsbz='否'"
'ElseIf cbogcsbz.Text = "是" Then
'    Label10.Caption = "当前已修改的问题数量："
'    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', szcsgcs as '问题反馈人', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',cssj as '测试时间',DATEDIFF(day, lvrusj, xgsj) as '修改天数',DATEDIFF(day, xgsj, cssj) as '测试天数',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') and gongchengsbz='是'"
'ElseIf cbogcsbz.Text = "" Then
    Label10.Caption = "当前条件问题数量："
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', szcsgcs as '问题反馈人', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',cssj as '测试时间',DATEDIFF(day, lvrusj, xgsj) as '修改天数',DATEDIFF(day, xgsj, cssj) as '测试天数',xggcs as '修改工程师',szcsgcs as '测试工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') "
'End If

'判断查询条件
 If cbobanben.Text <> "" Then
    str1 = str1 & "and banben='" & Trim(cbobanben.Text) & "'"
 End If
 
 If cbogcsbz.Text <> "" Then
    str1 = str1 & "and gongchengsbz='" & Trim(cbogcsbz.Text) & "'"
 End If
 
 If cboCSBZ.Text <> "" Then
    str1 = str1 & "and shouhoubz='" & Trim(cboCSBZ.Text) & "'"
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


Set msfwentilb.DataSource = conn.Execute(str1)
 '打开记录集，加载数据到网格
'Set rs = Nothing
'  rs.Open str1, conn, 1, 3
'    If Not rs.EOF Then
'        Set msfwentilb.DataSource = rs
'        rs.Close
'    Else
'        msfwentilb.Rows = 2
'        MsgBox "没有满足条件的数据", vbOKOnly + vbInformation, "提示"
'        rs.Close
'    End If
'取当前问题数量
If msfwentilb.TextMatrix(0, 0) <> "" Then
    labshuliang.Caption = msfwentilb.Rows - 1
Else
    labshuliang.Caption = 0
End If

msfwentilb.ColWidth(11) = 2500
msfwentilb.ColWidth(12) = 2500
msfwentilb.ColWidth(10) = 2500

End Sub

Private Sub cmdchaxun_GotFocus()
cmdchaxun.Picture = LoadPicture(App.Path & "\pic\按妞－查-询1.jpg")
End Sub

Private Sub cmdchaxun_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdchaxun.Picture = LoadPicture(App.Path & "\pic\按妞－查-询.jpg")
End Sub

Private Sub cmddaying_Click()
msfwentilb.Clear


    '根据不同情况选择查询时间的种类
If cbogcsbz.Text = "否" Then
    Label10.Caption = "当前未修改的问题数量："
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型' from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') and gongchengsbz='否'"
ElseIf cbogcsbz.Text = "是" Then
    Label10.Caption = "当前已修改的问题数量："
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (xgsj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') and gongchengsbz='是'"
ElseIf cbogcsbz.Text = "" Then
    Label10.Caption = "当前所有问题数量："
    str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',shouhoucs as '售后测试',lvrusj as '问题录入时间',xgsj as '修改时间',xggcs as '修改工程师',wentilx as '问题类型'  from yw_wentilb where (lvrusj between '" & dtpkssj.Value & " 00:00:01' and '" & dtpjssj.Value & " 23:59:59') "
End If

'判断查询条件
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

cbogongcs.Text = ""
cbogcsbz.Text = ""
cboshouhoucs.Text = ""

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
dtpkssj.Value = Format(Now, "yyyy-mm-dd")
dtpjssj.Value = Format(Now, "yyyy-mm-dd")
Command2.Visible = False               '初始化修改按钮为不可用
cboshouzhongcs.Text = user

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

'加载人员
Set Rs = Nothing
str1 = "select xingming from zd_jishuyuan where zhuangtai=1"
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
    str = "select * from [user] "
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
    str = "select * from [user] "
    Rs.CursorLocation = adUseClient
     Rs.Open str, conn
    If Not Rs.EOF Then

        For i = 1 To Rs.RecordCount
            cboshouhoucs.AddItem Rs.Fields("usename").Value
            Rs.MoveNext
        Next i
    End If
     Rs.Close
  str = "select count(lsh) as 'lsh' from yw_wentilb"
  Set Rs = conn.Execute(str)
  Label9.Caption = "数据库中问题总数：" & Rs.Fields("lsh").Value & " 个"

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
    msfwentilb.Move msfwentilb.Left, msfwentilb.Top, Me.ScaleWidth - msfwentilb.Left - 100, Me.ScaleHeight - msfwentilb.Top - 100
    Frame2.Width = Me.ScaleWidth - Frame2.Left - 100
    Frame3.Width = Me.ScaleWidth - Frame3.Left - 100
    Frame4.Width = Me.ScaleWidth - Frame4.Left - 100
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
    txtlrsj.Text = Format(msfwentilb.TextMatrix(msfwentilb.row, 10), "yyyy-MM-dd HH:mm:ss.fff")
    txtxgsj.Text = Format(msfwentilb.TextMatrix(msfwentilb.row, 11), "yyyy-MM-dd HH:mm:ss.fff")
    Text1.Text = Format(msfwentilb.TextMatrix(msfwentilb.row, 12), "yyyy-MM-dd HH:mm:ss.fff")
    txtlsh.Text = msfwentilb.TextMatrix(msfwentilb.row, 0)
Else
    Exit Sub
End If

'如果当前问题有图片，则查看图片按钮可用。
Set Rs = Nothing
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



