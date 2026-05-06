VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmdiandan 
   BackColor       =   &H00E0E0E0&
   Caption         =   "产品订单系统"
   ClientHeight    =   10950
   ClientLeft      =   60
   ClientTop       =   1005
   ClientWidth     =   15120
   DrawStyle       =   1  'Dash
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   10950
   ScaleWidth      =   15120
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'None
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
      Height          =   675
      Left            =   330
      TabIndex        =   60
      Top             =   8910
      Width           =   10785
      Begin mycmd.MyCommand MyCommand1 
         Height          =   375
         Left            =   9480
         TabIndex        =   61
         Top             =   210
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "退 出"
      End
      Begin mycmd.MyCommand Command2 
         Height          =   375
         Left            =   6600
         TabIndex        =   62
         Top             =   210
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "打印订单"
      End
      Begin mycmd.MyCommand cmdbaocun 
         Height          =   375
         Left            =   8040
         TabIndex        =   63
         Top             =   210
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "保存订单"
      End
      Begin mycmd.MyCommand cmdscdd 
         Height          =   375
         Left            =   5160
         TabIndex        =   64
         Top             =   210
         Visible         =   0   'False
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         Caption         =   "生成订单"
      End
   End
   Begin MSComctlLib.ListView lstMoKuai 
      Height          =   4575
      Left            =   5460
      TabIndex        =   41
      Top             =   2265
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
      TabIndex        =   36
      Top             =   600
      Width           =   3855
      Begin VB.TextBox txtKHMC 
         Height          =   375
         Left            =   960
         TabIndex        =   47
         Top             =   7920
         Width           =   2655
      End
      Begin MSFlexGridLib.MSFlexGrid FxGridKH 
         Height          =   4095
         Left            =   120
         TabIndex        =   45
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
         TabIndex        =   42
         Top             =   8520
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         Caption         =   "检 索"
      End
      Begin MSFlexGridLib.MSFlexGrid FxGridQy 
         Height          =   2895
         Left            =   120
         TabIndex        =   40
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
         TabIndex        =   46
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
         TabIndex        =   44
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
         TabIndex        =   43
         Top             =   240
         Width           =   1080
      End
   End
   Begin VB.TextBox Text3 
      Height          =   465
      Left            =   1440
      TabIndex        =   18
      Text            =   "Text3"
      Top             =   150
      Visible         =   0   'False
      Width           =   1725
   End
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   180
      TabIndex        =   17
      Text            =   "Text2"
      Top             =   120
      Visible         =   0   'False
      Width           =   1185
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
      Height          =   8265
      Left            =   210
      TabIndex        =   0
      Top             =   600
      Width           =   10815
      Begin VB.ComboBox txtFkfs 
         Height          =   300
         ItemData        =   "frmdiandan.frx":0000
         Left            =   930
         List            =   "frmdiandan.frx":0016
         TabIndex        =   65
         Top             =   2910
         Width           =   1800
      End
      Begin VB.TextBox Text5 
         Height          =   315
         Left            =   930
         TabIndex        =   58
         Text            =   "0"
         Top             =   4050
         Width           =   1800
      End
      Begin VB.TextBox Text1 
         Height          =   315
         Left            =   7710
         TabIndex        =   56
         Top             =   3533
         Width           =   1800
      End
      Begin VB.ComboBox cbopj 
         Height          =   300
         ItemData        =   "frmdiandan.frx":003E
         Left            =   4590
         List            =   "frmdiandan.frx":004E
         TabIndex        =   55
         Top             =   4050
         Width           =   1800
      End
      Begin VB.ComboBox cboht 
         Height          =   300
         ItemData        =   "frmdiandan.frx":0068
         Left            =   4590
         List            =   "frmdiandan.frx":0072
         TabIndex        =   54
         Top             =   3540
         Width           =   1800
      End
      Begin VB.ComboBox cborjk 
         Height          =   300
         ItemData        =   "frmdiandan.frx":008C
         Left            =   7710
         List            =   "frmdiandan.frx":00A2
         TabIndex        =   51
         Top             =   4050
         Width           =   1800
      End
      Begin VB.ComboBox cboyanshiry 
         Height          =   300
         ItemData        =   "frmdiandan.frx":00FA
         Left            =   7710
         List            =   "frmdiandan.frx":0101
         TabIndex        =   48
         Top             =   2910
         Width           =   1800
      End
      Begin VB.CheckBox Check3 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CHS"
         Enabled         =   0   'False
         Height          =   255
         Left            =   7440
         TabIndex        =   39
         Top             =   1290
         Width           =   615
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CRM"
         Enabled         =   0   'False
         Height          =   255
         Left            =   6390
         TabIndex        =   38
         Top             =   1290
         Width           =   615
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "HIS"
         Enabled         =   0   'False
         Height          =   255
         Left            =   5250
         TabIndex        =   37
         Top             =   1290
         Width           =   615
      End
      Begin VB.TextBox txtRjyk 
         Height          =   315
         Left            =   930
         TabIndex        =   35
         Text            =   "0"
         Top             =   1260
         Width           =   1800
      End
      Begin VB.TextBox txtBj 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4590
         TabIndex        =   34
         Top             =   713
         Width           =   1590
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   1425
         Left            =   930
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   32
         Top             =   4560
         Width           =   3195
      End
      Begin VB.TextBox txtMoKuai 
         Height          =   915
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   28
         Top             =   1800
         Width           =   10455
      End
      Begin VB.ComboBox txtxiaoshouren 
         Height          =   300
         ItemData        =   "frmdiandan.frx":010D
         Left            =   4590
         List            =   "frmdiandan.frx":010F
         TabIndex        =   27
         Top             =   2910
         Width           =   1800
      End
      Begin VB.CheckBox Check12 
         BackColor       =   &H00E0E0E0&
         Caption         =   "是否升级用户"
         ForeColor       =   &H8000000D&
         Height          =   345
         Left            =   3720
         TabIndex        =   26
         Top             =   1245
         Width           =   1425
      End
      Begin VB.TextBox txtshoujihao 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   9180
         TabIndex        =   25
         Top             =   285
         Width           =   1365
      End
      Begin VB.CheckBox Check36 
         BackColor       =   &H00E0E0E0&
         Caption         =   "患者随访管理"
         Height          =   285
         Left            =   16320
         TabIndex        =   24
         Top             =   3300
         Width           =   1395
      End
      Begin VB.CheckBox Check35 
         BackColor       =   &H00E0E0E0&
         Caption         =   "市场调查"
         Height          =   285
         Left            =   15165
         TabIndex        =   23
         Top             =   3300
         Width           =   1065
      End
      Begin VB.CheckBox Check30 
         BackColor       =   &H00E0E0E0&
         Caption         =   "老年保健"
         Height          =   285
         Left            =   16890
         TabIndex        =   22
         Top             =   2370
         Width           =   1065
      End
      Begin VB.CheckBox Check29 
         BackColor       =   &H00E0E0E0&
         Caption         =   "家床管理"
         Height          =   285
         Left            =   15840
         TabIndex        =   21
         Top             =   2370
         Width           =   1065
      End
      Begin VB.CheckBox Check23 
         BackColor       =   &H00E0E0E0&
         Caption         =   "体检管理"
         Height          =   285
         Left            =   16770
         TabIndex        =   20
         Top             =   1800
         Width           =   1065
      End
      Begin VB.CheckBox Check22 
         BackColor       =   &H00E0E0E0&
         Caption         =   "计划生育"
         Height          =   285
         Left            =   15690
         TabIndex        =   19
         Top             =   1800
         Width           =   1065
      End
      Begin VB.ComboBox cbobanben 
         Height          =   300
         ItemData        =   "frmdiandan.frx":0111
         Left            =   930
         List            =   "frmdiandan.frx":0113
         TabIndex        =   15
         Top             =   3540
         Width           =   1800
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
         Left            =   930
         TabIndex        =   2
         Top             =   277
         Width           =   2595
      End
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         Height          =   570
         Left            =   7095
         TabIndex        =   1
         Top             =   600
         Width           =   3450
      End
      Begin MSComCtl2.DTPicker txtsj 
         Height          =   315
         Left            =   7680
         TabIndex        =   5
         Top             =   4530
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   556
         _Version        =   393216
         Format          =   112459777
         CurrentDate     =   39105
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件余款"
         ForeColor       =   &H000000FF&
         Height          =   180
         Index           =   7
         Left            =   120
         TabIndex        =   59
         Top             =   4110
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "订单金额"
         ForeColor       =   &H000000FF&
         Height          =   180
         Index           =   6
         Left            =   6780
         TabIndex        =   57
         Top             =   3600
         Width           =   720
      End
      Begin VB.Label Label29 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "票据"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   3720
         TabIndex        =   53
         Top             =   4110
         Width           =   360
      End
      Begin VB.Label Label28 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "合同"
         ForeColor       =   &H8000000D&
         Height          =   180
         Left            =   3720
         TabIndex        =   52
         Top             =   3600
         Width           =   360
      End
      Begin VB.Label Label24 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "款类别"
         ForeColor       =   &H00FF0000&
         Height          =   180
         Left            =   6780
         TabIndex        =   50
         Top             =   4110
         Width           =   540
      End
      Begin VB.Label Label22 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "演示人员"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   6780
         TabIndex        =   49
         Top             =   2970
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "其它说明"
         Height          =   180
         Index           =   3
         Left            =   120
         TabIndex        =   33
         Top             =   4620
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "维护费"
         Height          =   180
         Index           =   2
         Left            =   120
         TabIndex        =   31
         Top             =   1327
         Width           =   540
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "付款方式"
         ForeColor       =   &H000000FF&
         Height          =   180
         Index           =   1
         Left            =   120
         TabIndex        =   30
         Top             =   2970
         Width           =   720
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "软件总价"
         Height          =   180
         Index           =   0
         Left            =   3720
         TabIndex        =   29
         Top             =   780
         Width           =   720
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   120
         TabIndex        =   16
         Top             =   3600
         Width           =   720
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackColor       =   &H00E0E0E0&
         Caption         =   "手机号"
         ForeColor       =   &H000000FF&
         Height          =   210
         Left            =   8640
         TabIndex        =   14
         Top             =   322
         Width           =   540
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         ForeColor       =   &H000000FF&
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
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3720
         TabIndex        =   10
         Top             =   2970
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "下单时间"
         ForeColor       =   &H000000FF&
         Height          =   180
         Index           =   5
         Left            =   6870
         TabIndex        =   9
         Top             =   4590
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院主要负责人"
         ForeColor       =   &H000000FF&
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
         ForeColor       =   &H000000FF&
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
         ForeColor       =   &H000000FF&
         Height          =   180
         Index           =   1
         Left            =   6300
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
Attribute VB_Name = "frmdiandan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Dim obj As proBaoBiaoGG.clsRpt_LIB
Dim strsql As String

