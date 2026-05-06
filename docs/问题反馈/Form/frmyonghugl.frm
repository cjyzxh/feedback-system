VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmyonghugl 
   Caption         =   "用户管理"
   ClientHeight    =   5910
   ClientLeft      =   4920
   ClientTop       =   3525
   ClientWidth     =   8115
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   5910
   ScaleWidth      =   8115
   Begin VB.ComboBox CboQuanXian2 
      Height          =   300
      ItemData        =   "frmyonghugl.frx":0000
      Left            =   2640
      List            =   "frmyonghugl.frx":000A
      TabIndex        =   25
      Top             =   1320
      Width           =   1095
   End
   Begin VB.ComboBox cbozhuangtai 
      Height          =   300
      ItemData        =   "frmyonghugl.frx":0022
      Left            =   4560
      List            =   "frmyonghugl.frx":002C
      Style           =   2  'Dropdown List
      TabIndex        =   22
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "查 询"
      Height          =   375
      Left            =   120
      TabIndex        =   21
      Top             =   5160
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "删 除"
      Height          =   375
      Left            =   3960
      TabIndex        =   20
      Top             =   5160
      Width           =   855
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Height          =   135
      Left            =   2760
      TabIndex        =   19
      Top             =   3240
      Width           =   30
      _ExtentX        =   53
      _ExtentY        =   238
      _Version        =   393216
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "清空"
      Height          =   375
      Left            =   3000
      TabIndex        =   18
      Top             =   5160
      Width           =   855
   End
   Begin VB.TextBox txtdaima 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   720
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   840
      Width           =   615
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mshliebiao 
      Height          =   3135
      Left            =   240
      TabIndex        =   16
      Top             =   1800
      Width           =   7695
      _ExtentX        =   13573
      _ExtentY        =   5530
      _Version        =   393216
      Cols            =   1
      FixedCols       =   0
      SelectionMode   =   1
      AllowUserResizing=   3
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin VB.CommandButton cmdtuichu 
      Cancel          =   -1  'True
      Caption         =   "退 出"
      Height          =   375
      Left            =   4920
      TabIndex        =   15
      Top             =   5160
      Width           =   855
   End
   Begin VB.ComboBox cboxingbie 
      Height          =   300
      ItemData        =   "frmyonghugl.frx":0036
      Left            =   3960
      List            =   "frmyonghugl.frx":0040
      Style           =   2  'Dropdown List
      TabIndex        =   14
      Top             =   825
      Width           =   975
   End
   Begin VB.ComboBox cboquanxian 
      Height          =   300
      ItemData        =   "frmyonghugl.frx":004C
      Left            =   720
      List            =   "frmyonghugl.frx":0056
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   1320
      Width           =   1095
   End
   Begin VB.CommandButton cmdzj 
      Caption         =   "增加"
      Height          =   375
      Left            =   1080
      TabIndex        =   12
      Top             =   5160
      Width           =   855
   End
   Begin VB.CommandButton cmdxiougai 
      Caption         =   "修 改"
      Height          =   375
      Left            =   5880
      TabIndex        =   11
      Top             =   5160
      Width           =   855
   End
   Begin VB.CommandButton cmdbaocun 
      Caption         =   "保 存"
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   5160
      Width           =   855
   End
   Begin VB.TextBox Text6 
      Appearance      =   0  'Flat
      Height          =   270
      IMEMode         =   3  'DISABLE
      Left            =   6960
      PasswordChar    =   "*"
      TabIndex        =   9
      Top             =   840
      Width           =   975
   End
   Begin VB.TextBox txtnianling 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   5640
      TabIndex        =   6
      Top             =   848
      Width           =   615
   End
   Begin VB.TextBox txtxingming 
      Appearance      =   0  'Flat
      Height          =   270
      Left            =   2040
      TabIndex        =   3
      Top             =   840
      Width           =   1095
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "权限2"
      Height          =   180
      Left            =   2040
      TabIndex        =   24
      Top             =   1380
      Width           =   450
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "状 态"
      Height          =   180
      Left            =   3960
      TabIndex        =   23
      Top             =   1380
      Width           =   450
   End
   Begin VB.Label labdaima 
      AutoSize        =   -1  'True
      Caption         =   "代 码"
      Height          =   180
      Left            =   240
      TabIndex        =   17
      Top             =   885
      Width           =   450
   End
   Begin VB.Label labmima 
      AutoSize        =   -1  'True
      Caption         =   "密 码"
      Height          =   180
      Left            =   6480
      TabIndex        =   8
      Top             =   885
      Width           =   450
   End
   Begin VB.Label labquanxian 
      AutoSize        =   -1  'True
      Caption         =   "权 限"
      Height          =   180
      Left            =   240
      TabIndex        =   7
      Top             =   1380
      Width           =   450
   End
   Begin VB.Label labnianling 
      AutoSize        =   -1  'True
      Caption         =   "年 龄"
      Height          =   180
      Left            =   5160
      TabIndex        =   5
      Top             =   885
      Width           =   450
   End
   Begin VB.Label labxingbie 
      AutoSize        =   -1  'True
      Caption         =   "性 别"
      Height          =   180
      Left            =   3360
      TabIndex        =   4
      Top             =   885
      Width           =   450
   End
   Begin VB.Label labxingming 
      AutoSize        =   -1  'True
      Caption         =   "姓 名"
      Height          =   180
      Left            =   1560
      TabIndex        =   2
      Top             =   885
      Width           =   450
   End
   Begin VB.Label labyonghubq 
      AutoSize        =   -1  'True
      Caption         =   "用 户 管 理 设 置"
      BeginProperty Font 
         Name            =   "隶书"
         Size            =   14.25
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2760
      TabIndex        =   0
      Top             =   240
      Width           =   2715
   End
