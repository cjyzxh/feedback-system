VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.2#0"; "HISControl1.ocx"
Begin VB.Form frmkehuxinxiwh 
   BackColor       =   &H00E0E0E0&
   Caption         =   "客户信息维护"
   ClientHeight    =   9045
   ClientLeft      =   255
   ClientTop       =   450
   ClientWidth     =   15120
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   9045
   ScaleWidth      =   15120
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户信息维护"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7905
      Left            =   5250
      TabIndex        =   7
      Top             =   555
      Width           =   9795
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   6300
         TabIndex        =   68
         Top             =   300
         Width           =   825
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   8145
         TabIndex        =   59
         Top             =   3900
         Width           =   1305
      End
      Begin UserControl.lst lst1 
         Height          =   2505
         Left            =   1035
         TabIndex        =   58
         Top             =   5145
         Width           =   8445
         _ExtentX        =   14896
         _ExtentY        =   4419
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         MergeCells      =   4
         Cols            =   9
         BackColorFrozen =   16763080
         BackColorSel    =   49152
         RowHeightMin    =   300
         ColumnCaptions  =   "序号;软件版本;款类别;订单金额;余款;余款old;下单时间;下单人;合同"
         ColWidths       =   "0;1500;1000;1200;1200;0;1500"
         ColumnName      =   "AutoID;banben;rjklb;ruanjianzj;ruanjianyk;ruanjianykold;xiadansj;xiaoshoury;hetong"
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   8985
         TabIndex        =   52
         Text            =   "1"
         Top             =   3510
         Visible         =   0   'False
         Width           =   375
      End
      Begin VB.ComboBox txtshishiry 
         Height          =   300
         Left            =   1065
         TabIndex        =   48
         Top             =   3510
         Width           =   1155
      End
      Begin VB.TextBox txtID 
         Height          =   285
         Left            =   8535
         TabIndex        =   44
         Top             =   4140
         Visible         =   0   'False
         Width           =   1005
      End
      Begin VB.TextBox txtmokuai 
         Appearance      =   0  'Flat
         Height          =   855
         Left            =   1080
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   43
         Top             =   1260
         Width           =   8565
      End
      Begin VB.TextBox txtfukuanqk 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1065
         TabIndex        =   41
         Top             =   4740
         Width           =   8415
      End
      Begin VB.TextBox txtgly 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1080
         TabIndex        =   20
         Top             =   3960
         Width           =   1155
      End
      Begin VB.TextBox txtcclx 
         Appearance      =   0  'Flat
         Height          =   345
         Left            =   1080
         TabIndex        =   19
         Top             =   4335
         Width           =   8445
      End
      Begin VB.TextBox txtbanben1 
         Appearance      =   0  'Flat
         Height          =   345
         Left            =   5220
         TabIndex        =   18
         Top             =   285
         Width           =   435
      End
      Begin VB.TextBox txtkehumc 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   1080
         TabIndex        =   17
         Top             =   300
         Width           =   3315
      End
      Begin VB.TextBox txtfuzheren 
         Appearance      =   0  'Flat
         Height          =   345
         Left            =   1080
         TabIndex        =   16
         Top             =   780
         Width           =   1005
      End
      Begin VB.TextBox txtshoujihao 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   5460
         TabIndex        =   15
         Top             =   780
         Width           =   1575
      End
      Begin VB.TextBox txtdianhua 
         Appearance      =   0  'Flat
         Height          =   345
         Left            =   2940
         TabIndex        =   14
         Top             =   780
         Width           =   1425
      End
      Begin VB.TextBox txtxiaoshouren 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   7905
         TabIndex        =   13
         Top             =   780
         Width           =   1755
      End
      Begin VB.TextBox txtdizhi 
         Appearance      =   0  'Flat
         Height          =   390
         Left            =   1080
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         Top             =   2670
         Width           =   8595
      End
      Begin VB.TextBox txtqtsm 
         Appearance      =   0  'Flat
         Height          =   420
         Left            =   1080
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         Top             =   2190
         Width           =   8595
      End
      Begin VB.TextBox txtsj 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   7920
         TabIndex        =   10
         Top             =   990
         Visible         =   0   'False
         Width           =   1755
      End
      Begin VB.TextBox txtglysj 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   3495
         TabIndex        =   9
         Top             =   3900
         Width           =   1335
      End
      Begin VB.TextBox txtglydh 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   6015
         TabIndex        =   8
         Top             =   3900
         Width           =   1305
      End
      Begin MSComCtl2.DTPicker dtpjieshusj 
         Height          =   375
         Left            =   3450
         TabIndex        =   21
         Top             =   3450
         Width           =   1545
         _ExtentX        =   2725
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   88670209
         CurrentDate     =   39379
      End
      Begin MSComCtl2.DTPicker dtpkssj 
         Height          =   345
         Left            =   3405
         TabIndex        =   22
         Top             =   3450
         Visible         =   0   'False
         Width           =   1515
         _ExtentX        =   2672
         _ExtentY        =   609
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   88670209
         CurrentDate     =   39379
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   375
         Left            =   7905
         TabIndex        =   60
         Top             =   270
         Width           =   1545
         _ExtentX        =   2725
         _ExtentY        =   661
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   88670209
         CurrentDate     =   39379
      End
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   345
         Left            =   5940
         TabIndex        =   64
         Top             =   3480
         Width           =   1515
         _ExtentX        =   2672
         _ExtentY        =   609
         _Version        =   393216
         CheckBox        =   -1  'True
         Format          =   88670209
         CurrentDate     =   39379
      End
      Begin VB.Label Label26 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "拼音码"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   5730
         TabIndex        =   69
         Top             =   330
         Width           =   540
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "完工日期"
         Height          =   180
         Index           =   1
         Left            =   5040
         TabIndex        =   63
         Top             =   3570
         Width           =   720
      End
      Begin VB.Label Label25 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "年"
         Height          =   180
         Left            =   9405
         TabIndex        =   53
         Top             =   3570
         Visible         =   0   'False
         Width           =   180
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "免费维护周期"
         Height          =   180
         Left            =   7845
         TabIndex        =   51
         Top             =   3570
         Visible         =   0   'False
         Width           =   1080
      End
      Begin VB.Label Label23 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   8760
         TabIndex        =   50
         Top             =   5220
         Width           =   90
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "维护费"
         Height          =   180
         Left            =   7395
         TabIndex        =   49
         Top             =   4020
         Width           =   540
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "模块"
         Height          =   180
         Left            =   480
         TabIndex        =   42
         Top             =   1260
         Width           =   360
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "备注"
         Height          =   240
         Left            =   480
         TabIndex        =   40
         Top             =   4740
         Width           =   495
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Left            =   285
         TabIndex        =   39
         Top             =   3630
         Width           =   720
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "维护开始时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2265
         TabIndex        =   38
         Top             =   3630
         Visible         =   0   'False
         Width           =   1080
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "维护结束时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   2295
         TabIndex        =   37
         Top             =   3570
         Width           =   1080
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "系统管理员"
         Height          =   180
         Index           =   0
         Left            =   90
         TabIndex        =   36
         Top             =   4020
         Width           =   900
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "乘车路线"
         Height          =   180
         Left            =   150
         TabIndex        =   35
         Top             =   4335
         Width           =   720
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   4530
         TabIndex        =   34
         Top             =   367
         Width           =   720
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   240
         TabIndex        =   33
         Top             =   337
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院负责人"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   60
         TabIndex        =   32
         Top             =   900
         Width           =   900
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         BackStyle       =   0  'Transparent
         Caption         =   "手机号"
         Height          =   210
         Left            =   4800
         TabIndex        =   31
         Top             =   840
         Width           =   540
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         Height          =   180
         Left            =   2160
         TabIndex        =   30
         Top             =   900
         Width           =   720
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   7140
         TabIndex        =   29
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "完工时间"
         ForeColor       =   &H00000000&
         Height          =   180
         Index           =   5
         Left            =   7140
         TabIndex        =   28
         Top             =   367
         Width           =   720
      End
      Begin VB.Label Label14 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "地址"
         Height          =   180
         Left            =   510
         TabIndex        =   27
         Top             =   2745
         Width           =   360
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "其它说明"
         Height          =   180
         Left            =   120
         TabIndex        =   26
         Top             =   2250
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   -120
         X2              =   9780
         Y1              =   3180
         Y2              =   3180
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户补充信息"
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
         Left            =   90
         TabIndex        =   25
         Top             =   3240
         Width           =   1170
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "管理员手机"
         Height          =   180
         Left            =   2475
         TabIndex        =   24
         Top             =   4020
         Width           =   900
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "管理员电话"
         Height          =   180
         Left            =   5055
         TabIndex        =   23
         Top             =   4020
         Width           =   900
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户列表"
      Height          =   6195
      Left            =   420
      TabIndex        =   5
      Top             =   2220
      Width           =   4665
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwentilb 
         Height          =   5865
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   4455
         _ExtentX        =   7858
         _ExtentY        =   10345
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
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "客户基本信息查询"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   420
      TabIndex        =   0
      Top             =   540
      Width           =   4695
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "查备份"
         Height          =   285
         Left            =   3870
         TabIndex        =   70
         Top             =   1140
         Width           =   885
      End
      Begin UserControl.cbo cbo1 
         Height          =   300
         Left            =   420
         TabIndex        =   67
         Top             =   210
         Width           =   2925
         _ExtentX        =   5159
         _ExtentY        =   529
         Caption         =   "销售员"
         CaptionWidth    =   600
         BackColor       =   14737632
         TextColumn      =   2
         ForeColor       =   16711680
         Caption         =   "销售员"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCaptions  =   "序号;姓名;"
         ColWidths       =   "600;1200;"
         ListText        =   ""
      End
      Begin mycmd.MyCommand MyCommand3 
         Height          =   375
         Left            =   3480
         TabIndex        =   54
         Top             =   660
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   661
         Caption         =   "清 空"
      End
      Begin mycmd.MyCommand cmdchaxun 
         Height          =   375
         Left            =   3480
         TabIndex        =   47
         Top             =   180
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   661
         Caption         =   "查 询"
      End
      Begin VB.TextBox txtkehumingc 
         Height          =   345
         Left            =   990
         TabIndex        =   4
         Top             =   1080
         Width           =   2835
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         Left            =   1020
         TabIndex        =   2
         Top             =   690
         Width           =   2085
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "客户名称"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Index           =   0
         Left            =   180
         TabIndex        =   3
         Top             =   1200
         Width           =   720
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   150
         TabIndex        =   1
         Top             =   750
         Width           =   720
      End
   End
   Begin mycmd.MyCommand cmdbaocun 
      Height          =   435
      Left            =   1680
      TabIndex        =   55
      Top             =   8580
      Width           =   1155
      _ExtentX        =   2037
      _ExtentY        =   767
      Caption         =   "保 存"
   End
   Begin mycmd.MyCommand MyCommand2 
      Height          =   435
      Left            =   390
      TabIndex        =   56
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "检查信息"
   End
   Begin mycmd.MyCommand MyCommand1 
      Height          =   435
      Left            =   3030
      TabIndex        =   57
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "退 出"
   End
   Begin mycmd.MyCommand MyCommand4 
      Height          =   435
      Left            =   4290
      TabIndex        =   61
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "删 除"
   End
   Begin mycmd.MyCommand MyCommand5 
      Height          =   435
      Left            =   5550
      TabIndex        =   62
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "删除明细"
   End
   Begin mycmd.MyCommand MyCommand6 
      Height          =   435
      Left            =   6780
      TabIndex        =   65
      Top             =   8580
      Visible         =   0   'False
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "合并主表"
   End
   Begin mycmd.MyCommand MyCommand7 
      Height          =   435
      Left            =   8070
      TabIndex        =   66
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "转 移 "
   End
   Begin mycmd.MyCommand MyCommand8 
      Height          =   435
      Left            =   9330
      TabIndex        =   71
      Top             =   8580
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   767
      Caption         =   "还 原"
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
      Left            =   5640
      TabIndex        =   46
      Top             =   30
      Width           =   1725
   End
   Begin VB.Label Label21 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "客户信息维护"
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
      Left            =   7800
      TabIndex        =   45
      Top             =   30
      Width           =   2880
   End
