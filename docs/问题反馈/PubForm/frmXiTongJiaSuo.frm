VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.0#0"; "HISControl1.ocx"
Begin VB.Form frmXiTongJiaSuo 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "系统加锁"
   ClientHeight    =   3090
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4620
   FillStyle       =   0  'Solid
   Icon            =   "frmXiTongJiaSuo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   4620
   ShowInTaskbar   =   0   'False
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   120
      TabIndex        =   4
      Top             =   60
      Width           =   4395
      _ExtentX        =   7752
      _ExtentY        =   714
      Caption         =   "系统加锁"
   End
   Begin UserControl.txt txtMiMa 
      Height          =   225
      Left            =   1680
      TabIndex        =   3
      Top             =   1740
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   397
      Caption         =   "密码"
      CaptionWidth    =   420
      Hwnd            =   657414
      ForeColor       =   0
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
      PasswordChar    =   "#"
   End
   Begin UserControl.txt txtYongHuM 
      Height          =   225
      Left            =   1680
      TabIndex        =   2
      Top             =   1200
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   397
      Caption         =   "用户名"
      CaptionWidth    =   630
      Hwnd            =   2360074
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
      Locked          =   -1  'True
   End
   Begin UserControl.cmd cmdTuiChu 
      Height          =   495
      Left            =   3060
      TabIndex        =   1
      Top             =   2370
      Width           =   1230
      _ExtentX        =   2170
      _ExtentY        =   873
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退 出(&Q)"
   End
   Begin UserControl.cmd cmdDengLu 
      Height          =   495
      Left            =   1740
      TabIndex        =   0
      Top             =   2370
      Width           =   1230
      _ExtentX        =   2170
      _ExtentY        =   873
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "登 录(&D)"
   End
   Begin VB.Image Image1 
      Height          =   1455
      Left            =   150
      Picture         =   "frmXiTongJiaSuo.frx":08CA
      Stretch         =   -1  'True
      Top             =   900
      Width           =   1305
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H80000003&
      BorderWidth     =   2
      Height          =   3015
      Left            =   60
      Top             =   30
      Width           =   4515
   End
End
Attribute VB_Name = "frmXiTongJiaSuo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdDengLu_Click()

   '* 功    能： 登陆系统
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： xuzhaolin
   '* 修 改 人：
   '* 修改日期：
   
   Dim rstYongHu As Adodb.Recordset
   Dim strMiMa As String      '密码

   Set rstYongHu = Nothing
   Set rstYongHu = New Adodb.Recordset
   g_strSQL = "SELECT MiMa" & Chr(13) _
               & "FROM zd_YongHu" & Chr(13) _
               & "WHERE DaiMa= '" & g_strYongHuDM & "'"
   Set rstYongHu = GetRs(g_strSQL)
               

   '检查用户密码是否正确
   strMiMa = rstYongHu("MiMa")
   '如果是超级用户，加日期
   If txtYongHuM.Text = "Administrator" Then
      strMiMa = strMiMa & Format(objStandData.getSystemDate(), "MMDD")
   End If
   If strMiMa = txtMiMa.Text Then
      rstYongHu.Close
      Unload Me

   Else
      MsgBox "输入密码不正确，请重新输入！", vbOKOnly + vbExclamation, "警告"
      txtMiMa.SetFocus
      txtMiMa.Text = ""
   End If

   
End Sub

Private Sub cmdTuiChu_Click()
 
'   Unload frmZhuChuangTi
'   Unload Me
    
   If MsgBox("是否要退出系统?", vbExclamation + vbYesNo, "系统提示") = vbYes Then
      Unload Me
      End
   End If
End Sub

Private Sub Form_Load()


   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： xuzhaolin
   '* 修 改 人：
   '* 修改日期：
      
   '自动创建窗体信息
  ' Call objFormSetting.CreateFormInfo(Me)
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 4620
   Const c_formHeight = 3090
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
   
   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
      GoTo PROC_EXIT
   End If

   '给各个控件赋缺省值
   If objFormSetting.InitFormData(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
      GoTo PROC_EXIT
   End If
   
   txtYongHuM.Text = g_strYongHuMC
   txtMiMa.Text = ""
   
   If ReplaceChar(g_strCenterName) = "张锁中医骨伤诊所" Then
        cmdTuiChu.Enabled = False
   End If
PROC_EXIT:
   Exit Sub
   
End Sub

Private Sub Form_Activate()
   
   '把焦点移至第一个控件
   txtMiMa.SetFocus
   
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)
   
End Sub


Private Sub txtMiMa_KeyPress(KeyAscii As Integer)
   
   '回车移焦点
   If KeyAscii = vbKeyReturn Then
      cmdDengLu.SetFocus
   End If

End Sub

