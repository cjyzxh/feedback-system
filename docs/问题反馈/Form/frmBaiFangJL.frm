VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmBaiFangJL 
   Caption         =   "拜访记录"
   ClientHeight    =   9615
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   15240
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9615
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin mycmd.MyCommand MyCommand4 
      Height          =   375
      Left            =   9480
      TabIndex        =   44
      Top             =   5400
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Caption         =   "退 出"
   End
   Begin mycmd.MyCommand MyCommand3 
      Height          =   375
      Left            =   2880
      TabIndex        =   43
      Top             =   9120
      Visible         =   0   'False
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      Caption         =   "检索我的客户"
   End
   Begin mycmd.MyCommand MyCommand2 
      Height          =   375
      Left            =   7200
      TabIndex        =   42
      Top             =   7560
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   661
      Caption         =   "新增拜访"
   End
   Begin VB.Frame fmKhxx 
      Caption         =   "客户信息"
      Height          =   3495
      Left            =   4560
      TabIndex        =   12
      Top             =   120
      Width           =   10605
      Begin VB.TextBox Text1 
         Height          =   270
         Left            =   1140
         TabIndex        =   56
         Text            =   "Text1"
         Top             =   780
         Visible         =   0   'False
         Width           =   1935
      End
      Begin VB.ComboBox cbobfxx 
         Height          =   300
         Index           =   2
         Left            =   840
         TabIndex        =   40
         Top             =   960
         Width           =   1455
      End
      Begin VB.TextBox txtKhxx 
         Height          =   1575
         Index           =   5
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         Top             =   1680
         Width           =   3015
      End
      Begin VB.TextBox txtKhxx 
         Height          =   1635
         Index           =   4
         Left            =   3480
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   28
         Top             =   1680
         Width           =   6945
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   0
         Left            =   3270
         TabIndex        =   19
         Top             =   180
         Width           =   4395
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   0
         Left            =   8520
         TabIndex        =   18
         Top             =   180
         Width           =   1935
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   1
         Left            =   840
         TabIndex        =   17
         Top             =   180
         Width           =   1515
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   1
         Left            =   3270
         TabIndex        =   16
         Top             =   540
         Width           =   1875
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   2
         Left            =   5790
         TabIndex        =   15
         Top             =   540
         Width           =   1875
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   3
         Left            =   8520
         TabIndex        =   14
         Top             =   540
         Width           =   1935
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   3
         Left            =   840
         TabIndex        =   13
         Top             =   555
         Width           =   1515
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   3180
         TabIndex        =   66
         Top             =   1320
         Width           =   90
      End
      Begin VB.Label Label12 
         AutoSize        =   -1  'True
         Caption         =   "洽谈时间："
         Height          =   180
         Left            =   2280
         TabIndex        =   65
         Top             =   1320
         Width           =   900
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   7680
         TabIndex        =   64
         Top             =   1320
         Width           =   90
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "销售人员："
         Height          =   180
         Left            =   6720
         TabIndex        =   63
         Top             =   1320
         Width           =   900
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   7680
         TabIndex        =   60
         Top             =   1080
         Width           =   90
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "目前价格："
         Height          =   180
         Left            =   6720
         TabIndex        =   59
         Top             =   1080
         Width           =   900
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   5400
         TabIndex        =   58
         Top             =   1080
         Width           =   90
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "软件版本："
         Height          =   180
         Left            =   4440
         TabIndex        =   57
         Top             =   1080
         Width           =   900
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   3720
         TabIndex        =   46
         Top             =   1080
         Width           =   90
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "当前洽谈进度："
         Height          =   180
         Left            =   2400
         TabIndex        =   45
         Top             =   1080
         Width           =   1260
      End
      Begin VB.Label lblBfxx 
         Caption         =   "洽谈进度"
         ForeColor       =   &H00FF0000&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   41
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "医院情况"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   30
         Top             =   1440
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "所需模块"
         Height          =   735
         Index           =   5
         Left            =   3240
         TabIndex        =   27
         Top             =   1920
         Width           =   255
      End
      Begin VB.Label lblkhmc 
         Caption         =   "客户名称"
         Height          =   225
         Index           =   0
         Left            =   2400
         TabIndex        =   26
         Top             =   240
         Width           =   825
      End
      Begin VB.Label lblkhmc 
         Caption         =   "负责人"
         Height          =   255
         Index           =   1
         Left            =   7770
         TabIndex        =   25
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "手机"
         Height          =   255
         Index           =   6
         Left            =   5220
         TabIndex        =   24
         Top             =   600
         Width           =   585
      End
      Begin VB.Label lblkhmc 
         Caption         =   "传真"
         Height          =   255
         Index           =   9
         Left            =   7770
         TabIndex        =   23
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "客户性质"
         Height          =   255
         Index           =   13
         Left            =   90
         TabIndex        =   22
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "电话"
         Height          =   255
         Index           =   14
         Left            =   2400
         TabIndex        =   21
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "区域"
         Height          =   255
         Index           =   19
         Left            =   90
         TabIndex        =   20
         Top             =   210
         Width           =   735
      End
   End
   Begin TabDlg.SSTab TabKh 
      Height          =   7005
      Left            =   120
      TabIndex        =   11
      Top             =   840
      Width           =   4380
      _ExtentX        =   7726
      _ExtentY        =   12356
      _Version        =   393216
      TabOrientation  =   1
      Tab             =   2
      TabHeight       =   520
      TabCaption(0)   =   "我的客户列表"
      TabPicture(0)   =   "frmBaiFangJL.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "trvKh"
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "拜访记录"
      TabPicture(1)   =   "frmBaiFangJL.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "RTBfjl"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "待回访客户"
      TabPicture(2)   =   "frmBaiFangJL.frx":0038
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "trvhf"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).ControlCount=   1
      Begin MSComctlLib.TreeView trvhf 
         Height          =   6615
         Left            =   0
         TabIndex        =   47
         Top             =   0
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   11668
         _Version        =   393217
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         Appearance      =   1
      End
      Begin RichTextLib.RichTextBox RTBfjl 
         Height          =   6495
         Left            =   -74880
         TabIndex        =   36
         Top             =   120
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   11456
         _Version        =   393217
         BackColor       =   -2147483629
         ScrollBars      =   2
         TextRTF         =   $"frmBaiFangJL.frx":0054
      End
      Begin MSComctlLib.TreeView trvKh 
         Height          =   6495
         Left            =   -74880
         TabIndex        =   35
         Top             =   120
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   11456
         _Version        =   393217
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   7
         Appearance      =   1
      End
   End
   Begin VB.Frame fmParmProfile 
      Caption         =   "客户资料参数配置"
      Height          =   1575
      Left            =   120
      TabIndex        =   7
      Top             =   7920
      Width           =   4365
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   2
         Left            =   2760
         Style           =   2  'Dropdown List
         TabIndex        =   50
         Top             =   480
         Width           =   1515
      End
      Begin VB.CheckBox ChkALL 
         Caption         =   "全部客户记录"
         Height          =   255
         Left            =   2760
         TabIndex        =   49
         Top             =   960
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.OptionButton OptEmployees 
         Caption         =   "客户列表按销售人员分类"
         Height          =   315
         Left            =   60
         TabIndex        =   34
         Top             =   850
         Width           =   2385
      End
      Begin VB.OptionButton optDisposition 
         Caption         =   "客户列表按客户性质分类"
         Height          =   315
         Left            =   60
         TabIndex        =   33
         Top             =   500
         Width           =   2325
      End
      Begin VB.OptionButton optProgress 
         Caption         =   "客户列表按洽谈进度分类"
         Height          =   315
         Left            =   60
         TabIndex        =   32
         Top             =   1200
         Width           =   2325
      End
      Begin VB.OptionButton optArea 
         Caption         =   "客户列表按区域分类"
         Height          =   315
         Left            =   60
         TabIndex        =   31
         Top             =   150
         Value           =   -1  'True
         Width           =   1995
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "销售人员"
         Height          =   180
         Left            =   2760
         TabIndex        =   51
         Top             =   240
         Width           =   720
      End
   End
   Begin VB.Frame fmBfxx 
      Caption         =   "拜访信息"
      Height          =   5805
      Left            =   4560
      TabIndex        =   0
      Top             =   3720
      Width           =   10575
      Begin RichTextLib.RichTextBox RTB1 
         Height          =   5055
         Left            =   6120
         TabIndex        =   61
         Top             =   480
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   8916
         _Version        =   393217
         Enabled         =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frmBaiFangJL.frx":00F1
      End
      Begin mycmd.MyCommand MyCommand7 
         Height          =   375
         Left            =   3720
         TabIndex        =   55
         Top             =   3840
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   661
         Caption         =   "修改拜访时间"
      End
      Begin mycmd.MyCommand MyCommand6 
         Height          =   375
         Left            =   5280
         TabIndex        =   54
         Top             =   3840
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   661
         Caption         =   "清空"
      End
      Begin mycmd.MyCommand MyCommand5 
         Height          =   375
         Left            =   3720
         TabIndex        =   53
         Top             =   1680
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   661
         Caption         =   "清 空"
      End
      Begin VB.TextBox txtBfxx 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   1215
         Index           =   1
         Left            =   960
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   38
         Top             =   240
         Width           =   5085
      End
      Begin MSComCtl2.DTPicker DTPXcbfsj 
         Height          =   315
         Left            =   1230
         TabIndex        =   9
         Top             =   3840
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         Format          =   84606977
         CurrentDate     =   39948
      End
      Begin MSComCtl2.DTPicker dtpBfsj 
         Height          =   345
         Left            =   990
         TabIndex        =   8
         Top             =   1680
         Width           =   1425
         _ExtentX        =   2514
         _ExtentY        =   609
         _Version        =   393216
         Format          =   84606977
         CurrentDate     =   39948
      End
      Begin VB.TextBox txtBfxx 
         Height          =   1455
         Index           =   0
         Left            =   960
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   2160
         Width           =   5085
      End
      Begin VB.TextBox txtBfxx 
         Height          =   1335
         Index           =   2
         Left            =   960
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   4320
         Width           =   5055
      End
      Begin VB.TextBox txtKhbm 
         Height          =   345
         Left            =   3120
         TabIndex        =   10
         Top             =   1440
         Visible         =   0   'False
         Width           =   2625
      End
      Begin VB.TextBox txtBfbm 
         Height          =   375
         Left            =   4920
         TabIndex        =   37
         Top             =   3600
         Visible         =   0   'False
         Width           =   735
      End
      Begin mycmd.MyCommand MyCommand1 
         Height          =   375
         Left            =   2520
         TabIndex        =   48
         Top             =   1680
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   661
         Caption         =   "保存记录"
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "历次拜访记录"
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
         Left            =   6240
         TabIndex        =   62
         Top             =   240
         Width           =   1170
      End
      Begin VB.Label lblBfxx 
         Caption         =   "本次拜访目的"
         Height          =   825
         Index           =   2
         Left            =   120
         TabIndex        =   39
         Top             =   480
         Width           =   855
      End
      Begin VB.Label lblBfxx 
         Caption         =   "拜访记录"
         Height          =   255
         Index           =   0
         Left            =   60
         TabIndex        =   6
         Top             =   2130
         Width           =   735
      End
      Begin VB.Label lblBfxx 
         Caption         =   "拜访时间"
         Height          =   225
         Index           =   1
         Left            =   60
         TabIndex        =   5
         Top             =   1770
         Width           =   855
      End
      Begin VB.Label lblBfxx 
         Caption         =   "下次拜访时间"
         Height          =   255
         Index           =   3
         Left            =   90
         TabIndex        =   4
         Top             =   3840
         Width           =   1155
      End
      Begin VB.Label lblBfxx 
         Caption         =   "下次拜访目的"
         Height          =   495
         Index           =   4
         Left            =   240
         TabIndex        =   3
         Top             =   4320
         Width           =   615
      End
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "销售部客户根踪记录"
      BeginProperty Font 
         Name            =   "华文新魏"
         Size            =   24
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   52
      Top             =   120
      Width           =   4320
   End