Public m_strKhbm As String                '客户编码

Private Sub cbobanben_KeyDown(KeyCode As Integer, Shift As Integer)
     If KeyCode = 13 And cbobanben.Text <> "" Then
        Text6.SetFocus
    End If
End Sub

Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCode = 0
End Sub


Private Sub cboyiyuanmc_KeyPress(KeyAscii As Integer)
KeyAscii = 0
End Sub

Private Sub cboyiyuanmc_LostFocus()                 '查询当前客户的联系信息
    Dim strsql As String
    Dim lngRow As Long
    
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    cbobanben.Text = ""
    Text6.Text = ""
    txtBj.Text = ""
    txtxiaoshouren.Text = ""
    txtmokuai.Text = ""
    
    txtRjyk.Text = 0
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
            
            strsql = "select * from yw_kehuxinxi where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'" & strtiaojian
            Set rs = Nothing
            rs.Open strsql, conn, adOpenStatic
            
            If rs.RecordCount > 0 Then
                On Error Resume Next
                
                If rs.RecordCount > 1 Then
                    With FrmKeHu
                        .strType = "Old"
                        .Show 1
                    End With
                Else
                    txtfuzheren.Text = StringEnDeCodecn(rs("yiyuanfuzher").Value, 75)
                    txtdianhua.Text = decipher(rs("gudingdh").Value)
                    txtshoujihao.Text = decipher(rs("shoujihao").Value)
                    cbobanben.Text = rs("banben").Value
                    Text6.Text = StringEnDeCodecn(rs("dizhi").Value, 75)
    
                    txtxiaoshouren.Text = StringEnDeCodecn(rs("xiaoshoury").Value, 75)
                    txtmokuai.Text = rs("yiyuanmokuai").Value
                    txtBj.Text = StringEnDeCodecn(rs("ruanjianzj").Value, 75)
                    txtRjyk.Text = StringEnDeCodecn(rs("ruanjianyk").Value, 75)
                    txtFkfs.Text = StringEnDeCodecn(rs("fukuanfs").Value, 75)
                    Text4.Text = StringEnDeCodecn(rs("qtsm").Value, 75)
                End If
            Else
                txtxiaoshouren.Text = user
            End If
            Set rs = Nothing
        Else
            If g_strYongHuZT = "3" Then           '销售经理
                strtiaojian = ""                    '" and Xsry='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
            Else    'If g_strYongHuZT = "2" Then       '普通销售人员
                strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
            End If
            
            strsql = "select Khbm,isnull(Khmc,'') as Khmc from khxx where Qtjd='成交' and isnull(Qdr,'')=''" & strtiaojian
            Set rs = Nothing
            rs.Open strsql, conn, adOpenStatic
            
            If rs.RecordCount > 0 Then
                For lngRow = 0 To rs.RecordCount - 1
                    If Decode(rs("Khmc").Value) = cboyiyuanmc.Text Then
                        Exit For
                    End If
                    rs.MoveNext
                Next lngRow
                
                If lngRow < rs.RecordCount Then
                    strsql = "select * from khxx where khbm='" & rs("Khbm").Value & "'"
                    Set rs = Nothing
                    rs.Open strsql, conn, adOpenStatic
                    If rs.RecordCount > 0 Then
                        On Error Resume Next
                        
                        If rs.RecordCount > 1 Then
                            With FrmKeHu
                                .strType = "New"
                                .Show 1
                            End With
                        Else
                            txtfuzheren.Text = Decode(rs("fzr").Value)
                            txtdianhua.Text = Decode(rs("gddh").Value)
                            txtshoujihao.Text = Decode(rs("sj").Value)
                            cbobanben.Text = rs("banben").Value
                            Text6.Text = Decode(rs("khdz").Value)
                            txtBj.Text = Decode(rs("bj").Value)
                            txtxiaoshouren.Text = rs("xsry").Value
                            txtmokuai.Text = rs("sxmk").Value
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
            Set rs = Nothing
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
    strTmp = Split(txtmokuai.Text, vbCrLf)
    
    If Check1.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strsql = "select mokuai  from xt_mokuai where xt='his' order by mokuai"
        Set rs = Nothing
        rs.Open strsql, conn
        
        If rs.RecordCount > 0 Then
            For i = 1 To rs.RecordCount
                lstMoKuai.ListItems.Add i, "his" & i, rs("mokuai")
                rs.MoveNext
            Next i
        End If
        txtmokuai.Text = ""