End
Attribute VB_Name = "frmyonghugl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private rs As New ADODB.Recordset

Private Sub cboquanxian_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And cboquanxian.Text <> "" Then
      cmdzj.SetFocus
    End If
End Sub

Private Sub cboxingbie_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And cboxingbie.Text <> "" Then
  txtnianling.SetFocus
End If
End Sub

'Private Sub cbozhuangtai_Click()            '使权限值与状态值对应
'    If cbozhuangtai.Text = 2 Then
'        cboquanxian.Text = "销售人员"
'    ElseIf cbozhuangtai.Text = 3 Then
'        cboquanxian.Text = "销售经理"
'    End If
'End Sub

Private Sub cmdbaocun_Click()                                           '新增记录
'    If Len(txtdaima) = 0 Then
'        MsgBox "代码不能为空", vbInformation, "提示"
'        Exit Sub
'    ElseIf Len(Text6) = 0 Then
'        MsgBox "密码不能为空", vbInformation, "提示"
'        Exit Sub
'    ElseIf Len(txtxingming) = 0 Then
'        MsgBox "姓名不能为空", vbInformation, "提示"
'        Exit Sub
'    End If
'
'    rs.Open "select daima from [user] where daima='" & Trim(txtdaima.Text) & "'", conn
'    If Not rs.EOF Then
'        MsgBox "已经有该代码,请从新录入...", vbInformation, "提示"
'        rs.Close
'        Exit Sub
'    End If
'    rs.Close
    Dim brow As Integer
    Set rs = Nothing
    
    For brow = 1 To mshliebiao.Rows - 1
        str = "insert into [user](daima,usename,pym,xingbie,nianling,pwd,quxian,quxian2,zhuangtai) values('" & _
            Trim(mshliebiao.TextMatrix(brow, 0)) & "','" & Trim(mshliebiao.TextMatrix(brow, 1)) & "','" & _
            Null & "','" & Trim(mshliebiao.TextMatrix(brow, 2)) & "','" & Trim(mshliebiao.TextMatrix(brow, 3)) & "','" & _
            Trim(mshliebiao.TextMatrix(brow, 4)) & "','" & Trim(mshliebiao.TextMatrix(brow, 5)) & "',convert(varbinary(20),'" & _
            Encode(Trim(mshliebiao.TextMatrix(brow, 6))) & "'),'" & Trim(mshliebiao.TextMatrix(brow, 7)) & "') "
        rs.Open str, conn
    Next brow
    
    MsgBox "记录添加成功", vbOKOnly, "提示"
    
    Set rs = Nothing
    Call clears
