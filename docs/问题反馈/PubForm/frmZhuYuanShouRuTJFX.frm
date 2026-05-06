VERSION 5.00
Object = "{A964BDA3-3E93-11CF-9A0F-9E6261DACD1C}#3.0#0"; "RESIZE32.OCX"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Begin VB.Form frmZhuYuanShouRuTJFX 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "住院收入统计分析"
   ClientHeight    =   8625
   ClientLeft      =   -210
   ClientTop       =   6060
   ClientWidth     =   13680
   Icon            =   "frmZhuYuanShouRuTJFX.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8625
   ScaleWidth      =   13680
   Begin ResizeLibCtl.ReSize ReSize1 
      Left            =   12420
      Top             =   8100
      _Version        =   196608
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   64
      Enabled         =   -1  'True
      FormMinWidth    =   0
      FormMinHeight   =   0
      FormDesignHeight=   8625
      FormDesignWidth =   13680
   End
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   23
      Top             =   0
      Width           =   13575
      _ExtentX        =   23945
      _ExtentY        =   714
      Caption         =   "住院收入统计分析"
   End
   Begin UserControl.cbo cboTongJiLeiB 
      Height          =   225
      Left            =   7680
      TabIndex        =   17
      Top             =   1440
      Visible         =   0   'False
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   397
      Caption         =   "统计类别"
      ForeColor       =   16711680
      Caption         =   "统计类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "序号;名称;"
      ColWidths       =   "800;1200;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboChaXunFL 
      Height          =   225
      Left            =   10380
      TabIndex        =   16
      Top             =   1440
      Visible         =   0   'False
      Width           =   2475
      _ExtentX        =   4366
      _ExtentY        =   397
      Caption         =   "查询分类"
      ForeColor       =   16711680
      Caption         =   "查询分类"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "序号;名称;"
      ColWidths       =   ""
      ListText        =   ""
   End
   Begin UserControl.dtm dtmJieShuRQZY 
      Height          =   225
      Left            =   10260
      TabIndex        =   15
      Top             =   1020
      Visible         =   0   'False
      Width           =   3315
      _ExtentX        =   5847
      _ExtentY        =   397
      Caption         =   "结束日期"
      DateFormat      =   1
      BackColor       =   16777215
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
   Begin UserControl.dtm dtmKaiShiRQCY 
      Height          =   225
      Left            =   6960
      TabIndex        =   14
      Top             =   1020
      Visible         =   0   'False
      Width           =   3195
      _ExtentX        =   5636
      _ExtentY        =   397
      Caption         =   "开始日期"
      DateFormat      =   1
      BackColor       =   16777215
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
   Begin UserControl.cbo cboZhuangTai 
      Height          =   225
      Left            =   5115
      TabIndex        =   13
      Top             =   1020
      Width           =   1740
      _ExtentX        =   3069
      _ExtentY        =   397
      ListWidth       =   1200
      Caption         =   "状态"
      CaptionWidth    =   400
      ValueColumn     =   2
      TextColumn      =   2
      ForeColor       =   16711680
      Caption         =   "状态"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "状态;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboJiuZhenYS 
      Height          =   225
      Left            =   2640
      TabIndex        =   12
      Top             =   600
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
      Caption         =   "就诊医生"
      ForeColor       =   16711680
      Caption         =   "就诊医生"
      Enabled         =   0   'False
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "800;800;1200;"
      ListText        =   ""
   End
   Begin UserControl.txt txtHuanZheZZ 
      Height          =   225
      Left            =   3420
      TabIndex        =   11
      Top             =   1440
      Visible         =   0   'False
      Width           =   4155
      _ExtentX        =   7329
      _ExtentY        =   397
      Caption         =   "患者住址"
      CaptionWidth    =   840
      Hwnd            =   1118768
      CaptionForeColor=   -2147483630
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
   Begin UserControl.cbo cboHuanZheXM 
      Height          =   225
      Left            =   2640
      TabIndex        =   6
      Top             =   1020
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
      Caption         =   "患者姓名"
      ValueColumn     =   2
      TextColumn      =   2
      ForeColor       =   16744576
      Caption         =   "患者姓名"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "拼音码;患者姓名;"
      ColWidths       =   "1000;1000;"
      ListText        =   ""
   End
   Begin UserControl.lst lstZhuYuanMx 
      Height          =   1725
      Left            =   1290
      TabIndex        =   5
      Top             =   4080
      Visible         =   0   'False
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   3043
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   4
      BackColorBkg    =   16777215
      BackColorFixed  =   14737632
      BackColorFrozen =   8454143
      BackColorSel    =   8454143
      ForeColorSel    =   0
      GridColor       =   12582912
      GridColorFixed  =   12582912
      RowHeightMin    =   300
      ColWidths       =   ""
   End
   Begin UserControl.txt txtTongJiFXMC 
      Height          =   225
      Left            =   12240
      TabIndex        =   3
      Top             =   7920
      Visible         =   0   'False
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   397
      CaptionWidth    =   105
      Hwnd            =   7735134
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
   Begin UserControl.dtm dtmJieShuRQ 
      Height          =   225
      Left            =   9300
      TabIndex        =   0
      Top             =   600
      Width           =   4275
      _ExtentX        =   7541
      _ExtentY        =   397
      Caption         =   "结束日期"
      DateFormat      =   1
      BackColor       =   16777215
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
   Begin UserControl.cbo cboKeShi 
      Height          =   225
      Left            =   60
      TabIndex        =   1
      Top             =   600
      Width           =   2475
      _ExtentX        =   4366
      _ExtentY        =   397
      Caption         =   "就诊科室"
      Caption         =   "就诊科室"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboHeSuanKS 
      Height          =   225
      Left            =   2640
      TabIndex        =   2
      Top             =   600
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
      Caption         =   "核算科室"
      Caption         =   "核算科室"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.lst lstChaXunJieGuo 
      Height          =   6015
      Left            =   60
      TabIndex        =   4
      Top             =   1800
      Width           =   13575
      _ExtentX        =   23945
      _ExtentY        =   10610
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   4
      BackColorBkg    =   16777215
      BackColorFixed  =   14737632
      BackColorFrozen =   8454143
      BackColorSel    =   8454143
      ForeColorSel    =   0
      RowHeightMin    =   300
      ColWidths       =   "800"
   End
   Begin UserControl.cbo cbo2 
      Height          =   225
      Left            =   120
      TabIndex        =   7
      Top             =   2880
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      ForeColor       =   16744576
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   ""
      ListText        =   ""
   End
   Begin UserControl.cbo cboBingLiH 
      Height          =   225
      Left            =   60
      TabIndex        =   8
      Top             =   1020
      Width           =   2475
      _ExtentX        =   4366
      _ExtentY        =   397
      Caption         =   "病例号"
      TextColumn      =   1
      ForeColor       =   16744576
      Caption         =   "病例号"
      MuchItems       =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "流水号;患者姓名;病例号;"
      ColWidths       =   "800;1000;1000;"
      ListText        =   ""
   End
   Begin UserControl.dtm dtmKaiShiRQ 
      Height          =   225
      Left            =   5100
      TabIndex        =   9
      Top             =   600
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   397
      Caption         =   "开始日期"
      DateFormat      =   1
      BackColor       =   16777215
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
   Begin UserControl.cbo cboZhuYaoZD 
      Height          =   225
      Left            =   60
      TabIndex        =   10
      Top             =   1440
      Visible         =   0   'False
      Width           =   3195
      _ExtentX        =   5636
      _ExtentY        =   397
      Caption         =   "主要诊断"
      TextColumn      =   2
      Caption         =   "主要诊断"
      MuchItems       =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.cmd cmdChaXun 
      Height          =   495
      Left            =   60
      TabIndex        =   18
      Top             =   7980
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   873
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "查询(&S)"
   End
   Begin UserControl.cmd cmdPreview 
      Height          =   495
      Left            =   2460
      TabIndex        =   19
      Top             =   7980
      Width           =   1305
      _ExtentX        =   2302
      _ExtentY        =   873
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "打印预览(&V)"
   End
   Begin UserControl.cmd cmdPrint 
      Height          =   495
      Left            =   3855
      TabIndex        =   20
      Top             =   7980
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   873
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "打印(&P)"
   End
   Begin UserControl.cmd cmdClose 
      Height          =   495
      Left            =   4860
      TabIndex        =   21
      Top             =   7980
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   873
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退出(&Q)"
   End
   Begin UserControl.cmd cmdQingKongTJ 
      Height          =   495
      Left            =   1065
      TabIndex        =   22
      Top             =   7980
      Width           =   1305
      _ExtentX        =   2302
      _ExtentY        =   873
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "清空条件(&C)"
   End