'        'HIS模块去掉字符，判断选中
'        If UBound(strTmp) >= 0 Then
'            For k = LBound(strTmp) To UBound(strTmp)
'                If Left(strTmp(k), 5) = "HIS模块" Then
'                    '去掉附加字符
'                    strTmp(k) = Mid(strTmp(k), 7)
'                    '拆分模块
'                    strMokuai = Split(strTmp(k), " ")
'                    '选中匹配的
'                    For i = LBound(strMokuai) To UBound(strMokuai)
'                        For j = 1 To lstMoKuai.ListItems.Count
'                            If lstMoKuai.ListItems(j).Text = Mid(strMokuai(i), 2) Then
'                                lstMoKuai.ListItems(j).Checked = True
'                                Exit For
'                            End If
'                        Next j
'                    Next i
'                    Exit For
'                End If
'            Next k
'        End If
        Set rs = Nothing
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
            
            txtmokuai.Text = strMk
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
    strTmp = Split(txtmokuai.Text, vbCrLf)
    
    If Check2.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strsql = "select mokuai  from xt_mokuai where xt='crm' order by mokuai"
        Set rs = Nothing
        rs.Open strsql, conn
        
        If rs.RecordCount > 0 Then
            For i = 1 To rs.RecordCount
                lstMoKuai.ListItems.Add i, "crm" & i, rs("mokuai")
                rs.MoveNext
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
        Set rs = Nothing
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
            
            txtmokuai.Text = strMk
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
    strTmp = Split(txtmokuai.Text, vbCrLf)
    
    If Check3.Value = 1 Then                    '选中状态
        lstMoKuai.Visible = False
        lstMoKuai.ListItems.Clear   '清空列表
        strsql = "select mokuai  from xt_mokuai where xt='chs' order by mokuai"
        Set rs = Nothing
        rs.Open strsql, conn
        
        If rs.RecordCount > 0 Then
            For i = 1 To rs.RecordCount
                lstMoKuai.ListItems.Add i, "chs" & i, rs("mokuai")
                rs.MoveNext
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
        Set rs = Nothing
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
            
            txtmokuai.Text = strMk
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
    
    txtmokuai.Text = ""
    Check1.Value = 0
    Check2.Value = 0
    Check3.Value = 0
