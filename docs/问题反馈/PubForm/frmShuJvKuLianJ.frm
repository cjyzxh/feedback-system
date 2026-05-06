VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.1#0"; "HISControl1.ocx"
Begin VB.Form frmShuJvKuLianJ 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "数据库连接"
   ClientHeight    =   5040
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5130
   Icon            =   "frmShuJvKuLianJ.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5040
   ScaleWidth      =   5130
   StartUpPosition =   1  '所有者中心
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   15
      Top             =   0
      Width           =   4995
      _ExtentX        =   8811
      _ExtentY        =   714
      Caption         =   "数据库连接"
   End
   Begin VB.OptionButton OptWenJian 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "读配置文件"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   960
      TabIndex        =   4
      Top             =   840
      Value           =   -1  'True
      Width           =   1425
   End
   Begin VB.OptionButton OptZhuCeB 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "读注册表"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   2460
      TabIndex        =   3
      Top             =   840
      Width           =   1185
   End
   Begin VB.CheckBox chkZiDongGX 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "升级数据库"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Top             =   3780
      Width           =   1425
   End
   Begin VB.CheckBox ChkWenJianLJ 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "启用文件路径"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   1747
      TabIndex        =   1
      Top             =   3780
      Width           =   1560
   End
   Begin VB.CheckBox ChkCaiZheng 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "启用财政接口"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   3360
      TabIndex        =   0
      Top             =   3780
      Width           =   1680
   End
   Begin UserControl.cmd cmdWriteIni 
      Height          =   375
      Left            =   0
      TabIndex        =   5
      Top             =   5100
      Visible         =   0   'False
      Width           =   1140
      _ExtentX        =   2011
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "写配置"
      Icn             =   "frmShuJvKuLianJ.frx":08CA
   End
   Begin MSComDlg.CommonDialog cdg 
      Left            =   4230
      Top             =   900
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin UserControl.cmd cmdTuiChu 
      Height          =   495
      Left            =   2550
      TabIndex        =   6
      Top             =   4260
      Width           =   1260
      _ExtentX        =   2223
      _ExtentY        =   873
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退出(&B)"
      Icn             =   "frmShuJvKuLianJ.frx":2A04
      Icon            =   4
   End
   Begin UserControl.cmd cmdQueDing 
      Height          =   495
      Left            =   1260
      TabIndex        =   7
      Top             =   4260
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   873
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "确定(&O)"
      Icn             =   "frmShuJvKuLianJ.frx":2F9E
      Icon            =   8
   End
   Begin UserControl.txt txtDengLuMM 
      Height          =   225
      Left            =   480
      TabIndex        =   8
      Top             =   3045
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   397
      Caption         =   "登陆密码"
      CaptionWidth    =   840
      Hwnd            =   2491656
      AllowNull       =   "是"
      AllowNull       =   "是"
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
      PasswordChar    =   "*"
   End
   Begin UserControl.txt txtDengLuM 
      Height          =   225
      Left            =   480
      TabIndex        =   9
      Top             =   2445
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   397
      Caption         =   "DB用户名"
      CaptionWidth    =   840
      Text            =   "SA"
      Hwnd            =   5048910
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
   Begin UserControl.txt txtShuJvKMC 
      Height          =   225
      Left            =   480
      TabIndex        =   10
      Top             =   1920
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   397
      Caption         =   "数据库名称"
      CaptionWidth    =   1050
      Hwnd            =   5965066
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
   Begin UserControl.txt txtFuWuQiIP 
      Height          =   225
      Left            =   450
      TabIndex        =   11
      Top             =   1425
      Width           =   3435
      _ExtentX        =   6059
      _ExtentY        =   397
      Caption         =   "服务器"
      CaptionWidth    =   630
      Hwnd            =   2753538
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
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
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
      Height          =   255
      Left            =   3870
      TabIndex        =   14
      Top             =   2565
      Width           =   255
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
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
      Height          =   255
      Left            =   3870
      TabIndex        =   13
      Top             =   1965
      Width           =   255
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
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
      Height          =   255
      Left            =   3870
      TabIndex        =   12
      Top             =   1365
      Width           =   255
   End
End
Attribute VB_Name = "frmShuJvKuLianJ"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim strFuWuQiIP As String
Dim strShuJvKMC As String
Dim strYongHuM  As String
Dim strMiMa  As String
Dim strConn As String



Private Sub ChkCaiZheng_Click()
If ChkCaiZheng.Value Then
   m_bolQiYongZT = True
