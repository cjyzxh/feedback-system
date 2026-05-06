VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmzaiwairy 
   BackColor       =   &H00E0E0E0&
   Caption         =   "Form1"
   ClientHeight    =   9435
   ClientLeft      =   255
   ClientTop       =   1035
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9435
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdqk 
      BackColor       =   &H00C0E0FF&
      Caption         =   "清 空"
      Height          =   375
      Left            =   120
      MaskColor       =   &H00000000&
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmdxiougai 
      BackColor       =   &H00C0FFFF&
      Caption         =   "修 改"
      Height          =   375
      Left            =   3210
      MaskColor       =   &H00000000&
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmdzj 
      BackColor       =   &H00C0E0FF&
      Caption         =   "增 加"
      Height          =   375
      Left            =   2190
      MaskColor       =   &H00000000&
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmdtuichu 
      BackColor       =   &H00FFC0FF&
      Caption         =   "退 出"
      Height          =   375
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmdbaicun 
      BackColor       =   &H00FFC0C0&
      Caption         =   "保 存"
      Height          =   375
      Left            =   4245
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   8880
      Width           =   975
   End
   Begin VB.CommandButton cmdchaxun 
      BackColor       =   &H00C0E0FF&
      Caption         =   "查 询"
      Height          =   375
      Left            =   1155
      MaskColor       =   &H00000000&
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   8880
      Width           =   975
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "基本信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4440
      Left            =   270
      TabIndex        =   0
      Top             =   810
      Width           =   14895
      Begin MSComCtl2.DTPicker DTPicker2 
         Height          =   330
         Left            =   12915
         TabIndex        =   54
         Top             =   765
         Width           =   1500
         _ExtentX        =   2646
         _ExtentY        =   582
         _Version        =   393216
         Format          =   25559041
         CurrentDate     =   39358
      End
      Begin VB.CheckBox Check16 
         BackColor       =   &H00E0E0E0&
         Caption         =   "系统管理"
         Height          =   285
         Left            =   6705
         TabIndex        =   52
         Top             =   2340
         Width           =   1230
      End
      Begin VB.CheckBox Check15 
         BackColor       =   &H00E0E0E0&
         Caption         =   "数据审核"
         Height          =   285
         Left            =   6795
         TabIndex        =   51
         Top             =   1935
         Width           =   1095
      End
      Begin VB.TextBox Text4 
         Height          =   915
         Left            =   9315
         TabIndex        =   48
         Text            =   "Text4"
         Top             =   2835
         Width           =   5190
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   13635
         TabIndex        =   47
         Text            =   "Text3"
         Top             =   225
         Width           =   1185
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   11655
         TabIndex        =   45
         Text            =   "Text2"
         Top             =   180
         Width           =   1050
      End
      Begin VB.TextBox Text1 
         Height          =   330
         Left            =   5805
         TabIndex        =   44
         Text            =   "Text1"
         Top             =   2700
         Width           =   1680
      End
      Begin VB.CheckBox Check14 
         BackColor       =   &H00E0E0E0&
         Caption         =   "其它"
         Height          =   285
         Left            =   4725
         TabIndex        =   43
         Top             =   2700
         Width           =   825
      End
      Begin VB.CheckBox Check13 
         BackColor       =   &H00E0E0E0&
         Caption         =   "社区卫生CHS系统"
         Height          =   285
         Left            =   2880
         TabIndex        =   42
         Top             =   2700
         Width           =   1725
      End
      Begin VB.CheckBox Check12 
         BackColor       =   &H00E0E0E0&
         Caption         =   "CRM系统"
         Height          =   285
         Left            =   1665
         TabIndex        =   41
         Top             =   2745
         Width           =   1230
      End
      Begin VB.CheckBox Check11 
         BackColor       =   &H00E0E0E0&
         Caption         =   "手术室管理"
         Height          =   285
         Left            =   270
         TabIndex        =   40
         Top             =   2745
         Width           =   1230
      End
      Begin VB.CheckBox Check10 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊护士站"
         Height          =   285
         Left            =   5355
         TabIndex        =   39
         Top             =   2295
         Width           =   1230
      End
      Begin VB.CheckBox Check9 
         BackColor       =   &H00E0E0E0&
         Caption         =   "医技管理"
         Height          =   285
         Left            =   4050
         TabIndex        =   38
         Top             =   2250
         Width           =   1230
      End
      Begin VB.CheckBox Check8 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊医生"
         Height          =   285
         Left            =   2925
         TabIndex        =   37
         Top             =   2205
         Width           =   1230
      End
      Begin VB.CheckBox Check7 
         BackColor       =   &H00E0E0E0&
         Caption         =   "院长查询"
         Height          =   285
         Left            =   1620
         TabIndex        =   36
         Top             =   2250
         Width           =   1230
      End
      Begin VB.CheckBox Check6 
         BackColor       =   &H00E0E0E0&
         Caption         =   "财务管理"
         Height          =   285
         Left            =   270
         TabIndex        =   35
         Top             =   2340
         Width           =   1230
      End
      Begin VB.CheckBox Check5 
         BackColor       =   &H00E0E0E0&
         Caption         =   "住院护士站"
         Height          =   285
         Left            =   5400
         TabIndex        =   34
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check4 
         BackColor       =   &H00E0E0E0&
         Caption         =   "住院管理"
         Height          =   285
         Left            =   4095
         TabIndex        =   33
         Top             =   1890
         Width           =   1230
      End
      Begin VB.CheckBox Check3 
         BackColor       =   &H00E0E0E0&
         Caption         =   "药库管理"
         Height          =   285
         Left            =   2745
         TabIndex        =   32
         Top             =   1800
         Width           =   1230
      End
      Begin VB.CheckBox Check2 
         BackColor       =   &H00E0E0E0&
         Caption         =   "药房管理"
         Height          =   285
         Left            =   1530
         TabIndex        =   31
         Top             =   1845
         Width           =   1230
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "门诊管理"
         Height          =   285
         Left            =   225
         TabIndex        =   30
         Top             =   1890
         Width           =   1230
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   375
         Left            =   9855
         TabIndex        =   27
         Top             =   720
         Width           =   1380
         _ExtentX        =   2434
         _ExtentY        =   661
         _Version        =   393216
         Format          =   25559041
         CurrentDate     =   39105
      End
      Begin VB.TextBox txtchengchelx 
         Appearance      =   0  'Flat
         Height          =   1170
         Left            =   9240
         TabIndex        =   24
         Top             =   1440
         Width           =   5295
      End
      Begin VB.TextBox txtxtgly 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   4950
         TabIndex        =   23
         Top             =   270
         Width           =   885
      End
      Begin VB.ComboBox cboxsry 
         Height          =   300
         Left            =   1260
         TabIndex        =   21
         Top             =   765
         Width           =   1215
      End
      Begin MSComCtl2.DTPicker txtsj 
         Height          =   375
         Left            =   6120
         TabIndex        =   19
         Top             =   630
         Width           =   1320
         _ExtentX        =   2328
         _ExtentY        =   661
         _Version        =   393216
         Format          =   25559041
         CurrentDate     =   39105
      End
      Begin VB.TextBox txtmokuai 
         Appearance      =   0  'Flat
         Height          =   1020
         Left            =   990
         TabIndex        =   11
         Top             =   3195
         Width           =   6345
      End
      Begin VB.TextBox txtgudingdh 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   9180
         TabIndex        =   8
         Top             =   225
         Width           =   1035
      End
      Begin VB.TextBox txtshoujihao 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   6840
         TabIndex        =   6
         Top             =   270
         Width           =   1395
      End
      Begin VB.ComboBox cmbshishiry 
         Height          =   300
         Left            =   3510
         TabIndex        =   4
         Top             =   720
         Width           =   1335
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   1200
         TabIndex        =   2
         Top             =   240
         Width           =   2580
      End
      Begin VB.Line Line3 
         X1              =   8010
         X2              =   8010
         Y1              =   1305
         Y2              =   4455
      End
      Begin VB.Label Label11 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "模块信息"
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
         TabIndex        =   55
         Top             =   1530
         Width           =   900
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "免费维护结束时间"
         Height          =   180
         Left            =   11385
         TabIndex        =   53
         Top             =   900
         Width           =   1440
      End
      Begin VB.Label Label9 
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
         Left            =   90
         TabIndex        =   50
         Top             =   3600
         Width           =   900
      End
      Begin VB.Label Label7 
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
         Left            =   8190
         TabIndex        =   49
         Top             =   3330
         Width           =   900
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系电话"
         Height          =   180
         Left            =   12870
         TabIndex        =   46
         Top             =   270
         Width           =   720
      End
      Begin VB.Line Line2 
         X1              =   10920
         X2              =   14880
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施结束时间"
         Height          =   180
         Left            =   8730
         TabIndex        =   26
         Top             =   900
         Width           =   1080
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "乘车路线"
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
         Left            =   8235
         TabIndex        =   25
         Top             =   2295
         Width           =   900
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "系统管理员"
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   3960
         TabIndex        =   22
         Top             =   360
         Width           =   900
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "销售人员"
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   450
         TabIndex        =   20
         Top             =   900
         Width           =   720
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   10920
         Y1              =   1320
         Y2              =   1320
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施开始时间"
         Height          =   180
         Index           =   5
         Left            =   4995
         TabIndex        =   10
         Top             =   810
         Width           =   1080
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院主要负责人"
         Height          =   180
         Index           =   4
         Left            =   10395
         TabIndex        =   9
         Top             =   315
         Width           =   1260
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "固定电话"
         Height          =   180
         Index           =   3
         Left            =   8415
         TabIndex        =   7
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "联系手机"
         Height          =   180
         Index           =   2
         Left            =   6075
         TabIndex        =   5
         Top             =   315
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Index           =   1
         Left            =   2745
         TabIndex        =   3
         Top             =   855
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "医院名称"
         Height          =   180
         Index           =   0
         Left            =   360
         TabIndex        =   1
         Top             =   360
         Width           =   720
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSH 
      Height          =   3195
      Left            =   270
      TabIndex        =   17
      Top             =   5535
      Width           =   14895
      _ExtentX        =   26273
      _ExtentY        =   5636
      _Version        =   393216
      ForeColor       =   16711680
      Cols            =   1
      FixedCols       =   0
      BackColorBkg    =   16777215
      AllowUserResizing=   3
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "用户信息"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   21.75
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Index           =   1
      Left            =   6480
      TabIndex        =   16
      Top             =   120
      Width           =   1800
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
      ForeColor       =   &H00000000&
      Height          =   510
      Left            =   4560
      TabIndex        =   15
      Top             =   120
      Width           =   1725
   End