End
Attribute VB_Name = "frmZhuYuanShouRuTJFX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public strChuangTiMZY As String
Public strChaXunLeiX        As String   '费用类别  发票类别

Dim strMsgZT As String








Private Sub cboJiuZhenYS_GotFocus()

    cboJiuZhenYS.LoadOver = False
    g_strTiaoJian = ""
    g_strSQL = ""
    Dim strTiaoJian As String  '条件
    '装载医生
    If Trim(cboKeShi.Text) <> "" Then
      strTiaoJian = " AND MingCheng='" & Trim(cboKeShi.Text) & "'"
    Else
      strTiaoJian = ""
    End If
    g_strTiaoJian = " where leibie='医生' "
    If cboKeShi.Text <> "" Then
        g_strTiaoJian = g_strTiaoJian & " AND  DaiMa in (SELECT YongHuDM FROM zd_YongHu_DengLuKS WHERE DengLuKS in (SELECT DaiMa FROM zd_KeShi WHERE LeiBie='住院就诊' " & Trim(strTiaoJian) & " ))"
    End If
    
    g_strSQL = "select daima,pinyinm,mingcheng from zd_yonghu" & g_strTiaoJian
    
    
    If objFormSetting.LoadcboData(cboJiuZhenYS, RecordData, g_strSQL) = False Then
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.AddDataFailure)
         GoTo PROC_EXIT
    End If
    