End Sub

Private Sub cmdbaocun_Click()                           '保存订单
    If cmdscddClick = False Then
        Exit Sub

    End If
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
    strkhmc = Trim(StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75))
    strLXR = StringEnDeCodecn(Trim(txtfuzheren.Text), 75)
    strDZ = StringEnDeCodecn(Trim(Text6.Text), 75)
    'txtMoKuai.Text = StringEnDeCodecn(Trim(txtMoKuai.Text), 75)
    strSYMK = Trim(txtmokuai.Text)                                          'StringEnDeCodecn(trim(txtMoKuai.Text),75)
    strQTSM = StringEnDeCodecn(Trim(Text4.Text), 75)
    strXsry = StringEnDeCodecn(Trim(txtxiaoshouren.Text), 75)
    strXDSJ = Trim(txtsj.Value)
    'cbobanben.Text = StringEnDeCodecn(Trim(cbobanben.Text), 75)
    strBB = Trim(cbobanben.Text)

    strRJZJ = StringEnDeCodecn(txtBj.Text, 75)         '软件总价
    strRJFKFS = StringEnDeCodecn(txtFkfs.Text, 75)       '软件付款方式
    strRJYK = StringEnDeCodecn(Text5.Text, 75)         '软件余款

    strRJZJtxtRjyk = StringEnDeCodecn(txtRjyk.Text, 75)         '软件总价

    strGDDH = cipher(txtdianhua.Text)
    strSJ = cipher(txtshoujihao.Text)

    '主表
    str = " declare @int int" & vbCrLf
    str = str & "if exists(select yiyuanmc from [yw_kehuxinxi] with(nolock)  where     yiyuanmc = '{0}' )" & vbCrLf
    str = str & "begin" & vbCrLf
    str = str & "select @int= ID from [yw_kehuxinxi] with(nolock) where  yiyuanmc = '{0}'" & vbCrLf

    str = str & "update  yw_kehuxinxi set pym='{20}', yiyuanfuzher='{1}',gudingdh='{2}',shoujihao='{3}',dizhi='{4}',ruanjianzj='{5}'  ,weihufei='{8}'    where  ID= @int " & vbCrLf
    str = str & "End" & vbCrLf
    str = str & "Else" & vbCrLf
    str = str & "begin" & vbCrLf
    str = str & "select @int=isnull(max(ID),0)+1 from [yw_kehuxinxi] with(nolock)" & vbCrLf
    str = str & "insert into yw_kehuxinxi ( ID,yiyuanmc,yiyuanfuzher,gudingdh ,shoujihao,dizhi,ruanjianzj, weihufei,xiaoshoury,pym)" & vbCrLf
    str = str & " values (@int,'{0}' ,'{1}','{2}','{3}','{4}','{5}' ,'{8}','{21}','{20}')" & vbCrLf
    str = str & "End" & vbCrLf
    '明细表
    str = str & "insert into yw_kehuxinxiMingxi ( ID,banben,rjklb,ruanjianzj,ruanjianyk,xiaoshoury,yanshiry,fukuanfs,qtsm,hetong,piaoju,yiyuanmokuai,xiadansj)" & vbCrLf
    str = str & " values (@int,'{9}' ,'{10}',{11},{12},'{13}','{14}','{15}','{16}' ,'{17}','{18}','{7}','{6}')" & vbCrLf

    str = Replace(str, "{0}", strkhmc)
    str = Replace(str, "{1}", strLXR)
    str = Replace(str, "{2}", strGDDH)
    str = Replace(str, "{3}", strSJ)
    str = Replace(str, "{4}", strDZ)
    str = Replace(str, "{5}", strRJZJ)
    str = Replace(str, "{6}", strXDSJ)
    str = Replace(str, "{7}", strSYMK)
    str = Replace(str, "{8}", strRJZJtxtRjyk)
    '---
    str = Replace(str, "{9}", strBB)
    str = Replace(str, "{10}", cborjk.Text)
    str = Replace(str, "{11}", Val(Text1.Text))
    str = Replace(str, "{12}", Val(Text5.Text))
    str = Replace(str, "{13}", txtxiaoshouren.Text)
    str = Replace(str, "{14}", cboyanshiry.Text)
    str = Replace(str, "{15}", txtFkfs)
    str = Replace(str, "{16}", strQTSM)
    str = Replace(str, "{17}", cboht.Text)
    str = Replace(str, "{18}", cbopj.Text)
   str = Replace(str, "{20}", conn.Execute("select dbo.fun_getPY('" & Trim(cboyiyuanmc.Text) & "')").Fields(0).Value)
   ' GetTextFirstLetter(cboyiyuanmc.Text))
   str = Replace(str, "{21}", strXsry)

    conn.Execute str
    'MsgBox "订单保存成功,客户名称保存成功!", vbOKOnly + vbInformation, "提示"
   
 
    '更新签单人和签单时间
    Set rs = Nothing
    str = "select Khbm,Khmc,Qy from Khxx where isnull(Qdr,'')=''"
    rs.Open str, conn, adOpenStatic
    
    Do While Not rs.EOF
        If Decode(rs("Khmc").Value) = Trim(cboyiyuanmc.Text) Then
            strqy = rs("qy").Value                  '保存区域值

            str = "update Khxx set Qdr='" & txtxiaoshouren.Text & "',Qdsj='" & Now() & "' where Khbm='" & rs("Khbm").Value & "'"
            Set rs = Nothing
            rs.Open str, conn

            '更新区域
            str = "update yw_kehuxinxi set qy='" & strqy & "' where yiyuanmc='" & StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75) & "'"
            Set rs = Nothing
            rs.Open str, conn

            Set rs = Nothing
            Exit Do
        End If
        rs.MoveNext
    Loop

    Set rs = Nothing
     Call Command2_Click
     
    Call adidas

    Call MyCommand2_Click