End
Attribute VB_Name = "frmzaiwairy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Dim str1 As String


Private Sub cmdbaicun_Click()
Dim X As Integer                              '定义网格行循环变量
For X = 1 To MSH.Rows - 1 Step 1
    str = "insert into yw_zaiwairy (yiyuanmc,shishiry,shoujihao,gudingdh,szjishuzc,sskaishisj,yiyuanmokuai,xiaoshoury,xitonggly,ssjieshusj,cclx)"
    
    str = str & "values ('" & MSH.TextMatrix(X, 0) & "','" & Trim(MSH.TextMatrix(X, 1)) & "','" & Trim(MSH.TextMatrix(X, 2)) & "','" & Trim(MSH.TextMatrix(X, 3)) & "',"
    str = str & "'" & Trim(MSH.TextMatrix(X, 4)) & "','" & Trim(MSH.TextMatrix(X, 5)) & "','" & Trim(MSH.TextMatrix(X, 6)) & "','" & Trim(MSH.TextMatrix(X, 7)) & "','" & Trim(MSH.TextMatrix(X, 8)) & "','" & Trim(MSH.TextMatrix(X, 9)) & "','" & Trim(MSH.TextMatrix(X, 10)) & "')"
   
rs.Open str, conn
Next X
  MsgBox "保存成功！", vbOKOnly + vbInformation, "提示"
  Set rs = Nothing
  MSH.Clear                                   '清空网格内容
  MSH.Rows = 2                                '初始化网格行
  Call zxhclear