'    mshliebiao.Clear
'    mshliebiao.Rows = 2
End Sub

Private Sub cmdchaxun_Click()
'    Call FormatGrid
    str = "select ID AS '序列号',usename as '用户名', pym as '拼音码', xingbie as '性别', nianling as 年龄, quxian as '权限',daima as '代码'   from [user] where usename='" & txtxingming.Text & " '"
    rs.Open str, conn
    Set mshliebiao.DataSource = rs
    Set rs = Nothing
End Sub

Private Sub cmdClear_Click()
'    Call ClearText
'    txtxingming.Text = ""
'    cboxingbie.ListIndex = -1
'    Text6.Text = ""
'    mshliebiao.Clear
'    mshliebiao.Rows = 2
'    cmdzj.Enabled = True
'    cmdbaocun.Enabled = True
    Call clears
End Sub

Private Sub cmdtuichu_Click()
    Unload Me
End Sub

Private Sub cmdxiougai_Click()                  '修 改
'    str = "update [user] set usename='" & Trim(txtxingming.Text) & "',pym='" & txtpingyingm.Text & "',nianling='" & txtnianling.Text & "'where daima='" & txtdaima.Text & "'"
    
'    If Len(Text6.Text) < 6 Then
'        MsgBox "密码长度不能小于6位", vbOKOnly + vbInformation, "提示"
'        Exit Sub
'    End If
    If Trim(txtdaima.Text) = "" Then
        MsgBox "请选择要修改的用户"
        Exit Sub
    End If
    
    If Trim(cboquanxian.Text) = "" Then
        MsgBox "请选择用户权限"
        cboquanxian.SetFocus
        Exit Sub
    End If
    
'    If cbozhuangtai.Text = "" Then
'        MsgBox "请选择状态，1为在职，0为离职", vbOKOnly + vbInformation, "提示"   '，2为销售人员，3为销售经理
'        cbozhuangtai.SetFocus
'        Exit Sub
'    End If
    
    If Trim(CboQuanXian2.Text) = "销售经理" Then
        If MsgBox("确定要将当前用户的权限2设置为销售经理吗？" & vbCrLf & vbCrLf & "注意：销售经理具有浏览一切销售人员的销售记录的权限！", vbQuestion + vbYesNo) = vbNo Then
            CboQuanXian2.SetFocus
            Exit Sub
        End If
    End If
    
    str = "update [user] set usename='" & Trim(txtxingming.Text) & "',xingbie='" & cboxingbie.Text & "',nianling='" & txtnianling.Text & "'," & _
        "quxian='" & cboquanxian.Text & "',quxian2=convert(varbinary(20),'" & Encode(CboQuanXian2.Text) & "')" & _
        "where daima='" & txtdaima.Text & "'"
    
    Set rs = Nothing
    rs.Open str, conn
    MsgBox "记录修改成功", vbOKOnly, "提示"
    Set rs = Nothing
End Sub

