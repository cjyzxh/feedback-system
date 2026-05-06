VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.2#0"; "HISControl1.ocx"
Object = "{F6B9D3BC-3953-4A68-AD1A-BD05206D76A9}#1.0#0"; "CjyButton.ocx"
Begin VB.Form frmXiTongDengLu 
   BorderStyle     =   0  'None
   Caption         =   "系统登录"
   ClientHeight    =   5220
   ClientLeft      =   3450
   ClientTop       =   1710
   ClientWidth     =   7650
   FillStyle       =   0  'Solid
   Icon            =   "frmXiTongDengLu.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5220
   ScaleWidth      =   7650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin UserControl.txt txtMiMa 
      Height          =   225
      Left            =   3960
      TabIndex        =   12
      Top             =   4080
      Width           =   1605
      _ExtentX        =   2831
      _ExtentY        =   397
      CaptionWidth    =   0
      Hwnd            =   1377894
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PasswordChar    =   "*"
   End
   Begin 黑马按钮控件.dcButton cmdTuiChu 
      Height          =   375
      Left            =   6045
      TabIndex        =   4
      Top             =   4455
      Width           =   1035
      _ExtentX        =   1826
      _ExtentY        =   661
      BackColor       =   1228031
      ButtonStyle     =   11
      Caption         =   "退  出"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   16711680
   End
   Begin 黑马按钮控件.dcButton cmdDengLu 
      Height          =   375
      Left            =   6045
      TabIndex        =   0
      Top             =   3780
      Width           =   1035
      _ExtentX        =   1826
      _ExtentY        =   661
      BackColor       =   1228031
      ButtonStyle     =   11
      Caption         =   "登  录"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   16711680
   End
   Begin UserControl.rsz rsz 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin UserControl.cbo cboDengLuKS 
      Height          =   225
      Left            =   3825
      TabIndex        =   2
      Top             =   4620
      Width           =   1770
      _ExtentX        =   3122
      _ExtentY        =   397
      ListWidth       =   2350
      CaptionWidth    =   0
      BackColor       =   -2147483633
      ListHeight      =   1815
      ListVertical    =   1
      ListText        =   ""
   End
   Begin UserControl.cbo cboYongHuM 
      Height          =   225
      Left            =   3825
      TabIndex        =   1
      Top             =   3690
      Width           =   1770
      _ExtentX        =   3122
      _ExtentY        =   397
      ListWidth       =   2350
      CaptionWidth    =   0
      BackColor       =   -2147483633
      ListHeight      =   1815
      ListVertical    =   1
      ListText        =   ""
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "科  室"
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
      Index           =   0
      Left            =   3300
      TabIndex        =   11
      Top             =   4920
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "科  室"
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
      Index           =   1
      Left            =   2130
      TabIndex        =   10
      Top             =   4920
      Visible         =   0   'False
      Width           =   690
   End
   Begin VB.Label lblyiyuanmc 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   240
      Left            =   360
      TabIndex        =   9
      Top             =   840
      Width           =   810
   End
   Begin VB.Label LblBanBen 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00E0E0E0&
      Height          =   210
      Left            =   6000
      TabIndex        =   8
      Top             =   2460
      Width           =   720
   End
   Begin VB.Label Label44 
      BackStyle       =   0  'Transparent
      Caption         =   "科  室"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C75B41&
      Height          =   240
      Left            =   3060
      TabIndex        =   7
      Top             =   4650
      Width           =   720
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "密  码"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C75B41&
      Height          =   240
      Left            =   3060
      TabIndex        =   6
      Top             =   4185
      Width           =   720
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "用户名"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C75B41&
      Height          =   240
      Left            =   3060
      TabIndex        =   5
      Top             =   3720
      Width           =   720
   End
   Begin VB.Label LblXiTongMC 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "黑体"
         Size            =   36
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   990
      Left            =   0
      TabIndex        =   3
      Top             =   1380
      Width           =   7350
   End
   Begin VB.Image Image1 
      Height          =   5250
      Left            =   -15
      Picture         =   "frmXiTongDengLu.frx":08CA
      Top             =   0
      Width           =   7650
   End