End Sub

Private Function cmdscddClick() As Boolean                      '生成订单
    If cboyiyuanmc.Text = "" Then
        MsgBox "客户名称不能为空"
        cboyiyuanmc.SetFocus
        Exit Function
    End If
    
    If txtfuzheren.Text = "" Then
        MsgBox "医院主要负责人不能为空"
        txtfuzheren.SetFocus
        Exit Function
    End If
    
    If txtdianhua.Text = "" And txtshoujihao.Text = "" Then
        MsgBox "联系电话和手机号不能同时为空"
        txtdianhua.SetFocus
        Exit Function
    End If
    
    If txtxiaoshouren.Text = "" Then
        MsgBox "销售人员不能为空"
        txtxiaoshouren.SetFocus
        Exit Function
    End If
    
    If Text6.Text = "" Then
        MsgBox "客户地址不能为空"
        Text6.SetFocus
        Exit Function
    End If
    
    If cbobanben.Text = "" Then
        MsgBox "软件版本不能为空"
        cbobanben.SetFocus
        Exit Function
    End If
    
    If Text1.Text = "" Then
        MsgBox "请输入订单金额"
        Text1.SetFocus
        Exit Function
    End If
    
    If txtFkfs.Text = "" Then
        MsgBox "请输入软件付款方式"
        txtFkfs.SetFocus
        Exit Function
    End If
    
    If Text5.Text = "" Then
        MsgBox "请输入软件余款"
        Text5.SetFocus
        Exit Function
    End If