End
Attribute VB_Name = "frmBaiFangJL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_KeyPress(KeyAscii As Integer)
    On Error Resume Next

    If KeyAscii = vbKeyEscape Then
        Dim TmpCtrl As Control
        For Each TmpCtrl In Me
            If (TypeOf TmpCtrl Is TextBox) Or (TypeOf TmpCtrl Is ComboBox) Or (TypeOf TmpCtrl Is RichTextBox) Then
                TmpCtrl.Text = ""
            End If
        Next
        Label2.Caption = ""     '当前洽谈进度
        TabKh.Tab = 0           '显示我的客户列表
    End If
End Sub

Private Sub Form_Load()
    Dim strSql As String

    On Error Resume Next

    strSql = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where 1=1 and zhuangtai='1'"

    Call BindComboBoxData(cboKhxx(2), strSql, "usename")            '销售人员
    cboKhxx(2).Text = user                                          '默认值为当前登录用户
    '    Call BindCbo(cbobfxx(0), "客户意向")

    Call BindCbo(cbobfxx(2), "洽谈进度")

    dtpBfsj.Value = Now()
    DTPXcbfsj.Value = Now()

    '分配权限
    '    g_strYongHuZT = "3"
    If g_strYongHuZT = "3" Then                   '销售经理
        cboKhxx(2).Enabled = True
        ChkALL.Visible = True
    Else    'If g_strYongHuZT = "2" Then                       '普通销售人员
        cboKhxx(2).Enabled = False
        ChkALL.Visible = False
    End If

    Call MyCommand3_Click