End
Attribute VB_Name = "frmkehuxinxiwh"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdbaocun_Click()
    Set Rs = Nothing
    '加密数据
    txtkehumc.Text = StringEnDeCodecn(Trim(txtkehumc.Text), 75)
    txtdianhua.Text = cipher(txtdianhua.Text)
    txtshoujihao.Text = cipher(txtshoujihao.Text)
    txtqtsm.Text = StringEnDeCodecn(Trim(txtqtsm.Text), 75)
    'txtmokuai.Text = StringEnDeCodecn(Trim(txtmokuai.Text), 75)
    txtdizhi.Text = StringEnDeCodecn(Trim(txtdizhi.Text), 75)
    txtshishiry.Text = StringEnDeCodecn(Trim(txtshishiry.Text), 75)
    txtgly.Text = StringEnDeCodecn(Trim(txtgly.Text), 75)
    txtglysj.Text = cipher(txtglysj.Text)
    txtglydh.Text = cipher(txtglydh.Text)
    txtcclx.Text = StringEnDeCodecn(Trim(txtcclx.Text), 75)
    txtfukuanqk.Text = StringEnDeCodecn(Trim(txtfukuanqk.Text), 75)
 dtpkssj.CheckBox = False
 'pym GetTextFirstLetter(cboyiyuanmc.Text))
    str = "update yw_kehuxinxi set pym='" & Text3.Text & "' , shoujihao='" & txtshoujihao.Text & "' ,yiyuanfuzher='" & StringEnDeCodecn(Trim(txtfuzheren.Text), 75) & "',yiyuanmc='" & txtkehumc.Text & "',gudingdh='" & Trim(txtdianhua.Text) & "' ,"
      str = str & IIf(DTPicker1.CheckBox, "ssjieshusj='" & DTPicker2.Value & "',", "") & IIf(DTPicker1.CheckBox, "WanGongenddime='" & DTPicker1.Value & "',", "") & "weihufei='" & (StringEnDeCodecn(Text2.Text, 75)) & "'," & IIf(dtpkssj.CheckBox, "weihuStarttime='" & dtpkssj.Value & "',", "") & IIf(dtpjieshusj.CheckBox, "weihuEndtime='" & dtpjieshusj.Value & "',", "") & vbCrLf
    str = str & "qtsm='" & Trim(txtqtsm.Text) & "',yiyuanmokuai='" & Trim(txtmokuai.Text) & "',dizhi='" & Trim(txtdizhi.Text) & "',"
    str = str & "shishiry='" & Trim(txtshishiry.Text) & "',sskaishisj='" & dtpkssj.Value & "' ,"
    str = str & "xitonggly='" & Trim(txtgly.Text) & "',glysj='" & Trim(txtglysj.Text) & "',glydh='" & Trim(txtglydh.Text) & "',"
    str = str & "cclx='" & Trim(txtcclx.Text) & "',fukuanfs='" & Trim(txtfukuanqk.Text) & "',zhuangtai='完工',enddime='" & Trim(Label23.Caption) & "' where ID='" & Trim(txtID.Text) & "'"
    conn.Execute str
    str = ""
    Dim lngRow As Integer
    For lngRow = 1 To lst1.getMaxRow
        If lst1.cellValue(lngRow, "ruanjianyk") <> lst1.cellValue(lngRow, "ruanjianykold") Then
            str = str & "update yw_kehuxinxiMingxi set ruanjianyk=" & Val(lst1.cellValue(lngRow, "ruanjianyk")) & " where AutoID=" & lst1.cellValue(lngRow, "AutoID") & vbCrLf
        End If
    Next lngRow
    If str <> "" Then
    conn.Execute str
    End If
    Call zxh1
    MsgBox "客户信息保存成功!", vbOKOnly + vbInformation, "提示"