PROC_EXIT:
   Exit Sub
    
End Sub



Private Sub cboZhuangTai_SelectChanged()
    If cboZhuangTai.Text = "护士站出院" Or cboZhuangTai.Text = "住院处出院" Then
        dtmKaiShiRQCY.Visible = True
        dtmJieShuRQZY.Visible = True
'        dtmKaiShiRQ.Enabled = False
'        dtmJieShuRQ.Enabled = False
    Else
        dtmKaiShiRQCY.Visible = False
        dtmJieShuRQZY.Visible = False
'        dtmKaiShiRQ.Enabled = True
'        dtmJieShuRQ.Enabled = True

    End If
End Sub

Private Sub cboZhuYaoZD_KeyPress(KeyAscii As Integer)
    Dim strSQL As String
    cboZhuYaoZD.InputColumn = 2

   If KeyAscii = vbKeyReturn Then
      '装载主要诊断
'      cboZhuYaoZD.ClearData
      cboZhuYaoZD.LoadOver = False
'      strSql = ""
      strSQL = "SELECT " & Chr(13) _
                   & "        /*代码,拼音码,ICD10编码,名称*/" & Chr(13) _
                   & "        DaiMa,PinYinM,ICD10BM,MingCheng" & Chr(13) _
                   & "FROM zd_ICD10"
      strSQL = strSQL & Chr(13) & " WHERE (PinYinM like '%" & cboZhuYaoZD.Text & "%')"
      If objFormSetting.LoadcboData(cboZhuYaoZD, RecordData, strSQL) = False Then
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.AddDataFailure)
         GoTo PROC_EXIT
      End If
   End If
  
PROC_EXIT:
   Exit Sub
   
End Sub