Private Sub cmdzj_Click()
    Dim brow As Integer
    
    If Trim(cboquanxian.Text) = "" Then
        MsgBox "请选择用户权限"
        cboquanxian.SetFocus
        Exit Sub
    End If
    
    If cbozhuangtai.Text = "" Then
        MsgBox "请选择状态，1为在职，0为离职", vbOKOnly + vbInformation, "提示"   '，2为销售人员，3为销售经理
        cbozhuangtai.SetFocus
        Exit Sub
    End If
    
    If mshliebiao.TextMatrix(1, 1) <> "" Then
        mshliebiao.Rows = mshliebiao.Rows + 1
    End If
    
    If Len(Text6.Text) < 6 Then
        MsgBox "密码长度不能小于6位", vbOKOnly + vbInformation, "提示"
        Exit Sub
    End If
    
    Text6.Text = cipher(Text6.Text)   '加密
    '网格的行号等于当前最大行 -1
    brow = mshliebiao.Rows - 1
                      
    With mshliebiao
        .Cols = 8
        .TextMatrix(brow, 0) = Trim(txtdaima.Text)              '代码
        .TextMatrix(brow, 1) = Trim(txtxingming.Text)           '姓名
        .TextMatrix(brow, 2) = Trim(cboxingbie.Text)            '姓别
        .TextMatrix(brow, 3) = Trim(txtnianling.Text)           '年龄
        .TextMatrix(brow, 4) = Trim(Text6.Text)                 '年龄
        .TextMatrix(brow, 5) = Trim(cboquanxian.Text)           '权限
        .TextMatrix(brow, 6) = Trim(CboQuanXian2.Text)          '权限2
        .TextMatrix(brow, 7) = Trim(cbozhuangtai.Text)          '状态
    End With
    
'    txtdaima.Text = txtdaima.Text + 1
'    Call clears
End Sub
Private Sub clears()
    On Error Resume Next
    
    txtxingming.Text = ""
    cboxingbie.ListIndex = -1
    txtnianling.Text = ""
    Text6.Text = ""
    cboquanxian.ListIndex = -1
    CboQuanXian2.Text = ""
    cbozhuangtai.ListIndex = -1

    mshliebiao.Clear
    mshliebiao.Rows = 2
    cmdzj.Enabled = True
    cmdbaocun.Enabled = True
    
    Set rs = Nothing
    rs.Open "select isnull(max(daima),1) as daima from [user]", conn, adOpenStatic
    txtdaima.Text = rs("daima").Value + 1
    txtxingming.SetFocus
End Sub

Private Sub Command1_Click()
If MsgBox("确定要删除吗？", vbYesNo + vbQuestion, "提示") = vbYes And mshliebiao.TextMatrix(mshliebiao.row, 0) <> "" Then
'    str = "select yiyuanmc from yw_wentilb where yiyuanmc='" & Trim(mshliebiao.TextMatrix(mshliebiao.row, 1)) & "'"
'    Set rs = conn.Execute(str)
'    If rs.EOF Then
        str = "delete from [user] where daima='" & Trim(mshliebiao.TextMatrix(mshliebiao.row, 0)) & "'"
        Set rs = conn.Execute(str)
        MsgBox "删除成功！", vbOKOnly + vbQuestion, "提示"
        Call Command2_Click
'    Else
'        MsgBox "数据已被引用不能删除！", vbOKOnly + vbQuestion, "提示"
'    End If

End If
End Sub

Private Sub Command2_Click()                            '查 询
    str = ""
    str = "select daima as '代码',usename as '姓名',xingbie as '性别',nianling as '年龄',quxian as '权限',isnull(convert(varchar(20),quxian2),'') as '权限2',zhuangtai  as '状态' from [user] where 1=1"
    
    If cboquanxian.Text <> "" Then
        str = str & " and  quxian='" & Trim(cboquanxian.Text) & "'"
    End If
    If cbozhuangtai.Text <> "" Then
        str = str & " and zhuangtai='" & Trim(cbozhuangtai.Text) & "'"
    End If
    Set mshliebiao.DataSource = conn.Execute(str)
    
    '对权限2进行解密
    Dim lngRow As Long
    
    With mshliebiao
        For lngRow = 1 To .Rows - 1
            .TextMatrix(lngRow, 5) = Decode(.TextMatrix(lngRow, 5))
        Next lngRow
    End With
    
    cmdzj.Enabled = False
    cmdbaocun.Enabled = False