End
Attribute VB_Name = "frmXiTongDengLu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim m_strXiTongDLFS         As String
Dim m_strJiaZaiYHTJ         As String     '加载用户条件
'lrz 同步打开一个程序-------

Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long

Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long


Private Const SYNCHRONIZE = &H100000

Private Const INFINITE = &HFFFF   ' Infinite timeout
Private Const WAIT_TIMEOUT = &H102&

Private Declare Function GetSystemMenu Lib "user32" (ByVal hWnd As Long, ByVal bRevert As Long) As Long    '获得当前窗口的系统菜单

Private Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long) As Long    '置灰

Private Const MF_REMOVE = &H1000&
Private Const SC_COLSE = &HF060
'---------
Private Sub cboDengLuKS_KeyPress(KeyAscii As Integer)
   
   '回车移焦点
   If KeyAscii = vbKeyReturn Then
      cmdDengLu.SetFocus
   End If

End Sub

Private Sub cboDengLuKS_LostFocus()

   Dim rstKeShi As ADODB.Recordset   '科室
   
   If cboDengLuKS.Value <> "" Then
      g_strKeShiDM = cboDengLuKS.Value
      g_strKeShiMC = cboDengLuKS.cellValue(3)
      '提取科室类别
      g_strSql = "SELECT LeiBie" & Chr(13) _
               & "FROM zd_KeShi" & Chr(13) _
               & "WHERE DaiMa='" & cboDengLuKS.Value & "'"
      Set rstKeShi = objExecuteSQL.GetRs(g_strSql)
      g_strKeShiLB = rstKeShi("LeiBie")
      cmdDengLu.Enabled = True
   Else
      cmdDengLu.Enabled = False
   End If
   
End Sub

Private Sub cboYongHuM_GotFocus()
    cboYongHuM.nextFocus = False
End Sub