Private Sub cmdChaXun_Click()
   
   On Error GoTo PROC_EXIT
   
   Dim rstTongJiFXMC As ADODB.Recordset '统计分析名称
   Dim strCanZhaoZD As String           '参照字段

   Dim strTongJiGS As String            '统计公式
   Dim strShuJvLY As String             '数据来源
   Dim strFenZuZD As String             '分组字段
   Dim strShiJianZD As String           '时间字段
   Dim strFuJiaTJ As String             '附加条件
   Dim intHeJiKSZD As Integer           '合计开始字段
   Dim intHeJiJSZD As Integer           '合计结束字段
   Dim dblHeJi As Double                '合计
   Dim dblZongJi As Double              '总计
   Dim lngZongHangS As Long             '总行数
   Dim strCanZhaoTJ As String           '参照条件
   Dim lngRow As Long  '行号
   Dim lngCol As Long  '列号
   Dim colHeJi As Collection
   Dim intJiSuanBLZD As Integer         '计算比例字段
   Dim intStartCol As Integer           '开始行
   Dim intStartRow As Integer           '开始列
   Dim arrLieMingC() As String          '列名称
   Dim arrLieBiaoT() As String          '列标题
   Dim arrLieKuanD() As String          '列宽度
   Dim arrDuiQiFS() As String           '对齐方式
   Dim arrXianShiZD() As String         '显示字段
   Dim strLieBiaoT As String            '列标题
   Dim strLieKuanD As String            '列宽度
   Dim strLieMingC As String            '列名称
   Dim strDuiQiFS As String             '对齐方式
   Dim strXianShiZD As String           '显示字段
   Dim inti As Integer                  '循环变量
   Dim rstLinShi As ADODB.Recordset     '临时使用
   Dim strTiaoJian As String            '条件
   Dim strLeiBieTJ As String            '类别条件
   Dim strLeiBieXX As String            '类别信息
   
   
   If cboZhuangTai.Text = "护士站出院" Or cboZhuangTai.Text = "住院处出院" Then
        Dim strMsg As String
        strMsg = "0"
        strMsg = MsgBox("是否查询患者全部费用", vbYesNo + vbInformation, "查询提示")
        If strMsg = vbYes Then
            strMsgZT = "0"
        Else
            strMsgZT = "1"
        End If
        
        
   End If
   
   '正在处理的行号

   intStartCol = 0
   intStartRow = 6
   
   '开始日期
   strTiaoJian = "1=1"
   
   If Not dtmKaiShiRQ.IsNull Then
      strTiaoJian = strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
   End If
   '结束日期
   If Not dtmJieShuRQ.IsNull Then
      strTiaoJian = strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
   End If
   strLeiBieTJ = "AND (DaiMa in (SELECT DaiMa FROM zd_FeiYongLeiBie))"
   
   '查询需要显示的信息
   g_strSQL = "SELECT CaoZhaoTJ,LieBiaoT,LieKuanD,JiSuanBLZD," & Chr(13) _
            & "ShuJvLY,XianShiZD,FenZuZD,DuiQiFS,HeJiKSZD,HeJiJSZD,LieMingC" & Chr(13) _
            & "FROM xt_ZhuYuanShouRuTJFXSD" & Chr(13) _
            & "WHERE TongJiFXMC='" & txtTongJiFXMC.Text & "'"
   Set rstTongJiFXMC = objExecuteSQL.GetRs(g_strSQL)
   strLieBiaoT = rstTongJiFXMC("LieBiaoT")           '列标题
   strShuJvLY = rstTongJiFXMC("ShuJvLY")             '数据来源
   strFenZuZD = rstTongJiFXMC("FenZuZD")             '分组字段
   strDuiQiFS = rstTongJiFXMC("DuiQiFS")             '对齐方式
   strCanZhaoTJ = rstTongJiFXMC("CaoZhaoTJ")         '参照条件
   strLieKuanD = rstTongJiFXMC("LieKuanD")           '列宽度
   strLieMingC = rstTongJiFXMC("LieMingC")           '列名称
   strLieBiaoT = rstTongJiFXMC("LieBiaoT")           '列标题
   strDuiQiFS = rstTongJiFXMC("DuiQiFS")             '对齐方式
   strLieKuanD = rstTongJiFXMC("LieKuanD")           '列宽度
   strLieMingC = rstTongJiFXMC("LieMingC")           '列名称
   strXianShiZD = rstTongJiFXMC("XianShiZD")         '显示字段
   intJiSuanBLZD = rstTongJiFXMC("JiSuanBLZD")       '计算比例字段
   intHeJiKSZD = rstTongJiFXMC("HeJiKSZD")           '合计开始字段
   intHeJiJSZD = rstTongJiFXMC("HeJiJSZD")           '合计结束字段
   

   arrLieMingC = Split(strLieMingC, ";")
   arrLieBiaoT = Split(strLieBiaoT, ";")
   arrDuiQiFS = Split(strDuiQiFS, ";")
   arrLieKuanD = Split(strLieKuanD, ";")
   arrXianShiZD = Split(strXianShiZD, ";")
   
   '根据特殊名称生成新的列表设置信息
   strLieMingC = ""
   strLieBiaoT = ""
   strDuiQiFS = ""
   strLieKuanD = ""
   strXianShiZD = ""
   For inti = 0 To UBound(arrXianShiZD) - 1
      '如果是特殊名称，特殊处理
      Select Case arrXianShiZD(inti)
   '药品收入明细
      Case "YaoPinSRMX":
      
         '需要重新计算下列各值(先减一，下面的循环追加)
         intHeJiJSZD = intHeJiJSZD - 1         '合计结束字段
         If Trim(strChaXunLeiX) = "发票类别" Then
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_ZhuYuanFaPiaoLB" & Chr(13) _
                     & "WHERE daima in (select distinct ZhuYuanFPLB from zd_ShouFeiZiDian where DaLei='1')" & Chr(13)
         Else
             g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_FeiYongLeiBie" & Chr(13) _
                     & "WHERE DaLei='1'" & Chr(13) _
                     & strLeiBieTJ

         End If
         
         Set rstLinShi = objExecuteSQL.GetRs(g_strSQL)
         While Not rstLinShi.EOF
            '
            strLieMingC = strLieMingC & Right("0000" + rstLinShi(0), 4) + "收入;"
            strLieBiaoT = strLieBiaoT & rstLinShi(1) + "收入;"
            strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
            strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
            If Trim(strChaXunLeiX) = "发票类别" Then
                strXianShiZD = strXianShiZD & "SUM(CASE ZhuYuanFPLB WHEN '" & rstLinShi(0) & "' THEN A.ShiShouJE ELSE 0 END),"
            Else
                strXianShiZD = strXianShiZD & "SUM(CASE FeiYongLB WHEN '" & rstLinShi(0) & "' THEN A.ShiShouJE ELSE 0 END),"
            End If
            
            intHeJiJSZD = intHeJiJSZD + 1         '合计结束字段
            rstLinShi.MoveNext
         Wend
         
      '药品收入合计
      Case "YaoPinSRHJ":
      
         strLieMingC = strLieMingC & arrLieMingC(inti) & ";"
         strLieBiaoT = strLieBiaoT & arrLieBiaoT(inti) & ";"
         strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
         strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
         
         If Trim(strChaXunLeiX) = "发票类别" Then
            strLeiBieXX = "SUM(CASE ZhuYuanFPLB "
            
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_ZhuYuanFaPiaoLB" & Chr(13) _
                     & "WHERE daima in (select distinct ZhuYuanFPLB from zd_ShouFeiZiDian where DaLei='1')" & Chr(13)
         Else
            strLeiBieXX = "SUM(CASE FeiYongLB "
               
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_FeiYongLeiBie" & Chr(13) _
                     & "WHERE DaLei='1'" & Chr(13) _
                     & strLeiBieTJ
         End If
         Set rstLinShi = objExecuteSQL.GetRs(g_strSQL)
         While Not rstLinShi.EOF
            '

            strLeiBieXX = strLeiBieXX & " WHEN '" & rstLinShi(0) & "' THEN A.ShiShouJE"


            rstLinShi.MoveNext
         Wend
         
         If Trim(strChaXunLeiX) = "发票类别" Then
            If strLeiBieXX <> "SUM(CASE ZhuYuanFPLB " Then
               strLeiBieXX = strLeiBieXX & " ELSE 0 END),"
               strXianShiZD = strXianShiZD & strLeiBieXX
            Else
               strXianShiZD = strXianShiZD & "0 YaoPinSRHJ,"
            End If
         Else
            If strLeiBieXX <> "SUM(CASE FeiYongLB " Then
               strLeiBieXX = strLeiBieXX & " ELSE 0 END),"
               strXianShiZD = strXianShiZD & strLeiBieXX
            Else
               strXianShiZD = strXianShiZD & "0 YaoPinSRHJ,"
            End If
         End If
      '医疗收入明细
      Case "YiLiaoSRMX":
      
         intHeJiJSZD = intHeJiJSZD - 1         '合计结束字段
         
         If Trim(strChaXunLeiX) = "发票类别" Then
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_ZhuYuanFaPiaoLB" & Chr(13) _
                     & "WHERE daima in (select distinct ZhuYuanFPLB from zd_ShouFeiZiDian where DaLei<>'1')" & Chr(13)
         Else
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_FeiYongLeiBie" & Chr(13) _
                     & "WHERE DaLei<>'1'" & Chr(13) _
                     & strLeiBieTJ
         End If
         Set rstLinShi = objExecuteSQL.GetRs(g_strSQL)
         While Not rstLinShi.EOF
            '
            strLieMingC = strLieMingC & Right("0000" + rstLinShi(0), 4) + "收入;"
            strLieBiaoT = strLieBiaoT & rstLinShi(1) + "收入;"
            strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
            strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
            
            If Trim(strChaXunLeiX) = "发票类别" Then
                strXianShiZD = strXianShiZD & "SUM(CASE ZhuYuanFPLB WHEN '" & rstLinShi(0) & "' THEN A.ShiShouJE ELSE 0 END),"
            Else
                strXianShiZD = strXianShiZD & "SUM(CASE FeiYongLB WHEN '" & rstLinShi(0) & "' THEN A.ShiShouJE ELSE 0 END),"
            End If
            intHeJiJSZD = intHeJiJSZD + 1         '合计结束字段
            rstLinShi.MoveNext
         Wend
         
      '医疗收入合计
      Case "YiLiaoSRHJ":
         '药品比较少，所以用非统计方式
         
         If Trim(strChaXunLeiX) = "发票类别" Then
            strLeiBieXX = "SUM(CASE ZhuYuanFPLB "
            
            g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                     & "FROM zd_ZhuYuanFaPiaoLB" & Chr(13) _
                     & "WHERE daima in (select distinct ZhuYuanFPLB from zd_ShouFeiZiDian where DaLei<>'1')" & Chr(13)
         Else
              strLeiBieXX = "SUM(CASE FeiYongLB "
                 
        
              g_strSQL = "SELECT distinct DaiMa,MingCheng" & Chr(13) _
                       & "FROM zd_FeiYongLeiBie" & Chr(13) _
                       & "WHERE DaLei<>'1'" & Chr(13) _
                       & strLeiBieTJ
         End If
         Set rstLinShi = objExecuteSQL.GetRs(g_strSQL)
         While Not rstLinShi.EOF
            '

            strLeiBieXX = strLeiBieXX & " WHEN '" & rstLinShi(0) & "' THEN  A.ShiShouJE "


            rstLinShi.MoveNext
         Wend
         
         If Trim(strChaXunLeiX) = "发票类别" Then
            If strLeiBieXX <> "SUM(CASE ZhuYuanFPLB " Then
               strLeiBieXX = strLeiBieXX & "ELSE 0 END),"
               strXianShiZD = strXianShiZD & strLeiBieXX
               strLieMingC = strLieMingC & arrLieMingC(inti) & ";"
               strLieBiaoT = strLieBiaoT & arrLieBiaoT(inti) & ";"
               strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
               strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
                Else
               strXianShiZD = strXianShiZD & "0 YiLiaoSRHJ,"
            End If

         Else
            If strLeiBieXX <> "SUM(CASE FeiYongLB " Then
               strLeiBieXX = strLeiBieXX & "ELSE 0 END),"
               strXianShiZD = strXianShiZD & strLeiBieXX
               strLieMingC = strLieMingC & arrLieMingC(inti) & ";"
               strLieBiaoT = strLieBiaoT & arrLieBiaoT(inti) & ";"
               strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
               strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
                Else
               strXianShiZD = strXianShiZD & "0 YiLiaoSRHJ,"
            End If
         End If
      Case Else
            strLieMingC = strLieMingC & arrLieMingC(inti) & ";"
            strLieBiaoT = strLieBiaoT & arrLieBiaoT(inti) & ";"
            strDuiQiFS = strDuiQiFS & arrDuiQiFS(inti) & ";"
            strLieKuanD = strLieKuanD & arrLieKuanD(inti) & ";"
            strXianShiZD = strXianShiZD & arrXianShiZD(inti) & ","
      End Select
   Next
   
   '去掉最后一个字段
   If strChuangTiMZY = "住院收入统计分析_按主要诊断" Then
        strXianShiZD = Left(strXianShiZD, Len(strXianShiZD) - 1)
   Else
        strXianShiZD = Left(strXianShiZD, Len(strXianShiZD) - 2)
   End If
   strShuJvLY = "SELECT " & strXianShiZD & " FROM " & strShuJvLY
   
   '科室;门诊挂号;急诊挂号;专家挂号;挂号收入;西药收入;中成药;中草药;药品收入合计;医疗收入合计;实收金额;实收金额比(%);
   
   '设置列标题
   lstChaXunJieGuo.SetListCaption strLieBiaoT
   '设置列宽度
   lstChaXunJieGuo.SetColumnWidth strLieKuanD
   '对齐方式
   lstChaXunJieGuo.AlignColString = strDuiQiFS
   '列名称
   lstChaXunJieGuo.ColumnName = strLieMingC
   
   '重新展开列名称
   arrLieMingC = Split(strLieMingC, ";")
   
   '重新生成数据来源
   
   '生成查询需要的SQL语句
    If strChuangTiMZY = "住院收入统计分析_按主要诊断" Then
        g_strSQL = CreateSql(strShuJvLY, strFenZuZD)
    Else
        strShuJvLY = strShuJvLY & Chr(13) _
                   & "AND A.BaiYaoBZ='是'" & Chr(13) _
                   & "AND (A.TuiKuanBZ='否' OR (A.TuiKuanBZ='是' AND A.TuiYaoBZ='否'))"
        g_strSQL = CreateSql(strShuJvLY, strFenZuZD)
   End If
   If objFormSetting.FillList(lstChaXunJieGuo, g_strSQL) = 0 Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
   End If
   
   '总行数
   lngZongHangS = lstChaXunJieGuo.getMaxRow
   
   Set colHeJi = New Collection
   colHeJi.Add "合计"
   '补空格
   For lngCol = 2 To intHeJiKSZD - 1
      colHeJi.Add ""
   Next lngCol
   '计算合计(纵向)
   For lngCol = intHeJiKSZD To intHeJiJSZD + 1
      dblHeJi = 0
      '补数
      For lngRow = 1 To lngZongHangS
         dblHeJi = dblHeJi + objConvertData.ConvertNumber(lstChaXunJieGuo.cellValue(lngRow, arrLieMingC(lngCol - 1)))
      Next lngRow
      colHeJi.Add dblHeJi
   Next lngCol
   '添加合计
   lstChaXunJieGuo.AddItem colHeJi
   
   '计算比例(针对某一列计算)
   dblZongJi = 0
   '现计算合计
   For lngRow = 1 To lngZongHangS
      dblZongJi = dblZongJi + objConvertData.ConvertNumber(lstChaXunJieGuo.cellValue(lngRow, arrLieMingC(intJiSuanBLZD - 1)))
   Next lngRow
   '计算比例
   If lngZongHangS > 0 Then
      For lngRow = 1 To lngZongHangS + 1
         lstChaXunJieGuo.cellValue(lngRow, arrLieMingC(intHeJiJSZD)) = Format(objConvertData.ConvertNumber(lstChaXunJieGuo.cellValue(lngRow, arrLieMingC(intJiSuanBLZD - 1))) / dblZongJi * 100, "##.00")
      Next lngRow
   End If
   
   '格式化数据
   Dim intJ As Integer
   For inti = 1 To lstChaXunJieGuo.getMaxRow
      For intJ = 1 To UBound(arrLieMingC)
         lstChaXunJieGuo.cellValue(inti, arrLieMingC(intJ)) = Format(lstChaXunJieGuo.cellValue(inti, arrLieMingC(intJ)), "##.00")
      Next intJ
   Next inti
   