End Sub

Private Sub cmdchaxun_Click()

    Dim i As Integer, Rs As ADODB.Recordset
    '定义查询条件

    MSHwentilb.Clear
Dim sName As String
If Check1.Value Then
sName = " yw_kehuxinxi_bak  "
Else
sName = " yw_kehuxinxi "

End If
    str = "select ID,yiyuanmc  as Khmc,pym from " & sName & " where 1=1"
    If cbobanben.Text <> "" Then
        '    cbobanben.Text = StringEnDeCodecn(Trim(cbobanben.Text), 75)
        str = str & " and banben = '" & Trim(cbobanben.Text) & "'"
        '    cbobanben.Text = StringEnDeCodecn(Trim(cbobanben.Text), 75)
    End If

    If cbo1.Text <> "" Then

        str = str & " and xiaoshoury like '%" & StringEnDeCodecn(Trim(cbo1.Text), 75) & "%'"

    End If

    '    Set MSHwentilb.DataSource = conn.Execute(str)
    '    MSHwentilb.ColWidth(1) = 5000
    Set Rs = New ADODB.Recordset
    Rs.Open str, conn, adOpenStatic
    With MSHwentilb
        .Rows = 1
        .Cols = 2
        .TextMatrix(0, 0) = "Id"
        .TextMatrix(0, 1) = "客户名称"
        .ColWidth(0) = 0
        .ColWidth(1) = 5000

        If Rs.RecordCount > 0 Then
            '未下订单客户列表
            '            .ColWidth(2) = 0
            Do While Not Rs.EOF
                If Trim(txtkehumingc.Text) <> "" Then
                    If StringEnDeCodecn(Rs("Khmc").Value, 75) Like "*" & Trim(txtkehumingc.Text) & "*" Or LCase(Rs("pym").Value) Like "*" & LCase(Trim(txtkehumingc.Text)) & "*" Then
                        .Rows = .Rows + 1
                        .TextMatrix(.Rows - 1, 0) = Rs("ID").Value
                        .TextMatrix(.Rows - 1, 1) = StringEnDeCodecn(Rs("Khmc").Value, 75)
                    End If
                Else
                    .Rows = .Rows + 1
                    .TextMatrix(.Rows - 1, 0) = Rs("ID").Value
                    .TextMatrix(.Rows - 1, 1) = StringEnDeCodecn(Rs("Khmc").Value, 75)
                End If
                Rs.MoveNext
            Loop

        End If
        Set Rs = Nothing
    End With