'
'    If txtmokuai.Text = "" Then
'        MsgBox "请选择所需模块"
'        txtmokuai.SetFocus
'        Exit Function
'    End If
     cmdscddClick = True
     
End Function
Public Sub ddd()
   txtmokuai.Text = ""
   
End Sub
Public Sub adidas()
    cboyiyuanmc.Text = ""
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    Text6.Text = ""
    txtmokuai.Text = ""
    cborjk.Text = ""
    Text1.Text = ""
    txtsj.Value = Now
    cbobanben.Text = ""

    txtBj.Text = ""
    cboyanshiry.Text = ""
    Text5.Text = 0


    cboyiyuanmc.Text = ""
    txtfuzheren.Text = ""
    txtdianhua.Text = ""
    txtshoujihao.Text = ""
    'txtxiaoshouren.Text = ""//屏蔽销售人达到销售人可重复下订单
    cbobanben.Text = ""
    Text6.Text = ""
    txtmokuai.Text = ""
    Text4.Text = ""
    Text1.Text = ""
    cboht.Text = ""
    cbopj.Text = ""

    txtBj.Text = ""
    txtFkfs.Text = ""
    txtRjyk.Text = 0
End Sub


Private Sub Command2_Click()                                '打印订单
 Dim col As New Collection
 

If MsgBox("是否确认要打印?", vbYesNo + vbQuestion, "提示") = vbYes Then
    If txtmokuai.Text <> "" Then
         col.Add "客户名称"
         col.Add cboyiyuanmc.Text
         
         col.Add "联系人"
         col.Add txtfuzheren.Text
         
         col.Add "联系电话"
         col.Add txtdianhua.Text
        
         col.Add "手机号"
         col.Add txtshoujihao.Text
         
         col.Add "地址"
         col.Add Text6.Text
         
         col.Add "所用模块"
         col.Add txtmokuai.Text
         
         col.Add "其它说明"
         col.Add Text4.Text
         
         col.Add "销售人员"
         col.Add txtxiaoshouren.Text
         
         col.Add "演示人员"
         col.Add cboyanshiry.Text
         
         col.Add "下单时间"
         col.Add txtsj.Value
         
         col.Add "软件版本"
         col.Add cbobanben.Text
         
          col.Add "软件余款"
         col.Add Text5.Text
         
          col.Add "软件总价"
         col.Add Text1.Text
         
          col.Add "软件付款方式"
         col.Add txtFkfs.Text
         
         col.Add "软件款类别"
         col.Add cborjk.Text
         
         col.Add "合同"
         col.Add cboht.Text
         
         col.Add "票据"
         col.Add cbopj.Text
         
         col.Add "销售人员"
         col.Add user

         Call Grf.ReportDes_Auto(0, col, App.Path & "\Report\订单.grf")

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
  
    txtsj.Value = Now
    
     '重新设置窗体上的控件大小
   ' rsz.ReadXY Me, 15360, 10485
    '1创建对象