PROC_EXIT:
   
   Exit Sub
   
PROC_ERR:
   If ERR.Number <> 0 Then
      Call ShowError(Me.name, "cmdChaXun_Click()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Sub

Private Sub cmdClose_Click()
   Unload Me
End Sub

Private Sub cmdPreview_Click()

   '传递报表参数
   If ChuanDiBBCS(Me) Then
   End If
   
   '打印预览
   objPrt.PrintPreGrid lstChaXunJieGuo, txtTongJiFXMC.Text, g_intDaYinYLDZT, False
   
End Sub

Private Sub cmdPrint_Click()

   '传递报表参数
   If ChuanDiBBCS(Me) Then
   End If
   
   '打印预览
   objPrt.PrintPreGrid lstChaXunJieGuo, txtTongJiFXMC.Text, 2, False
   
End Sub

Private Sub cmdQingKongTJ_Click()
   
   Dim strTongJiMC As String   '统计分析名称
   
   '保留参数
   strTongJiMC = txtTongJiFXMC.Text
   
   '清空条件
   Call objFormSetting.InitFormData(Me)
   
   '还原参数
   txtTongJiFXMC.Text = strTongJiMC
End Sub

Private Sub Form_Activate()

   '把焦点移至第一个控件
   Call objFormSetting.DiYiGKJ(Me)
   
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)
   