Else
  m_bolQiYongZT = False
End If
End Sub

'Private Sub ChkWenJianLJ_Click()
'    If ChkWenJianLJ.value Then
'      If txtFileServer.Text = "" Then
'          MsgBox "请先选择更新路径!", vbInformation, "系统提示"
'          ChkWenJianLJ.value = 0
'          Exit Sub
'      End If
'   End If
'End Sub

'Private Sub chkZiDongGX_Click()
'   If chkZiDongGX.value Then
'      If txtFileServer.Text = "" Then
'          MsgBox "请先选择更新路径!", vbInformation, "系统提示"
'          chkZiDongGX.value = 0
'          Exit Sub
'      End If
'   End If
'End Sub

Private Sub cmdFile_Click()
'   Dim varRuJian As Variant
'   Dim Str As String
'   cdg.ShowOpen
'   Str = cdg.filename
'   If Str <> "" Then
'      varRuJian = Split(Str, "\")
'      'Left(cdg.filename, Len(cdg.filename) - Len(varRuJian(UBound(varRuJian))) - 1)
'   End If
'   Me.txtFileServer.Text = BrowseForFolder()
End Sub

Private Sub cmdQueDing_Click()

'* 功    能： 连接数据库确定
'* 参    数：
'* 返 回 值：
'* 创 建 人： huguolin
'* 修 改 人：
'* 修改日期：

    On Error GoTo PROC_ERR

    Dim strShuJvKLJC As String      '数据库连接串
    Dim strFileServer As String

'    strFileServer = txtFileServer.Text

'    If chkZiDongGX.value Then
'        If txtFileServer.Text = "" Then
'            MsgBox "请先选择更新路径!", vbInformation, "系统提示"
'            txtFileServer.SetFocus
'            Exit Sub
'        End If
'    End If

    If Len(txtFuWuQiIP.Text) = 0 Then
        MsgBox "信息输入错误，服务器IP地址不能为空！", vbOKOnly + vbExclamation, "警告"
        Exit Sub
        txtFuWuQiIP.SetFocus
    End If

    If Len(txtShuJvKMC.Text) = 0 Then
        MsgBox "信息输入错误，数据库名称不能为空！", vbOKOnly + vbExclamation, "警告"
        Exit Sub
        txtShuJvKMC.SetFocus
    End If

    If Len(txtDengLuM.Text) = 0 Then
        MsgBox "信息输入错误，登陆名不能为空！", vbOKOnly + vbExclamation, "警告"
        Exit Sub
        txtDengLuM.SetFocus
    End If

    strFuWuQiIP = txtFuWuQiIP.Text
    strShuJvKMC = txtShuJvKMC.Text
    strYongHuM = txtDengLuM.Text
    strMiMa = txtDengLuMM.Text
    
    '在连接前先检测当前IP:是否可以PING通，注意不能用名实例名的检测  lz2015-11-24 给PING功能设置开关
    If g_strYNPing = 1 And PingIP(strFuWuQiIP) = False Then
        MsgBox "当前IP:" & strFuWuQiIP & "不能正确访问，请确认输入是否正确", vbInformation
        Exit Sub
    End If

    'If strShuJvKLJC = "" Then
    strShuJvKLJC = "Provider=SQLOLEDB.1;Password=" & strMiMa & ";Persist Security Info=True;User ID=" & strYongHuM & ";Initial Catalog=" & strShuJvKMC & ";Data Source=" & strFuWuQiIP & ""
    'End If
    'MsgBox strConn

    '连接数据库服务器,如果连接成功,装载登录窗体,否则提示输入数据库连接信息
    'strShuJvKLJC = Replace(Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\医疗信息管理系统", "Conn")), Chr(0), "")
    'strShuJvKLJC = "Provider=SQLOLEDB.1;Password=;Persist Security Info=True;User ID=sa;Initial Catalog=new_his;Data Source=(local)"
    '以后删除
   If GetSetConnection(False, IIf(OptZhuCeB.Value, 0, 1), txtShuJvKMC.Text, txtDengLuMM.Text, txtDengLuM.Text, txtFuWuQiIP.Text, "", chkZiDongGX.Value, ChkWenJianLJ.Value, ChkCaiZheng.Value) = "1" Then
        GoTo PROC_EXIT
   End If
    If objExecuteSQL.ConnectionServer(strShuJvKLJC) Then
        MsgBox "数据库连接成功！请重新打开程序！", vbOKOnly + vbInformation, "提示"
        End
    Else
        strShuJvKLJC = ""
        SetKeyValue HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "Conn", strShuJvKLJC, REG_SZ
        MsgBox "数据库连接失败！", vbOKOnly + vbExclamation, "提示"
    End If

