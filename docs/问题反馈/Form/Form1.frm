VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Begin VB.Form frmxgsj1 
   BackColor       =   &H00E0E0E0&
   Caption         =   "Form1"
   ClientHeight    =   9900
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   9900
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtwentilsh 
      Height          =   315
      Left            =   2640
      TabIndex        =   30
      Text            =   "Text1"
      Top             =   60
      Visible         =   0   'False
      Width           =   1035
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "基本信息"
      Height          =   3855
      Left            =   0
      TabIndex        =   0
      Top             =   600
      Width           =   15015
      Begin VB.TextBox txtshijian 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   0  'None
         ForeColor       =   &H000000FF&
         Height          =   270
         Left            =   1080
         TabIndex        =   7
         Top             =   840
         Width           =   2115
      End
      Begin VB.TextBox txtshouzhongcssm 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2175
         Left            =   4140
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   6
         Top             =   1620
         Width           =   2775
      End
      Begin VB.TextBox txtwentism 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2175
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   5
         Top             =   1620
         Width           =   3975
      End
      Begin VB.ComboBox xggcs 
         Height          =   300
         ItemData        =   "Form1.frx":0000
         Left            =   6060
         List            =   "Form1.frx":0002
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.ComboBox cmbshishiry 
         Height          =   300
         Left            =   4140
         TabIndex        =   3
         Top             =   240
         Width           =   1185
      End
      Begin VB.ComboBox cboyiyuanmc 
         Height          =   300
         Left            =   960
         TabIndex        =   2
         Top             =   270
         Width           =   2310
      End
      Begin VB.TextBox txtgcsyj 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2175
         Left            =   7020
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   1
         Top             =   1620
         Width           =   4815
      End
      Begin MSComDlg.CommonDialog cdldaoru 
         Left            =   8460
         Top             =   1980
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Label txtwtfkr 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         ForeColor       =   &H00800000&
         Height          =   180
         Left            =   8400
         TabIndex        =   20
         Top             =   330
         Width           =   90
      End
      Begin VB.Label txtxgsj 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         ForeColor       =   &H000000C0&
         Height          =   180
         Left            =   5400
         TabIndex        =   19
         Top             =   810
         Width           =   90
      End
      Begin VB.Image pic1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   2175
         Left            =   12000
         Stretch         =   -1  'True
         Top             =   1620
         Width           =   2895
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "录入时间"
         Height          =   180
         Index           =   0
         Left            =   4605
         TabIndex        =   18
         Top             =   840
         Width           =   720
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "图片预览"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   13080
         TabIndex        =   17
         Top             =   1320
         Width           =   780
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "测试人员意见"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   4560
         TabIndex        =   16
         Top             =   1320
         Width           =   2055
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问 题 说 明"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   1320
         TabIndex        =   15
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Line Line1 
         X1              =   0
         X2              =   15000
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程师"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   180
         TabIndex        =   14
         Top             =   840
         Width           =   540
      End
      Begin VB.Label labwentilx 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "工程师"
         ForeColor       =   &H000000FF&
         Height          =   180
         Left            =   5460
         TabIndex        =   13
         Top             =   360
         Width           =   540
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "实施人员"
         Height          =   180
         Left            =   3420
         TabIndex        =   12
         Top             =   360
         Width           =   720
      End
      Begin VB.Label labyiyuanmc 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "医院名称"
         Height          =   180
         Left            =   150
         TabIndex        =   11
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "工程师修改意见"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   9
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   180
         Left            =   8700
         TabIndex        =   10
         Top             =   1320
         Width           =   1365
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问题计划修改时间"
         BeginProperty Font 
            Name            =   "黑体"
            Size            =   15.75
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   315
         Left            =   9480
         TabIndex        =   9
         Top             =   180
         Width           =   2640
      End
      Begin VB.Label Label9 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "待查"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Left            =   9900
         TabIndex        =   8
         Top             =   780
         Width           =   420
      End
   End
   Begin mycmd.MyCommand cmdqingkong 
      Height          =   420
      Left            =   14040
      TabIndex        =   21
      Top             =   4965
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "清 空"
   End
   Begin mycmd.MyCommand cmdchaxun 
      Height          =   420
      Left            =   14040
      TabIndex        =   22
      Top             =   5490
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "查询问题"
   End
   Begin mycmd.MyCommand cmdtuichu 
      Height          =   420
      Left            =   14040
      TabIndex        =   23
      Top             =   6120
      Width           =   1050
      _ExtentX        =   1852
      _ExtentY        =   741
      Caption         =   "退 出"
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHwenticllb 
      Height          =   4425
      Left            =   15
      TabIndex        =   24
      Top             =   4800
      Width           =   13875
      _ExtentX        =   24474
      _ExtentY        =   7805
      _Version        =   393216
      BackColor       =   -2147483639
      ForeColor       =   -2147483646
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   12632256
      BackColorBkg    =   12632256
      AllowUserResizing=   3
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
   End
   Begin VB.Label lbl1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Left            =   7785
      TabIndex        =   29
      Top             =   9015
      Width           =   90
   End
   Begin VB.Label Label12 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题列表"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   180
      Left            =   30
      TabIndex        =   28
      Top             =   4560
      Width           =   780
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "问题计划修改时间查询"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   315
      Index           =   1
      Left            =   7020
      TabIndex        =   27
      Top             =   120
      Width           =   3150
   End
   Begin VB.Label labzxh 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFC0C0&
      BackStyle       =   0  'Transparent
      Caption         =   "EU-HIS"
      BeginProperty Font 
         Name            =   "Georgia"
         Size            =   21.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   510
      Left            =   5220
      TabIndex        =   26
      Top             =   60
      Width           =   1725
   End
   Begin VB.Label labshijian 
      AutoSize        =   -1  'True
      BackColor       =   &H00C000C0&
      Caption         =   "时 间"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   180
      Left            =   9030
      TabIndex        =   25
      Top             =   1440
      Width           =   495
   End
