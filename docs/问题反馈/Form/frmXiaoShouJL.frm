VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Begin VB.Form frmXiaoShouJL 
   Caption         =   "软件销售管理"
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
   Begin VB.TextBox txtKhxx 
      Height          =   1275
      Index           =   5
      Left            =   1080
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   41
      Top             =   2400
      Width           =   9375
   End
   Begin MSComctlLib.ListView lstMoKuai 
      Height          =   3795
      Left            =   300
      TabIndex        =   30
      Top             =   4560
      Visible         =   0   'False
      Width           =   5835
      _ExtentX        =   10292
      _ExtentY        =   6694
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   0   'False
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.TextBox txtKhxx 
      Height          =   1275
      Index           =   8
      Left            =   6240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Top             =   3960
      Width           =   5475
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MshGrid 
      Height          =   3795
      Left            =   240
      TabIndex        =   34
      Top             =   3960
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   6694
      _Version        =   393216
      Rows            =   0
      Cols            =   24
      FixedRows       =   0
      FixedCols       =   0
      FillStyle       =   1
      AllowUserResizing=   1
      FormatString    =   $"frmXiaoShouJL.frx":0000
      _NumberOfBands  =   1
      _Band(0).Cols   =   24
      _Band(0).GridLinesBand=   1
      _Band(0).TextStyleBand=   0
      _Band(0).TextStyleHeader=   0
      _Band(0).ColHeader=   1
   End
   Begin VB.Frame fmKhxx 
      Caption         =   "客户信息"
      Height          =   9465
      Left            =   120
      TabIndex        =   15
      Top             =   120
      Width           =   11745
      Begin mycmd.MyCommand cmddc 
         Height          =   375
         Left            =   7380
         TabIndex        =   53
         Top             =   8760
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         Caption         =   "导出数据至XLS"
      End
      Begin VB.TextBox Text2 
         Height          =   495
         Left            =   240
         TabIndex        =   50
         Text            =   "Text2"
         Top             =   2040
         Visible         =   0   'False
         Width           =   255
      End
      Begin VB.TextBox txtKhxx 
         Height          =   735
         Index           =   9
         Left            =   960
         TabIndex        =   45
         Top             =   1440
         Width           =   10575
      End
      Begin VB.CheckBox ChkALL 
         Caption         =   "全部客户记录"
         Height          =   255
         Left            =   240
         TabIndex        =   43
         Top             =   8880
         Visible         =   0   'False
         Width           =   1455
      End
      Begin VB.CommandButton ok 
         BackColor       =   &H00FFFFC0&
         Caption         =   "模块确认"
         Height          =   375
         Left            =   10680
         MaskColor       =   &H00FFFFC0&
         TabIndex        =   40
         Top             =   3360
         UseMaskColor    =   -1  'True
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Height          =   270
         Left            =   8160
         TabIndex        =   39
         Text            =   "Text1"
         Top             =   1920
         Visible         =   0   'False
         Width           =   855
      End
      Begin VB.TextBox txtKhxx 
         Height          =   795
         Index           =   7
         Left            =   6120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   38
         Top             =   6840
         Width           =   5475
      End
      Begin VB.TextBox txtKhxx 
         Height          =   1155
         Index           =   4
         Left            =   6120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   37
         Top             =   5400
         Width           =   5475
      End
      Begin VB.CommandButton CmdTuiChu 
         Caption         =   "退出"
         Height          =   405
         Left            =   5760
         TabIndex        =   36
         Top             =   8760
         Width           =   1095
      End
      Begin VB.CommandButton btnSearch 
         Caption         =   "查 询"
         Height          =   405
         Left            =   1800
         TabIndex        =   32
         Top             =   8760
         Width           =   1095
      End
      Begin MSComCtl2.DTPicker DtpTime 
         Height          =   315
         Left            =   3960
         TabIndex        =   31
         Top             =   1020
         Width           =   1845
         _ExtentX        =   3254
         _ExtentY        =   556
         _Version        =   393216
         Format          =   112656385
         CurrentDate     =   39948
      End
      Begin VB.CommandButton btnModify 
         Caption         =   "修 改"
         Enabled         =   0   'False
         Height          =   405
         Left            =   4440
         TabIndex        =   14
         Top             =   8760
         Width           =   1095
      End
      Begin VB.CommandButton btnNew 
         Caption         =   "保 存"
         Height          =   405
         Left            =   3120
         TabIndex        =   13
         Top             =   8760
         Width           =   1095
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   8
         Left            =   900
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   8025
         Width           =   2055
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   7
         Left            =   4290
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   8025
         Width           =   2295
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   6
         Left            =   6480
         TabIndex        =   10
         Top             =   960
         Width           =   1905
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   5
         Left            =   9240
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   1080
         Width           =   2295
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   3
         Left            =   900
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   660
         Width           =   2055
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   3
         Left            =   9240
         TabIndex        =   6
         Top             =   660
         Width           =   2295
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   2
         Left            =   900
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   1020
         Width           =   2055
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   2
         Left            =   6480
         TabIndex        =   5
         Top             =   660
         Width           =   1875
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   1
         Left            =   3960
         TabIndex        =   4
         Top             =   660
         Width           =   1875
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   1
         ItemData        =   "frmXiaoShouJL.frx":00C3
         Left            =   900
         List            =   "frmXiaoShouJL.frx":00C5
         TabIndex        =   0
         Top             =   270
         Width           =   2055
      End
      Begin VB.TextBox txtKhxx 
         Height          =   315
         Index           =   0
         Left            =   9240
         TabIndex        =   2
         Top             =   270
         Width           =   2295
      End
      Begin VB.ComboBox cboKhxx 
         Height          =   300
         Index           =   0
         Left            =   3960
         TabIndex        =   1
         Top             =   270
         Width           =   4395
      End
      Begin VB.TextBox txtKhbm 
         Height          =   255
         Left            =   7440
         TabIndex        =   33
         Top             =   1920
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "清空界面请按ESC键"
         BeginProperty Font 
            Name            =   "隶书"
            Size            =   15
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   6960
         TabIndex        =   52
         Top             =   8040
         Width           =   2550
      End
      Begin VB.Label Label5 
         Caption         =   "医院情况"
         Height          =   495
         Left            =   120
         TabIndex        =   49
         Top             =   2880
         Width           =   735
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "CHS所需模块"
         Height          =   180
         Left            =   6240
         TabIndex        =   48
         Top             =   6600
         Width           =   990
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "CRM所需模块"
         Height          =   180
         Left            =   6240
         TabIndex        =   47
         Top             =   5160
         Width           =   990
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "客户列表"
         Height          =   180
         Left            =   240
         TabIndex        =   46
         Top             =   3600
         Width           =   720
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "客户地址"
         Height          =   180
         Left            =   120
         TabIndex        =   44
         Top             =   1680
         Width           =   720
      End
      Begin VB.Label lblkhmc 
         Caption         =   "洽谈进度"
         Height          =   255
         Index           =   20
         Left            =   8400
         TabIndex        =   29
         Top             =   1080
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "区域"
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   28
         Top             =   300
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         AutoSize        =   -1  'True
         Caption         =   "客户转交给"
         Height          =   180
         Index           =   16
         Left            =   3240
         TabIndex        =   27
         Top             =   8085
         Width           =   900
      End
      Begin VB.Label lblkhmc 
         Caption         =   "电话"
         Height          =   255
         Index           =   14
         Left            =   3090
         TabIndex        =   26
         Top             =   690
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "客户性质"
         Height          =   255
         Index           =   13
         Left            =   120
         TabIndex        =   25
         Top             =   690
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "洽谈时间"
         Height          =   255
         Index           =   12
         Left            =   3090
         TabIndex        =   24
         Top             =   1050
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "报价"
         Height          =   255
         Index           =   10
         Left            =   6000
         TabIndex        =   23
         Top             =   1080
         Width           =   495
      End
      Begin VB.Label lblkhmc 
         Caption         =   "传真"
         Height          =   255
         Index           =   9
         Left            =   8490
         TabIndex        =   22
         Top             =   690
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "手机"
         Height          =   255
         Index           =   6
         Left            =   5970
         TabIndex        =   21
         Top             =   690
         Width           =   465
      End
      Begin VB.Label lblkhmc 
         AutoSize        =   -1  'True
         Caption         =   "HIS所需模块"
         Height          =   180
         Index           =   5
         Left            =   6240
         TabIndex        =   20
         Top             =   3600
         Width           =   990
      End
      Begin VB.Label lblkhmc 
         Caption         =   "销售人员"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   19
         Top             =   8055
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "软件名称"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   18
         Top             =   1050
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "负责人"
         Height          =   255
         Index           =   1
         Left            =   8490
         TabIndex        =   17
         Top             =   300
         Width           =   735
      End
      Begin VB.Label lblkhmc 
         Caption         =   "客户名称"
         Height          =   225
         Index           =   0
         Left            =   3090
         TabIndex        =   16
         Top             =   315
         Width           =   825
      End
   End
   Begin MSFlexGridLib.MSFlexGrid FxGridQy 
      Height          =   8415
      Left            =   11880
      TabIndex        =   35
      Top             =   1080
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   14843
      _Version        =   393216
      Rows            =   1
      FixedCols       =   0
      AllowUserResizing=   1
      FormatString    =   "^ 序号 |^               客户名称    "
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "销售部客户档案维护"
      BeginProperty Font 
         Name            =   "华文行楷"
         Size            =   18
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   12000
      TabIndex        =   51
      Top             =   240
      Width           =   3240
   End
   Begin VB.Label lblkhmc 
      AutoSize        =   -1  'True
      Caption         =   "已登记医院列表"
      Height          =   180
      Index           =   3
      Left            =   12000
      TabIndex        =   42
      Top             =   840
      Width           =   1260
   End