End Sub





'Private Sub Command1_Click()
'Text1.Text = Format(DateDiff("s", dtpkssj.Value, dtpjieshusj.Value), "00:00:00")
'
'End Sub

Private Sub Form_Load()
    Dim str1 As String
    Dim i As Integer
    '加载版本
    Set Rs = Nothing
    str1 = "SELECT DISTINCT banben FROM zd_mokuai"
    Rs.CursorLocation = adUseClient
    Rs.Open str1, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cbobanben.AddItem Rs.Fields("banben").Value
            Rs.MoveNext
        Next i
        Rs.Close
    End If



    '加载人员
    Set Rs = Nothing
    str1 = "select xingming from zd_jishuyuan where  zhiwu<>'销售人员' and zhuangtai='1'"
    Rs.CursorLocation = adUseClient
    Rs.Open str1, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            txtshishiry.AddItem Rs.Fields("xingming").Value
            Rs.MoveNext
        Next i
        Rs.Close
    End If
    lst1.EnableEdit = True
    lst1.EditColString = "4;"

    '加载默认时间
    dtpkssj.Value = "1900-1-1"
    cmdbaocun.Enabled = False
   str = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where zhuangtai='1'"
   Dim sTtaing As String
    Call BindComboBoxData(Nothing, str, "usename", sTtaing)           '销售人员
    
     objFormSetting.LoadcboData cbo1, 1, sTtaing