End Sub

Private Sub cmdchaxun_Click()
    str1 = ""
    str1 = "select ID as 'ID',yiyuanmc as '医院名称',xitonggly as '系统管理员',shoujihao as '手机',gudingdh as '固定电话',sskaishisj as '实施开始时间',yiyuanmokuai as '医院模块',xiaoshoury as '销售人员',cclx as '出差路线',ssjieshusj as '实施结束时间' from yw_zaiwairy where 1=1"
If cboyiyuanmc.Text <> "" Then
    str1 = str1 & "and yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
End If
    rs.Open str1, conn, 1, 3
    If Not rs.EOF Then
        Set MSH.DataSource = rs
        Set rs = Nothing
    Else
        MsgBox "没有记录！", vbOKOnly + vbInformation, "提示"
    End If
End Sub

Private Sub cmdqk_Click()
Call zxhclear
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub cmdzj_Click()
Dim brow As Long

'为下一次赋傎，将网格行数加1，当为第一行时不加1
    If MSH.TextMatrix(1, 1) <> "" Then
        MSH.Rows = MSH.Rows + 1
    End If
          
     
'网格的行号等于当前最大行 -1
  brow = MSH.Rows - 1
                            
    '将控件的傎加载到网格中
    With MSH
      .Cols = 11
      .TextMatrix(brow, 0) = StringEnDeCodecn(Trim(cboyiyuanmc.Text), 75)
      .TextMatrix(brow, 1) = Trim(cmbshishiry.Text)
      .TextMatrix(brow, 2) = Trim(txtshoujihao.Text)
      .TextMatrix(brow, 3) = Trim(txtgudingdh.Text)
      .TextMatrix(brow, 4) = Trim(cbojishuzc.Text)
      .TextMatrix(brow, 5) = Trim(txtsj.Value)
      .TextMatrix(brow, 6) = Trim(txtmokuai.Text)
      .TextMatrix(brow, 7) = Trim(cboxsry.Text)
      .TextMatrix(brow, 8) = Trim(txtxtgly.Text)
      .TextMatrix(brow, 9) = ""
      .TextMatrix(brow, 10) = Trim(txtchengchelx.Text)
    End With
    Call zxhclear