End Sub

Private Sub Form_Load()


   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： xuzhaolin
   '* 修 改 人：
   '* 修改日期：
   
   '自动创建窗体信息
   Call objFormSetting.CreateFormInfo(Me)
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 13770
   Const c_formHeight = 9000

   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
      GoTo PROC_EXIT
   End If
   
   '装载科室
   g_strTiaoJian = "LeiBie='住院就诊'"
   If LoadKeShi(cboKeShi, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   
   '装载核算科室
   g_strTiaoJian = ""
   If LoadKeShi(cboHeSuanKS, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
    '装载患者姓名
    Dim rstZhuZai As ADODB.Recordset
   g_strSQL = "SELECT " & Chr(13) _
          & "        /*拼音码,患者姓名*/" & Chr(13) _
          & "        PinYinM,HuanZheXM" & Chr(13) _
          & "FROM yw_ZhuYuanLiuShui"
    Set rstZhuZai = objExecuteSQL.GetRs(g_strSQL)
          
  If Not rstZhuZai.EOF Then
   If objFormSetting.LoadcboData(cboHuanZheXM, RecordData, g_strSQL) = True Then
   End If
   End If
   Set rstZhuZai = Nothing
   
     '装载病例号
   g_strSQL = "SELECT " & Chr(13) _
          & "        /*病例号,患者姓名*/" & Chr(13) _
          & "        BingLiH,HuanZheXM" & Chr(13) _
          & "FROM yw_ZhuYuanLiuShui"
    Set rstZhuZai = objExecuteSQL.GetRs(g_strSQL)
          
  If Not rstZhuZai.EOF Then
   If objFormSetting.LoadcboData(cboBingLiH, RecordData, g_strSQL) = True Then
   End If
   End If
   Set rstZhuZai = Nothing
   
   
   
  '给各个控件赋缺省值
   If objFormSetting.InitFormData(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
      GoTo PROC_EXIT
   End If
   Dim strKaiShiRQ As String
   Dim strRiQi As String
   strRiQi = objStandData.getSystemDate(Date)
   strKaiShiRQ = strRiQi + " 00:00:00"
   dtmKaiShiRQ.SetDate strKaiShiRQ
   
PROC_EXIT:
   Exit Sub

End Sub

Private Function CreateSql(strShuJvLY As String, strFenZuZD As String) As String

   '* 功    能： 创建查询条件的SQL语句
   '* 参    数：
   '* 返 回 值： 生成的SQL语句
   '* 创 建 人： WangLiGuo
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR
   
   Dim colSearch As Collection   '集合(查询)
   
   '加入查询条件
   g_strTiaoJian = ""
    If strChuangTiMZY = "住院收入统计分析_按主要诊断" Then
    
'        '开始日期
'        If Not dtmKaiShiRQ.IsNull Then
'           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.RuYuanRQ>='" & dtmKaiShiRQ.GetDate & "'"
'        End If
'        '结束日期
'        If Not dtmJieShuRQ.IsNull Then
'           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.RuYuanRQ<'" & dtmJieShuRQ.GetDate & "'"
'        End If
        
         '入院科室
        If cboKeShi.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.RuYuanKS='" & cboKeShi.Value & "'"
        End If
'        '就诊医生
        
        If cboJiuZhenYS.Text <> "" Then
            g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.JieZhenYS='" & cboJiuZhenYS.Value & "'"
        End If
         '患者姓名
        If cboHuanZheXM.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.HuanZheXM='" & cboHuanZheXM.Text & "'"
        End If
          '病例号
        If cboBingLiH.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND A.BingLiH='" & cboBingLiH.Text & "'"
        End If
    Else
        '开始日期
'        If Not dtmKaiShiRQ.IsNull Then
'           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
'        End If
'        '结束日期
'        If Not dtmJieShuRQ.IsNull Then
'           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
'        End If
   
        '科室
        If cboKeShi.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KeShi='" & cboKeShi.Value & "'"
        End If
        '核算科室
        If cboHeSuanKS.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HeSuanKS='" & cboHeSuanKS.Value & "'"
        End If
         '患者姓名
        If cboHuanZheXM.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HuanZheXM='" & cboHuanZheXM.Value & "'"
        End If
          '病例号
        If cboBingLiH.Value <> "" Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND BingLiH='" & cboBingLiH.Value & "'"
        End If
    End If
   '是否出院
'   If ChkBZ.Value = vbChecked Then
'      g_strTiaoJian = g_strTiaoJian & Chr(13) & " AND ZhuangTai='7' "
'   End If
    If cboZhuangTai.Value = "在院" Then
        g_strTiaoJian = g_strTiaoJian & Chr(13) & " AND ZhuangTai NOT IN('7','4') "
         '开始日期
        If Not dtmKaiShiRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
        End If
        '结束日期
        If Not dtmJieShuRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
        End If
    ElseIf cboZhuangTai.Value = "住院处出院" Then
        g_strTiaoJian = g_strTiaoJian & Chr(13) & " AND ZhuangTai='7' "
          '开始日期
        If Not dtmKaiShiRQCY.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ChuYuanSJ>='" & dtmKaiShiRQCY.GetDate & "'"
        End If
        '结束日期
        If Not dtmJieShuRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ChuYuanSJ<='" & dtmJieShuRQZY.GetDate & "'"
        End If
        If strMsgZT = "1" Then
            If Not dtmKaiShiRQ.IsNull Then
               g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
            End If
            '结束日期
            If Not dtmJieShuRQ.IsNull Then
               g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
            End If
        End If
    ElseIf cboZhuangTai.Value = "护士站出院" Then
        g_strTiaoJian = g_strTiaoJian & Chr(13) & " AND ZhuangTai='4' "
        If Not dtmKaiShiRQCY.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ChuYuanSJ>='" & dtmKaiShiRQCY.GetDate & "'"
        End If
        '结束日期
        If Not dtmJieShuRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ChuYuanSJ<='" & dtmJieShuRQZY.GetDate & "'"
        End If
        If strMsgZT = "1" Then
            If Not dtmKaiShiRQ.IsNull Then
               g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
            End If
            '结束日期
            If Not dtmJieShuRQ.IsNull Then
               g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
            End If
        End If
    Else
        g_strTiaoJian = g_strTiaoJian & Chr(13) & " AND 1=1 "
        
         '开始日期
        If Not dtmKaiShiRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiSJ>='" & dtmKaiShiRQ.GetDate & "'"
        End If
        '结束日期
        If Not dtmJieShuRQ.IsNull Then
           g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuSJ<'" & DateAdd("n", 1, dtmJieShuRQ.GetDate) & "'"
        End If
    End If
    
   
   If strChuangTiMZY = "住院收入统计分析_按主要诊断" Then
        If cboZhuYaoZD.Text <> "" Then
            g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ZhuYaoZhenD='" & cboZhuYaoZD.Text & "'"
        End If
        
        If txtHuanZheZZ.Text <> "" Then
            g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HuKouDZ like '%" & txtHuanZheZZ.Text & "%'"
        End If
    End If
                  
   '转化标准SQL语句
   CreateSql = strShuJvLY & Chr(13) _
             & g_strTiaoJian & Chr(13) _
             & "GROUP BY " & strFenZuZD
   
PROC_EXIT:
   Exit Function
PROC_ERR:
   If ERR.Number <> 0 Then
      CreateSql = ""
      Call ShowError(Me.name, "CreateSql()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

Private Sub ReSize1_PreResize(ControlName As String, ControlType As String, NewTop As Single, NewLeft As Single, NewHeight As Single, NewWidth As Single, NewFontSize As Single, IgnoreControl As Boolean, ByVal CurrentControl As Object)
    ReSize1.AutoCenterFormOnLoad = True
End Sub