End Sub
Private Sub MSHwentilb_Click()
    On Error Resume Next
    Call zxh1
    '使当前行的背景色突出显示
    Me.MSHwentilb.FocusRect = flexFocusNone
    Me.MSHwentilb.SelectionMode = flexSelectionByRow
    Me.MSHwentilb.BackColorSel = 8421631
If MSHwentilb.row < 1 Then
Exit Sub
End If
    '加载当前所选数据
    str = ""
    str = "select * from yw_kehuxinxi where ID='" & Trim(MSHwentilb.TextMatrix(MSHwentilb.row, 0)) & "'"
    Set Rs = conn.Execute(str)

    '赋傎并解密

    '医院名称
    txtkehumc.Text = Rs.Fields("yiyuanmc").Value
    txtkehumc.Text = StringEnDeCodecn(Trim(txtkehumc.Text), 75)

    '版本
    txtbanben1.Text = IIf(IsNull(Rs.Fields("banben").Value), "", Rs.Fields("banben").Value)
    '  txtbanben1.Text = StringEnDeCodecn(Trim(txtbanben1.Text), 75)

    '医院负责人
    txtfuzheren.Text = Rs.Fields("yiyuanfuzher").Value
    txtfuzheren.Text = StringEnDeCodecn(Trim(txtfuzheren.Text), 75)

    '联系电话
    txtdianhua.Text = Rs.Fields("gudingdh").Value
    txtdianhua.Text = decipher(Trim(txtdianhua.Text))
Text3.Text = Rs.Fields("pym").Value
    '手机号
    txtshoujihao.Text = Rs.Fields("shoujihao").Value
    txtshoujihao.Text = decipher(Trim(txtshoujihao.Text))

    '销售人员
    txtxiaoshouren.Text = Rs.Fields("xiaoshoury").Value
    txtxiaoshouren.Text = StringEnDeCodecn(Trim(txtxiaoshouren.Text), 75)

    '下单时间
    txtsj.Text = Rs.Fields("xiadansj").Value


    '地址
    txtdizhi.Text = Rs.Fields("dizhi").Value
    txtdizhi.Text = StringEnDeCodecn(Trim(txtdizhi.Text), 75)


    '其它说明
    txtqtsm.Text = Rs.Fields("qtsm").Value
    txtqtsm.Text = StringEnDeCodecn(Trim(txtqtsm.Text), 75)

    '状态
    txtID.Text = Rs.Fields("ID").Value
 '模块内容
 Dim Rstttmp As ADODB.Recordset
 Set Rstttmp = New ADODB.Recordset
            strSql = "select a.yiyuanmokuai from yw_kehuxinxiMingxi a  with(nolock)  where  isnull(a.bShanchu,0)=0  and   a.ID='" & txtID.Text & "'"     'yiyuanmc='" & StringEnDeCodecn(strYYMC, 75) & "' and

            Rstttmp.Open strSql, conn, adOpenStatic
            If Rstttmp.RecordCount > 0 Then
                txtmokuai.Text = Rstttmp.GetString    'rs("yiyuanmokuai").Value     '
            End If
            Rstttmp.Close