End
Attribute VB_Name = "frmxgsj1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub cboyiyuanmc_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim pymstr As String            '查询字符串
    Dim pymint As Integer           '循环变量

    If KeyCode = 13 And cboyiyuanmc.Text <> "" Then
        pymstr = ""
        '构建查询语句
        pymstr = "select yiyuanmc from st_yw_kehuxinxi where pym like '%" & Trim(cboyiyuanmc.Text) & "%'"
        rs.CursorLocation = adUseClient
        rs.Open pymstr, conn
        If Not rs.EOF Then
            cboyiyuanmc.Clear                          '清空当前LIST记录
            '循环赋傎给组合框的LIST
            For pymint = 1 To rs.RecordCount
                cboyiyuanmc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
                rs.MoveNext
            Next pymint
            cboyiyuanmc.ListIndex = 0                  '将第一行的傎赋给TEXT
        End If

    End If
    If KeyCode = 13 And cboyiyuanmc.Text <> "" Then
        cmbshishiry.SetFocus
    End If
    Set rs = Nothing
End Sub

Private Sub cmdchaxun_Click()
 Dim str1 As String                             '定义查询条件变量
 
 MSHwenticllb.Clear                             '当二次查询时清空列表
' msfgcs.Clear
 str1 = "1=1"
'根据不同的条件从库中查询记录并赋给网格
 str1 = "select lsh AS '流水号',banben as '版本', yiyuanmc as '医院名称', shishiry as '实施人员', mokuai as '模块', chuangtimc as '窗体',wentism as '问题说明',shouzhongcs as '售中测试说明',gongcscs as '工程师说明',lvrusj as '录入时间',xggcs as '工程师',jihuasj as '计划时间',data as '上下午'from yw_wentilb where shouzhongbz='是' and gongchengsbz='否' and taolunbz='否'"
 If cboyiyuanmc.Text <> "" Then
    str1 = str1 & "and yiyuanmc='" & Trim(cboyiyuanmc.Text) & "'"
 End If
 If cmbshishiry.Text <> "" Then
    str1 = str1 & "and shishiry='" & Trim(cmbshishiry.Text) & "'"
 End If
 