End Sub

Private Sub Form_Load()
Me.Width = 8235 '6400
Me.Height = 6500
Me.Top = 1800
Me.Left = 5000

With mshliebiao
    .Cols = 7
    .TextMatrix(0, 0) = "代码"
    .TextMatrix(0, 1) = "姓名"
    .TextMatrix(0, 2) = "性别"
    .TextMatrix(0, 3) = "年龄"
    .TextMatrix(0, 4) = "权限"
    .TextMatrix(0, 5) = "权限2"
    .TextMatrix(0, 6) = "密码"
End With

'加载流水号
Set rs = Nothing
rs.Open "select max(daima) as lsh from [user]", conn
    If Not rs.EOF Then
        txtdaima.Text = rs.Fields("lsh").Value + 1
    End If
Set rs = Nothing
'str = "select ID AS '序列号',usename as '用户名', pym as '拼音码', xingbie as '性别', nianling as 年龄, quxian as '权限',daima as '代码'   from [user]"
'    rs.Open str, conn
'    Set mshliebiao.DataSource = rs
'    Set rs = Nothing
    '确定修改按钮的可见性
    If user = "张晓华" Then
        cmdxiougai.Visible = True
    Else
        cmdxiougai.Visible = False
    End If
End Sub

Private Sub mshliebiao_Click()
    On Error Resume Next
    
    txtdaima.Text = mshliebiao.TextMatrix(mshliebiao.row, 0)
    txtxingming.Text = mshliebiao.TextMatrix(mshliebiao.row, 1)
    cboxingbie.Text = mshliebiao.TextMatrix(mshliebiao.row, 2)
    txtnianling.Text = mshliebiao.TextMatrix(mshliebiao.row, 3)
    cboquanxian.Text = mshliebiao.TextMatrix(mshliebiao.row, 4)
    CboQuanXian2.Text = mshliebiao.TextMatrix(mshliebiao.row, 5)
    cbozhuangtai.Text = mshliebiao.TextMatrix(mshliebiao.row, 6)
End Sub

Private Sub Text6_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And Text6.Text <> "" Then
  cmdzj.SetFocus
End If
End Sub

Private Sub txtdaima_Change()
If KeyCode = 13 And txtdaima.Text <> "" Then
  txtxingming.SetFocus
End If
End Sub



Private Sub txtdaima_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtdaima.Text <> "" Then
  txtxingming.SetFocus
End If
End Sub

Private Sub txtnianling_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtnianling.Text <> "" Then
  cboquanxian.SetFocus
End If
End Sub

Private Sub txtpingyingm_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 And txtpingyingm.Text <> "" Then
  cboxingbie.SetFocus
End If
End Sub

''格式化网格
'Private Sub FormatGrid()
'    mshliebiao.Cols = 6
'    mshliebiao.TextMatrix(0, 0) = "用户名"
'    mshliebiao.TextMatrix(0, 1) = "拼音码"
'    mshliebiao.TextMatrix(0, 2) = "性别"
'    mshliebiao.TextMatrix(0, 3) = "年龄"
'    mshliebiao.TextMatrix(0, 4) = "权限"
'    mshliebiao.TextMatrix(0, 5) = "密码"
'    mshliebiao.ColWidth(0) = 1000
'
'End Sub

'清空
Private Sub ClearText()
    Dim contro As Control
    For Each contro In frmyonghugl.Controls
        If (TypeOf contro Is TextBox) Then
            contro.Text = ""
        ElseIf (TypeOf contro Is ComboBox) Then
            contro.ListIndex = -1
        End If
    Next
End Sub

Private Sub txtxingming_KeyDown(KeyCode As Integer, Shift As Integer)
If txtxingming.Text <> "" And KeyCode = 13 Then
    cboxingbie.SetFocus
End If
End Sub