'    '模块
'    txtMoKuai.Text = rs.Fields("yiyuanmokuai").Value
    '  txtmokuai.Text = StringEnDeCodecn(Trim(txtmokuai.Text), 75)

    '后期数据decipher

    '  txtkehumc.Text = StringEnDeCodecn(Trim(txtkehumc.Text), 75)
    'txtdianhua.Text = cipher(txtdianhua.Text)
    'txtshoujihao.Text = cipher(txtshoujihao.Text)
    'txtqtsm.Text = StringEnDeCodecn(Trim(txtqtsm.Text), 75)
    'txtmokuai.Text = StringEnDeCodecn(Trim(txtmokuai.Text), 75)
    'txtdizhi.Text = StringEnDeCodecn(Trim(txtdizhi.Text), 75)
    If Rs.Fields("shishiry").Value <> "" Then
        txtshishiry.Text = Rs.Fields("shishiry").Value
        txtshishiry.Text = StringEnDeCodecn(Trim(txtshishiry.Text), 75)
    End If

    If Rs.Fields("xitonggly").Value <> "" Then
        txtgly.Text = Rs.Fields("xitonggly").Value
        txtgly.Text = StringEnDeCodecn(Trim(txtgly.Text), 75)
    End If

    If Rs.Fields("glysj").Value <> "" Then
        txtglysj.Text = Rs.Fields("glysj").Value
        txtglysj.Text = decipher(txtglysj.Text)
    End If

    If Rs.Fields("glydh").Value <> "" Then
        txtglydh.Text = Rs.Fields("glydh").Value
        txtglydh.Text = decipher(txtglydh.Text)
    End If

    If Rs.Fields("cclx").Value <> "" Then
        txtcclx.Text = Rs.Fields("cclx").Value
        txtcclx.Text = StringEnDeCodecn(Trim(txtcclx.Text), 75)
    End If

    If Rs.Fields("fukuanfs").Value <> "" Then
        txtfukuanqk.Text = Rs.Fields("fukuanfs").Value
        txtfukuanqk.Text = StringEnDeCodecn(Trim(txtfukuanqk.Text), 75)
    End If
    ' dtpkssj.CheckBox = False
    If Rs.Fields("weihuStarttime").Value <> "" Then
        '   dtpkssj.v.CheckBox = True

        dtpkssj.Value = Rs.Fields("weihuStarttime").Value

    End If
    ' dtpjieshusj.CheckBox = False

    If Rs.Fields("weihuEndtime").Value <> "" Then
        '  dtpjieshusj.CheckBox = True
        dtpjieshusj.Value = Rs.Fields("weihuEndtime").Value

    End If

    If Rs.Fields("enddime").Value <> "" Then
        Label23.Caption = Rs.Fields("enddime").Value

    End If
    '      DTPicker1.CheckBox = False
    If Rs.Fields("WanGongenddime").Value <> "" Then
        'DTPicker1.CheckBox = True
        DTPicker1.Value = Rs.Fields("WanGongenddime").Value

    End If
      '      DTPicker1.CheckBox = False
    If Rs.Fields("ssjieshusj").Value <> "" Then
        'DTPicker1.CheckBox = True
        DTPicker2.Value = Rs.Fields("ssjieshusj").Value

    End If
    Text2.Text = ""
    If IsNull(Rs("weihufei").Value) = False Then
        Text2.Text = StringEnDeCodecn(Rs("weihufei").Value, 75)
    End If
    Dim g_strSQL As String
    g_strSQL = "select AutoID,banben,rjklb,ruanjianzj,isnull(ruanjianyk,0) as ruanjianyk,isnull(ruanjianyk,0)   as ruanjianykold,xiadansj,b.xiaoshoury,b.hetong from yw_kehuxinxiMingxi b with(nolock) where  isnull(b.bShanchu,0)=0 and ID=" & Rs.Fields("ID").Value

    objFormSetting.FillList Me.lst1, g_strSQL
End Sub
Public Sub zxh1()
    txtkehumc.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    txtqtsm.Text = ""
    txtmokuai.Text = ""
    txtdizhi.Text = ""
    txtshishiry.Text = ""
    txtgly.Text = ""
    txtglysj.Text = ""
    txtglydh.Text = ""
    txtcclx.Text = ""
    txtfukuanqk.Text = ""
    txtkehumc.Text = ""
    txtbanben1.Text = ""
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    txtxiaoshouren.Text = ""
    txtdizhi.Text = ""
    txtqtsm.Text = ""
    txtID.Text = ""
    txtmokuai.Text = ""
    dtpkssj.Value = "1900-1-1"
    Label23.Caption = ""
End Sub

Private Sub MyCommand1_Click()
    Unload Me
End Sub

Private Sub MyCommand2_Click()

    If Text1.Text <> "" Then
        '计算免费维护截止时间
        Label23 = DateAdd("yyyy", Val(Text1.Text), dtpjieshusj.Value)
    Else
        Exit Sub
    End If

    cmdbaocun.Enabled = True
End Sub

Private Sub MyCommand3_Click()
    cbobanben.Text = ""
    txtkehumingc.Text = ""
    MSHwentilb.Clear
    MSHwentilb.Rows = 2
End Sub

Private Sub MyCommand4Click(Optional bDelete As Boolean)
    On Error GoTo e01
    Dim bTran As Boolean
    If MSHwentilb.row < 1 Then
        Exit Sub
    End If
    Dim sStr As String
    sStr = Trim(MSHwentilb.TextMatrix(MSHwentilb.row, 1))
    If MsgBox("你确认要" & IIf(bDelete, "删除 ", "转移 ") & sStr, vbQuestion + vbYesNo) = vbNo Then
        Exit Sub
    End If
    conn.BeginTrans
    bTran = True

    '更新签单人和签单时间
    Set Rs = Nothing
    str = "select Khbm,Khmc,Qy from Khxx  with(nolock) "
    Rs.Open str, conn, adOpenStatic
    str = ""
    Do While Not Rs.EOF
        Debug.Print Decode(Rs("Khmc").Value)
        If Decode(Rs("Khmc").Value) = sStr Then
            If bDelete Then
                str = "update Khxx set Qdr=null,Qdsj=null where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf

            Else
                 str = str & "insert into Khxx_bak select *   FROM Khxx where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf
                str = str & "delete Khxx where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf

            End If
            Exit Do
        End If
        Rs.MoveNext
    Loop
    Rs.Close
    Set Rs = Nothing
    If bDelete = False Then
             str = str & "insert into yw_kehuxinxi_bak select *   FROM yw_kehuxinxi  where ID= {0}  " & vbCrLf
                str = str & "insert into yw_kehuxinxiMingxi_bak select *   FROM yw_kehuxinxiMingxi  where ID= {0}  " & vbCrLf
     End If
    '明细表
    str = str & "delete yw_kehuxinxiMingxi where ID= {0} " & vbCrLf
    '主表
    str = str & "delete [yw_kehuxinxi] where ID= {0} " & vbCrLf
    str = Replace(str, "{0}", Val(MSHwentilb.TextMatrix(MSHwentilb.row, 0)))
    conn.Execute str
    conn.CommitTrans
    bTran = False
    If MSHwentilb.Rows > 1 Then
        MSHwentilb.RemoveItem MSHwentilb.row
    End If
    Exit Sub
