VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.33#0"; "HISControl1.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Object = "{60CC5D62-2D08-11D0-BDBE-00AA00575603}#1.0#0"; "SysTray.ocx"
Begin VB.MDIForm frmzxh 
   BackColor       =   &H00FFFFFF&
   Caption         =   "问题处理"
   ClientHeight    =   8190
   ClientLeft      =   3210
   ClientTop       =   2250
   ClientWidth     =   13695
   Icon            =   "mdi.frx":0000
   LinkTopic       =   "MDIForm1"
   Picture         =   "mdi.frx":15162
   ScrollBars      =   0   'False
   StartUpPosition =   2  '屏幕中心
   WindowState     =   2  'Maximized
   Begin SysTrayCtl.cSysTray cSysTray1 
      Left            =   11700
      Top             =   5160
      _ExtentX        =   900
      _ExtentY        =   900
      InTray          =   0   'False
      TrayIcon        =   "mdi.frx":29697
      TrayTip         =   "VB 5 - SysTray Control."
   End
   Begin UserControl.EFM EFM1 
      Left            =   9480
      Top             =   6240
      _ExtentX        =   423
      _ExtentY        =   397
      IconTooltipText =   "HIS程序"
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1440
      Top             =   2400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":31611
            Key             =   "a1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":3231B
            Key             =   "a3"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":3419D
            Key             =   "a4"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":34737
            Key             =   "a5"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":35589
            Key             =   "a6"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "mdi.frx":35B23
            Key             =   "a2"
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   30000
      Left            =   2280
      Top             =   2400
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13695
      _ExtentX        =   24156
      _ExtentY        =   1111
      ButtonWidth     =   1455
      ButtonHeight    =   1058
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   11
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "连接设置"
            Key             =   "连接设置"
            ImageKey        =   "a1"
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   1
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题录入"
            Key             =   "问题录入"
            ImageKey        =   "a2"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题处理"
            Key             =   "问题处理"
            ImageKey        =   "a3"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "问题测试"
            Key             =   "问题测试"
            ImageKey        =   "a4"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "修改状态"
            Key             =   "修改状态"
            ImageKey        =   "a5"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "升级日志"
            Key             =   "升级日志"
            ImageKey        =   "a6"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "状态分析"
            Key             =   "效率分析"
            ImageKey        =   "a5"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "测试分析"
            Key             =   "测试状态"
            ImageKey        =   "a5"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Visible         =   0   'False
            Caption         =   "计划时间"
            Key             =   "计划时间"
            ImageKey        =   "a6"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "退出系统"
            Key             =   "退出"
            ImageKey        =   "a2"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BorderStyle     =   1
      OLEDropMode     =   1
   End
   Begin MSComctlLib.StatusBar stb 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   7815
      Width           =   13695
      _ExtentX        =   24156
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   2725
            Picture         =   "mdi.frx":3621D
            Text            =   "当前时间："
            TextSave        =   "当前时间："
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   3069
            Picture         =   "mdi.frx":36917
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
   Begin VB.Menu xt 
      Caption         =   "系统"
      Index           =   1
      NegotiatePosition=   2  'Middle
      WindowList      =   -1  'True
      Begin VB.Menu yhgl 
         Caption         =   "用户管理"
      End
      Begin VB.Menu xg 
         Caption         =   "修改密码"
      End
      Begin VB.Menu mnuchongxindl 
         Caption         =   "重新登录"
      End
      Begin VB.Menu zhuangtai 
         Caption         =   "修改用户状态"
      End
      Begin VB.Menu mnulianjiesz 
         Caption         =   "连接设置"
      End
      Begin VB.Menu mnutuichu 
         Caption         =   "退出"
      End
   End
   Begin VB.Menu ywcl 
      Caption         =   "业务处理"
      Begin VB.Menu mnuwentilr 
         Caption         =   "问题录入"
      End
      Begin VB.Menu mnuweiticl 
         Caption         =   "问题处理"
      End
   End
   Begin VB.Menu cxfx 
      Caption         =   "查询分析"
      Begin VB.Menu mnuwentifx 
         Caption         =   "问题分析"
      End
      Begin VB.Menu 问题修改分析 
         Caption         =   "问题修改分析"
      End
      Begin VB.Menu 问题讨论 
         Caption         =   "问题讨论"
      End
      Begin VB.Menu zwssry 
         Caption         =   "在外实施人员"
         Visible         =   0   'False
      End
   End
   Begin VB.Menu zd 
      Caption         =   "字典"
      Begin VB.Menu mnuJiChuZD 
         Caption         =   "基础字典"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuyiyuanmc 
         Caption         =   "医院字典名称"
         Visible         =   0   'False
      End
      Begin VB.Menu mnumokuan 
         Caption         =   "模块字典"
      End
      Begin VB.Menu mnuchuangti 
         Caption         =   "窗体字典"
      End
      Begin VB.Menu mnussry 
         Caption         =   "实施人员"
      End
      Begin VB.Menu moban 
         Caption         =   "模板"
      End
   End
   Begin VB.Menu ck 
      Caption         =   "统计分析"
      Begin VB.Menu 修改效率分析 
         Caption         =   "修改状态分析"
      End
      Begin VB.Menu 测试状态分析 
         Caption         =   "测试状态分析"
      End
   End
   Begin VB.Menu KHZL 
      Caption         =   "客户资料"
      Visible         =   0   'False
      Begin VB.Menu mnuKhda 
         Caption         =   "客户档案"
      End
      Begin VB.Menu mnuBfjl 
         Caption         =   "根踪记录"
      End
      Begin VB.Menu KHDD 
         Caption         =   "订单录入"
      End
      Begin VB.Menu KHXXWH 
         Caption         =   "客户信息维护"
      End
      Begin VB.Menu KHXXCX 
         Caption         =   "客户信息查询"
      End
   End