End Sub

Private Sub MyCommand1_Click()                          '保存拜访记录
    Dim strSql As String
    Dim strBfbm As String
    Dim colInsert As New Collection
    Dim lngRow As Long
    Dim strCaption As String
    Dim strValue As String
    Dim strTemp() As String

    If FunBlnCheck = False Then
        Exit Sub
    End If

    '判断是否存在回访记录，如果存在则进行更新操作而不是插入操作
    If txtKhbm.Tag <> "" Then                                           '存在回访记录
        '更新内容：拜访时间，拜访记录，完成标志
        strSql = "update bfjl set bfsj='" & dtpBfsj.Value & "',bfjl='" & Encode(txtBfxx(0).Text) & "',wcbz='是' where bfbm='" & txtKhbm.Tag & "'"
        Set rs = Nothing
        rs.Open strSql, conn
        Set rs = Nothing

        txtKhbm.Tag = ""                    '清除回访标志
        Call TabKh_Click(2)                 '刷新列表框
        '清除原有记录
        '        cboKhxx(1).Text = ""
        '        cboKhxx(0).Text = ""
        '        cboKhxx(3).Text = ""
        '    '    cboKhxx(4).Text = ""
        ''        txtBfbm.Text = ""
        '        txtKhxx(0).Text = ""
        '        txtKhxx(1).Text = ""
        '        txtKhxx(2).Text = ""
        '        txtKhxx(3).Text = ""
        '        txtKhxx(4).Text = ""
        '        txtKhxx(5).Text = ""
        '
        '        txtBfxx(0).Text = ""
        '        txtBfxx(1).Text = ""
        '        txtKhbm.Text = ""
        '        txtKhbm.Tag = ""
    Else                                                                '插入新记录
        strBfbm = Format(Now, "yyyyMMddHHmmsss")

        colInsert.Add " Bfbm = '" & strBfbm & "'"                   '拜访编码
        colInsert.Add " Khbm= '" & txtKhbm.Text & "'"               '客户编码
        colInsert.Add " Bfjl= '" & Encode(txtBfxx(0).Text) & "'"    '拜访记录
        colInsert.Add " Bfsj= '" & dtpBfsj.Value & "'"              '拜访时间
        '        colInsert.Add " Xcbfsj= '" & DTPXcbfsj.Value & "'"          '下次拜访时间
        '        colInsert.Add " Xcbfmb= '" & Encode(txtBfxx(2).Text) & "'"  '下次拜访目的
        '        colInsert.Add " Bfjg= '" & cbobfxx(0).Text & "'"            '拜访结果
        colInsert.Add " wcbz='是'"                                  '目标完成标志
        colInsert.Add " Xsry= '" & user & "'"                       '销售人员
        colInsert.Add " Jlsj= '" & Now & "'"                        '记录时间
        colInsert.Add " Jlr= '" & user & "'"                        '记录人

        For lngRow = 1 To colInsert.Count
            strTemp = Split(colInsert.Item(lngRow), "=")
            strCaption = strCaption & Trim(strTemp(0)) & ","
            strValue = strValue & Trim(strTemp(1)) & ","
        Next

        strSql = "INSERT INTO bfjl(" & Mid(strCaption, 1, Len(strCaption) - 1) & ") Values(" & Mid(strValue, 1, Len(strValue) - 1) & ")"

        Set rs = Nothing

        rs.Open strSql, conn

        Set rs = Nothing
        Set colInsert = Nothing
    End If

    '更新洽谈进度
    If cbobfxx(2).Text <> "" Then
        strSql = "update khxx set qtjd='" & Trim(cbobfxx(2).Text) & "' where khbm='" & txtKhbm.Text & "'"
        Set rs = Nothing
        rs.Open strSql, conn
        Set rs = Nothing
    End If

    If cbobfxx(2).Text = "成交" Then
        If MsgBox("拜访记录保存成功！" & vbCrLf & vbCrLf & "当前业务已经谈成，是否进入下订单业务？", vbQuestion + vbYesNo) = vbYes Then
            With frmdiandan
                .m_strKhbm = txtKhbm.Text           '客户编码
                .Show
            End With
        End If
    Else
        MsgBox "保存拜访记录成功"
    End If
End Sub

