VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmdingdanluru 
   Caption         =   "Form1"
   ClientHeight    =   9270
   ClientLeft      =   255
   ClientTop       =   1815
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   9270
   ScaleWidth      =   15240
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "订单"
      Height          =   3795
      Left            =   135
      TabIndex        =   37
      Top             =   5355
      Width           =   14865
      Begin VB.CommandButton Command2 
         Caption         =   "打印"
         Height          =   420
         Left            =   10665
         TabIndex        =   56
         Top             =   1125
         Width           =   1500
      End
      Begin VB.CommandButton Command1 
         Caption         =   "保存"
         Height          =   420
         Left            =   10665
         TabIndex        =   55
         Top             =   540
         Width           =   1500
      End
      Begin VB.TextBox Text11 
         Height          =   330
         Left            =   4005
         TabIndex        =   54
         Text            =   "Text11"
         Top             =   3330
         Width           =   1815
      End
      Begin VB.TextBox Text10 
         Height          =   330
         Left            =   1170
         TabIndex        =   52
         Text            =   "Text10"
         Top             =   3285
         Width           =   1275
      End
      Begin VB.TextBox Text9 
         Height          =   465
         Left            =   1125
         TabIndex        =   50
         Text            =   "Text9"
         Top             =   2700
         Width           =   8295
      End
      Begin VB.TextBox Text8 
         Height          =   735
         Left            =   1170
         TabIndex        =   48
         Text            =   "Text8"
         Top             =   1845
         Width           =   8250
      End
      Begin VB.TextBox Text7 
         Height          =   330
         Left            =   1170
         TabIndex        =   46
         Text            =   "Text7"
         Top             =   1305
         Width           =   8250
      End
      Begin VB.TextBox Text5 
         Height          =   375
         Left            =   8055
         TabIndex        =   44
         Text            =   "Text5"
         Top             =   675
         Width           =   1320
      End
      Begin VB.TextBox Text3 
         Height          =   330
         Left            =   5085
         TabIndex        =   42
         Text            =   "Text3"
         Top             =   720
         Width           =   1410
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1215
         TabIndex        =   40
         Text            =   "Text2"
         Top             =   765
         Width           =   2715
      End
      Begin VB.Label Label16 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间："
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   3060
         TabIndex        =   53
         Top             =   3420
         Width           =   900
      End
      Begin VB.Label Label15 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员："
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   270
         TabIndex        =   51
         Top             =   3375
         Width           =   900
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "其它说明"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   135
         TabIndex        =   49
         Top             =   2835
         Width           =   900
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "所用模块"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   180
         TabIndex        =   47
         Top             =   2025
         Width           =   900
      End
      Begin VB.Label Label12 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "地址"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   585
         TabIndex        =   45
         Top             =   1395
         Width           =   450
      End
      Begin VB.Label Label10 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   6975
         TabIndex        =   43
         Top             =   810
         Width           =   900
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "联系人"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   4320
         TabIndex        =   41
         Top             =   855
         Width           =   675
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   225
         TabIndex        =   39
         Top             =   855
         Width           =   900
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "北京创佳益软件公司软件订单表"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   210
         Left            =   3735
         TabIndex        =   38
         Top             =   360
         Width           =   3150
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4035
      Left            =   135
      TabIndex        =   0
      Top             =   1170
      Width           =   14895
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   990
         TabIndex        =   36
         Top             =   810
         Width           =   7260
      End
      Begin VB.TextBox txtxiaoshouren 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   9270
         TabIndex        =   34
         Top             =   270
         Width           =   1095
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   990
         TabIndex        =   23
         Top             =   270
         Width           =   2175
      End
      Begin VB.TextBox txtmokuai 
         Appearance      =   0  'Flat
         Height          =   1020
         Left            =   9270
         TabIndex        =   22
         Top             =   1530
         Width           =   5310
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊管理"
         Height          =   285
         Left            =   135
         TabIndex        =   20
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "药房管理"
         Height          =   285
         Left            =   1530
         TabIndex        =   19
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check3 
         BackColor       =   &H00E0E0E0&
         Caption         =   "药库管理"
         Height          =   285
         Left            =   2745
         TabIndex        =   18
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check4 
         BackColor       =   &H00E0E0E0&
         Caption         =   "住院管理"
         Height          =   285
         Left            =   4095
         TabIndex        =   17
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check5 
         BackColor       =   &H00E0E0E0&
         Caption         =   "住院护士站"
         Height          =   285
         Left            =   5400
         TabIndex        =   16
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check6 
         BackColor       =   &H00E0E0E0&
         Caption         =   "财务管理"
         Height          =   285
         Left            =   135
         TabIndex        =   15
         Top             =   2610
         Width           =   1230
      End
      Begin VB.CheckBox Check7 
         BackColor       =   &H00E0E0E0&
         Caption         =   "院长查询"
         Height          =   285
         Left            =   1530
         TabIndex        =   14
         Top             =   2610
         Width           =   1230
      End
      Begin VB.CheckBox Check8 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊医生"
         Height          =   285
         Left            =   2745
         TabIndex        =   13
         Top             =   2610
         Width           =   1230
      End
      Begin VB.CheckBox Check9 
         BackColor       =   &H00E0E0E0&
         Caption         =   "医技管理"
         Height          =   285
         Left            =   4095
         TabIndex        =   12
         Top             =   2610
         Width           =   1230
      End
      Begin VB.CheckBox Check10 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊护士站"
         Height          =   285
         Left            =   5400
         TabIndex        =   11
         Top             =   2610
         Width           =   1230
      End
      Begin VB.CheckBox Check11 
         BackColor       =   &H00E0E0E0&
         Caption         =   "手术室管理"
         Height          =   285
         Left            =   135
         TabIndex        =   10
         Top             =   3465
         Width           =   1230
      End
      Begin VB.CheckBox Check12 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CRM系统"
         Height          =   285
         Left            =   1530
         TabIndex        =   9
         Top             =   3465
         Width           =   1230
      End
      Begin VB.CheckBox Check13 
         BackColor       =   &H00E0E0E0&
         Caption         =   "社区卫生CHS系统"
         Height          =   285
         Left            =   2745
         TabIndex        =   8
         Top             =   3465
         Width           =   1725
      End
      Begin VB.CheckBox Check14 
         BackColor       =   &H00E0E0E0&
         Caption         =   "其它"
         Height          =   285
         Left            =   4860
         TabIndex        =   7
         Top             =   3465
         Width           =   690
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   330
         Left            =   5625
         TabIndex        =   6
         Top             =   3420
         Width           =   1680
      End
      Begin VB.TextBox txtfuzheren 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   4860
         TabIndex        =   5
         Top             =   270
         Width           =   1050
      End
      Begin VB.TextBox txtdianhua 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   7065
         TabIndex        =   4
         Top             =   270
         Width           =   1185
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   915
         Left            =   9315
         TabIndex        =   3
         Top             =   2835
         Width           =   5190
      End
      Begin VB.CheckBox Check15 
         BackColor       =   &H00E0E0E0&
         Caption         =   "数据审核"
         Height          =   285
         Left            =   6795
         TabIndex        =   2
         Top             =   1890
         Width           =   1095
      End
      Begin VB.CheckBox Check16 
         BackColor       =   &H00E0E0E0&
         Caption         =   "系统管理"
         Height          =   285
         Left            =   6795
         TabIndex        =   1
         Top             =   2610
         Width           =   1095
      End
      Begin MSComCtl2.DTPicker txtsj 
         Height          =   375
         Left            =   11610
         TabIndex        =   21
         Top             =   270
         Width           =   1320
         _ExtentX        =   2328
         _ExtentY        =   661
         _Version        =   393216
         Format          =   25559041
         CurrentDate     =   39105
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户地址"
         Height          =   180
         Index           =   1
         Left            =   180
         TabIndex        =   35
         Top             =   945
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         Height          =   180
         Index           =   0
         Left            =   225
         TabIndex        =   31
         Top             =   405
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院主要负责人"
         Height          =   180
         Index           =   4
         Left            =   3555
         TabIndex        =   30
         Top             =   405
         Width           =   1260
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间"
         Height          =   180
         Index           =   5
         Left            =   10755
         TabIndex        =   29
         Top             =   405
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   10920
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   8505
         TabIndex        =   28
         Top             =   405
         Width           =   720
      End
      Begin VB.Line Line2 
         X1              =   10920
         X2              =   14880
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         Height          =   180
         Left            =   6255
         TabIndex        =   27
         Top             =   405
         Width           =   720
      End
      Begin VB.Label Label7 
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
         Left            =   8190
         TabIndex        =   26
         Top             =   3330
         Width           =   780
      End
      Begin VB.Label Label9 
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
         Left            =   8145
         TabIndex        =   25
         Top             =   1980
         Width           =   780
      End
      Begin VB.Label Label11 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "模块信息"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   135
         TabIndex        =   24
         Top             =   1530
         Width           =   720
      End
      Begin VB.Line Line3 
         X1              =   8010
         X2              =   8010
         Y1              =   1305
         Y2              =   4455
      End
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "订单录入"
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
      Left            =   6300
      TabIndex        =   33
      Top             =   270
      Width           =   1920
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
      Left            =   4500
      TabIndex        =   32
      Top             =   270
      Width           =   1725
   End
End
Attribute VB_Name = "frmdingdanluru"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
'加载医院名称
Set rs = Nothing
str = "select yiyuanmc from zd_yiyuanmc"
rs.CursorLocation = adUseClient
rs.Open str, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
     cboyiyuanmc.AddItem rs.Fields("yiyuanmc").Value
     rs.MoveNext
  Next i
  rs.Close
End If
End Sub