Private Sub cboYongHuM_LostFocus()

   Dim rstKeShi As ADODB.Recordset    '科室代码
   Dim strKeShiLB As String           '根据系统模块确定默认科室类别
   
   
   If cboYongHuM.Value = "" Then
      GoTo PROC_EXIT
   End If
   
   '
   Select Case App.Title
   Case "门诊管理"
      strKeShiLB = "'门诊挂号','门诊收费'"
   Case "门诊药房"
      strKeShiLB = "'药房'"
   Case "病区药房"
      strKeShiLB = "'药房'"
   Case "药库管理"
      strKeShiLB = "'药库'"
   Case "综合药房"
      strKeShiLB = "'药房'"
   Case "单独药房管理"
      strKeShiLB = "'药房'"
   Case "药品管理"
      strKeShiLB = "'药库','药房'"
   Case "住院管理"
      strKeShiLB = "'住院处'"
   Case "住院护士站", "住院医生站"
      strKeShiLB = "'住院就诊'"
   Case "门诊医生"
      strKeShiLB = "'门诊就诊'"
   Case "耗材管理"
      strKeShiLB = "'耗材'"
   Case "手术室"
      strKeShiLB = "'手术室'"
   Case "门诊护士", "住院护士"
      strKeShiLB = "'门诊护士','住院护士'"
   Case Else
      strKeShiLB = ""
   End Select


   '装载科室
   cboDengLuKS.LoadOver = False
   cboDengLuKS.Text = ""
   
   If strKeShiLB <> "" Then
      g_strTiaoJian = "LeiBie in (" & strKeShiLB & ")" & Chr(13) _
                    & "AND DaiMa in (SELECT DengLuKS FROM zd_YongHu_DengLuKS WHERE YongHuDM='" & cboYongHuM.Value & "')"
   Else
      g_strTiaoJian = "DaiMa in (SELECT DengLuKS FROM zd_YongHu_DengLuKS WHERE YongHuDM='" & cboYongHuM.Value & "')"
   End If
   If LoadKeShi(cboDengLuKS, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   If strKeShiLB <> "" Then
        'lz2016-04-18 过滤停用科室
      g_strSql = "SELECT DaiMa" & Chr(13) _
               & "FROM zd_KeShi" & Chr(13) _
               & "WHERE ISNULL(TingYongBZ,'否') = '否' and LeiBie in (" & strKeShiLB & ")" & Chr(13) _
               & "AND DaiMa in (SELECT DengLuKS FROM zd_YongHu_DengLuKS WHERE YongHuDM='" & cboYongHuM.Value & "')"
      Set rstKeShi = objExecuteSQL.GetRs(g_strSql)
      '如果存在药库，默认药库
      If Not rstKeShi.EOF Then
         cboDengLuKS.InitValue rstKeShi("DaiMa")
      End If
   End If
   
   '没有科室取默认第一个登录科室
   If cboDengLuKS.Value = "" Then
      cboDengLuKS.InitValue cboDengLuKS.cellValue(1, 1)
   End If
   
   If cboDengLuKS.Value <> "" Then
      g_strKeShiDM = cboDengLuKS.Value
      g_strKeShiMC = cboDengLuKS.cellValue(3)
      '提取科室类别
      g_strSql = "SELECT LeiBie" & Chr(13) _
               & "FROM zd_KeShi" & Chr(13) _
               & "WHERE DaiMa='" & cboDengLuKS.Value & "'"
      Set rstKeShi = objExecuteSQL.GetRs(g_strSql)
      g_strKeShiLB = rstKeShi("LeiBie")
      cmdDengLu.Enabled = True
   Else
      cmdDengLu.Enabled = False
   End If
   
   
PROC_EXIT:
   Exit Sub
   
End Sub

Private Sub cmdDengLu_Click()

   '* 功    能： 登陆系统
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
   Dim rstYongHu As ADODB.Recordset
   Dim strMiMa As String      '密码
   Dim blnUnload As Boolean           '是否可以卸载登陆窗体
   
   Set rstYongHu = Nothing
   Set rstYongHu = New ADODB.Recordset
   g_strSql = "SELECT MiMa,KeShi,LeiBie" & Chr(13) _
               & "FROM zd_YongHu WHERE DaiMa= '" & cboYongHuM.Value & "'"
   Set rstYongHu = GetRs(g_strSql)

   blnUnload = False
   '判断用户名是否为空
   If Trim(cboYongHuM.Value = "") Then
      MsgBox "没有输入用户,请输入用户名！", vbOKOnly + vbExclamation, "警告"
      cboYongHuM.SetFocus
   '检查密码是否输入真确
   Else
      strMiMa = Trim(rstYongHu("MiMa"))
      g_strYongHuKSDM = rstYongHu("KeShi")
      '如果是超级用户，加日期
      If cboYongHuM.Value = "0" Then
         strMiMa = strMiMa & Format(objStandData.getSystemDate(), "MMDD")
      End If
      If strMiMa = (txtMiMa.Text) Then
         g_strYongHuLB = rstYongHu("LeiBie")              'lyc 获得用户类别
         rstYongHu.Close
         Me.Hide
         txtMiMa.Text = ""
         g_strYongHuDM = cboYongHuM.Value
         g_strYongHuMC = cboYongHuM.Text
         g_strYongHuKSMC = cboDengLuKS.Text
         frmZhuChuangTi.Show
         blnUnload = True
         '传递公用变量到封装的公用函数
         If objStandData.setGongYongBL(g_strYongHuDM, g_strKeShiDM) Then
         End If
         '提取打印预览的状态
         g_intDaYinYLDZT = getXiTongCS(g_eXiTongCS.DaYinYLDZT)
         
         If g_intDaYinYLDZT = 4 Then
            g_intDaYinYLDZT = CInt(Val(GetIniSet("打印模式")))
         End If
         
         '程序类别(含药品、耗材、物资、供应室)
         Select Case App.Title
         Case "耗材管理"
            g_strChengXuLB = "耗材"
            g_strDaLei = "3"
         Case "物资管理"
            g_strChengXuLB = "物资"
            g_strDaLei = "3"
         Case "供应室管理"
            g_strChengXuLB = "耗材"
            g_strDaLei = "3"
         Case Else
            g_strChengXuLB = "药品"
            g_strDaLei = "1"
         End Select
         
         '设置普通报表为默认打印机
         If GetPrinter("PuTongBBDYJ") <> "" Then
            SetDefaultPrinter GetPrinter("PuTongBBDYJ")
         End If
      Else
         MsgBox "输入密码不正确，请重新输入！", vbOKOnly + vbExclamation, "警告"
         txtMiMa.SetFocus
         txtMiMa.Text = ""
         Exit Sub
      End If
   End If

   bfrmXiTongDengLu = True
   '若可以卸载 即执行  不然关闭主窗体时进程不终止ky
   If blnUnload = True Then
      Unload Me
   End If
End Sub

Private Sub cmdDengLu_LostFocus()
'   txtMiMa.SetFocus
End Sub

Private Sub cmdTuiChu_Click()
   '结束进程
   Unload Me
   'End
End Sub




Private Sub Form_Load()
bfrmXiTongDengLu = False

'* 功    能： 初始化窗体
'* 参    数：
'* 返 回 值：
'* 创 建 人： huguolin
'* 修 改 人：
'* 修改日期：
    Dim m_bLogined As Boolean

    Dim strRenYuanLB As String   '根据系统模块确定能够进入系统的人员
    Dim strDengLuKS As String    '登录科室
    Dim strYingPanID As String
    '   Dim objBeiJing As New clsBeiJingYB

    m_strXiTongDLFS = getXiTongCS(g_eXiTongCS.XiTongDLFS)

    If getXiTongCS(g_eXiTongCS.XiaLaKZDXL) = "2" Then
        cboYongHuM.AutoList = False
        cboDengLuKS.AutoList = False
    End If

    '模块
    LblXiTongMC.Caption = App.Title
    Select Case App.Title
    Case "门诊管理"
        strRenYuanLB = "'接诊员','收费员'"
    Case "门诊药房"
        strRenYuanLB = "'药房'"
    Case "病区药房"
        strRenYuanLB = "'药房'"
    Case "药库管理"
        strRenYuanLB = "'药库'"
    Case "单独药房管理"
        strRenYuanLB = "'药房'"
    Case "药品管理"
        strRenYuanLB = "'药库','药房'"
    Case "住院管理"
        strRenYuanLB = "'收费员'"
    Case "住院护士站"
        strRenYuanLB = "'护士'"
    Case "住院医生站"
        strRenYuanLB = "'医生'"
    Case "耗材管理"
        strRenYuanLB = "'耗材'"
    Case Else
        strRenYuanLB = "'系统管理员','接诊员','收费员','药库','药房','医生','护士'"
    End Select

    '   自动创建窗体信息
    '   Call objFormSetting.CreateFormInfo(Me)

    '设置窗体居中(Call objFormSetting.InitFormPosition)
    Const c_formWidth = 7650
    Const c_formHeight = 5220
    Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

    LblXiTongMC.Width = Image1.Width
    LblXiTongMC.Left = Image1.Left

    cboYongHuM.ColumnCaptions = "代码;拼音码;名称;"
    cboYongHuM.ColWidths = "700;0;1300;"

    cboDengLuKS.ColumnCaptions = "代码;拼音码;名称;"
    cboDengLuKS.ColWidths = "700;0;1300;"

    '初始化窗体属性
    '   If objFormSetting.InitFormProperty(Me) = False Then
    '      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
    '      GoTo PROC_EXIT
    '   End If


    '装载用户
    '只有本系统权限的人员方可进入
    g_strTiaoJian = "(DaiMa in (SELECT A.YongHuDM FROM zd_QuanXian A,zd_XiTongMoKuai B WHERE A.MoKuaiDM=B.MoKuaiDM AND B.MoKuaiMC='" & App.Title & "'))"
    '限制是否可以使用内置用户
    If getXiTongCS(0) = "否" Then
        g_strTiaoJian = g_strTiaoJian & Chr(13) _
                      & "AND DaiMa<>'0'"
    End If

    '装载选中科室
    strDengLuKS = GetSetting("CjySoftDengLuKS", App.Title, "DengLuKS")

    '登录科室
    If strDengLuKS <> "''" And strDengLuKS <> "" Then
        g_strTiaoJian = g_strTiaoJian & "AND (DaiMa in (SELECT YongHuDM FROM zd_YongHu_DengLuKS WHERE DengLuKS in (" & strDengLuKS & ")))"
    End If

    '记录加载用户条件
    m_strJiaZaiYHTJ = g_strTiaoJian

    If m_strXiTongDLFS = "2" Then

    Else
        If LoadYongHu(cboYongHuM, g_strTiaoJian) = False Then
            g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
            GoTo PROC_EXIT
        End If

        '代码;拼音码;名称;
        '        g_strSQL = ""
        '
        '        If objFormSetting.LoadcboData(cboYongHuM, RecordData, g_strSQL) = False Then
        '           g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
        '           GoTo PROC_EXIT
        '        End If

    End If

    '给各个控件赋缺省值
    '   If objFormSetting.InitFormData(Me) = False Then
    '      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
    '      GoTo PROC_EXIT
    '   End If

    cboYongHuM.BackColor = &HFFFFFF
    txtMiMa.BackColor = &HFFFFFF
    cboDengLuKS.BackColor = &HFFFFFF

    If (ReplaceChar(g_strCenterName) = "北京市崇文区红十字会国龙医院" _
        Or ReplaceChar(g_strCenterName) = "京城皮肤病医院" _
        Or ReplaceChar(g_strCenterName) = "北京市崇文区红十字会华都中医医院" _
        Or ReplaceChar(g_strCenterName) = "北京市崇文区红十字会东华医院" _
        Or ReplaceChar(g_strCenterName) = "万和颈椎病医院") _
        Or ProBeiJingYBBZ = True Then
        LblBanBen.Caption = "当前版本:V5.0"
    Else
        LblBanBen.Caption = "当前版本:" & App.Major & "." & App.Minor & "." & App.Revision
    End If
    txtMiMa.Text = ""
    '加载一个当前医院名称便于公司测试人员查看 BY ZXH 2010-12-06
    lblyiyuanmc.Caption = "授权用户：" & g_strCenterName
    'lrz 11-12-30
    If bVB Then
        m_bLogined = True
    Else
        If AutodownStyle() Then
            m_bLogined = AutoDownSetup
        Else
            m_bLogined = AutoDownFile
        End If
    End If
    If DateDiff("d", Now, objStandData.getSystemDate(DateTime)) <> 0 Then
      MsgBox "本地时间跟服务器时间[" & objStandData.getSystemDate(DateTime) & "]不相等，请设置好本地时间！"
      End
    End If
    If g_strCenterName = "牡丹江市肛肠医院" Then
        Image1.Picture = LoadPicture("")
        LblXiTongMC.ForeColor = vbBlack
        lblyiyuanmc.ForeColor = vbBlack
        LblBanBen.ForeColor = vbBlack
    End If
    
    If m_bLogined = False Then
        Unload Me
    End If
PROC_EXIT:
    Exit Sub

End Sub

Private Sub Form_Activate()
   
   '把焦点移至第一个控件
   Call objFormSetting.DiYiGKJ(Me)
   
 
 
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)