Private Sub MyCommand2_Click()                      '新增拜访计划
    Dim strSql As String
    Dim strBfbm As String
    Dim colInsert As New Collection
    Dim lngRow As Long
    Dim strTemp() As String
    Dim strCaption As String
    Dim strValue As String

    '检查是否存在尚未完成的拜访计划（下次拜访目的）
    strSql = "select * from Bfjl where wcbz='否' and Khbm='" & txtKhbm.Text & "' and xsry='" & user & "'"
    Set rs = Nothing
    rs.Open strSql, conn
    If rs.RecordCount > 0 Then
        MsgBox "当前客户有尚未完成的拜访计划，请先完成"
        Exit Sub
        '切换到待回访客户列表
        TabKh.Tab = 2
        Call trvhf_NodeClick(trvhf.Nodes(txtKhbm.Text))
        trvhf.Nodes(txtKhbm.Text).Expanded = True
        trvhf.Nodes(txtKhbm.Text).EnsureVisible

        Exit Sub
    End If
    Set rs = Nothing

    If Trim(txtKhbm.Text) = "" Then
        MsgBox "请从我的客户列表中选择要拜访的客户名称"
        Exit Sub
    End If

    If Trim(txtBfxx(2).Text) = "" Then
        MsgBox "下次拜访目的不能为空"
        Exit Sub
    End If

    Set colInsert = Nothing

    strBfbm = Format(Now, "yyyyMMddHHmmss")

    colInsert.Add " Bfbm = '" & strBfbm & "'"                   '拜访编码
    colInsert.Add " Khbm= '" & txtKhbm.Text & "'"               '客户编码
    '    colInsert.Add " Bfjl= '" & Encode(txtBfxx(0).Text) & "'"            '拜访记录
    '    colInsert.Add " Bfsj= '" & dtpBfsj.Value & "'"              '拜访时间
    colInsert.Add " Xcbfsj= '" & DTPXcbfsj.Value & "'"          '下次拜访时间
    colInsert.Add " Xcbfmb= '" & Encode(txtBfxx(2).Text) & "'"  '下次拜访目的
    '    colInsert.Add " Bfjg= '" & cbobfxx(0).Text & "'"            '拜访结果
    colInsert.Add " wcbz='否'"                                  '目标完成标志
    colInsert.Add " Xsry= '" & user & "'"                       '销售人员
    colInsert.Add " Jlsj= '" & Now & "'"                        '记录时间
    colInsert.Add " Jlr= '" & user & "'"             '记录人

    '    For lngRow = 1 To colInsert.Count
    '        strValue = strValue & colInsert.Item(lngRow) & ","
    '    Next
    '
    '    strSql = "UPDATE Bfjl SET " & Mid(strValue, 1, Len(strValue) - 1) & " WHERE Bfbm='" & txtBfbm.Text & "'"

    For lngRow = 1 To colInsert.Count
        strTemp = Split(colInsert.Item(lngRow), "=")
        strCaption = strCaption & Trim(strTemp(0)) & ","
        strValue = strValue & Trim(strTemp(1)) & ","
    Next

    strSql = "INSERT INTO bfjl(" & Mid(strCaption, 1, Len(strCaption) - 1) & ") Values(" & Mid(strValue, 1, Len(strValue) - 1) & ")"

    Set rs = Nothing

    rs.Open strSql, conn

    MsgBox "新增拜访计划成功"

    Set colInsert = Nothing
End Sub

Private Sub MyCommand3_Click()                      '检索我的客户列表
    If optArea.Value = True Then
        Call optArea_Click
    ElseIf optDisposition.Value = True Then
        Call optDisposition_Click
    ElseIf OptEmployees.Value = True Then
        Call OptEmployees_Click
    ElseIf optProgress.Value = True Then
        Call optProgress_Click
    End If
End Sub

Private Sub MyCommand4_Click()                  '退出
    Unload Me
End Sub

Private Sub MyCommand5_Click()
    txtBfxx(0).Text = ""
End Sub

Private Sub MyCommand6_Click()
    txtBfxx(2).Text = ""
End Sub

Private Sub MyCommand7_Click()
    Set rs = Nothing
    If txtBfxx(1).Text <> "" Then
        str = "update bfjl set xcbfsj='" & DTPXcbfsj.Value & "' where bfbm='" & Text1.Text & "'"
        rs.Open str, conn
        MsgBox ("下次拜访时间修改成！~")
        Set rs = Nothing
    Else
        MsgBox ("没有待拜访记录，不能修改")
        Exit Sub
    End If
End Sub

Private Sub optArea_Click()                     '按区域分类显示
    Dim strSql As String

    Dim strkeyqy As String
    Dim lngkeyqy As Long
    Dim strqy As String
    Dim strtiaojian As String           '查询限制条件

    '    If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Or user = "蒙海胜" Then
    '        strTiaoJian = ""
    '    Else
    '        strTiaoJian = " and Xsry='" & user & "'"  'or Zjjsr='" & user & "'"
    '    End If

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    trvKh.Nodes.Clear               '清除原有的节点记录

    strSql = "select Khbm,Khmc,Qy from Khxx where isnull(Qtjd,'')<>'成交' and isnull(qtjd,'')<>'流失'" & strtiaojian & " order by Qy,Khbm"
    Set rs = Nothing
    rs.Open strSql, conn

    If rs.RecordCount > 0 Then
        Do While Not rs.EOF
            '增加父节点（区域）
            If strqy <> rs("Qy").Value Then
                lngkeyqy = lngkeyqy + 1
                strkeyqy = "Qy" & lngkeyqy
                trvKh.Nodes.Add , , strkeyqy, rs("Qy").Value
            End If

            '添加客户名称
            trvKh.Nodes.Add strkeyqy, tvwChild, rs("Khbm").Value, Decode(rs("Khmc").Value)

            '存储最后的数据
            strqy = rs("Qy").Value

            rs.MoveNext
        Loop
    End If

    TabKh.Tab = 0
End Sub

Private Sub optDisposition_Click()              '按客户性质分类显示
    Dim strSql As String

    Dim strkeyqy As String
    Dim lngkeyqy As Long
    Dim strqy As String
    Dim strtiaojian As String           '查询限制条件

    '    If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Or user = "蒙海胜" Then
    '        strTiaoJian = ""
    '    Else
    '        strTiaoJian = " and Xsry='" & user & "'"  'or Zjjsr='" & user & "'"
    '    End If

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    trvKh.Nodes.Clear               '清除原有的节点记录

    strSql = "select Khbm,Khmc,khxz from Khxx where isnull(Qtjd,'')<>'成交' and isnull(qtjd,'')<>'流失'" & strtiaojian & " order by Khxz,Khbm"
    Set rs = Nothing
    rs.Open strSql, conn

    If rs.RecordCount > 0 Then
        Do While Not rs.EOF
            '增加父节点（客户意向）
            If strqy <> rs("khxz").Value Then
                lngkeyqy = lngkeyqy + 1
                strkeyqy = "khxz" & lngkeyqy
                trvKh.Nodes.Add , , strkeyqy, rs("khxz").Value
            End If

            '添加客户名称
            trvKh.Nodes.Add strkeyqy, tvwChild, rs("Khbm").Value, Decode(rs("Khmc").Value)

            '存储最后的数据
            strqy = rs("khxz").Value

            rs.MoveNext
        Loop
    End If

    TabKh.Tab = 0
End Sub