End Sub

Private Sub Form_Load()

'加载医院名称
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

'加载人员
Set rs = Nothing
str1 = "select xingming from zd_jishuyuan"
rs.CursorLocation = adUseClient
rs.Open str1, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
      cmbshishiry.AddItem rs.Fields("xingming").Value
      rs.MoveNext
  Next i
  rs.Close
End If
'加载人员
    str = "select * from [user]"
    rs.CursorLocation = adUseClient
     rs.Open str, conn
    If Not rs.EOF Then

        For i = 1 To rs.RecordCount
            cbojishuzc.AddItem rs.Fields("usename").Value
            rs.MoveNext
        Next i
    End If
    rs.Close
    
  '加载列标题
  With MSH
        .Cols = 11
        .TextMatrix(0, 0) = "医院名称"
        .TextMatrix(0, 1) = "实施人员"
        .TextMatrix(0, 2) = "联系手机"
        .TextMatrix(0, 3) = "固定电话"
        .TextMatrix(0, 4) = "技术支持"
        .TextMatrix(0, 5) = "开始时间"
        .TextMatrix(0, 6) = "医院模块"
        .TextMatrix(0, 7) = "销售人员"
        .TextMatrix(0, 8) = "系统管理员"
        .TextMatrix(0, 9) = "结束时间"
        .TextMatrix(0, 10) = "乘车路线"
       
  End With
End Sub

Private Sub zxhclear()
    cboyiyuanmc.Text = ""
    cmbshishiry.Text = ""
    txtshoujihao.Text = ""
    txtgudingdh.Text = ""
    cbojishuzc.Text = ""
    txtxtgly.Text = ""
    txtmokuai.Text = ""
    cboxsry.Text = ""
    txtchengchelx.Text = ""
End Sub