End Sub


Private Sub Form_Unload(Cancel As Integer)
   Unload Me
End Sub




 

Private Sub txtMiMa_KeyPress(KeyAscii As Integer)
   
   '回车移焦点
   If KeyAscii = vbKeyReturn Then
      If cboDengLuKS.Text <> "" Then
         Call cmdDengLu_Click
      Else
         cboDengLuKS.SetFocus
      End If
   End If
   
End Sub
Private Sub cboYongHuM_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = vbKeyReturn Then
        If KeyAscii = 8 Then
          cboYongHuM.nextFocus = False
        End If
              
        If m_strXiTongDLFS = "2" Then
            If cboYongHuM.nextFocus = False Then
                cboYongHuM.LoadOver = False
                cboYongHuM.ClearData
                
                If LoadYongHu(cboYongHuM, m_strJiaZaiYHTJ & " and daima='" & Trim(cboYongHuM.Text) & "'") = False Then
                   g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
                Else
                    cboYongHuM.nextFocus = True
                End If
            Else
                txtMiMa.SetFocus
                txtMiMa.Text = ""
            End If
        Else
               '回车移焦点
             If KeyAscii = vbKeyReturn Then
                   txtMiMa.SetFocus
            End If
        End If
      
      
   End If

End Sub

'lrz 11-12-30
Public Function FunDBToFile(ByVal strFileName As String, rsRead As ADODB.Recordset, ByVal strField As String) As Boolean
'    On Error Resume Next
    Dim lTotalSize As Long
    Dim Offset As Long
    Dim ChunkSize As Long
    Dim TheBytes() As Byte
    FunDBToFile = True
    If strFileName = "" Or strField = "" Or rsRead.State = 0 Then
        FunDBToFile = False
        Exit Function
    End If
    On Error GoTo m_eRr
    If Dir(strFileName) <> "" Then Kill strFileName
    ChunkSize = 1000
    lTotalSize = rsRead(strField).ActualSize
     Label4(0).Visible = True
    Label4(0).Caption = "正在下载最新的安装包[V" & Val(rsRead!Ver) & "],请稍候......"
  '  Label4(0).Caption = getResource("10378-1") & Val(rsRead!Ver) & getResource("10221-2")
    Label4(0).Caption = " / " & Round(lTotalSize / 1024, 2) & "(KB)" & Label4(0).Caption
    If ChunkSize > lTotalSize Then ChunkSize = lTotalSize
    If ChunkSize = 0 Then Exit Function
    ReDim TheBytes(0 To ChunkSize - 1)
    Offset = 0
    Open strFileName For Binary Access Write As #1       'get source file len
    Do While Offset < lTotalSize
        If Offset + ChunkSize > lTotalSize Then
            ChunkSize = lTotalSize - Offset
            ReDim TheBytes(0 To ChunkSize - 1)
            TheBytes = rsRead(strField).GetChunk(ChunkSize)
            Put #1, , TheBytes
        Else
            TheBytes = rsRead(strField).GetChunk(ChunkSize)
            Put #1, , TheBytes
        End If
        Offset = Offset + ChunkSize
        Label4(1).Visible = True
        Label4(1).Caption = Round(Offset / 1024, 2)    '& "/" & Round(lTotalSize / 1024, 2) & ",正在下载最新的安装包,请稍候......"
        DoEvents
    Loop
    Close #1
    Label4(0).Visible = True
    Label4(1).Visible = False
    Label4(0).Caption = "下载完成！正在打开安装包......"
    Exit Function