Private Sub OptEmployees_Click()                '按销售人员和洽谈进度分类显示
    Dim strSql As String

    Dim strkeyqy As String
    Dim lngkeyqy As Long
    Dim strqy As String

    Dim strKeyQtjd As String            '洽谈进度
    Dim lngKeyQtjd As Long
    Dim strQtjd As String
    Dim strtiaojian As String           '查询限制条件

    '    If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Or user = "蒙海胜" Then
    '        strTiaoJian = ""
    '    Else
    '        strTiaoJian = " and Xsry='" & user & "'"  'or Zjjsr='" & user & "'"
    '    End If

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    trvKh.Nodes.Clear               '清除原有的节点记录

    strSql = "select Khbm,Khmc,Xsry,Qtjd from Khxx where isnull(Qtjd,'')<>'成交'" & strtiaojian & " order by Xsry,Qtjd,Khbm"
    Set rs = Nothing
    rs.Open strSql, conn

    If rs.RecordCount > 0 Then
        Do While Not rs.EOF
            '增加父节点（销售人员）
            If strqy <> rs("Xsry").Value Then
                lngkeyqy = lngkeyqy + 1
                strkeyqy = "Xsry" & lngkeyqy
                trvKh.Nodes.Add , , strkeyqy, rs("Xsry").Value
            End If

            '增加子节点（洽谈进度）
            If strQtjd <> rs("Qtjd").Value Or (strQtjd = rs("Qtjd").Value And strqy <> rs("Xsry").Value) Then
                lngKeyQtjd = lngKeyQtjd + 1
                strKeyQtjd = "Qtjd" & lngKeyQtjd
                trvKh.Nodes.Add strkeyqy, tvwChild, strKeyQtjd, rs("Qtjd").Value
            End If

            '添加客户名称
            trvKh.Nodes.Add strKeyQtjd, tvwChild, rs("Khbm").Value, Decode(rs("Khmc").Value)

            '存储最后的数据
            strqy = rs("Xsry").Value
            strQtjd = rs("Qtjd").Value

            rs.MoveNext
        Loop
    End If

    TabKh.Tab = 0
End Sub

Private Sub optProgress_Click()                 '按洽谈进度分类显示
    Dim strSql As String

    Dim strkeyqy As String
    Dim lngkeyqy As Long
    Dim strqy As String
    Dim strtiaojian As String           '查询限制条件

    '    If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Or user = "蒙海胜" Then
    '        strTiaoJian = ""
    '    Else
    '        strTiaoJian = " and Xsry='" & user & "'"  'or Zjjsr='" & user & "'"
    '    End If

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    trvKh.Nodes.Clear               '清除原有的节点记录

    strSql = "select Khbm,Khmc,Qtjd from Khxx where 1=1" & strtiaojian & " order by Qtjd,Khbm"
    Set rs = Nothing
    rs.Open strSql, conn

    If rs.RecordCount > 0 Then
        Do While Not rs.EOF
            '增加父节点（洽谈进度）
            If strqy <> rs("Qtjd").Value Then
                lngkeyqy = lngkeyqy + 1
                strkeyqy = "Qtjd" & lngkeyqy
                trvKh.Nodes.Add , , strkeyqy, rs("Qtjd").Value
            End If

            '添加客户名称
            trvKh.Nodes.Add strkeyqy, tvwChild, rs("Khbm").Value, Decode(rs("Khmc").Value)

            '存储最后的数据
            strqy = rs("Qtjd").Value

            rs.MoveNext
        Loop
    End If

    TabKh.Tab = 0
End Sub



Private Sub TabKh_Click(PreviousTab As Integer)
    Dim lngkeyqy As Long
    Dim strkeyqy As String
    Dim strqy As String

    If TabKh.Caption = "我的客户列表" Then
        '        Call MyCommand3_Click
    ElseIf TabKh.Caption = "拜访记录" Then
        If Not trvKh.SelectedItem Is Nothing Then
            If trvKh.SelectedItem.Children = 0 Then         '说明当前选择的是客户名称
                Call GetBfjl(trvKh.SelectedItem.key)

            Else
                RTBfjl.Text = ""

            End If
        Else
            RTBfjl.Text = ""
        End If
    ElseIf TabKh.Caption = "待回访客户" Then
        Dim strtiaojian As String

        If g_strYongHuZT = "3" Then           '销售经理
            If ChkALL.Value = 1 Then                                            '查询全部
                strtiaojian = ""
            Else
                strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
            End If
        Else    'If g_strYongHuZT = "2" Then       '普通销售人员
            strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
        End If

        '        '下次拜访时间
        '        strTiaoJian = strTiaoJian & " and Xcbfsj>='" & Format(DTPXcbfsj.Value, "YYYY-MM-DD 00:00:00") & "'"

        trvhf.Nodes.Clear
        'strSql = "select distinct a.khbm,a.khmc,a.qy,B.xcbfmb from khxx as A left join bfjl as B on B.Khbm=A.Khbm and b.wcbz='否' where a.xsry='" & user & "'"
        strSql = "select Qy,Khbm,Khmc from Khxx where Khbm in (select Khbm from Bfjl where isnull(wcbz,'否')='否'" & strtiaojian & " and xcbfsj<=getdate())  order by Qy,Khbm"
        Set rs = Nothing
        rs.Open strSql, conn

        '加载树
        If rs.RecordCount > 0 Then
            Do While Not rs.EOF
                '增加父节点（客户意向）
                If strqy <> rs("qy").Value Then
                    lngkeyqy = lngkeyqy + 1
                    strkeyqy = "qy" & lngkeyqy
                    trvhf.Nodes.Add , , strkeyqy, rs("qy").Value
                End If

                '加客户名称
                trvhf.Nodes.Add strkeyqy, tvwChild, rs("Khbm").Value, Decode(rs("Khmc").Value)

                '存储最后的数据
                strqy = rs("qy").Value

                rs.MoveNext
            Loop
        End If
    End If
End Sub

Private Sub trvhf_Click()
    RTB1.Text = ""
    Call Getrtb2(trvhf.SelectedItem.key)
End Sub