PROC_EXIT:
    Exit Sub

PROC_ERR:
    If ERR.Number <> 0 Then
        Call ShowError("frmShuJvKuLianJ", "cmdQueDing_Click", ERR.Number, ERR.Description)
        Resume PROC_EXIT
    End If

End Sub



Private Sub cmdTuiChu_Click()
   
   Unload Me
   
End Sub



Private Sub cmdWriteIni_Click()
Dim intLeiXing As Integer

   '获取连接数据库类型
   Call ProLianJieLeiX
   If Trim(g_strShuJuKuLx) <> "0" Then
      intLeiXing = 1
   Else
      intLeiXing = 0
   End If
      
   If Not WriteIni(intLeiXing, txtShuJvKMC.Text, txtDengLuMM.Text, txtDengLuM.Text, txtFuWuQiIP.Text, "", chkZiDongGX.Value, ChkWenJianLJ.Value) Then           '写ini文件
      GoTo PROC_ERR
   Else
      MsgBox "配置文件已生成！ 路径为程序所在文件夹.", vbInformation, "系统提示"
      Call Form_Load
   End If
   
PROC_EXIT:
   Exit Sub
PROC_ERR:
   MsgBox "配置文件生成错误!", vbInformation, "系统提示"
   GoTo PROC_EXIT
End Sub

Private Sub Form_Load()

   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   Dim strLeiXing As String
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 5220
   Const c_formHeight = 5400
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
   
'   If g_strShuJvKLJC = "" Then
'
'   Else
'        If g_intLiangJieZT = 0 Then
'
'        Else
'            '初始化窗体属性
'            If objFormSetting.InitFormProperty(Me) = False Then
'               g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
'               GoTo PROC_EXIT
'            End If
'        End If
'
'   End If
   '获取连接数据库类型
   Call ProLianJieLeiX

   If Trim(g_strShuJuKuLx) = "0" Then
      OptZhuCeB.Value = True
      OptWenJian.Value = False
      Call JiaZai(0)
   Else
      OptZhuCeB.Value = False
      OptWenJian.Value = True
      Call JiaZai(1)
   End If
   
        
PROC_EXIT:
   Exit Sub
End Sub

Private Sub JiaZai(intLeiBie As Integer)
   If intLeiBie = 0 Then
      '取注册表中的键值作为缺省值
      txtFuWuQiIP.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "ServerIP"))
      txtShuJvKMC.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "DBName"))
      txtDengLuM.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "SA"))
      txtDengLuMM.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "PWD"))
      
      chkZiDongGX.Value = Val(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "UpdateType"))
      'txtFileServer.Text = Replace(Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "FileServer")), Chr(0), "")
      ChkWenJianLJ.Value = Val(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "FuWuQiPZWJ"))
      ChkCaiZheng.Value = Val(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "BoSiJK"))
   Else
      txtFuWuQiIP.Text = Trim(GetIniString("ServerIP"))
      txtShuJvKMC.Text = Trim(GetIniString("DBName"))
      txtDengLuM.Text = Trim(GetIniString("SA"))
      txtDengLuMM.Text = Trim(GetIniString("PWD"))
      
      chkZiDongGX.Value = Val(GetIniString("UpdateType"))
      'txtFileServer.Text = Replace(Trim(GetIniString("FileServer")), Chr(0), "")
      ChkWenJianLJ.Value = Val(GetIniString("FuWuQiPZWJ"))
      ChkCaiZheng.Value = Val(GetIniString("FuWuQiPZWJ"))
   End If
End Sub

Private Sub OptWenJian_Click()
   If OptWenJian.Value Then
      OptZhuCeB.Value = False
      Call JiaZai(1)
   End If
   
End Sub

Private Sub OptZhuCeB_Click()
   If OptZhuCeB.Value Then
      OptWenJian.Value = False
      Call JiaZai(0)
   End If
End Sub

Private Sub txtDengLuM_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = 13 Then
      txtDengLuMM.SetFocus
   End If

End Sub


Private Sub txtDengLuMM_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = 13 Then
      cmdQueDing.SetFocus
   End If

End Sub

Private Sub txtFuWuQiIP_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = 13 Then
      txtShuJvKMC.SetFocus
   End If

End Sub



Private Sub txtShuJvKMC_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = 13 Then
      txtDengLuM.SetFocus
   End If

End Sub