e01:
    If bTran Then
        conn.RollbackTrans
    End If
    MsgBox "删除出错:" & Err.Description

End Sub
Private Sub MyCommand8Click(Optional bDelete As Boolean)
    On Error GoTo e01
    Dim bTran As Boolean
    If MSHwentilb.row < 1 Then
        Exit Sub
    End If
    Dim sStr As String
    sStr = Trim(MSHwentilb.TextMatrix(MSHwentilb.row, 1))
    If MsgBox("你确认要" & IIf(bDelete, "还原 ", "  ") & sStr, vbQuestion + vbYesNo) = vbNo Then
        Exit Sub
    End If
    conn.BeginTrans
    bTran = True

    '更新签单人和签单时间
    Set Rs = Nothing
    str = "select Khbm,Khmc,Qy from Khxx_bak  with(nolock) "
    Rs.Open str, conn, adOpenStatic
    str = ""
    Do While Not Rs.EOF
       
        If Decode(Rs("Khmc").Value) = sStr Then
            If bDelete Then
'                str = "update Khxx set Qdr=null,Qdsj=null where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf
'
'            Else
                 str = str & "insert into Khxx select *   FROM  Khxx_bak where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf
                    str = str & "delete Khxx_bak where Khbm='" & Rs("Khbm").Value & "'" & vbCrLf


            End If
            Exit Do
        End If
        Rs.MoveNext
    Loop
    Rs.Close
    Set Rs = Nothing
   ' If bDelete = False Then
             str = str & "insert into yw_kehuxinxi select *   FROM  yw_kehuxinxi_bak where ID= {0}  " & vbCrLf
             str = str & "SET IDENTITY_INSERT  dbo.yw_kehuxinxiMingxi ON " & vbCrLf
                str = str & "insert into yw_kehuxinxiMingxi (     AutoID, ID, banben, rjklb, yanshiry, yiyuanmokuai, xiaoshoury, qtsm, xiadansj, jilusj, glysj, ruanjianzj, fukuanfs, ruanjianyk, hetong, piaoju, bShanchu)" & vbCrLf
                str = str & "select AutoID, ID, banben, rjklb, yanshiry, yiyuanmokuai, xiaoshoury, qtsm, xiadansj, jilusj, glysj, ruanjianzj, fukuanfs, ruanjianyk, hetong, piaoju, bShanchu FROM yw_kehuxinxiMingxi_bak     where ID= {0}  " & vbCrLf
   '  End If
    '明细表
   str = str & "delete yw_kehuxinxiMingxi_bak where ID= {0} " & vbCrLf
    '主表
    str = str & "delete [yw_kehuxinxi_bak] where ID= {0} " & vbCrLf
    str = Replace(str, "{0}", Val(MSHwentilb.TextMatrix(MSHwentilb.row, 0)))
    conn.Execute str
    conn.CommitTrans
    bTran = False
    If MSHwentilb.Rows > 1 Then
        MSHwentilb.RemoveItem MSHwentilb.row
    End If
    Exit Sub
e01:
    If bTran Then
        conn.RollbackTrans
    End If
    MsgBox "删除出错:" & Err.Description

End Sub


Private Sub MyCommand4_Click()
 MyCommand4Click True
End Sub

Private Sub MyCommand5_Click()
    On Error GoTo e01
    Dim bTran As Boolean
    If lst1.getSelectedRow < 1 Then
        Exit Sub
    End If
    Dim sStr As String
    sStr = Trim(lst1.TextMatrix(lst1.getSelectedRow, 1))
    If MsgBox("你确认要删除 " & sStr, vbQuestion + vbYesNo) = vbNo Then
        Exit Sub
    End If

    str = ""
    conn.BeginTrans
    bTran = True

    '明细表
    str = "update  yw_kehuxinxiMingxi set bShanchu=1 where AutoID= {0} " & vbCrLf
    str = Replace(str, "{0}", Val(lst1.TextMatrix(lst1.getSelectedRow, 0)))
    conn.Execute str
    conn.CommitTrans
    bTran = False
    lst1.RemoveItem lst1.getSelectedRow
     Exit Sub