Private Sub trvhf_DblClick()
    Dim strSql As String
    Dim strkhmc As String       '客户名称
    Dim strtiaojian As String
    Dim strkhbm As String

    TabKh.Tab = 1




    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    '拜访时间
    strtiaojian = strtiaojian & " and Bfsj<='" & Format(dtpBfsj.Value, "YYYY-MM-DD 23:59:59") & "'"

    '清空原有内容
    RTBfjl.Text = ""

    '查询指定条件的记录
    strkhmc = trvhf.SelectedItem.Text
    '--客户名称，销售人员，拜访时间，拜访记录，拜访结果
    strSql = "select '" & strkhmc & "' as Khmc,Xsry,Bfsj,isnull(Bfjl,'') as Bfjl,Bfjg from Bfjl where wcbz='是' and Khbm='" & txtKhbm.Text & "'" & strtiaojian & " order by Bfsj desc"
    Set rs = Nothing
    rs.Open strSql, conn, adOpenStatic
    If rs.RecordCount <= 0 Then             '未找到满足条件的记录则直接退出
        Exit Sub
    End If

    Dim i As Integer
    Dim a As String             '定义数据集返回变量
    Dim b As String
    Dim c As String
    Dim D As String
    Dim e As String
    Dim f As String
    Dim strlen() As String      '变量个数
    Dim strlong As String
    Dim MySelStart As Integer, MySelLength As Integer

    Dim N As Integer            '空格数量（目的：使标题居中对齐）
    Dim lngSelStart As Long
    Dim lngSelEnd As Long

    '查询赋值
    For i = 1 To rs.RecordCount
        N = 22 - Len(rs.Fields("Khmc").Value)
        a = Space(N) & rs.Fields("Khmc").Value                  '客户名称
        b = "销售人员：" & rs.Fields("Xsry").Value              '销售人员
        c = "拜访时间：" & rs.Fields("Bfsj").Value              '拜访时间
        D = "拜访记录：" & vbCrLf & Decode(rs.Fields("Bfjl").Value)              '拜访记录
        e = "拜访结果：" & rs.Fields("Bfjg").Value              '拜访结果

        '销售人员起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 & ";"

        '拜访时间起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) & ";"

        '拜访记录起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) & ";"

        '拜访结果起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) + 2 + Len(D) & ";"

        RTBfjl.Text = RTBfjl.Text & a & vbCrLf & b & vbCrLf & c & vbCrLf & D & vbCrLf & e & vbCrLf & vbCrLf & vbCrLf
        rs.MoveNext
    Next i

    '记录每个变量的傎并用分号格开
    strlen = Split(strlong, ";")

    'UBound返回Split函数的个数，然后循环
    For i = 0 To UBound(strlen) - 1
        RTBfjl.SelStart = strlen(i)
        If i Mod 4 = 0 Then
            RTBfjl.SelLength = 5
            RTBfjl.SelBold = True
        Else
            RTBfjl.SelLength = 7
            RTBfjl.SelBold = True
        End If

        '恢复之前的光标位置和选定长度
        RTBfjl.SelStart = MySelStart
        RTBfjl.SelLength = MySelLength
    Next i

    '还原RichTextBox的光标位置和选定长度
    MySelStart = RTBfjl.SelStart
    MySelLength = RTBfjl.SelLength

End Sub

Private Sub trvhf_NodeClick(ByVal Node As MSComctlLib.Node)                     '待回访客户
    Dim strkhbm As String               '客户编码
    Dim strSql As String
    Dim strtiaojian As String

    '清除原有记录
    cboKhxx(1).Text = ""
    cboKhxx(0).Text = ""
    cboKhxx(3).Text = ""
    '    cboKhxx(4).Text = ""

    txtKhxx(0).Text = ""
    txtKhxx(1).Text = ""
    txtKhxx(2).Text = ""
    txtKhxx(3).Text = ""
    txtKhxx(4).Text = ""
    txtKhxx(5).Text = ""
    Text1.Text = ""
    txtKhbm.Text = ""
    txtKhbm.Tag = ""
    Label2.Caption = ""
    Label6.Caption = ""
    Label8.Caption = ""
    Label11.Caption = ""

    txtBfxx(1).Text = ""            '回访目标

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and B.Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and B.Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    If Node.Children = 0 Then
        strkhbm = Node.key
        strtiaojian = strtiaojian & " AND A.Khbm='" & strkhbm & "'"

        strSql = "select *,B.xcbfmb,B.Bfbm from khxx as A left join bfjl as B on B.Khbm=A.Khbm and b.wcbz='否' where isnull(Qtjd,'')<>'成交'" & strtiaojian
        Set rs = Nothing
        rs.Open strSql, conn, adOpenStatic

        If rs.RecordCount > 0 Then
            cboKhxx(1).Text = rs("Qy").Value                            '区域
            cboKhxx(0).Text = Decode(rs("Khmc").Value)                  '客户名称
            cboKhxx(3).Text = rs("Khxz").Value                          '客户性质
            Label2.Caption = rs("qtjd").Value                           '洽谈进度
            txtKhxx(0).Text = Decode(rs("Fzr").Value)                   '负责人
            txtKhxx(1).Text = Decode(rs("Gddh").Value)                  '电话
            txtKhxx(2).Text = Decode(rs("Sj").Value)                    '手机
            txtKhxx(3).Text = Decode(rs("Cz").Value)                    '传真
            txtKhxx(4).Text = rs("Sxmk").Value                          '所需模块
            txtKhxx(5).Text = Decode(rs("Yyqk").Value)                  '医院情况
            Label11.Caption = rs("xsry").Value                          '销售人员
            Label13.Caption = rs("qtsj").Value                          '洽谈时间

            Label6.Caption = rs("rjmc").Value                           '软件版本
            Label8.Caption = IIf(IsNull(Decode(rs("bj").Value)), "无", Decode(rs("bj").Value))                   '软件价格

            txtBfxx(1).Text = "本次预约次拜访时间：" & (rs("xcbfsj").Value) & "     本次拜访目的：" & Decode(rs("xcbfmb").Value)            '下次拜访目标

            txtKhbm.Text = rs("Khbm").Value                             '客户编码
            txtKhbm.Tag = rs("bfbm").Value                              '拜访编码
            Text1.Text = rs("bfbm").Value
        End If

        Set rs = Nothing

        txtKhbm.Text = strkhbm              '保存客户编码
    End If
End Sub

Private Sub trvKh_DblClick()
    If trvKh.SelectedItem Is Nothing Then
        Exit Sub
    ElseIf trvKh.SelectedItem.Children = 0 Then
        Call trvKh_NodeClick(trvKh.SelectedItem)
        TabKh.Tab = 1
    End If


End Sub