If xggcs.Text <> "" Then
    str1 = str1 & "and xggcs='" & Trim(xggcs.Text) & "'"
End If

    '打开记录集将傎赋给网格
          rs.Open str1, conn, 1, 3
    If Not rs.EOF Then
        Set MSHwenticllb.DataSource = rs
        rs.Close
    Else
        MsgBox "没有待处理的问题，请查看其它时间段！", vbOKOnly + vbInformation, "提示"
        rs.Close
    End If
    
    '取当前问题数量
If MSHwenticllb.TextMatrix(0, 0) <> "" Then
    dqwt = MSHwenticllb.Rows - 1
Else
    dqwt = 0
End If

'Label21.Caption = dqwt

End Sub



Private Sub cmdqingkong_Click()
MSHwenticllb.Clear
MSHwenticllb.Rows = 2
cboyiyuanmc.Text = ""
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub MSHwenticllb_Click()
'使当前行的背景色突出显示
 Me.MSHwenticllb.FocusRect = flexFocusNone
  Me.MSHwenticllb.SelectionMode = flexSelectionByRow
  Me.MSHwenticllb.BackColorSel = 8421631
  
If MSHwenticllb.Rows > 1 And MSHwenticllb.TextMatrix(MSHwenticllb.row, 0) <> "" Then
    txtwentilsh.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 0)
'    cbobanben.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 1)
    cboyiyuanmc.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 2)
'    cmbshishiry.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 3)
'    cbomokuan.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 4)
'    cbochuangti.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 5)
    txtwentism.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 6)
    txtshouzhongcssm.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 7)
    txtgcsyj.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 8)
'    txtshouhoucs.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 9)
    txtshijian.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 10)
    txtxgsj.Caption = MSHwenticllb.TextMatrix(MSHwenticllb.row, 9)
'    xggcs.Text = MSHwenticllb.TextMatrix(MSHwenticllb.row, 10)

   If MSHwenticllb.TextMatrix(MSHwenticllb.row, 11) <> "" Then
     Label9.Caption = Format(MSHwenticllb.TextMatrix(MSHwenticllb.row, 11), "YYYY-MM-DD") & "  " & MSHwenticllb.TextMatrix(MSHwenticllb.row, 12)
'    Label9.Caption = Format((txtxgsj.Text), "YYYY-MM-DD ") & " "
    Else
      Label9.Caption = "工程师没有给出计划时间，马上与工程师沟通"
    End If
  
'    txtshouhoucs.SetFocus
Else
    Exit Sub
End If


'If txtshouhoucs.Text <> "" Then
'    cmdxiougai.Enabled = True
'Else
'    cmdxiougai.Enabled = False
'End If

'查看图片
Set rs = Nothing
  Dim prs1 As New ADODB.Stream
    rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
   If Not rs.EOF Then
       With prs1
       .Type = adTypeBinary                   '定义流对象变量的类型为二进制
       .Mode = adModeReadWrite
       .Open
       .Write rs.Fields("pic1")
       .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
       End With
      pic1.Picture = LoadPicture(App.Path & ".jpg")
'      frmchakantp.img1(0).Picture = LoadPicture(App.Path & ".jpg")
      Kill App.Path & ".jpg"                   '删除临时图片
     Else
     pic1.Picture = LoadPicture()
     
    End If
    rs.Close

'加载模板
'msfshouhou.ColWidth(0) = 2000
' str = "select moban as 模板 from zd_moban where mobanlx='修改后测试'"
'
'    rs.Open str, conn
'    Set msfshouhou.DataSource = rs
'    rs.Close
End Sub
