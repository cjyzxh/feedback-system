VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.0#0"; "HISControl1.ocx"
Begin VB.Form frmXiTongSheZhi 
   BackColor       =   &H00EBE2E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "系统设置"
   ClientHeight    =   2685
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4335
   Icon            =   "frmXiTongSheZhi.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2685
   ScaleWidth      =   4335
   Begin UserControl.cmd cmdQuXiao 
      Height          =   375
      Left            =   2280
      TabIndex        =   1
      Top             =   1920
      Width           =   1080
      _ExtentX        =   1905
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退出(&Q)"
      Icn             =   "frmXiTongSheZhi.frx":08CA
      Icon            =   4
   End
   Begin UserControl.cmd cmdZhuCe 
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   1920
      Width           =   1080
      _ExtentX        =   1905
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "注册(&Z)"
      Icn             =   "frmXiTongSheZhi.frx":0E64
      Icon            =   8
   End
   Begin UserControl.rsz rsz 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin UserControl.cmd cmdJianCe 
      Height          =   375
      Left            =   2970
      TabIndex        =   2
      Top             =   450
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "检测(&J)"
   End
   Begin UserControl.txt txtYongHuMC 
      Height          =   375
      Left            =   90
      TabIndex        =   3
      Top             =   1050
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   529
      Caption         =   "授权用户名称"
      CaptionWidth    =   1200
      Enabled         =   0   'False
      Hwnd            =   4261228
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtZhuCeHM 
      Height          =   375
      Left            =   90
      TabIndex        =   4
      Top             =   450
      Width           =   2775
      _ExtentX        =   4895
      _ExtentY        =   529
      Caption         =   "注册号码"
      CaptionWidth    =   1200
      Hwnd            =   3736942
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmXiTongSheZhi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdJianCe_Click()

   '* 功    能： 注册码检测
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
   If Trim(txtZhuCeHM.Text) = "" Then
      Exit Sub
   End If
   txtYongHuMC.Text = ChkCenter(txtZhuCeHM.Text)

End Sub

Private Sub cmdQuXiao_Click()

   Unload Me

End Sub

Private Sub cmdZhuCe_Click()

   '* 功    能： 注册确定
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
   Dim strZhuCeHM As String   '注册号码
   Dim strYongHuMC As String  '授权用户名称
   Dim strPath As String
   
   
   strZhuCeHM = txtZhuCeHM.Text
   strYongHuMC = txtYongHuMC.Text
   If Trim(txtZhuCeHM.Text) <> "" And Trim(txtYongHuMC.Text) <> "" And Trim(txtYongHuMC.Text) <> "非授权用户" Then
      
      '获取连接数据库类型
      Call ProLianJieLeiX
      If Trim(g_strShuJuKuLx) <> "0" Then         '有ini 文件且类型为1 的才修改类型
         If Right(CStr(App.Path), 1) = "\" Then
           strPath = App.Path & "Conn.ini"
         Else
           strPath = App.Path & "\Conn.ini"
         End If
         
         Call SetIni("CJYSOFT", "CenterID", strZhuCeHM, strPath)
         Call SetIni("CJYSOFT", "CenterName", strYongHuMC, strPath)
      Else
         '创建注册表,并设置键值
         CreateNewKey HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS"
         SetKeyValue HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "CenterID", strZhuCeHM, REG_SZ
         SetKeyValue HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "CenterName", strYongHuMC, REG_HZ
      End If

      MsgBox "注册成功！", vbInformation
      Me.Hide
   Else
      MsgBox "请输入注册编码和授权用户名称！", vbCritical, "警告"
      Exit Sub
   End If
End Sub

Private Sub Form_Load()

   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 4455
   Const c_formHeight = 3195
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
   
'   '获取连接数据库类型
   Call ProLianJieLeiX
   
   If Trim(g_strShuJuKuLx) = "0" Then
      txtZhuCeHM.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "CenterID"))
      txtYongHuMC.Text = Trim(QueryValue(HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "CenterName"))
      
      '
   Else
      txtZhuCeHM.Text = Trim(GetIniString("CenterID"))
      txtYongHuMC.Text = Trim(GetIniString("CenterName"))

   End If
End Sub