End
Attribute VB_Name = "frmXiaoShouJL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'以下API函数用于使组合框控件自动显示下拉列表框
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Const CB_SHOWDROPDOWN = &H14F
Dim strSql As String
Dim i As Integer
'*   名称：OutDataToExcel
  '*   功能：将MsFlexGrid控件中显示的内容输出到Excel表格中进行打印
  '*********************************************************
  Private Sub OutDataToExcel(flex As MSFlexGrid)                 '导出至Excel
          Dim s     As String
          Dim i     As Integer
          Dim J     As Integer
          Dim k     As Integer
          On Error GoTo Ert
          Me.MousePointer = 11
          Dim ExcelApp     As Excel.Application
          Set ExcelApp = New Excel.Application
          On Error Resume Next
          DoEvents
          ExcelApp.SheetsInNewWorkbook = 1
          ExcelApp.Workbooks.Add
          ExcelApp.ActiveSheet.Cells(1, 3) = s
          ExcelApp.Range("C1").Select
          ExcelApp.Selection.Font.FontStyle = "Bold"
          ExcelApp.Selection.Font.Size = 16
          With flex
                  k = .Rows
                  For i = 0 To k - 1
                          For J = 0 To .Cols - 1
                                DoEvents
                                ExcelApp.ActiveSheet.Cells(3 + i, J + 1) = "'" & .TextMatrix(i, J)
                          Next J
                  Next i
          End With
          Me.MousePointer = 0
          ExcelApp.Visible = True
          ExcelApp.Sheets.PrintPreview