End
Attribute VB_Name = "frmzxh"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim blnCheckHuiFang As Boolean              '显示回访提示标志





Private Sub cSysTray1_MouseDblClick(Button As Integer, Id As Long)
    frmzxh.Show
End Sub

Private Sub KHDD_Click()
    frmdiandan.Show
End Sub

Private Sub KHXXCX_Click()
    frmkehuxinxicx.Show
End Sub

Private Sub KHXXWH_Click()
    frmkehuxinxiwh.Show
End Sub



Private Sub MDIForm_Load()
    Dim str As String
    Dim quxian As String



    stb.Panels(4) = user
    stb.Panels(2) = Format(Now, "yyyy-MM-dd")
    ''限定权限
    str = "select quxian from [user] where usename='" & Trim(stb.Panels(4)) & "'"
    Set Rs = Nothing
    Rs.Open str, conn
        If Not Rs.EOF Then
             Rs.MoveFirst
            quxian = Rs.Fields("quxian").Value
        End If
    'Set rs = Nothing
    '   If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Then
    '        Toolbar1.Buttons(2).Enabled = True
    ''       mnuwentilr.Enabled = False
    ''        KHZL.Visible = True
    '    End If


    '分配权限
    If g_strYongHuZT = "2" Or g_strYongHuZT = "3" Then          '2=销售人员 3=销售经理
        mnuKhda.Visible = True
        mnuBfjl.Visible = True
        Toolbar1.Buttons(2).Enabled = False
        '        mnuwentilr.Enabled = True
        KHZL.Visible = False
        KHXXWH.Enabled = False
    Else
        mnuKhda.Visible = False
        mnuBfjl.Visible = False
        '        Toolbar1.Buttons(2).Enabled = False
        mnuwentilr.Enabled = False
        KHZL.Visible = True
        KHXXWH.Enabled = False
    End If

    If user = "张晓华" Then             '管理员
        yhgl.Visible = True
        Toolbar1.Buttons(2).Enabled = True
        mnuwentilr.Enabled = True
        KHZL.Visible = False
        KHXXWH.Enabled = False
    Else
        yhgl.Visible = False
    End If

        Toolbar1.Buttons(2).Enabled = True
        mnuwentilr.Enabled = True


        
    blnCheckHuiFang = True              '显示回访提示标志

End Sub





Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Unload frmain
End Sub

Private Sub mnuBfjl_Click()
    frmBaiFangJL.Show
End Sub

Private Sub mnuchongxindl_Click()
    Unload Me
    conn.Close
    Call Main
End Sub

Private Sub mnuchuangti_Click()
    frmchuangtim.Show
End Sub

Private Sub mnuJiChuZD_Click()
    frmJiChuZD.Show
End Sub

Private Sub mnuKhda_Click()
    frmXiaoShouJL.Show
End Sub

Private Sub mnulianjiesz_Click()
    frmshujvlj.Show
End Sub

Private Sub mnumokuan_Click()
    frmmokuai.Show
End Sub

Private Sub mnushgzltjb_Click()
    Frmshgzltjb.Show
End Sub

Private Sub mnussry_Click()
    frmsssy.Show
End Sub

Private Sub mnuyffhl_Click()
    Frmyffhl.Show
End Sub

Private Sub mnuyfzzltjb_Click()
    Frmyfzzltjb.Show
End Sub

Private Sub mnuzzlmxb_Click()
    FrmZZLFX.Show
End Sub

Private Sub Timer1_Timer()
'    stb.Panels(2) = Now

    '判断是否需要显示回访提示
'    Call fn_HuiFang CP20200403旧数据库少表暂时注释
Dim rst As ADODB.Recordset
Set rst = New ADODB.Recordset
rst.Open "select getdate()", conn, 1, 3
End Sub
'判断是否需要显示回访提示
Private Sub fn_HuiFang()
    If blnCheckHuiFang = True Then
        str = "select Qy,Khbm,Khmc from Khxx where Khbm in (select Khbm from Bfjl where isnull(wcbz,'否')='否' and Xsry='" & user & "' and xcbfsj<=getdate()) order by Qy,Khbm"
        Set Rs = Nothing
        Rs.Open str, conn

        If Rs.RecordCount > 0 Then
            If MsgBox("您目前有" & Rs.RecordCount & "个客户需要进行回访。" & vbCrLf & vbCrLf & vbCrLf & "是否切换到回访记录界面？", vbQuestion + vbYesNo, "客户回访提示") = vbYes Then
                Set Rs = Nothing
                With frmBaiFangJL
                    .Show
                    .TabKh.Tab = 2
                End With

            End If
        End If

        Set Rs = Nothing
        blnCheckHuiFang = False
    End If