e01:
    If bTran Then
        conn.RollbackTrans
    End If
    MsgBox "删除明细出错:" & Err.Description
End Sub

Private Sub MyCommand6_Click()
'主表
    On Error GoTo e01
    Dim Rs1 As New ADODB.Recordset
    Dim bTran As Boolean
    Dim Id As Long
    If conn.Execute("select  yiyuanmc from yw_kehuxinxi with(nolock) group by  yiyuanmc having count(*)>1").RecordCount < 1 Then
        MsgBox "已经整理过，不需要再整理！"
        Exit Sub
    End If
    Set Rs = New ADODB.Recordset
    conn.BeginTrans
    bTran = True
    Rs.Open "select  yiyuanmc,min(id) as id from yw_kehuxinxi with(nolock) group by  yiyuanmc having count(*) >=1  ", conn, adOpenForwardOnly, adLockReadOnly
    With Rs
        Do While .EOF = False
            Id = .Fields("id").Value
            Set Rs1 = New ADODB.Recordset
            Rs1.Open "select  *  from yw_kehuxinxi with(nolock)  where yiyuanmc='" & GetNZ(Rs.Fields("yiyuanmc").Value) & "'", conn, adOpenForwardOnly, adLockReadOnly
            Do While Rs1.EOF = False
                conn.Execute "update yw_kehuxinxi set pym=dbo.fun_getPY('" & (StringEnDeCodecn(Rs1.Fields("yiyuanmc").Value, 75)) & "') where Id=" & Id
                str = "insert into yw_kehuxinxiMingxi ( ID,banben,rjklb,ruanjianzj, ruanjianyk,xiaoshoury,yanshiry,fukuanfs,qtsm,hetong,piaoju,yiyuanmokuai,xiadansj)" & vbCrLf
                str = str & " values ({0},'{9}' ,'{10}',{11},{12},'{13}','{14}','{15}','{16}' ,'{17}','{18}','{20}','{6}')" & vbCrLf
                str = Replace(str, "{0}", Id)
                str = Replace(str, "{9}", GetNZ(Rs1.Fields("banben").Value))
                str = Replace(str, "{10}", GetNZ(Rs1.Fields("rjklb").Value))
                str = Replace(str, "{11}", Val(StringEnDeCodecn(GetNZ(Rs1.Fields("ruanjianzj").Value), 75)))
                str = Replace(str, "{12}", Val(StringEnDeCodecn(GetNZ(Rs1.Fields("ruanjianyk").Value), 75)))
                str = Replace(str, "{13}", StringEnDeCodecn(GetNZ(Rs1.Fields("xiaoshoury").Value), 75))
                str = Replace(str, "{14}", "")    'yanshiry
                str = Replace(str, "{15}", StringEnDeCodecn(GetNZ(Rs1.Fields("fukuanfs").Value), 75))  ' fukuanfs
                str = Replace(str, "{16}", GetNZ(Rs1.Fields("qtsm").Value))    'qtsm
                str = Replace(str, "{17}", GetNZ(Rs1.Fields("hetong").Value))
                str = Replace(str, "{18}", GetNZ(Rs1.Fields("piaoju").Value))
                str = Replace(str, "{20}", GetNZ(Rs1.Fields("yiyuanmokuai").Value))
                str = Replace(str, "{6}", GetNZ(Rs1.Fields("xiadansj").Value))
                conn.Execute str
                Rs1.MoveNext
            Loop
            .MoveNext
        Loop
    End With
    conn.Execute "delete b from yw_kehuxinxi b " & vbCrLf & _
               " where yiyuanmc in  " & vbCrLf & _
               " (select  yiyuanmc from yw_kehuxinxi with(nolock) group by  yiyuanmc having count(*)> 1 ) " & vbCrLf & _
               " and id not in (select  min(id) as id from yw_kehuxinxi with(nolock) group by  yiyuanmc having count(*)> 1 )  " & vbCrLf

    conn.CommitTrans
    bTran = False
    Exit Sub
e01:
    If bTran Then
        conn.RollbackTrans
    End If
    MsgBox "合并时出错:" & Err.Description
End Sub
Private Function GetNZ(sValue As Variant) As String
On Error GoTo e01
GetNZ = sValue
Exit Function
e01:

GetNZ = ""
End Function

Private Sub MyCommand7_Click()
 MyCommand4Click False
End Sub

Private Sub MyCommand8_Click()
MyCommand8Click (True)
End Sub

Private Sub txtkehumc_Validate(Cancel As Boolean)
Text3.Text = conn.Execute("select dbo.fun_getPY('" & txtkehumc.Text & "')").Fields(0).Value
'GetTextFirstLetter
End Sub