Ert:
          If Not (ExcelApp Is Nothing) Then
                  ExcelApp.Quit
          End If
  End Sub


Private Sub btnModify_Click()                           '修改记录
    Dim strSql     As String
    Dim strkhbm    As String
    Dim colUpdate  As New Collection
    Dim lngRow     As Long
    Dim strValue   As String
    Dim strSxmk As String
    
    If FunBlnCheck = False Then
        Exit Sub
    End If
    
    If MsgBox("确定要修改当前客户的资料吗？", vbQuestion + vbYesNo) = vbNo Then
        Exit Sub
    End If
    
    If cboKhxx(7).Text <> cboKhxx(8).Text Then
        If MsgBox("确定要将当前客户转交给" & cboKhxx(7).Text & "吗？", vbQuestion + vbYesNo) = vbNo Then
            Exit Sub
        End If
    End If
    
    Set colUpdate = Nothing
    Set Rs = Nothing
    
    colUpdate.Add " Khmc = '" & Encode(cboKhxx(0).Text) & "'"
    colUpdate.Add " pym='" & conn.Execute("select dbo.fun_getPY('" & Trim(cboKhxx(0).Text) & "')").Fields(0).Value & "'"   '拼音码（客户名称） GetTextFirstLetter(cboKhxx(0).Text)
    colUpdate.Add " Fzr  = '" & Encode(txtKhxx(0).Text) & "'"
    colUpdate.Add " Gddh = '" & Encode(txtKhxx(1).Text) & "'"
    colUpdate.Add " Sj   = '" & Encode(txtKhxx(2).Text) & "'"
    colUpdate.Add " Cz   = '" & Encode(txtKhxx(3).Text) & "'"
