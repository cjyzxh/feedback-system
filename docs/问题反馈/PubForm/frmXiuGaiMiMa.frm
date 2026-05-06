VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Begin VB.Form frmXiuGaiMiMa 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "修改密码"
   ClientHeight    =   4725
   ClientLeft      =   7380
   ClientTop       =   4875
   ClientWidth     =   5235
   Icon            =   "frmXiuGaiMiMa.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4725
   ScaleWidth      =   5235
   StartUpPosition =   1  '所有者中心
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   6
      Top             =   0
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   714
      Caption         =   "修改密码"
   End
   Begin UserControl.txt txtQueRenMM 
      Height          =   225
      Left            =   1200
      TabIndex        =   5
      Top             =   2640
      Width           =   2715
      _ExtentX        =   4789
      _ExtentY        =   397
      Caption         =   "确认密码"
      CaptionWidth    =   840
      Hwnd            =   663734
      CaptionForeColor=   0
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
   Begin UserControl.txt txtXinMiM 
      Height          =   225
      Left            =   1200
      TabIndex        =   4
      Top             =   1320
      Width           =   2715
      _ExtentX        =   4789
      _ExtentY        =   397
      Caption         =   "新密码"
      CaptionWidth    =   630
      Hwnd            =   663796
      CaptionForeColor=   0
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
   Begin UserControl.txt txtJiuMiM 
      Height          =   225
      Left            =   1200
      TabIndex        =   3
      Top             =   1980
      Width           =   2715
      _ExtentX        =   4789
      _ExtentY        =   397
      Caption         =   "原密码"
      CaptionWidth    =   630
      Hwnd            =   3018424
      CaptionForeColor=   0
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
   Begin UserControl.cmd cmdTuiChu 
      Height          =   495
      Left            =   2640
      TabIndex        =   1
      Top             =   3960
      Width           =   1275
      _ExtentX        =   2249
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
      Caption         =   "退出"
   End
   Begin UserControl.cmd cmdQueDing 
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   3960
      Width           =   1275
      _ExtentX        =   2249
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
      Caption         =   "确认"
   End
   Begin UserControl.txt txtYongHuM 
      Height          =   225
      Left            =   1200
      TabIndex        =   2
      Top             =   660
      Width           =   2715
      _ExtentX        =   4789
      _ExtentY        =   397
      Caption         =   "用户名"
      CaptionWidth    =   630
      Hwnd            =   531756
      CaptionForeColor=   0
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
End
Attribute VB_Name = "frmXiuGaiMiMa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function Decrypt Lib "wjjdblib.dll" (ByVal inprice As Double, ByVal itemcode As String) As Double
'提示信息序列号
Private Enum m_eTiShiXLH
   
   XinJiuBYZ = 100      '新密码与确认密码不一致
   JiuMiMSRBZQ = 101    '旧密码输入不正确
End Enum


Private Sub cmdQueDing_Click()

   '* 功    能： 修改确定
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_EXIT
   Dim rstYongHu As ADODB.Recordset
   Set rstYongHu = Nothing
   Set rstYongHu = New ADODB.Recordset
   Set rstYongHu = GetRs("SELECT MiMa FROM zd_YongHu WHERE DaiMa= '" & g_strYongHuDM & "'")
   Dim colUpdate As Collection   '字段赋值的Collection对象

   '修改表记录
   Set colUpdate = New Collection

   If Trim(rstYongHu("MiMa")) = Trim(txtJiuMiM.Text) Then
      
      If Trim(txtXinMiM.Text) = Trim(txtQueRenMM.Text) Then
         '循环修改字段
         colUpdate.Add "MiMa =  '" & txtXinMiM.Text & "'"    '名称

         '如果没有执行成功SQL语句
         g_strTiaoJian = "DaiMa =  '" & g_strYongHuDM & "'"
         If objExecuteSQL.UpdateRecord("zd_YongHu", g_strTiaoJian, colUpdate) = False Then
            GoTo PROC_EXIT
         End If
         Set colUpdate = Nothing
        '修改成功提示
        If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.XiuGaiCG) = False Then
           GoTo PROC_EXIT
        
        End If
        
         rstYongHu.Close
         Unload Me
         
      Else
         '新密码与确认密码不一致
         g_intMessage = objFormSetting.MessageBox(Me.Name, m_eTiShiXLH.XinJiuBYZ)
                 
         txtXinMiM.SetFocus
         txtXinMiM.Text = ""
         txtQueRenMM.Text = ""
      End If
   Else
      '旧密码输入不正确
      g_intMessage = objFormSetting.MessageBox(Me.Name, m_eTiShiXLH.JiuMiMSRBZQ)
        
      txtJiuMiM.SetFocus
      txtJiuMiM.Text = ""
   End If
   
PROC_EXIT:
   Exit Sub
   
End Sub

Private Sub cmdTuiChu_Click()

   Unload Me
   
End Sub



Private Sub Form_Activate()
   txtJiuMiM.SetFocus
End Sub

Private Sub Form_Load()
   
   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： huguolin
   '* 修 改 人：
   '* 修改日期：
   
'  '自动创建窗体信息
'   Call objFormSetting.CreateFormInfo(Me)

   '设置窗体居中(Call objFormSetting.InitFormPosition)
'   Const c_formWidth = 4515
'   Const c_formHeight = 4140
'   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
   
   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
      GoTo PROC_EXIT
   End If

   txtYongHuM.Text = g_strYongHuMC
   txtJiuMiM.Text = ""
   txtXinMiM.Text = ""
   txtQueRenMM.Text = ""
   
PROC_EXIT:
   Exit Sub
   
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Call objFormSetting.CreateFormInfo(Me)
End Sub

Private Sub txtJiuMiM_KeyPress(KeyAscii As Integer)

   '回车移焦点
   If KeyAscii = 13 Then
      txtXinMiM.SetFocus
   End If
   
End Sub


Private Sub txtQueRenMM_KeyPress(KeyAscii As Integer)
   
   '回车移焦点
   If KeyAscii = 13 Then
      cmdQueDing.SetFocus
   End If
   
End Sub


Private Sub txtXinMiM_KeyPress(KeyAscii As Integer)
   
   '回车移焦点
   If KeyAscii = 13 Then
      txtQueRenMM.SetFocus
   End If
   
End Sub