m_eRr:
    FunDBToFile = False
    Close #1
End Function



'lrz 10-10-8下载安装包
Private Function AutoDownSetup(Optional ForceCheck As Boolean = False) As Boolean
    On Error GoTo ErrHandle001
    AutoDownSetup = False
    Dim Rsttemp As New ADODB.Recordset, ssetupFile As String, sFilePath As String
    Dim KeyValue As String, KeyValue1 As String
    Dim i As Integer, str1 As String, Str2 As String
   
    Set Rsttemp = objExecuteSQL.GetRs(("select Ver from xt_ShangChuan with (nolock) where (LoginType='" & 0 & "' or LoginType='300') and  sFielName='setup.exe' order by Ver desc "))
    If Rsttemp.EOF Then
        AutoDownSetup = True
        Exit Function
    End If
    KeyValue = Val(Rsttemp!Ver)
    AutoDownSetup = True
    '--------安装包
    If Val(App.Major & "." & App.Minor & App.Revision) < Val(KeyValue) Then
     
        Label4(0).Visible = True
    Label4(0).Caption = "正在下载最新的安装包[V" & Val(KeyValue) & "],请稍候......"
     
        DoEvents
        Set Rsttemp = objExecuteSQL.GetRs(("select * from xt_ShangChuan with (nolock) where (LoginType='" & 0 & "' or LoginType='300') and  sFielName='setup.exe'  order by Ver desc "))
        ssetupFile = NullToStr(Rsttemp!filepath, "C:\CJYSoftSetup\setup.exe")
        If ssetupFile = "" Then
            ssetupFile = "C:\CJYSoftSetup\setup.exe"
        End If
        cmdDengLu.Enabled = False
        cmdTuiChu.Enabled = False
        sFilePath = Mid(ssetupFile, 1, InStrRev(ssetupFile, "\"))
        If Dir(sFilePath, vbDirectory) = "" Then MkDir sFilePath
        If Dir(ssetupFile) <> "" Then Kill ssetupFile
        OpenReadme Rsttemp, sFilePath
        FunDBToFile ssetupFile, Rsttemp, "SetupFile"
        Call Shell(ssetupFile, vbNormalFocus)
        Unload Me
        cmdDengLu.Enabled = True
        cmdTuiChu.Enabled = True
        AutoDownSetup = False
        Exit Function
    End If
    '
    Exit Function
ErrHandle001:
    cmdDengLu.Enabled = True
    cmdTuiChu.Enabled = True
    Label4(0).Visible = False
    Label4(1).Visible = False
End Function

'lrz 11-12-30
Private Sub OpenReadme(Rsttemp As ADODB.Recordset, sFile As String)
    On Error GoTo ErrHandle001
    sFile = sFile + "readme.docx"
    If Rsttemp.Fields("cMemoFile").ActualSize = 0 Then
        If NullToStr(Rsttemp.Fields("cMemo")) <> "" Then
            MsgBox Rsttemp.Fields("cMemo")
            Exit Sub
        End If
    End If
    If Dir(sFile) <> "" Then Kill sFile
    FunDBToFile sFile, Rsttemp, "cMemoFile"
    Dim i As Long
    i = ShellExecute(Me.hWnd, "open", sFile, vbNullString, vbNullString, 1)
ErrHandle001:

End Sub


'lrz 10-11-8下载安装包
Private Function AutoDownFile() As Boolean
    On Error GoTo ErrHandle001
    AutoDownFile = False
    Dim Rsttemp As New ADODB.Recordset, ssetupFile As String, sFilePath As String
    Dim KeyValue As String, KeyValue1 As String
    Dim i As Integer, str1 As String, Str2 As String
     
     If Dir("c:\CJYAppAutoDown.exe") <> "" Then
        Kill App.Path & "\CJYAppAutoDown.exe "
        FileCopy "c:\CJYAppAutoDown.exe", App.Path & "\CJYAppAutoDown.exe "
       Kill "c:\CJYAppAutoDown.exe"
    End If
    If Dir(App.Path & "\CJYAppAutoDown.exe ") = "" Then
     MsgBox "没有更新程序[CJYAppAutoDown.exe]！请于系统维护员联系！"
       
        GoTo ErrHandle001
    End If
    Call ShellForWait(App.Path & "\CJYAppAutoDown.exe " & objExecuteSQL.GetDBConnection.ConnectionString, vbHide, &HFFFF)

    AutoDownFile = True
    Exit Function
ErrHandle001:
    cmdDengLu.Enabled = False
End Function
'lrz 11-12-30
Private Function ShellForWait(sAppName As String, Optional ByVal lShowWindow As VbAppWinStyle = vbMinimizedFocus, Optional ByVal lWaitTime As Long = 0) As Boolean
    Dim lID As Long, lHnd As Long, lRet As Long
    On Error Resume Next
    lID = Shell(sAppName, lShowWindow)
    If lID > 0 Then
        lHnd = OpenProcess(SYNCHRONIZE, 0, lID)
        If lHnd <> 0 Then
            Do
                lRet = WaitForSingleObject(lHnd, lWaitTime)
                DoEvents

            Loop While lRet = WAIT_TIMEOUT

            CloseHandle lHnd

            ShellForWait = True

        Else

            ShellForWait = False

        End If

    Else

        ShellForWait = False

    End If

End Function