'    Set obj = CreateObject("proBaoBiaoGG.clsRpt_LIB")
    '2初始化连接
'    blnReturn = obj.initConn(sqlDataString)
     
    
    
    '版本
    Set rs = Nothing
    str = "select banben from yw_banben"
    rs.CursorLocation = adUseClient
    rs.Open str, conn
    If Not rs.EOF Then
        For i = 1 To rs.RecordCount
            cbobanben.AddItem rs.Fields("banben").Value
            rs.MoveNext
        Next i
        rs.Close
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
    str = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where 1=1 and zhuangtai='1'"
    Call BindComboBoxData(txtxiaoshouren, str, "usename")            '销售人员
    
    Call MyCommand2_Click
    
    '判断是否是新客户进入
    If m_strKhbm <> "" Then
        str = "select * from Khxx where Khbm='" & m_strKhbm & "'"
        Set rs = Nothing
        rs.Open str, conn, adOpenStatic
        
        If rs.RecordCount > 0 Then
            cboyiyuanmc.Text = Decode(rs("khmc").Value)
            txtfuzheren.Text = Decode(rs("fzr").Value)
            txtdianhua.Text = Decode(rs("gddh").Value)
            txtshoujihao.Text = Decode(rs("sj").Value)
            Text6.Text = Decode(rs("khdz").Value)
            txtBj.Text = Decode(rs("bj").Value)
            txtxiaoshouren.Text = rs("xsry").Value
            txtmokuai.Text = rs("sxmk").Value
        End If
        
        Set rs = Nothing
    Else
        txtxiaoshouren.Text = user
    End If
End Sub

Private Sub Form_Resize()
' rsz.ReSetXY Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set obj = Nothing
End Sub