Private Sub trvKh_NodeClick(ByVal Node As MSComctlLib.Node)                     '我的客户列表
    Dim strkhbm As String               '客户编码
    Dim strSql As String


    RTB1.Text = ""
    Call Getrtb1(trvKh.SelectedItem.key)


    '清除原有记录
    cbobfxx(2).Text = ""
    cboKhxx(1).Text = ""
    cboKhxx(0).Text = ""
    cboKhxx(3).Text = ""
    '    cboKhxx(4).Text = ""
    Text1.Text = ""
    txtKhxx(0).Text = ""
    txtKhxx(1).Text = ""
    txtKhxx(2).Text = ""
    txtKhxx(3).Text = ""
    txtKhxx(4).Text = ""
    txtKhxx(5).Text = ""

    txtBfxx(1).Text = ""
    txtKhbm.Text = ""
    txtKhbm.Tag = ""
    Label2.Caption = ""
    Label6.Caption = ""
    Label8.Caption = ""
    Label11.Caption = ""

    If Node.Children = 0 Then
        strkhbm = Node.key
        strSql = "select * from Khxx where Khbm='" & strkhbm & "'"
        Set rs = Nothing
        rs.Open strSql, conn, adOpenStatic

        If rs.RecordCount > 0 Then
            cboKhxx(1).Text = rs("Qy").Value                            '区域
            cboKhxx(0).Text = Decode(rs("Khmc").Value)                  '客户名称
            cboKhxx(3).Text = rs("Khxz").Value                          '客户性质
            Label2.Caption = rs("qtjd").Value                           '洽谈进度
            Label6.Caption = rs("rjmc").Value                           '软件版本
            Label8.Caption = IIf(IsNull(Decode(rs("bj").Value)), "无", Decode(rs("bj").Value))                   '软件价格
            '            txtBfxx(1).Text = rs("xcbfmb").Value
            txtKhxx(0).Text = Decode(rs("Fzr").Value)                   '负责人
            txtKhxx(1).Text = Decode(rs("Gddh").Value)                  '电话
            txtKhxx(2).Text = Decode(rs("Sj").Value)                    '手机
            txtKhxx(3).Text = Decode(rs("Cz").Value)                    '传真
            txtKhxx(4).Text = rs("Sxmk").Value                          '所需模块
            txtKhxx(5).Text = Decode(rs("Yyqk").Value)                  '医院情况
            Label11.Caption = rs("xsry").Value                          '销售人员
            Label13.Caption = rs("qtsj").Value                          '洽谈时间

        End If

        Set rs = Nothing
        str = "select * from bfjl where khbm='" & strkhbm & "' and wcbz='否'"
        rs.Open str, conn, adOpenDynamic
        If rs.RecordCount > 0 Then
            txtBfxx(1).Text = "本次预约拜访时间：" & (rs("xcbfsj").Value) & "     本次拜访目的：" & Decode(rs("xcbfmb").Value)           '下次拜访目标
            Text1.Text = rs("bfbm").Value
        End If
        Set rs = Nothing
        txtKhbm.Text = strkhbm              '保存客户编码
    End If
End Sub

Private Sub GetBfjl(ByVal strkhbm As String)                       '根据客户编码获取拜访记录
    Dim strSql As String
    Dim strkhmc As String       '客户名称
    Dim strtiaojian As String

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    '拜访时间
    strtiaojian = strtiaojian & " and Bfsj<='" & Format(dtpBfsj.Value, "YYYY-MM-DD 23:59:59") & "'"

    '清空原有内容
    RTBfjl.Text = ""

    '查询指定条件的记录
    strkhmc = trvKh.SelectedItem.Text
    '--客户名称，销售人员，拜访时间，拜访记录，拜访结果
    strSql = "select '" & strkhmc & "' as Khmc,Xsry,Bfsj,isnull(Bfjl,'') as Bfjl,Bfjg from Bfjl where wcbz='是' and Khbm='" & strkhbm & "'" & strtiaojian & " order by Bfsj desc"
    Set rs = Nothing
    rs.Open strSql, conn, adOpenStatic
    If rs.RecordCount <= 0 Then             '未找到满足条件的记录则直接退出
        Exit Sub
    End If

    Dim i As Integer
    Dim a As String             '定义数据集返回变量
    Dim b As String
    Dim c As String
    Dim D As String
    Dim e As String
    Dim f As String
    Dim strlen() As String      '变量个数
    Dim strlong As String
    Dim MySelStart As Integer, MySelLength As Integer

    Dim N As Integer            '空格数量（目的：使标题居中对齐）
    Dim lngSelStart As Long
    Dim lngSelEnd As Long

    '查询赋值
    For i = 1 To rs.RecordCount
        N = 22 - Len(rs.Fields("Khmc").Value)
        a = Space(N) & rs.Fields("Khmc").Value                  '客户名称
        b = "销售人员：" & rs.Fields("Xsry").Value              '销售人员
        c = "拜访时间：" & rs.Fields("Bfsj").Value              '拜访时间
        D = "拜访记录：" & vbCrLf & Decode(rs.Fields("Bfjl").Value)              '拜访记录
        e = "拜访结果：" & rs.Fields("Bfjg").Value              '拜访结果

        '销售人员起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 & ";"

        '拜访时间起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) & ";"

        '拜访记录起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) & ";"

        '拜访结果起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) + 2 + Len(D) & ";"

        RTBfjl.Text = RTBfjl.Text & a & vbCrLf & b & vbCrLf & c & vbCrLf & D & vbCrLf & e & vbCrLf & vbCrLf & vbCrLf
        rs.MoveNext
    Next i

    '记录每个变量的傎并用分号格开
    strlen = Split(strlong, ";")

    'UBound返回Split函数的个数，然后循环
    For i = 0 To UBound(strlen) - 1
        RTBfjl.SelStart = strlen(i)
        If i Mod 4 = 0 Then
            RTBfjl.SelLength = 5
            RTBfjl.SelBold = True
        Else
            RTBfjl.SelLength = 7
            RTBfjl.SelBold = True
        End If

        '恢复之前的光标位置和选定长度
        RTBfjl.SelStart = MySelStart
        RTBfjl.SelLength = MySelLength
    Next i

    '还原RichTextBox的光标位置和选定长度
    MySelStart = RTBfjl.SelStart
    MySelLength = RTBfjl.SelLength