End Sub

Private Sub Timer2_Timer()
'Dim id As String
'Dim strtime2 As String
''读取信息
'Set rs = New ADODB.Recordset
'strtime2 = ""
'strtime2 = "select nr,id from yw_xinxi where ydbz='否' and shbz='1' and jieshouren='" & user & "'"
'rs.Open strtime2, conn
'If Not rs.EOF Then
'    rs.MoveFirst
'    id = rs.Fields("id").Value
'    MsgBox "" & rs.Fields("nr").Value & "", vbOKOnly + vbInformation, "友情提示"
'
'End If
'
'Set rs = Nothing
'
'
'
'strtime2 = "update yw_xinxi set ydbz='是',shbz='2' where  id='" & id & "'"
'conn.Execute strtime2

End Sub

Private Sub Timer3_Timer()
'Dim strxinxi As String
'Dim strID As String
'Dim strtime3 As String
''读取信息
'Set rs = New ADODB.Recordset
'strtime3 = ""
'strtime3 = "select nr,id,jieshouren from yw_xinxi where shbz='2' and fasongren='" & user & "'"
'rs.Open strtime3, conn
'If Not rs.EOF Then
'    rs.MoveFirst
'    strxinxi = rs.Fields("jieshouren").Value & " 已阅读了您发出的申请!"
'
'    strID = rs.Fields("id").Value
'     MsgBox " " & strxinxi & " ", vbOKOnly + vbInformation, "友情提示"
'End If
''
'Set rs = Nothing
'
'
'strtime3 = "update yw_xinxi set shbz='3' where fasongren='" & user & "' and id='" & strID & "'"
'
'conn.Execute strtime3

End Sub

Private Sub Timer4_Timer()
'Dim id As String
'Dim strtime1 As String
''读取信息
'Set rs = New ADODB.Recordset
'strtime1 = ""
'strtime1 = "select nr,id from yw_xinxi where shbz='4' and jieshouren='" & user & "'"
'rs.Open strtime1, conn
'If Not rs.EOF Then
'    rs.MoveFirst
'    id = rs.Fields("id").Value
'    MsgBox "" & rs.Fields("nr").Value & "", vbOKOnly + vbInformation, "友情提示"
'
'End If
'
'Set rs = Nothing
'
'
'
'strtime1 = "update yw_xinxi set shbz='5' where id='" & id & "'"
'conn.Execute strtime1

End Sub

Private Sub zhuangtai_Click()
    If user = "张晓华" Then
        frmzhuangtaixg.Show
    Else
        MsgBox "你没有权限使用此功能，请与系统管理员联系！", vbOKOnly + vbInformation, "提示"
    End If
End Sub

Private Sub zwssry_Click()
'    frmzaiwairy.Show
End Sub

Private Sub mnutuichu_Click()
    If MsgBox("确定退出吗？", vbYesNo, "提示框") = vbYes Then
        Unload Me
    Else
    End If
End Sub

Private Sub mnuweiticl_Click()
    frmwenticl.Show
    'frmwenticl.Height = 8610
    'frmwenticl.Width = 13140
End Sub

Private Sub mnuwentifx_Click()
    frmwentilb.Show
End Sub

Private Sub mnuwentilr_Click()
    frmwentily.Show
End Sub

Private Sub ssry_Click()
    frmzaiwairy.Show
End Sub

Private Sub xg_Click()
    frmxiougaimm.Show
End Sub

Private Sub mnuyiyuanmc_Click()
'frmyiyuanmc.Show
End Sub



Private Sub yhgl_Click()
    frmyonghugl.Show
End Sub

Private Sub moban_Click()
    frmmoban.Show
End Sub





Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
    Dim X As Integer
    Select Case Button.key
    Case "连接设置"
        frmshujvlj.Show
    Case "问题录入"
        frmwentily.Show
    Case "问题处理"
        frmwenticl.Show
        '    frmwenticl.Height = 8610
        '    frmwenticl.Width = 13140
    Case "问题测试"
        frmwentics.Show
    Case "修改状态"
        frmyixgcx.Show
    Case "退出"
        If MsgBox("确定要退出吗？", vbYesNo + vbInformation, "提示框") = vbYes Then
            End
        End If
    Case "升级日志"
        frmshengjirz.Show
    Case "效率分析"
        frmxiaolvfx.Show
    Case "测试状态"
        frmsystem.Show
        frmcheshizt.Show
    Case "问题讨论"
        frmdaitaolunwt.Show
    Case "计划时间"
        frmxgsj1.Show
    End Select
End Sub



Private Sub 测试状态分析_Click()
    frmcheshizt.Show
End Sub

Private Sub 问题讨论_Click()
    frmdaitaolunwt.Show
End Sub

Private Sub 问题修改分析_Click()
    frmyixgcx.Show
End Sub

Private Sub 修改效率分析_Click()
    frmxiaolvfx.Show
End Sub