Private Sub FxGridKH_DblClick()             '已下订单客户
    Dim strYYMC As String       '医院名称
    Dim strID As String         'ID
    Dim strsql As String
    Dim Rstttmp As New ADODB.Recordset
    If FxGridKH.row > 0 Then
        strID = FxGridKH.TextMatrix(FxGridKH.row, 0)
        strYYMC = FxGridKH.TextMatrix(FxGridKH.row, 1)

        strsql = "select a.* from st_yw_kehuxinxi a  where  a.ID='" & strID & "'"    'yiyuanmc='" & StringEnDeCodecn(strYYMC, 75) & "' and
        Set rs = Nothing
        rs.Open strsql, conn, adOpenStatic

        If rs.RecordCount > 0 Then
            cboyiyuanmc.Text = ""
            txtfuzheren.Text = ""
            txtdianhua.Text = ""
            txtshoujihao.Text = ""
            Text6.Text = ""
            txtmokuai.Text = ""
            'Text10.Text = ""
            txtsj.Value = Now
            cbobanben.Text = ""
            cborjk.Text = ""
            txtRjyk.Text = 0
            txtBj.Text = ""
            'Text15.Text = ""
            Text5.Text = 0
            cboht.Text = ""
            cbopj.Text = ""

            On Error Resume Next

            cboyiyuanmc.Text = strYYMC
            txtfuzheren.Text = StringEnDeCodecn(rs("yiyuanfuzher").Value, 75)
            txtdianhua.Text = decipher(rs("gudingdh").Value)
            txtshoujihao.Text = decipher(rs("shoujihao").Value)
            Text6.Text = StringEnDeCodecn(rs("dizhi").Value, 75)
            '模块内容
            strsql = "select a.yiyuanmokuai from yw_kehuxinxiMingxi a  with(nolock)  where  isnull(a.bShanchu,0)=0  and   a.ID='" & strID & "'"    'yiyuanmc='" & StringEnDeCodecn(strYYMC, 75) & "' and

            Rstttmp.Open strsql, conn, adOpenStatic
            If Rstttmp.RecordCount > 0 Then
                txtmokuai.Text = Rstttmp.GetString    'rs("yiyuanmokuai").Value     '
            End If
            Rstttmp.Close

            '其它说明
            Text4.Text = StringEnDeCodecn(rs("qtsm").Value, 75)
            '销售员
            'Text10.Text = StringEnDeCodecn(rs("xiaoshoury").Value, 75)
            'txtsj.Value = Rs("xiadansj").Value
            cbobanben.Text = rs("banben").Value
            cborjk.Text = rs("rjklb").Value
            'lblht
            cboht.Text = rs("hetong").Value
            '票据 --
            cbopj.Text = rs("piaoju").Value
            'txtBj
            txtBj.Text = rs("ruanjianzj1").Value    'StringEnDeCodecn(, 75)
            txtRjyk.Text = StringEnDeCodecn(rs("weihufei").Value, 75)
            '付款方式-
            'Text15.Text = StringEnDeCodecn(rs("fukuanfs").Value, 75)
            '            '    --余款
            '            Text5.Text = StringEnDeCodecn(rs("ruanjianyk").Value, 75)
        Else
            cboyiyuanmc.Text = ""
            txtfuzheren.Text = ""
            txtdianhua.Text = ""
            txtshoujihao.Text = ""
            Text6.Text = ""
            txtmokuai.Text = ""
            Text4.Text = ""
            'Text10.Text = ""
            txtsj.Value = Now
            cbobanben.Text = ""

            txtBj.Text = ""
            'Text15.Text = ""
            Text5.Text = 0
            cboht.Text = ""
            cbopj.Text = ""
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
    Dim strsql As String

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
    Dim sWhereJoin As String
    sWhereJoin = ""
    If Check12.Value <> 0 Then
        sWhereJoin = " and 1=2  "
    End If
    '查询洽谈进度为成交的未下订单客户名称
    strsql = "select Khmc,Khbm,pym from Khxx where Qtjd='成交' and isnull(Qdr,'')=''" & strtiaojian & sWhereJoin
    Set rs = Nothing
    rs.Open strsql, conn, adOpenStatic

    If rs.RecordCount > 0 Then
        With FxGridQy
            '            .ColWidth(2) = 0
            Do While Not rs.EOF
                If Trim(txtKHMC.Text) <> "" Then
                    If Decode(rs("Khmc").Value) Like "*" & Trim(txtKHMC.Text) & "*" Or LCase(rs("pym").Value) Like "*" & LCase(Trim(txtKHMC.Text)) & "*" Then
                        .Rows = .Rows + 1
                        .TextMatrix(.Rows - 1, 0) = .Rows - 1
                        .TextMatrix(.Rows - 1, 1) = Decode(rs("Khmc").Value)
                    End If
                Else
                    .Rows = .Rows + 1
                    .TextMatrix(.Rows - 1, 0) = .Rows - 1
                    .TextMatrix(.Rows - 1, 1) = Decode(rs("Khmc").Value)
                End If
                '                .TextMatrix(.Rows - 1, 2) = rs("khbm").Value
                rs.MoveNext
            Loop
        End With
    End If
    Set rs = Nothing


    '查询已下订单客户
    If g_strYongHuZT = "3" Then           '销售经理
        strtiaojian = ""                    '" and xiaoshoury='" & Trim(txtxiaoshouren.Text) & "'"           '查询指定销售人员的客户信息
        txtxiaoshouren.Enabled = True
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and xiaoshoury='" & StringEnDeCodecn(user, 75) & "'"                           '查询当前登录用户的客户信息
        txtxiaoshouren.Enabled = False
    End If

    If Trim(txtKHMC.Text) <> "" Then
        strtiaojian = strtiaojian & " and ( yiyuanmc like '%" & StringEnDeCodecn(Trim(txtKHMC.Text), 75) & "%' or pym like '%" & Trim(txtKHMC.Text) & "%')"
    End If
    sWhereJoin = ""
    If Check12.Value <> 1 Then
        sWhereJoin = " and 1=2  "

    End If
    strsql = "select ID,yiyuanmc,pym from yw_kehuxinxi where 1=1" & strtiaojian & sWhereJoin
    Set rs = Nothing
    rs.Open strsql, conn, adOpenStatic

    If rs.RecordCount > 0 Then
        With FxGridKH
            Do While Not rs.EOF
                .Rows = .Rows + 1
                .TextMatrix(.Rows - 1, 0) = rs("ID").Value      '.Rows - 1
                .TextMatrix(.Rows - 1, 1) = StringEnDeCodecn(rs("yiyuanmc").Value, 75)
                rs.MoveNext
            Loop
        End With
    End If
    Set rs = Nothing
End Sub

Private Sub Text1_Validate(Cancel As Boolean)
    Cancel = TextValidate(Text1)
End Sub

Private Function TextValidate(Text5 As TextBox) As Boolean
    TextValidate = False
    Text5.Text = Trim(Text5.Text)
    If Text5.Text = "" Then
        TextValidate = True
    ElseIf IsNumeric(Text5.Text) = False Then
        MsgBox "必须填写数字"
        TextValidate = True
    End If
End Function

Private Sub Text5_Validate(Cancel As Boolean)
    Cancel = TextValidate(Text5)
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



Private Sub txtRjyk_Validate(Cancel As Boolean)
 ' Cancel = TextValidate(txtRjyk)
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