End Sub
Private Sub Getrtb1(ByVal strkhbm As String)                       '根据客户编码获取拜访记录
    Dim strSql As String
    Dim strkhmc As String       '客户名称
    Dim strtiaojian As String

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    '拜访时间
    strtiaojian = strtiaojian & " and Bfsj<='" & Format(dtpBfsj.Value, "YYYY-MM-DD 23:59:59") & "'"

    '清空原有内容
    RTB1.Text = ""

    '查询指定条件的记录
    strkhmc = trvKh.SelectedItem.Text
    '--客户名称，销售人员，拜访时间，拜访记录，拜访结果
    strSql = "select '" & strkhmc & "' as Khmc,Xsry,Bfsj,isnull(Bfjl,'') as Bfjl,Bfjg from Bfjl where wcbz='是' and Khbm='" & strkhbm & "'" & strtiaojian & " order by Bfsj desc"
    Set rs = Nothing
    rs.Open strSql, conn, adOpenStatic
    If rs.RecordCount <= 0 Then             '未找到满足条件的记录则直接退出
        Exit Sub
    End If

    Dim i As Integer
    Dim a As String             '定义数据集返回变量
    Dim b As String
    Dim c As String
    Dim D As String
    Dim e As String
    Dim f As String
    Dim strlen() As String      '变量个数
    Dim strlong As String
    Dim MySelStart As Integer, MySelLength As Integer

    Dim N As Integer            '空格数量（目的：使标题居中对齐）
    Dim lngSelStart As Long
    Dim lngSelEnd As Long

    '查询赋值
    For i = 1 To rs.RecordCount
        N = 22 - Len(rs.Fields("Khmc").Value)
        a = Space(N) & rs.Fields("Khmc").Value                  '客户名称
        b = "销售人员：" & rs.Fields("Xsry").Value              '销售人员
        c = "拜访时间：" & rs.Fields("Bfsj").Value              '拜访时间
        D = "拜访记录：" & vbCrLf & Decode(rs.Fields("Bfjl").Value)              '拜访记录
        e = "拜访结果：" & rs.Fields("Bfjg").Value              '拜访结果

        '销售人员起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 & ";"

        '拜访时间起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) & ";"

        '拜访记录起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) & ";"

        '拜访结果起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) + 2 + Len(D) & ";"

        RTB1.Text = RTB1.Text & a & vbCrLf & b & vbCrLf & c & vbCrLf & D & vbCrLf & e & vbCrLf & vbCrLf & vbCrLf
        rs.MoveNext
    Next i

    '记录每个变量的傎并用分号格开
    strlen = Split(strlong, ";")

    'UBound返回Split函数的个数，然后循环
    For i = 0 To UBound(strlen) - 1
        RTB1.SelStart = strlen(i)
        If i Mod 4 = 0 Then
            RTB1.SelLength = 5
            RTB1.SelBold = True
        Else
            RTB1.SelLength = 7
            RTB1.SelBold = True
        End If

        '恢复之前的光标位置和选定长度
        RTB1.SelStart = MySelStart
        RTB1.SelLength = MySelLength
    Next i

    '还原RichTextBox的光标位置和选定长度
    MySelStart = RTB1.SelStart
    MySelLength = RTB1.SelLength
End Sub
Private Sub Getrtb2(ByVal strkhbm As String)                       '根据客户编码获取拜访记录
    Dim strSql As String
    Dim strkhmc As String       '客户名称
    Dim strtiaojian As String

    cbobfxx(2).Text = ""

    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(2).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If

    '拜访时间
    strtiaojian = strtiaojian & " and Bfsj<='" & Format(dtpBfsj.Value, "YYYY-MM-DD 23:59:59") & "'"

    '清空原有内容
    RTB1.Text = ""

    '查询指定条件的记录
    strkhmc = trvhf.SelectedItem.Text
    '--客户名称，销售人员，拜访时间，拜访记录，拜访结果
    strSql = "select '" & strkhmc & "' as Khmc,Xsry,Bfsj,isnull(Bfjl,'') as Bfjl,Bfjg from Bfjl where wcbz='是' and Khbm='" & strkhbm & "'" & strtiaojian & " order by Bfsj desc"
    Set rs = Nothing
    rs.Open strSql, conn, adOpenStatic
    If rs.RecordCount <= 0 Then             '未找到满足条件的记录则直接退出
        Exit Sub
    End If

    Dim i As Integer
    Dim a As String             '定义数据集返回变量
    Dim b As String
    Dim c As String
    Dim D As String
    Dim e As String
    Dim f As String
    Dim strlen() As String      '变量个数
    Dim strlong As String
    Dim MySelStart As Integer, MySelLength As Integer

    Dim N As Integer            '空格数量（目的：使标题居中对齐）
    Dim lngSelStart As Long
    Dim lngSelEnd As Long

    '查询赋值
    For i = 1 To rs.RecordCount
        N = 22 - Len(rs.Fields("Khmc").Value)
        a = Space(N) & rs.Fields("Khmc").Value                  '客户名称
        b = "销售人员：" & rs.Fields("Xsry").Value              '销售人员
        c = "拜访时间：" & rs.Fields("Bfsj").Value              '拜访时间
        D = "拜访记录：" & vbCrLf & Decode(rs.Fields("Bfjl").Value)              '拜访记录
        e = "拜访结果：" & rs.Fields("Bfjg").Value              '拜访结果

        '销售人员起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 & ";"

        '拜访时间起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) & ";"

        '拜访记录起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) & ";"

        '拜访结果起始位
        strlong = strlong & Len(RTBfjl.Text) + Len(a) + 2 + Len(b) + 2 + Len(CStr(c)) + 2 + Len(D) & ";"

        RTB1.Text = RTB1.Text & a & vbCrLf & b & vbCrLf & c & vbCrLf & D & vbCrLf & e & vbCrLf & vbCrLf & vbCrLf
        rs.MoveNext
    Next i

    '记录每个变量的傎并用分号格开
    strlen = Split(strlong, ";")

    'UBound返回Split函数的个数，然后循环
    For i = 0 To UBound(strlen) - 1
        RTB1.SelStart = strlen(i)
        If i Mod 4 = 0 Then
            RTB1.SelLength = 5
            RTB1.SelBold = True
        Else
            RTB1.SelLength = 7
            RTB1.SelBold = True
        End If

        '恢复之前的光标位置和选定长度
        RTB1.SelStart = MySelStart
        RTB1.SelLength = MySelLength
    Next i

    '还原RichTextBox的光标位置和选定长度
    MySelStart = RTB1.SelStart
    MySelLength = RTB1.SelLength
End Sub





Private Function FunBlnCheck() As Boolean                   '保存新增记录时的限制条件
    If Trim(txtKhbm.Text) = "" Then
        MsgBox "请从我的客户列表中选择要拜访的客户名称"
        Exit Function
    End If

    '    If Trim(cbobfxx(0).Text) = "" Then
    '        MsgBox "请选择拜访结果"
    '        cbobfxx(0).SetFocus
    '        Exit Function
    '    End If

    '    If Trim(cbobfxx(1).Text) = "" Then
    '        MsgBox "请选择销售人员"
    '        cbobfxx(1).SetFocus
    '        Exit Function
    '    End If

    '    If Trim(cbobfxx(2).Text) = "" Then
    '        MsgBox "请选择洽谈进度"
    '        cbobfxx(2).SetFocus
    '        Exit Function
    '    End If

    If Trim(txtBfxx(0).Text) = "" Then
        MsgBox "请填写拜访记录"
        txtBfxx(0).SetFocus
        Exit Function
    End If

    FunBlnCheck = True
End Function
