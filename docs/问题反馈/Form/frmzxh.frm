VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmzxh 
   Caption         =   "问题反馈"
   ClientHeight    =   8175
   ClientLeft      =   4200
   ClientTop       =   3675
   ClientWidth     =   10815
   BeginProperty Font 
      Name            =   "楷体_GB2312"
      Size            =   9
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00FF00FF&
   Icon            =   "frmzxh.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "frmzxh.frx":628A
   ScaleHeight     =   8175
   ScaleWidth      =   10815
   WindowState     =   2  'Maximized
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   10815
      _ExtentX        =   19076
      _ExtentY        =   741
      ButtonWidth     =   1984
      ButtonHeight    =   582
      Appearance      =   1
      TextAlignment   =   1
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   6
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "连接设置"
            Key             =   "连接设置"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题录入"
            Key             =   "问题录入"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题处理"
            Key             =   "问题处理"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题测试"
            Key             =   "问题测试"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题分析"
            Key             =   "问题分析"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "退出"
            Key             =   "退出"
         EndProperty
      EndProperty
      MouseIcon       =   "frmzxh.frx":19F3E
   End
   Begin MSComctlLib.StatusBar stb 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   7800
      Width           =   10815
      _ExtentX        =   19076
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   2725
            Picture         =   "frmzxh.frx":1A258
            Text            =   "当前时间："
            TextSave        =   "当前时间："
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   3069
            Picture         =   "frmzxh.frx":1A952
            Text            =   "当前操作员："
            TextSave        =   "当前操作员："
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Menu mnuxitong 
      Caption         =   "系统"
      Begin VB.Menu mnutuichu 
         Caption         =   "退出"
      End
      Begin VB.Menu mnuxiugaimm 
         Caption         =   "修改密码"
      End
      Begin VB.Menu mnulianjiesz 
         Caption         =   "连接设置"
      End
      Begin VB.Menu mnuyonghugl 
         Caption         =   "用户管理"
      End
      Begin VB.Menu mnuchongxindl 
         Caption         =   "重新登录"
      End
   End
   Begin VB.Menu mnuyewu 
      Caption         =   "业务处理(&B)"
      Begin VB.Menu mnuwentilr 
         Caption         =   "问题录入"
      End
      Begin VB.Menu mnuweiticl 
         Caption         =   "问题处理"
      End
   End
   Begin VB.Menu munchaxun 
      Caption         =   "查询分析"
      Begin VB.Menu mnuwentifx 
         Caption         =   "问题分析"
      End
      Begin VB.Menu mnussry 
         Caption         =   "在外实施人员"
      End
   End
   Begin VB.Menu mnuzhidian 
      Caption         =   "字典"
      Begin VB.Menu mnuyiyuanmc 
         Caption         =   "医院名称字典"
      End
      Begin VB.Menu mnuchuangti 
         Caption         =   "窗体字典"
      End
      Begin VB.Menu mnumokuan 
         Caption         =   "模块字典"
      End
      Begin VB.Menu mnubanbenh 
         Caption         =   "软件版本号"
      End
      Begin VB.Menu ssry 
         Caption         =   "实施人员"
      End
      Begin VB.Menu moban 
         Caption         =   "模板"
      End
   End
   Begin VB.Menu mnuchuangkou 
      Caption         =   "窗口"
   End
   Begin VB.Menu mnubanzhu 
      Caption         =   "帮助"
   End
End
Attribute VB_Name = "frmzxh"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
stb.Panels(2) = Now
stb.Panels(4) = user
End Sub

Private Sub mnuchongxindl_Click()
Unload Me
conn.Close
Call Main
End Sub

Private Sub mnuchuangti_Click()
frmchuangtim.Show vbModal
End Sub

Private Sub mnulianjiesz_Click()
frmshujvlj.Show vbModal
End Sub

Private Sub mnumokuan_Click()
frmmokuai.Show vbModal
End Sub

Private Sub mnussry_Click()
frmzaiwairy.Show vbModal
End Sub

Private Sub mnutuichu_Click()
If MsgBox("确定退出吗？", vbYesNo, "提示框") = vbYes Then
  Unload Me
Else
End If
End Sub

Private Sub mnuweiticl_Click()
frmwenticl.Show
frmwenticl.Height = 8610
frmwenticl.Width = 13140
End Sub

Private Sub mnuwentifx_Click()
frmwentilb.Show vbModal
End Sub

Private Sub mnuwentilr_Click()
frmwentily.Show vbModal
End Sub

Private Sub mnuxiugaimm_Click()
frmxiougaimm.Show vbModal
End Sub

Private Sub mnuyiyuanmc_Click()
frmyiyuanmc.Show vbModal
End Sub

Private Sub mnuyonghugl_Click()
frmyonghugl.Show vbModal
End Sub

Private Sub moban_Click()
frmmoban.Show vbModal
End Sub

Private Sub ssry_Click()
frmsssy.Show vbModal
End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)

End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
 Dim X As Integer
Select Case Button.Key
 Case "连接设置"
    frmshujvlj.Show vbModal
 Case "问题录入"
    frmwentily.Show vbModal
 Case "问题处理"
    frmwenticl.Show vbModal
    frmwenticl.Height = 8610
    frmwenticl.Width = 13140
    Case "问题测试"
    frmwentics.Show vbModal
 Case "问题分析"
    frmwentilb.Show vbModal
 Case "退出"
    If MsgBox("确定要退出吗？", vbYesNo, "提示框") = vbYes Then
      Unload Me
      Else
      MsgBox "欢迎使用本软件！"
    End If
End Select
End Sub