'    colUpdate.Add " Qtsj = '" & DtpTime.Value & "'"
    colUpdate.Add " Rjmc = '" & cboKhxx(2).Text & "'"
    colUpdate.Add " Yyqk = '" & Encode(txtKhxx(5).Text) & "'"
    '所需模块
    If Trim(txtKhxx(8).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "HIS模块：" & txtKhxx(8).Text
        Else
            strSxmk = "HIS模块：" & txtKhxx(8).Text
        End If
    End If
    If Trim(txtKhxx(4).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "CRM模块：" & txtKhxx(4).Text
        Else
            strSxmk = "CRM模块：" & txtKhxx(4).Text
        End If
    End If
    If Trim(txtKhxx(7).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "CHS模块：" & txtKhxx(7).Text
        Else
            strSxmk = "CHS模块：" & txtKhxx(7).Text
        End If
    End If
    colUpdate.Add " Sxmk =  '" & strSxmk & "'"                          '所需模块
    colUpdate.Add " Bj   = '" & Encode(txtKhxx(6).Text) & "'"
    colUpdate.Add " Khdz   = '" & Encode(txtKhxx(9).Text) & "'"         '客户地址
'    colUpdate.Add " Sfhs = '" & cboKhxx(6).Text & "'"
'    colUpdate.Add " Swje = '" & txtKhxx(7).Text & "'"
    colUpdate.Add " Xsry = '" & cboKhxx(7).Text & "'"
    colUpdate.Add " Khxz = '" & cboKhxx(3).Text & "'"
'    colUpdate.Add " Khyx = '" & cboKhxx(4).Text & "'"
    colUpdate.Add " Qtjd = '" & cboKhxx(5).Text & "'"
    colUpdate.Add " Qy   = '" & cboKhxx(1).Text & "'"
    colUpdate.Add " Zjbz = '" & IIf(cboKhxx(7).Text <> cboKhxx(8).Text, "是", "否") & "'"   '转交标志
    colUpdate.Add " Zjjsr = '" & cboKhxx(7).Text & "'"
'    colUpdate.Add " Qdsj = '" & Now & "'"
'    colUpdate.Add " Qdr = ''"
'    colUpdate.Add " Jlsj = '" & Now & "'"
'    colUpdate.Add " Jlr = '" & cboKhxx(8).Text & "'"
    
    For lngRow = 1 To colUpdate.Count
        strValue = strValue & colUpdate.Item(lngRow) & ","
    Next
    
    strSql = "UPDATE Khxx SET " & Mid(strValue, 1, Len(strValue) - 1) & " WHERE Khbm='" & txtKhbm.Text & "'"
    
    If Rs.State <> adStateClosed Then
        Rs.Close
    End If
       
    Rs.Open strSql, conn
    MsgBox "信息修改成功"
    
    Set colUpdate = Nothing
    
    Call btnSearch_Click
    Call cboKhxx_LostFocus(1)
    
    If cboKhxx(5).Text = "成交" Then
        If MsgBox("新客户信息保存成功！" & vbCrLf & vbCrLf & "当前业务已经谈成，是否进入下订单业务？", vbQuestion + vbYesNo) = vbYes Then
            With frmdiandan
                .m_strKhbm = txtKhbm.Text           '客户编码
                .Show
            End With
        End If
    End If
End Sub

Private Sub btnNew_Click()                              '添加新记录
    If FunBlnCheck = False Then
        Exit Sub
    End If
    
    '判断该客户名称是否已经存在
    Dim lngRow As Long
    
    str = "select * from Khxx where pym='" & conn.Execute("select dbo.fun_getPY('" & Trim(cboKhxx(0).Text) & "')").Fields(0).Value & "'"   'GetTextFirstLetter(Trim(cboKhxx(0).Text))
    Set Rs = Nothing
    Rs.Open str, conn, adOpenStatic
    If Rs.RecordCount > 0 Then
        If MsgBox("当前客户 " & cboKhxx(0).Text & " 由销售人员 " & Rs.Fields("xsry").Value & " 于 " & Rs.Fields("qtsj").Value & " 首先接触，您确定要重复添加吗？", vbQuestion + vbYesNo) = vbNo Then
            Exit Sub
        End If
    End If
    
'    With FxGridQy
'        For lngRow = 1 To .Rows - 1
'            If .TextMatrix(lngRow, 1) = Trim(cboKhxx(0).Text) Then
'                Exit For
'            End If
'        Next lngRow
'
'        If lngRow < .Rows Then
'            If MsgBox("当前客户名称已经存在，确定要重复添加吗？", vbQuestion + vbYesNo) = vbNo Then
'                Exit Sub
'            End If
'        End If
'    End With
    
    If cboKhxx(7).Text <> cboKhxx(8).Text Then
        If MsgBox("确定要将当前客户转交给" & cboKhxx(7).Text & "吗？", vbQuestion + vbYesNo) = vbNo Then
            Exit Sub
        End If
    End If
    
    Dim strSql     As String
    Dim strkhbm    As String
    Dim colInsert  As New Collection
    Dim strCaption As String
    Dim strValue   As String
    Dim strTemp()  As String
    Dim strSxmk As String
    
    strkhbm = Format(Now, "yyyyMMddHHmmsss")
    
    Set colInsert = Nothing
    Set Rs = Nothing
    
    colInsert.Add " Khbm = '" & strkhbm & "'"                           '客户编码
    colInsert.Add " Khmc = '" & Encode(Trim(cboKhxx(0).Text)) & "'"     '客户名称
    colInsert.Add " pym='" & conn.Execute("select dbo.fun_getPY('" & Trim(cboKhxx(0).Text) & "')").Fields(0).Value & "'"              '拼音码（客户名称）GetTextFirstLetter(Trim(cboKhxx(0).Text))
    colInsert.Add " Fzr  = '" & Encode(txtKhxx(0).Text) & "'"           '负责人
    colInsert.Add " Gddh = '" & Encode(txtKhxx(1).Text) & "'"           '电话
    colInsert.Add " Sj   = '" & Encode(txtKhxx(2).Text) & "'"           '手机
    colInsert.Add " Cz   = '" & Encode(txtKhxx(3).Text) & "'"           '传真
    colInsert.Add " Qtsj = '" & DtpTime.Value & "'"                     '洽谈时间
    colInsert.Add " Rjmc = '" & cboKhxx(2).Text & "'"                   '软件名称
    colInsert.Add " Yyqk = '" & Encode(txtKhxx(5).Text) & "'"           '医院情况
    '所需模块
    If Trim(txtKhxx(8).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "HIS模块：" & txtKhxx(8).Text
        Else
            strSxmk = "HIS模块：" & txtKhxx(8).Text
        End If
    End If
    If Trim(txtKhxx(4).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "CRM模块：" & txtKhxx(4).Text
        Else
            strSxmk = "CRM模块：" & txtKhxx(4).Text
        End If
    End If
    If Trim(txtKhxx(7).Text) <> "" Then
        If Trim(strSxmk) <> "" Then
            strSxmk = strSxmk & vbCrLf & "CHS模块：" & txtKhxx(7).Text
        Else
            strSxmk = "CHS模块：" & txtKhxx(7).Text
        End If
    End If
    colInsert.Add " Sxmk = '" & strSxmk & "'"                           '所需模块
    colInsert.Add " Bj   = '" & Encode(txtKhxx(6).Text) & "'"           '报价
    colInsert.Add " Khdz = '" & Encode(txtKhxx(9).Text) & "'"           '客户地址
'    colInsert.Add " Sfhs = '" & cboKhxx(6).Text & "'"                   '是否含税
'    colInsert.Add " Swje = '" & txtKhxx(7).Text & "'"                   '发票金额
    colInsert.Add " Xsry = '" & cboKhxx(8).Text & "'"                   '销售人员
    colInsert.Add " Khxz = '" & cboKhxx(3).Text & "'"                   '客户性质
'    colInsert.Add " Khyx = '" & cboKhxx(4).Text & "'"                   '客户意向
    colInsert.Add " Qtjd = '" & cboKhxx(5).Text & "'"                   '洽谈进度
    colInsert.Add " Qy   = '" & cboKhxx(1).Text & "'"                   '区域
    colInsert.Add " Zjbz = '" & IIf(cboKhxx(7).Text <> cboKhxx(8).Text, "是", "否") & "'"   '转交标志
    colInsert.Add " Zjjsr = '" & cboKhxx(7).Text & "'"                  '转交接收人
'    colInsert.Add " Qdsj =null"                                         '签单时间
'    colInsert.Add " Qdr = null"                                         '签单人
    colInsert.Add " Jlsj = '" & Now & "'"                               '记录时间
    colInsert.Add " Jlr = '" & user & "'"                               '记录人=当前登录用户
    
    For lngRow = 1 To colInsert.Count
        strTemp = Split(colInsert.Item(lngRow), "=")
        strCaption = strCaption & Trim(strTemp(0)) & ","
        strValue = strValue & Trim(strTemp(1)) & ","
    Next

    strSql = "INSERT INTO Khxx(" & Mid(strCaption, 1, Len(strCaption) - 1) & ") Values(" & Mid(strValue, 1, Len(strValue) - 1) & ")"
    Rs.Open strSql, conn
    Set colInsert = Nothing
    
    MsgBox "添加新记录成功"
    txtKhbm.Text = strkhbm
    
    Call btnSearch_Click
    Call cboKhxx_LostFocus(1)
    
    If cboKhxx(5).Text = "成交" Then
        If MsgBox("新客户信息保存成功！" & vbCrLf & vbCrLf & "当前业务已经谈成，是否进入下订单业务？", vbQuestion + vbYesNo) = vbYes Then
            With frmdiandan
                .m_strKhbm = txtKhbm.Text           '客户编码
                .Show
            End With
        End If
    End If
End Sub

Private Sub btnSearch_Click()

    Dim strSql As String
    Dim lngRow As Long
    Dim lngCol As Long
    Dim strtiaojian As String           '查询限制条件
    
    
     Me.MshGrid.FocusRect = flexFocusNone
  Me.MshGrid.SelectionMode = flexSelectionByRow
  Me.MshGrid.BackColorSel = 8421631
  
  
'    If user = "张晓华" Or user = "陈鹏" Or user = "张玉达" Or user = "闫洁" Or user = "陈金忠" Or user = "卓志强" Or user = "蒙海胜" Then
'        strTiaoJian = ""
'    Else
'        strTiaoJian = " and Xsry='" & user & "'"  'or Zjjsr='" & user & "'"
'    End If
    If g_strYongHuZT = "3" Then           '销售经理
        If ChkALL.Value = 1 Then                                            '查询全部
            strtiaojian = ""
        Else
            strtiaojian = " and Xsry='" & Trim(cboKhxx(8).Text) & "'"       '查询指定销售人员的客户信息
        End If
    Else    'If g_strYongHuZT = "2" Then       '普通销售人员
        strtiaojian = " and Xsry='" & user & "'"                            '查询当前登录用户的客户信息
    End If
    
'    If Trim(cboKhxx(0).Text) <> "" Then         '客户名称
'        strTiaoJian = strTiaoJian & " and Khmc like '%" & Trim(cboKhxx(0).Text) & "%'"
'    End If
    
'    区域
     If cboKhxx(1).Text <> "" Then

           strtiaojian = strtiaojian & " and qy='" & Trim(cboKhxx(1).Text) & "'"
      End If
    
    strSql = "SELECT Khmc  as '客户名称',Fzr  as '负责人',Gddh  as '电话',Sj  as '手机',Cz  as '传真',Qtsj  as '洽谈时间',Rjmc  as '软件名称'," & _
        "Yyqk  as '医院情况',Sxmk  as '所需模块',Bj  as '报价',Khdz as '客户地址',Sfhs  as '是否含税',Swje  as '税务金额',Xsry  as '销售人员',Khxz  as '客户性质'," & _
        "Khyx  as '客户意向',Qtjd  as '洽谈进度',Qy  as '区域',Zjbz  as '转交标志',Zjjsr  as '转交接收人',Qdsj  as '签单时间',Qdr  as '签单人'," & _
        "Jlsj  as '记录时间',Jlr  as '记录人',Khbm as '客户编码' FROM Khxx where 1=1 and isnull(Qdr,'')=''"
    
    strSql = strSql & strtiaojian & " order by qy"
    
    Set Rs = Nothing
    Rs.Open strSql, conn
    Set MshGrid.DataSource = Rs
    
    If Rs.RecordCount <= 0 Then
        MsgBox "没有找到满足条件的客户信息"
    End If
    
    Set Rs = Nothing
    
    '解密
    With MshGrid
        .ColWidth(23) = 0                               '隐藏“客户编码”
        For lngRow = 1 To .Rows - 1
            For lngCol = 0 To 4
                .TextMatrix(lngRow, lngCol) = Decode(.TextMatrix(lngRow, lngCol))           '客户名称、负责人、电话、手机、传真
            Next lngCol
            .TextMatrix(lngRow, 7) = Decode(.TextMatrix(lngRow, 7))                         '医院情况
            .TextMatrix(lngRow, 9) = Decode(.TextMatrix(lngRow, 9))                         '报价
            .TextMatrix(lngRow, 10) = Decode(.TextMatrix(lngRow, 10))                       '客户地址
        Next lngRow
    End With
    
    MshGrid.ColWidth(0) = 2000
End Sub

Private Sub cboKhxx_Change(Index As Integer)
    If Index = 1 Then           '区域
        Call cboKhxx_LostFocus(1)
    End If
    
   
End Sub

Private Sub cboKhxx_GotFocus(Index As Integer)
    'CB_SHOWDROPDOWN
    'wParam = (WPARAM) (BOOL) fShow;     // the show/hide flag
    'lParam = 0;                         // not used; must be zero
    
    If Index = 0 Then           '客户名称
        If cboKhxx(0).ListCount > 0 Then
            SendMessage cboKhxx(Index).hwnd, CB_SHOWDROPDOWN, -1, -1
        End If
    End If
End Sub

Private Sub cboKhxx_LostFocus(Index As Integer)
    If Index = 1 Then           '区域
        Dim strqy As String
        Dim strkhmc As String
        
        strqy = Trim(cboKhxx(Index).Text)
        strkhmc = Trim(cboKhxx(0).Text)
        
        '清除原有记录
        FxGridQy.Rows = 1       '区域客户名称列表
        cboKhxx(0).Clear        '客户名称
        cboKhxx(0).Text = strkhmc
        
        '查询该区域的所有客户名称
        strSql = "select khbm,Khmc from Khxx where Qy='" & strqy & "' and isnull(Qdr,'')=''"
        Set Rs = Nothing
        Rs.Open strSql, conn, adOpenStatic
        
        If Rs.RecordCount > 0 Then
            With FxGridQy
'                .ColWidth(2) = 0
                Do While Not Rs.EOF
                    .Rows = .Rows + 1
                    .TextMatrix(.Rows - 1, 0) = .Rows - 1
                    .TextMatrix(.Rows - 1, 1) = Decode(Rs("Khmc").Value)
'                    .TextMatrix(.Rows - 1, 2) = rs("khbm").Value
                    cboKhxx(0).AddItem .TextMatrix(.Rows - 1, 1)
                    Rs.MoveNext
                Loop
            End With
        End If
        Set Rs = Nothing
    End If
End Sub


'*   名称：OutDataToExcel
  '*   功能：将MsFlexGrid控件中显示的内容输出到Excel表格中进行打印
  '*********************************************************
  Private Sub cmddc_Click()                 '导出至Excel
          Dim s     As String
          Dim i     As Integer
          Dim J     As Integer
          Dim k     As Integer
          Dim flex As MSFlexGrid
   
          On Error GoTo Ert
          Me.MousePointer = 11
          Dim ExcelApp     As Excel.Application
          Set ExcelApp = New Excel.Application
          On Error Resume Next
          DoEvents
          ExcelApp.SheetsInNewWorkbook = 1
          ExcelApp.Workbooks.Add
          ExcelApp.ActiveSheet.Cells(1, 3) = s
          ExcelApp.Range("C1").Select
          ExcelApp.Selection.Font.FontStyle = "Bold"
          ExcelApp.Selection.Font.Size = 16
          With flex
                  k = MshGrid.Rows
                  For i = 0 To k - 1
                          For J = 0 To MshGrid.Cols - 1
                                DoEvents
                                ExcelApp.ActiveSheet.Cells(3 + i, J + 1) = "'" & MshGrid.TextMatrix(i, J)
                          Next J
                  Next i
          End With
          Me.MousePointer = 0
          ExcelApp.Visible = True
          ExcelApp.Sheets.PrintPreview
Ert:
          If Not (ExcelApp Is Nothing) Then
                  ExcelApp.Quit
          End If
    
  


End Sub

Private Sub cmdtuichu_Click()               '退出
    Unload Me
End Sub



Private Sub Form_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        SendKeys "{Tab}"        '敲的是回车键，使下一个控件获得焦点
    ElseIf KeyAscii = vbKeyEscape Then
        If MsgBox("确定要清除当前客户信息吗？", vbQuestion + vbYesNo) = vbYes Then
            Dim TmpCtrl As Control
            
            For Each TmpCtrl In Me
                If TypeOf TmpCtrl Is TextBox Then
                    TmpCtrl.Text = ""
                End If
                
                If TypeOf TmpCtrl Is ComboBox Then
                    TmpCtrl.ListIndex = -1
                End If
                
                If (TypeOf TmpCtrl Is MSHFlexGrid) Or (TypeOf TmpCtrl Is MSFlexGrid) Then
                    TmpCtrl.Rows = 1
                End If
            Next
            
            lstMoKuai.ListItems.Clear
            lstMoKuai.Visible = False
            
            DtpTime.Value = Now()
            cboKhxx(7).Text = user
            cboKhxx(8).Text = user
            cboKhxx(0).Text = ""
            cboKhxx(1).Text = ""
        End If
    End If
End Sub

Private Sub Form_Load()
    
    Dim strSql   As String
    Dim i As Integer
'
'            strSql = "select mokuai  from xt_mokuai where xt='his' order by mokuai"
'            Set rs = Nothing
'            rs.Open strSql, conn
'
'            If rs.RecordCount > 0 Then
'                For I = 1 To rs.RecordCount
'                    lstMoKuai.ListItems.Add I, "mk" & I, rs("mokuai")
'                    rs.MoveNext
'                Next I
'            End If
'
'            Set rs = Nothing
    
'    lstMoKuai.ListItems.Add 1, "lvMenZhenGL", "门诊管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL2", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL3", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL4", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL5", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL6", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL7", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL8", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL9", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL10", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL11", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL12", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL13", "住院管理"
'    lstMoKuai.ListItems.Add 2, "lvZhuYuanGL14", "住院管理"
    
    strSql = "select usename,isnull(convert(varchar(20),quxian2),'') as quxian2 from [user] where 1=1 and zhuangtai='1'"
    
    Call BindComboBoxData(cboKhxx(7), strSql, "usename")            '转交接收人
    Call BindComboBoxData(cboKhxx(8), strSql, "usename")            '销售人员
    
    Call BindCbo(cboKhxx(1), "区域")
    Call BindCbo(cboKhxx(2), "软件名称")
    Call BindCbo(cboKhxx(3), "客户性质")
'    Call BindCbo(cboKhxx(4), "客户意向")
    Call BindCbo(cboKhxx(5), "洽谈进度")
    
    DtpTime.Value = Now
    
    On Error Resume Next
    
    cboKhxx(7).Text = user              '默认：转交人=登录用户
    cboKhxx(8).Text = user              '默认：销售人员=登录用户
    
    '分配权限
'    g_strYongHuZT = "3"
    If g_strYongHuZT = "3" Then                   '销售经理
        cboKhxx(8).Enabled = True
        ChkALL.Visible = True
    Else    'If g_strYongHuZT = "2" Then                       '普通销售人员
        cboKhxx(8).Enabled = False
        ChkALL.Visible = False
    End If
    
    'MshGrid.FormatString = "客户名称|负责人|电话|手机|传真|洽谈时间|软件名称|医院情况|所需模块|报价|是否含税|税务金额|销售人员|客户性质|客户意向|洽谈进度|区域|转交标志|转交接收人|签单时间|签单人|记录时间|记录人"
End Sub

Private Sub lstMoKuai_LostFocus()
    Dim lngItem  As Long
If Text1.Text = 1 Then
    txtKhxx(8).Text = ""
    For lngItem = 1 To lstMoKuai.ListItems.Count
        If lstMoKuai.ListItems(lngItem).Checked = True Then
            txtKhxx(8).Text = txtKhxx(8).Text & "■" & lstMoKuai.ListItems(lngItem).Text & " "
        End If
    Next
ElseIf Text1.Text = 2 Then
     txtKhxx(4).Text = ""
    For lngItem = 1 To lstMoKuai.ListItems.Count
        If lstMoKuai.ListItems(lngItem).Checked = True Then
            txtKhxx(4).Text = txtKhxx(4).Text & "■" & lstMoKuai.ListItems(lngItem).Text & " "
        End If
    Next
ElseIf Text1.Text = 3 Then
     txtKhxx(7).Text = ""
    For lngItem = 1 To lstMoKuai.ListItems.Count
        If lstMoKuai.ListItems(lngItem).Checked = True Then
            txtKhxx(7).Text = txtKhxx(7).Text & "■" & lstMoKuai.ListItems(lngItem).Text & " "
        End If
    Next
End If
End Sub

Private Sub MshGrid_DblClick()
    Dim lngRow As Long
    Dim strMokuai() As String
    Dim i As Integer
    
    lngRow = MshGrid.row
    
    If lngRow <= 0 Then                             '当前没有可选记录
        Dim TmpCtrol  As Control
        
        For Each TmpCtrol In Me
            If TypeOf TmpCtrol Is TextBox Then
                TmpCtrol.Text = ""
            End If
        Next
        
        btnModify.Enabled = False
        
        Exit Sub
    End If
    txtKhxx(8).Text = ""
     txtKhxx(4).Text = ""
      txtKhxx(7).Text = ""
    '|||||||||||||||||转交标志||签单时间|签单人|记录时间||
    On Error Resume Next
    
    With MshGrid
        cboKhxx(0).Text = .TextMatrix(lngRow, 0)                '客户名称
        txtKhxx(0).Text = .TextMatrix(lngRow, 1)                '负责人
        txtKhxx(1).Text = .TextMatrix(lngRow, 2)                '电话
        txtKhxx(2).Text = .TextMatrix(lngRow, 3)                '手机
        txtKhxx(3).Text = .TextMatrix(lngRow, 4)                '传真
        DtpTime.Value = CDate(.TextMatrix(lngRow, 5))           '洽谈时间
        cboKhxx(2).Text = .TextMatrix(lngRow, 6)                '软件名称
        txtKhxx(5).Text = .TextMatrix(lngRow, 7)                '医院情况
        strMokuai = Split(.TextMatrix(lngRow, 8), vbCrLf)              '所需模块
        If UBound(strMokuai) >= 0 Then
            For i = LBound(strMokuai) To UBound(strMokuai)
                If UCase(Left(strMokuai(i), 3)) = "HIS" Then
                    txtKhxx(8).Text = Mid(strMokuai(i), 7)
                ElseIf UCase(Left(strMokuai(i), 3)) = "CRM" Then
                    txtKhxx(4).Text = Mid(strMokuai(i), 7)
                ElseIf UCase(Left(strMokuai(i), 3)) = "CHS" Then
                    txtKhxx(7).Text = Mid(strMokuai(i), 7)
                End If
            Next i
        End If
        txtKhxx(6).Text = .TextMatrix(lngRow, 9)                '报价
        txtKhxx(9).Text = .TextMatrix(lngRow, 10)               '客户地址
'        cboKhxx(6).Text = .TextMatrix(lngRow, 11)               '是否含税
'        txtKhxx(7).Text = .TextMatrix(lngRow, 12)               '税务金额
        cboKhxx(8).Text = .TextMatrix(lngRow, 13)               '销售人员
        cboKhxx(3).Text = .TextMatrix(lngRow, 14)               '客户性质
'        cboKhxx(4).Text = .TextMatrix(lngRow, 15)               '客户意向
        cboKhxx(5).Text = .TextMatrix(lngRow, 16)               '洽谈进度
        cboKhxx(1).Text = .TextMatrix(lngRow, 17)               '区域
        cboKhxx(7).Text = .TextMatrix(lngRow, 18)               '转交接收人
        cboKhxx(8).Text = .TextMatrix(lngRow, 23)               '记录人
        txtKhbm.Text = .TextMatrix(lngRow, 24)                  '客户编码
        
        If Trim(.TextMatrix(lngRow, 21)) = "" Then              '签单人
            btnModify.Enabled = True
        Else
            btnModify.Enabled = False
        End If
    End With
End Sub

Private Sub txtcrm_GotFocus()
   If Index = 8 Then
        lstMoKuai.Visible = True
          lstMoKuai.ListItems.Clear   '清空列表
                    
            strSql = "select mokuai  from xt_mokuai where xt='crm' order by mokuai"
            Set Rs = Nothing
            Rs.Open strSql, conn
            
            If Rs.RecordCount > 0 Then
                For i = 1 To Rs.RecordCount
                    lstMoKuai.ListItems.Add i, "mk" & i, Rs("mokuai")
                    Rs.MoveNext
                Next i
            End If
            
            Set Rs = Nothing
    Else
        lstMoKuai.Visible = False
    End If
End Sub

Private Sub ok_Click()
lstMoKuai.Visible = False
End Sub

Private Sub txtKhxx_GotFocus(Index As Integer)
    Dim strMokuai() As String
    Dim i As Integer
    Dim J As Integer
    
    If Index = 8 Then
        lstMoKuai.Visible = True
          lstMoKuai.ListItems.Clear   '清空列表
                    
            strSql = "select mokuai  from xt_mokuai where xt='his' order by mokuai"
            Set Rs = Nothing
            Rs.Open strSql, conn
            
            If Rs.RecordCount > 0 Then
                For i = 1 To Rs.RecordCount
                    lstMoKuai.ListItems.Add i, "his" & i, Rs("mokuai")
                    Rs.MoveNext
                Next i
            End If
            Text1.Text = 1
            'HIS模块去掉字符，判断选中
            If Trim(txtKhxx(8).Text) <> "" Then
                strMokuai = Split(Trim(txtKhxx(8).Text), " ")
                For i = LBound(strMokuai) To UBound(strMokuai)
                    For J = 1 To lstMoKuai.ListItems.Count
                        If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                            lstMoKuai.ListItems(J).Checked = True
                            Exit For
                        End If
                    Next J
                Next i
            End If
            
            Set Rs = Nothing
    ElseIf Index = 4 Then
    
        lstMoKuai.Visible = True
           lstMoKuai.ListItems.Clear   '清空列表
                    
            strSql = "select mokuai  from xt_mokuai where xt='crm' order by mokuai"
            Set Rs = Nothing
            Rs.Open strSql, conn
            
            If Rs.RecordCount > 0 Then
                For i = 1 To Rs.RecordCount
                    lstMoKuai.ListItems.Add i, "crm" & i, Rs("mokuai")
                    Rs.MoveNext
                Next i
            End If
            Text1.Text = 2
            
             'CRM模块去掉字符，判断选中
            If Trim(txtKhxx(4).Text) <> "" Then
                strMokuai = Split(Trim(txtKhxx(4).Text), " ")
                For i = LBound(strMokuai) To UBound(strMokuai)
                    For J = 1 To lstMoKuai.ListItems.Count
                        If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                            lstMoKuai.ListItems(J).Checked = True
                            Exit For
                        End If
                    Next J
                Next i
            End If
            Set Rs = Nothing
    ElseIf Index = 7 Then
         lstMoKuai.Visible = True
           lstMoKuai.ListItems.Clear   '清空列表
                    
            strSql = "select mokuai  from xt_mokuai where xt='chs' order by mokuai"
            Set Rs = Nothing
            Rs.Open strSql, conn
            
            If Rs.RecordCount > 0 Then
                For i = 1 To Rs.RecordCount
                    lstMoKuai.ListItems.Add i, "chs" & i, Rs("mokuai")
                    Rs.MoveNext
                Next i
            End If
            Text1.Text = 3
            
             'CHS模块去掉字符，判断选中
            If Trim(txtKhxx(7).Text) <> "" Then
                strMokuai = Split(Trim(txtKhxx(7).Text), " ")
                For i = LBound(strMokuai) To UBound(strMokuai)
                    For J = 1 To lstMoKuai.ListItems.Count
                        If lstMoKuai.ListItems(J).Text = Mid(strMokuai(i), 2) Then
                            lstMoKuai.ListItems(J).Checked = True
                            Exit For
                        End If
                    Next J
                Next i
            End If
            Set Rs = Nothing
    Else
       lstMoKuai.Visible = False
       
    End If

End Sub

Private Function FunBlnCheck() As Boolean                   '保存新增记录时的限制条件
    If Trim(cboKhxx(1).Text) = "" Then
        MsgBox "请选择区域"
        cboKhxx(1).SetFocus
        Exit Function
    End If
    
    If Trim(cboKhxx(0).Text) = "" Then
        MsgBox "请输入客户名称"
        cboKhxx(0).SetFocus
        Exit Function
    End If
    
    If Trim(txtKhxx(0).Text) = "" Then
        MsgBox "负责人不能为空"
        txtKhxx(0).SetFocus
        Exit Function
    End If
    
    If Trim(cboKhxx(3).Text) = "" Then
        MsgBox "请选择客户性质"
        cboKhxx(3).SetFocus
        Exit Function
    End If
    
    If Trim(txtKhxx(1).Text) = "" And Trim(txtKhxx(2).Text) = "" Then
        MsgBox "电话和手机两项不能同时为空"
        txtKhxx(1).SetFocus
        Exit Function
    End If
    
'    If Trim(cboKhxx(4).Text) = "" Then
'        MsgBox "请选择客户意向"
'        cboKhxx(4).SetFocus
'        Exit Function
'    End If
    
    If Trim(cboKhxx(5).Text) = "" Then
        MsgBox "请选择洽谈进度"
        cboKhxx(5).SetFocus
        Exit Function
    End If
    
    If Trim(cboKhxx(5).Text) = "成交" And Trim(cboKhxx(2).Text) = "" Then
        MsgBox "洽谈进度为成交时软件名称不能为空，请选择"
        cboKhxx(2).SetFocus
        Exit Function
    End If
    
'    If Trim(cboKhxx(6).Text) = "" Then
'        MsgBox "请选择是否含税"
'        cboKhxx(6).SetFocus
'        Exit Function
'    End If
'
'    If Trim(cboKhxx(7).Text) = "" Then
'        MsgBox "请选择转交人"
'        cboKhxx(7).SetFocus
'        Exit Function
'    End If
    
    If Trim(cboKhxx(8).Text) = "" Then
        MsgBox "请选择销售人员"
        cboKhxx(8).SetFocus
        Exit Function
    End If
    
    FunBlnCheck = True
End Function
Private Sub txtKhxx_LostFocus(Index As Integer)

'用手机号来判读是否以前登记过此客户
Dim i As Integer
If txtKhxx(2).Text <> "" Then
    str = ""
    str = "select sj,khmc,xsry from khxx"
    Rs.CursorLocation = adUseClient
    Rs.Open str, conn
    If Not Rs.EOF Then
    For i = 1 To Rs.RecordCount
       If Decode(Rs.Fields("sj").Value) = txtKhxx(2).Text Then
          MsgBox "该号码已存在于本系统中由" & " " & Rs.Fields("xsry").Value & " 登记为 " & Decode(Rs.Fields("khmc").Value) & " 请注意沟通！~"
          Set Rs = Nothing
          Exit Sub
          
        Else
             Rs.MoveNext
       End If
    Next i
      
      
       
         
    End If
End If
Set Rs = Nothing
End Sub
