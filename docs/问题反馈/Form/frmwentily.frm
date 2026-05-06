VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Object = "{C6D09F0A-D430-48BD-AED6-3042278B954A}#109.0#0"; "mycmd.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.33#0"; "HISControl1.ocx"
Begin VB.Form frmwentily 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "问题录入"
   ClientHeight    =   9660
   ClientLeft      =   2445
   ClientTop       =   1230
   ClientWidth     =   16875
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   11956.9
   ScaleMode       =   0  'User
   ScaleWidth      =   15174.02
   WindowState     =   2  'Maximized
   Begin UserControl.lst lstWenTiLB 
      Height          =   4275
      Left            =   180
      TabIndex        =   32
      Top             =   5340
      Width           =   12015
      _ExtentX        =   21193
      _ExtentY        =   7541
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   3
      BackColorFrozen =   12648447
      BackColorSel    =   12648447
      ForeColorFixed  =   -2147483630
      RowHeightMin    =   300
      ColWidths       =   ""
      SelectionMode   =   1
   End
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   0
      TabIndex        =   30
      Top             =   0
      Width           =   15075
      _ExtentX        =   26591
      _ExtentY        =   714
      Caption         =   "问题录入"
   End
   Begin mycmd.MyCommand cmdtuichu 
      Height          =   525
      Left            =   7950
      TabIndex        =   25
      Top             =   4710
      Width           =   1005
      _ExtentX        =   1773
      _ExtentY        =   926
      Caption         =   "退 出&Q"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdxg 
      Height          =   525
      Left            =   6660
      TabIndex        =   24
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "修 改&Z"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdshanchu 
      Height          =   525
      Left            =   5355
      TabIndex        =   23
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "删 除&X"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdbaocun 
      Height          =   525
      Left            =   4035
      TabIndex        =   22
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "保 存&S"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdzhengjia 
      Height          =   525
      Left            =   2730
      TabIndex        =   21
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "增 加&D"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdchaxun 
      Height          =   525
      Left            =   1425
      TabIndex        =   20
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "查 询&C"
      ftIn            =   16711680
   End
   Begin mycmd.MyCommand cmdqk 
      Height          =   525
      Left            =   120
      TabIndex        =   19
      Top             =   4710
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   926
      Caption         =   "清 空&W"
      ftIn            =   16711680
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "基本信息"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C0C0C0&
      Height          =   4215
      Left            =   120
      TabIndex        =   1
      Top             =   420
      Width           =   16695
      Begin UserControl.num txtwentilsh 
         Height          =   225
         Left            =   14160
         TabIndex        =   33
         Top             =   240
         Width           =   2145
         _ExtentX        =   3784
         _ExtentY        =   397
         XiaoShuWS       =   "0"
         Caption         =   "流水号"
         CaptionWidth    =   630
         Enabled         =   0   'False
         Hwnd            =   1316320
         ForeColor       =   255
         CaptionForeColor=   -2147483630
         Locked          =   -1  'True
      End
      Begin VB.CheckBox ChkQB 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "查询所有未处理问题"
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   315
         Left            =   14160
         TabIndex        =   31
         Top             =   660
         Width           =   2355
      End
      Begin VB.CheckBox ChkShouHou 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "售后处理"
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   14940
         TabIndex        =   28
         Top             =   2850
         Width           =   1215
      End
      Begin UserControl.cbo cboYYMC 
         Height          =   225
         Left            =   2730
         TabIndex        =   0
         Top             =   330
         Width           =   4575
         _ExtentX        =   8070
         _ExtentY        =   397
         ListWidth       =   5400
         Caption         =   "医院名称"
         TextColumn      =   1
         ForeColor       =   0
         CaptionForeColor=   -2147483640
         CaptionForeColor=   -2147483640
         Caption         =   "医院名称"
         ColumnCaptions  =   "医院名称;拼音码;模块;到期日;备注;"
         ColWidths       =   "2500;0;0;2500;0;"
         ListText        =   ""
      End
      Begin mycmd.MyCommand MyCommand3 
         Height          =   540
         Left            =   14940
         TabIndex        =   27
         Top             =   1500
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   953
         Caption         =   "粘贴图片&E"
         ftIn            =   255
      End
      Begin mycmd.MyCommand MyCommand1 
         Height          =   540
         Left            =   14940
         TabIndex        =   26
         Top             =   2175
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   953
         Caption         =   "保存图片&V"
         ftIn            =   255
      End
      Begin VB.ComboBox cbojingjicd 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "frmwentily.frx":0000
         Left            =   6030
         List            =   "frmwentily.frx":000D
         TabIndex        =   18
         Top             =   720
         Width           =   1275
      End
      Begin MSComDlg.CommonDialog cdldaoru 
         Left            =   15180
         Top             =   3480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
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
         Height          =   2595
         Left            =   7080
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   13
         Top             =   1530
         Width           =   4935
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
         Height          =   2625
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   12
         Top             =   1500
         Width           =   6855
      End
      Begin VB.ComboBox xggcs 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "frmwentily.frx":0021
         Left            =   3630
         List            =   "frmwentily.frx":0023
         TabIndex        =   11
         Top             =   720
         Width           =   1425
      End
      Begin VB.ComboBox cbomokuan 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   8070
         TabIndex        =   10
         Top             =   180
         Width           =   1995
      End
      Begin VB.ComboBox cbochuangti 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   9
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         ItemData        =   "frmwentily.frx":0025
         Left            =   8070
         List            =   "frmwentily.frx":0027
         TabIndex        =   9
         Top             =   660
         Width           =   1995
      End
      Begin VB.ComboBox cmbshishiry 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         ItemData        =   "frmwentily.frx":0029
         Left            =   900
         List            =   "frmwentily.frx":002B
         TabIndex        =   5
         Top             =   750
         Width           =   1755
      End
      Begin VB.ComboBox cbobanben 
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
         Height          =   330
         ItemData        =   "frmwentily.frx":002D
         Left            =   900
         List            =   "frmwentily.frx":003A
         TabIndex        =   3
         Text            =   "HIS问题"
         Top             =   240
         Width           =   1755
      End
      Begin UserControl.txt txtshijian 
         Height          =   225
         Left            =   10140
         TabIndex        =   34
         Top             =   720
         Width           =   3915
         _ExtentX        =   6906
         _ExtentY        =   397
         Caption         =   "录入时间"
         CaptionWidth    =   420
         Enabled         =   0   'False
         Hwnd            =   1054206
         ForeColor       =   12582912
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
      Begin VB.Label LabSHQ 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         Caption         =   "授权截止日期:"
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   375
         Left            =   10140
         TabIndex        =   29
         Top             =   180
         Width           =   3915
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "紧急程度"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   5130
         TabIndex        =   17
         Top             =   840
         Width           =   840
      End
      Begin VB.Image Image1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Enabled         =   0   'False
         Height          =   2655
         Left            =   12120
         Stretch         =   -1  'True
         Top             =   1500
         Width           =   2655
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "测试人员意见"
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   300
         Left            =   8640
         TabIndex        =   16
         Top             =   1170
         Width           =   1260
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "问 题 说 明"
         BeginProperty Font 
            Name            =   "微软雅黑"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   300
         Left            =   2760
         TabIndex        =   15
         Top             =   1170
         Width           =   1020
      End
      Begin VB.Label labwentilx 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "研发人员"
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
         Height          =   210
         Left            =   2760
         TabIndex        =   8
         Top             =   840
         Width           =   840
      End
      Begin VB.Label labmokuan 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "模 块"
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
         Height          =   210
         Left            =   7470
         TabIndex        =   7
         Top             =   300
         Width           =   525
      End
      Begin VB.Label labchuangti 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         Caption         =   "窗 体"
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
         Height          =   210
         Left            =   7470
         TabIndex        =   6
         Top             =   780
         Width           =   525
      End
      Begin VB.Label labshishiry 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "跟进人员"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   60
         TabIndex        =   4
         Top             =   870
         Width           =   840
      End
      Begin VB.Label labruanjianbb 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件版本"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Left            =   60
         TabIndex        =   2
         Top             =   360
         Width           =   840
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid msfshouhou 
      Height          =   4245
      Left            =   12240
      TabIndex        =   35
      Top             =   5340
      Width           =   4560
      _ExtentX        =   8043
      _ExtentY        =   7488
      _Version        =   393216
      BackColor       =   -2147483628
      Cols            =   1
      FixedCols       =   0
      BackColorFixed  =   14737632
      BackColorBkg    =   16777215
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   1
      _Band(0).Cols   =   1
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
      Left            =   9240
      TabIndex        =   14
      Top             =   1680
      Width           =   495
   End
End
Attribute VB_Name = "frmwentily"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim brow As Long                  '定义网格行变量
Private wentilsh As String        '定义流水号变量
Dim prs As New ADODB.stream       '建立流对象变量
Dim QP As New ClsBubble    '气泡类


'定义一个清空过程，方便调用
Private Sub Allclear()
    cboYYMC.Text = ""
    cmbshishiry.Text = ""
    cbomokuan.Text = ""
    cbochuangti.Text = ""
    txtwentism.Text = ""
    txtshouzhongcssm.Text = ""
    xggcs.Text = ""
    cbojingjicd.Text = ""
    cbojingjicd.Text = ""
    cbobanben.Text = ""
    LabSHQ.Caption = "授权截止日期:"
    txtshijian.Text = ""
End Sub

Private Sub cbobanben_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And cbobanben.Text <> "" Then
        cboYYMC.SetFocus
    End If
End Sub

Private Sub cbochuangti_GotFocus()
Dim str3 As String
Dim i As Integer
'加载窗体名
    cbochuangti.Clear                            '循环前清空组合框ITEM
    Set Rs = Nothing
    str3 = "select chuangtimc from zd_chuangti where mokuai='" & Trim(cbomokuan.Text) & "'"
    Rs.CursorLocation = adUseClient
    Rs.Open str3, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cbochuangti.AddItem Rs.Fields("chuangtimc").Value
            Rs.MoveNext
        Next i
    End If
    Rs.Close
End Sub



Private Sub cbochuangti_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And cbochuangti.Text <> "" Then
        cmbshishiry.SetFocus
    End If
End Sub





Private Sub cbojingjicd_KeyDown(KeyCode As Integer, Shift As Integer)
    If cbojingjicd.Text <> "" And KeyCode = 13 Then
        txtwentism.SetFocus
    End If
End Sub



Private Sub cbomokuan_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And cbomokuan.Text <> "" Then
        cbochuangti.SetFocus
    End If
End Sub

Private Sub cboyiyuanmc1_Change()

End Sub

Private Sub cboYYMC_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 And cboYYMC.Value <> "" Then
        cbomokuan.SetFocus
    End If
End Sub

Private Sub cboYYMC_SelectChanged()
    If cboYYMC.cellValue(4) <> "" Then
        LabSHQ.Caption = "授权截止日期:" & Format(cboYYMC.cellValue(4), "yyyy-MM-dd") & "  (剩余:" & DateDiff("d", Now, cboYYMC.cellValue(4)) & "天)"
    Else
        LabSHQ.Caption = "授权截止日期:没有数据"
    End If
End Sub



Private Sub cmdchaxun_Click()
    Dim str1 As String                             '定义查询条件变量


' msfgcs.Clear
    str1 = "1=1"
    '根据不同的条件从库中查询记录并赋给网格
    str1 = "select lsh AS 流水号,banben as 软件版本, yiyuanmc as 医院名称, shishiry as 跟进人员, mokuai as 模块, chuangtimc as 窗体," & Chr(13) & _
           "xggcs as 工程师,jingjicd as 紧急程度,wentism as 问题说明,shouzhongcs as 售中测试说明,jieshouSJ as 接收时间,wentiFKR as 问题反馈人," & Chr(13) & _
           "fankuiRDH as 反馈人电话,yanfaXG as 研发修改,lvrusj as 录入时间 from yw_wentilb where shouzhongbz='是' and gongchengsbz='否'"
    If cboYYMC.Text <> "" Then
        str1 = str1 & "and yiyuanmc='" & Trim(cboYYMC.Text) & "'"
    End If
    If cmbshishiry.Text <> "" Then
        str1 = str1 & "and shishiry='" & Trim(cmbshishiry.Text) & "'"
    End If
    If cbomokuan.Text <> "" Then
        str1 = str1 & "and mokuai='" & Trim(cbomokuan.Text) & "'"
    End If
    If cbochuangti.Text <> "" Then
        str1 = str1 & "and chuangtimc='" & Trim(cbochuangti.Text) & "'"
    End If
    If xggcs.Text <> "" Then
        str1 = str1 & "and xggcs='" & Trim(xggcs.Text) & "'"
    End If
    If cbojingjicd.Text <> "" Then
        str1 = str1 & "and jingjicd='" & Trim(cbojingjicd.Text) & "'"
    End If
'    If txtkssj.Value <> "" And txtjssj.Value <> "" Then
'        str1 = str1 & "and lvrusj between '" & Format(txtkssj.Value, "yyyy-mm-dd") & " 00:00:01" & "' and '" & Format(txtjssj.Value, "yyyy-mm-dd") & " 23:59:59" & "'"
'    End If
    If ChkQB.Value = 0 Then
        str1 = str1 & "and szcsgcs='" & user & "'"
    End If
    '打开记录集将傎赋给网格
    '        Set rs = conn.Execute(str1)


    Call objFormSetting.FillList_New(lstWenTiLB, str1)

    



    cmdbaocun.Enabled = False
    cmdzhengjia.Enabled = False
    cbobanben.SetFocus
End Sub



Private Sub cmdqk_Click()
    If cmdzhengjia.Enabled = True Then
        Call Allclear
        Image1.Picture = LoadPicture()
        '      txtwentilsh.Text = ""
    End If

    lstWenTiLB.RemoveAllItems
    cmdbaocun.Enabled = True
    cmdzhengjia.Enabled = True
    'cmdtxdr.Enabled = False
    Image1.Picture = LoadPicture()
    
    ChkShouHou.Value = 0
    '      txtwentilsh.Text = ""
End Sub

Private Sub cmdxg_Click()
'lstWenTiLB.ColumnCaptions = "流水号;软件版本;医院名称;跟进人员;模块;窗体;工程师;紧急程度;问题说明;售中测试说明;接收时间;问题反馈人;反馈人电话;研发修改;录入时间"
    Dim strSQL As String
    txtwentism.Text = Replace(Trim(txtwentism.Text), "'", "''")          '替换文本中的单引号
    txtshouzhongcssm.Text = Replace(Trim(txtshouzhongcssm.Text), "'", "''")

    strSQL = "update yw_wentilb set banben='" & Trim(cbobanben.Text) & "',yiyuanmc='" & Trim(cboYYMC.Text) & "',shishiry='" & Trim(cmbshishiry.Text) & "',"
    strSQL = strSQL & "mokuai='" & Trim(cbomokuan.Text) & "',yanfaXG='" & IIf(ChkShouHou.Value = 1, "否", "是") & "'" & IIf(ChkShouHou.Value = 0, ",zhuangYFSJ=getdate()", "") & ",chuangtimc='" & Trim(cbochuangti.Text) & "',xggcs='" & Trim(xggcs.Text) & "',jingjicd='" & Trim(cbojingjicd.Text) & "',"
    strSQL = strSQL & "wentism='" & Trim(txtwentism.Text) & "',shouzhongcs='" & Trim(txtshouzhongcssm.Text) & "' where lsh='" & Trim(txtwentilsh.Text) & "'"
    If MsgBox("确定要修改测试吗？", vbYesNo + vbInformation, "提示") = vbYes Then
        conn.Execute (strSQL)
        If objExecuteSQL.ExecuteSQL(strSQL) = True Then
        '    Set rs = Nothing
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "问题说明") = txtwentism.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "售中测试说明") = txtshouzhongcssm.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "研发修改") = IIf(ChkShouHou.Value = 1, "否", "是")
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "跟进人员") = cmbshishiry.Text                  '实施人员
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "工程师") = xggcs.Text                           '修改工程师
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "软件版本") = cbobanben.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "医院名称") = cboYYMC.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "模块") = cbomokuan.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "窗体") = cbochuangti.Text
             lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "研发修改") = IIf(ChkShouHou.Value = 1, "否", "是")
        
             MsgBox "修改成功!", vbInformation
        Else
            MsgBox "修改失败!!!", vbExclamation
        End If

    End If

    'Call cmdchaxun_Click
End Sub

Private Sub Form_Resize()
    Frame2.Width = Me.ScaleWidth - 100
'    lstWenTiLB.Move lstWenTiLB.Left, lstWenTiLB.Top, Me.ScaleWidth - 2 * lstWenTiLB.Left, Me.ScaleHeight - lstWenTiLB.Top - 100
    pic1.Width = Me.ScaleWidth
    
    lstWenTiLB.Height = Me.ScaleHeight - lstWenTiLB.Top - 50
    msfshouhou.Height = lstWenTiLB.Height
    msfshouhou.Top = lstWenTiLB.Top
    lstWenTiLB.Width = Me.ScaleWidth - msfshouhou.Width - 100
    msfshouhou.Left = lstWenTiLB.Left + lstWenTiLB.Width + 50

End Sub

'Private Sub Command1_Click()
'
'
'    Dim GQTS As Long
'    If cboYYMC.Text <> "" Then
'        GQTS = ShouHouGuoQiTS(cboYYMC.Text)
'        If GQTS > 0 And GQTS <> 9999 And GQTS <> 8888 Then
'            MsgBox "该用户没有过期，服务期还有" & GQTS & "天", vbOKOnly + vbInformation, "提示"
'        ElseIf GQTS > 0 And GQTS < 60 Then
'            MsgBox "此用户还有" & GQTS & "就要过期了，请及时催缴维护费", vbOKOnly + vbInformation, "提示"
'        ElseIf GQTS < 0 Then
'            MsgBox "该用户已经过维护期" & GQTS & "天了，请及时催缴维护费", vbOKOnly + vbInformation, "提示"
'            Exit Sub
'        ElseIf GQTS = 9999 Then
'
'        ElseIf GQTS = 8888 Then
'            MsgBox "该用户可能正在实施！！", vbOKOnly + vbInformation, "提示"
'        End If
'    Else
'        MsgBox "客户名称不能为空哦！", vbOKOnly + vbInformation, "提示"
'        Exit Sub
'    End If
'End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim str As String
    Dim wentilsh As String

    '先从库里取出最大的问题流水号给变量wentilsh
    Set Rs = Nothing
    str = "SELECT ISNULL(MAX(lsh), '0') AS lsh FROM yw_wentilb "
    Rs.Open str, conn

    If Not Rs.EOF Then
        wentilsh = Rs.Fields("lsh").Value
        Set Rs = Nothing
    End If
    Set Rs = Nothing
    str = ""
    str = "select lsh from yw_wentitp where lsh>'" & wentilsh & "'"
    Rs.Open str, conn
    '检查图片库中是否有LSH大于问题库中的LSH如有则删除记录
    If Not Rs.EOF Then
        Set Rs = Nothing
        str = ""
        str = "delete from yw_wentitp where lsh>'" & wentilsh & "'"
        Rs.Open str, conn
        Set Rs = Nothing
    Else
        Set Rs = Nothing
    End If

End Sub

Private Sub Image1_DblClick()
    If Image1.Picture = LoadPicture() Then
        Exit Sub

    Else
        tplsh = txtwentilsh.Text
        frmchakantp.Show
    End If
End Sub

Private Sub lstWenTiLB_Click()
'使当前行的背景色突出显示

           
    

    If lstWenTiLB.getSelectedRow > 0 Then
        txtwentilsh.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "流水号")                '流水号
        cbobanben.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "软件版本")                   '版本号
        cboYYMC.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "医院名称")              '医院名称
        cmbshishiry.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "跟进人员")                '实施人员
        cbomokuan.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "模块")                   '模块
        cbochuangti.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "窗体")               '窗体
        xggcs.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "工程师")                     '修改工程师
        cbojingjicd.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "紧急程度")             '紧急程度
        txtwentism.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "问题说明")                  '问题说明
        txtshouzhongcssm.Text = lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "售中测试说明")            '售中测试说明
        ChkShouHou.Value = IIf(lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "研发修改") = "是", 0, 1)            '是否研发修改标志
        txtshijian.Text = Format(lstWenTiLB.cellValue(lstWenTiLB.getSelectedRow, "录入时间"), "yyyy-MM-dd HH:mm:ss")
        MyCommand3.Enabled = True
        Image1.Enabled = True
        If cboYYMC.Text <> "" Then
            LabSHQ.Caption = "授权截止日期:  " & Format(cboYYMC.cellValue(4), "yyyy-MM-dd") & "  (剩余:" & DateDiff("d", Now, cboYYMC.cellValue(4)) & "天)"
        End If
    Else
        Exit Sub
    End If

    '查看图片
    Dim prs1 As New ADODB.stream
    Set Rs = Nothing
    Rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
    If Not Rs.EOF Then
        With prs1
            .Type = adTypeBinary                   '定义流对象变量的类型为二进制
            .Mode = adModeReadWrite
            .Open
            .Write Rs.Fields("pic1")
            .SaveToFile "d:\1.jpg"           '将图片保存到程序文件夹下
        End With
        Image1.Picture = LoadPicture("d:\1.jpg")
        '      frmchakantp.img1(0).Picture = LoadPicture(App.Path & ".jpg")
        Kill "d:\1.jpg"                   '删除临时图片
    Else
        Image1.Picture = LoadPicture()

    End If
    Rs.Close
End Sub



Private Sub msfshouhou_DblClick()
    txtshouzhongcssm.Text = msfshouhou.TextMatrix(msfshouhou.row, 0)
End Sub

Private Sub MyCommand1_Click()
'将Image控件中图片取出，保存到本地 然后在增加到数据库中 BY ZXH 2012-7-14

    Dim Ttpnum As Integer    '取数据库最大当前问题图片号

    Set Rs = conn.Execute("select isnull (max(tpnum),0) as zxh from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'")

    Ttpnum = Rs.Fields("zxh").Value

    Set Rs = Nothing


    If Image1.Picture = LoadPicture() Then
        MsgBox "图片框中没有图片！", vbOKOnly + vbInformation, "提示"
        Exit Sub
    Else
        SavePicture Image1.Picture, "d:\2.JPG"  '将图片取出保存为临时文件
        With prs
            .Mode = adModeReadWrite
            .Type = adTypeBinary
            .Open
            .LoadFromFile "d:\2.JPG"     '将图片加载到流中

        End With
        With Rs
            .Open "select pic1,lsh,yiyuanmc,tpnum,lurusj from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
            .AddNew         '新增一条记录

            .Fields("pic1") = prs.Read
            .Fields("lsh") = txtwentilsh.Text
            .Fields("yiyuanmc") = cboYYMC.Text
            .Fields("tpnum") = Ttpnum + 1                 '将变量号加1给字段TPNUM区分同一流水号的图片
            .Fields("lurusj") = Now
            .Update
        End With
        Kill "d:\2.jpg"
        Set Rs = Nothing
        Set prs = Nothing
        Image1.Picture = LoadPicture()   '清空图片框中的图片
        Clipboard.Clear                  '清除系统剪贴版中的内容
        MsgBox "图片保存成功", vbOKOnly + vbInformation, "提示"
    End If
End Sub

'Private Sub Picture1_Click()
'    Set Picture1.Picture = Clipboard.GetData()
'End Sub



Private Sub MyCommand3_Click()
    Set Image1.Picture = Clipboard.GetData()
End Sub

Private Sub txtwentism_GotFocus()
'如果上条问题的图上片未导入，则不能继续
'If cmdtxbc.Enabled = True Then
'    MsgBox "上个问题的图片还未导入，请先导入", vbOKOnly + vbInformation, "友情提示"
'    Exit Sub
'End If
End Sub



Private Sub xggcs_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And xggcs.Text <> "" Then
        cbojingjicd.SetFocus
    End If
End Sub

Private Sub cboyymc_KeyDown(KeyCode As Integer, Shift As Integer)


'   If KeyCode = 13 And cboYYMC.Text <> "" Then
'        Call WeiHuQTiShi
'
'    End If
    If KeyCode = 13 And cboYYMC.Text <> "" Then
        cmbshishiry.SetFocus
    End If
    Set Rs = Nothing

End Sub

'Private Sub WeiHuQTiShi()
''维护期提示
'    Dim pymstr As String            '查询字符串
'    Dim pymint As Integer           '循环变量
'        pymstr = ""
'        '构建查询语句
'        pymstr = "select  bEnd,yiyuanmc,ruanjianzj1,weihufei from st_yw_kehuxinxi with(nolock)  where pym like '%" & cboYYMC.Text & "%'"
'        rs.CursorLocation = adUseClient
'        rs.Open pymstr, conn
'        pymstr = ""
'        If Not rs.EOF Then
'            cboYYMC.Clear                          '清空当前LIST记录
'            '循环赋傎给组合框的LIST
'            For pymint = 1 To rs.RecordCount
'                If rs("bEnd").Value = 0 Then
'                    cboYYMC.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'                Else
'                    pymstr = pymstr & StringEnDeCodecn(rs("yiyuanmc").Value, 75) & vbTab & rs("ruanjianzj1").Value & vbTab & StringEnDeCodecn(rs("weihufei").Value, 75) & vbCrLf
'                End If
'                rs.MoveNext
'            Next pymint
'            If cboYYMC.ListCount > 0 Then
'                cboYYMC.ListIndex = 0                  '将第一行的傎赋给TEXT
'            End If
'        End If
''        If pymstr <> "" Then
''            MsgBox "下列客户已经过期：" & vbCrLf & "客户" & vbTab & "软件总价" & vbTab & "维护费" & vbCrLf & pymstr
''        End If
'End Sub

Private Sub cmbshishiry_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = 13 And cmbshishiry.Text <> "" Then
        xggcs.SetFocus
    End If
End Sub

Private Sub cmdbaocun_Click()
    Dim X As Long
    Dim strxinxi As String
    Dim strSQL As String
    Dim strYFXGBZ As String
    Dim Irow As Long



'lstWenTiLB.ColumnCaptions = "流水号;软件版本;医院名称;跟进人员;模块;窗体;工程师;紧急程度;问题说明;售中测试说明;接收时间;问题反馈人;反馈人电话;研发修改;录入时间"
    If lstWenTiLB.getMaxRow > 0 Then
        '定义网格行循环变量
        For X = 1 To lstWenTiLB.getMaxRow
        
            If Trim(lstWenTiLB.cellValue(X, "跟进人员")) = user And Trim(lstWenTiLB.cellValue(X, "研发修改")) = "否" Then
                strYFXGBZ = "是"
            Else
                strYFXGBZ = "否"
            End If
        
            str = "insert into yw_wentilb (lsh,banben,yiyuanmc,shishiry,mokuai,chuangtimc,xggcs,jingjicd,wentism,shouzhongcs,"
            str = str & "gongcscs,shouhoucs,shouzhongbz,gongchengsbz,shouhoubz,szcsgcs,xgsj,taolunbz,jieshouSJ,wentiFKR,fankuiRDH,yanfaXG,baocunsj,lvrusj)"
            str = str & "values ('" & lstWenTiLB.cellValue(X, "流水号") & "','" & Trim(lstWenTiLB.cellValue(X, "软件版本")) & "','" & Trim(lstWenTiLB.cellValue(X, "医院名称")) & "','" & Trim(lstWenTiLB.cellValue(X, "跟进人员")) & "',"
            str = str & "'" & Trim(lstWenTiLB.cellValue(X, "模块")) & "','" & Trim(lstWenTiLB.cellValue(X, "窗体")) & "','" & Trim(lstWenTiLB.cellValue(X, "工程师")) & "',"
            str = str & "'" & Trim(lstWenTiLB.cellValue(X, "紧急程度")) & "','" & Trim(lstWenTiLB.cellValue(X, "问题说明")) & "','" & Trim(lstWenTiLB.cellValue(X, "售中测试说明")) & "',"
            str = str & "'" & Null & "','" & Null & "','是',"
            str = str & "'" & strYFXGBZ & "','否','" & Trim(lstWenTiLB.cellValue(X, "跟进人员")) & "','" & Null & "','否','" & Trim(lstWenTiLB.cellValue(X, "接收时间")) & "','" & Trim(lstWenTiLB.cellValue(X, "问题反馈人")) & "','" & Trim(lstWenTiLB.cellValue(X, "反馈人电话")) & "','" & Trim(lstWenTiLB.cellValue(X, "研发修改")) & "',getdate(),getdate())"
            conn.Execute str
            If lstWenTiLB.cellValue(X, "研发修改") = "是" Then
                strSQL = "update yw_wentilb set zhuangYFSJ=getdate() where lsh='" & lstWenTiLB.cellValue(X, "流水号") & "'"
                Call objExecuteSQL.ExecuteSQL(strSQL)

'                conn.Execute strsql
            End If

            Call QiPao_WT(lstWenTiLB.cellValue(X, "流水号"), Trim(lstWenTiLB.cellValue(X, "工程师")), Trim(lstWenTiLB.cellValue(X, "医院名称")), "待修改", Trim(lstWenTiLB.cellValue(X, "问题反馈人")))

        Next X
        
        
        
        MsgBox "保存成功！", vbOKOnly + vbInformation, "提示"
        Set Rs = Nothing
        '更新流水号
        str = "update ok set lsh='" & Trim(lstWenTiLB.cellValue(lstWenTiLB.getMaxRow, "流水号")) & "'"
        conn.Execute str
        Set Rs = Nothing
        lstWenTiLB.RemoveAllItems
        Image1.Picture = LoadPicture()
    Else
        Exit Sub
    End If



End Sub

Private Sub QiPao_WT(strWTlsh As String, strJSGCS As String, strYYMC As String, strLB As String, strGJRY As String)
    Dim colInfo As New Collection
        colInfo.Add strWTlsh   '问题流水号
        colInfo.Add strJSGCS   '接收人员
        colInfo.Add strYYMC    '医院名称
        colInfo.Add strLB      '业务类别:待修改-待测试-返回修改
        colInfo.Add strGJRY    '当前业务发布人员
        Call QP.InsertQiPao_WT(colInfo)
End Sub


Private Sub cmdshanchu_Click()
'lstWenTiLB.ColumnCaptions = "流水号;软件版本;医院名称;跟进人员;模块;窗体;工程师;紧急程度;问题说明;售中测试说明;接收时间;问题反馈人;反馈人电话;研发修改;录入时间"
    Dim i As Long         '定义网格行变量
    Dim str As String        '定义SQL变量
    i = lstWenTiLB.getSelectedRow

        Set Rs = Nothing
        str = "select lsh from yw_wentilb where lsh='" & Trim(txtwentilsh.Text) & " '"
        Rs.Open str, conn

        If Not Rs.EOF Then

            Set Rs = Nothing
            If MsgBox("是否从库里删除数据，它将不可恢复", vbYesNo + vbCritical, "提示") = vbYes Then

                Rs.Open "delete from yw_wentilb where lsh='" & Trim(txtwentilsh.Text) & " '", conn
                str = "delete from yw_QiPaoTishi where Wtlsh='" & txtwentilsh.Text & "'"
                Call objExecuteSQL.ExecuteSQL(str)
                MsgBox "数据删除成功！", vbOKOnly + vbInformation, "提示"
                Set Rs = Nothing
                Rs.Open "delete from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & " '", conn
                Set Rs = Nothing
                lstWenTiLB.RemoveItem i
            Else
                Exit Sub
            End If
        Else
            lstWenTiLB.RemoveItem i

        End If


End Sub

Private Sub cmdtuichu_Click()
    Unload Me
End Sub

Private Sub cmdtuixiangck_Click()
'读取图片
    Dim prs1 As New ADODB.stream
    Rs.Open "select * from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
    If Not Rs.EOF Then
        With prs1
            .Type = adTypeBinary                   '定义流对象变量的类型为二进制
            .Mode = adModeReadWrite
            .Open
            .Write Rs.Fields("pic1")
            .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
        End With
        frmchakantp.Show
        frmchakantp.Picture = LoadPicture(App.Path & ".jpg")
        Set Rs = Nothing
    End If


End Sub

'Private Sub cmdtxbc_Click()
'Dim i As Integer
'Dim Ttpnum As Integer    '图片号最大的
'
'   Set rs = conn.Execute("select isnull (max(tpnum),0) as zxh from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'")
'
'Ttpnum = rs.Fields("zxh").Value
'
'Set rs = Nothing
'  '存图片
'For i = 0 To 5
'    If Trim(txtlujing(i).Text) <> "" And txtlujing(i).Text <> "图像保存成功" Then
'        With prs
'           .Mode = adModeReadWrite
'           .Type = adTypeBinary
'           .Open
'           .LoadFromFile txtlujing(i).Text
'
'        End With
'
'    Else
'        MsgBox "图片导入成功!", vbOKOnly + vbInformation, "提示"
'        cmdtxbc.Enabled = False
'        Set prs = Nothing
'        txtwentism.Text = ""
'        txtshouzhongcssm.Text = ""
'        cbomokuan.Text = ""
'        cbochuangti.Text = ""
'        cbomokuan.SetFocus
'        Exit Sub
'    End If
'
'        With rs
'                .Open "select pic1,lsh,yiyuanmc,tpnum,lurusj from yw_wentitp where lsh='" & Trim(txtwentilsh.Text) & "'", conn, 1, 3
'                .AddNew         '新增一条记录
'                .Fields("pic1") = prs.Read
'                .Fields("lsh") = txtwentilsh.Text
'                .Fields("yiyuanmc") = cboyymc.Text
'                .Fields("tpnum") = Ttpnum + i + 1                '将变量号加1给字段TPNUM区分同一流水号的图片
'                .Fields("lurusj") = Now
'                .Update
'            End With
'            txtlujing(i).Text = "图像保存成功"
'            Set rs = Nothing
'            Set prs = Nothing
'Next i
'
'
'cmdtxbc.Enabled = False
'MsgBox "图片保存成功", vbOKOnly + vbInformation, "提示"
'        txtwentism.Text = ""
'       ' txtshouzhongcssm.Text = ""
'        'cbomokuan.Text = ""
'       ' cbochuangti.Text = ""
'        cbomokuan.SetFocus
'
'End Sub


'Private Sub cmdtxdr_Click()
'Dim i As Integer
'cmdtxbc.Enabled = True
'For i = 0 To 5
'    cdldaoru.ShowOpen
'    cdldaoru.Filter = "Pictures (*.bmp;*.jpg;*.gif)　*.bmp;*.jpg;*.gif"
'    txtlujing(i).Text = cdldaoru.FileName
'    Image1.Picture = LoadPicture(txtlujing(i).Text)
'    If MsgBox("是否还有图片要导入？", vbYesNo + vbQuestion, "提示") = vbYes And i <> 5 Then
'
'    Else
'        If txtlujing(0).Text = "" Then
'            cmdtxbc.Enabled = False
'        End If
'        cmdtxdr.Enabled = False
'        Exit Sub
'    End If
' Next i
'
'End Sub


Private Sub cmdzhengjia_Click()
'If txtlujing(0) <> "" And txtlujing(0) <> "图像保存成功" Then
'    MsgBox "上个问题的图片还没有导入，请先导入！", vbOKOnly + vbQuestion, "提示"
'    cmdtxdr.Enabled = True
'    Exit Sub
'Else
'    cmdtxdr.Enabled = False
'End If
'cmdtxdr.Enabled = True
'判断必输项不能为空
    Dim GQTS As Long
Dim col As Collection
    If Len(cbobanben.Text) = 0 Then
        MsgBox "版本号不能为空", vbOKOnly, "提示"
        Exit Sub
    ElseIf Len(cboYYMC.Text) = 0 Then
        MsgBox "医院名称不能为空", vbOKOnly, "提示"
        Exit Sub
    ElseIf Len(cmbshishiry.Text) = 0 Then
        MsgBox "实施人员不能为空", vbOKOnly, "提示"
        Call Allclear
        Exit Sub
    ElseIf Len(cbomokuan.Text) = 0 Then
        MsgBox "模块不能为空", vbOKOnly, "提示"
        Call Allclear
        Exit Sub
    ElseIf Len(cbochuangti.Text) = 0 Then
        MsgBox "窗体不能为空", vbOKOnly, "提示"
        Exit Sub
    ElseIf Len(xggcs.Text) = 0 Then
        MsgBox "研发人员不能为空", vbOKOnly, "提示"
        Exit Sub
        'ElseIf Len(txtshijian.Text) = 0 Then
        '   MsgBox "时间不能为空", vbOKOnly, "提示"
        '   Exit Sub
    ElseIf Len(txtwentism.Text) = 0 Then
        MsgBox "问题说明不能为空", vbOKOnly, "提示"
        Exit Sub
    ElseIf Len(txtshouzhongcssm.Text) = 0 Then
        MsgBox "售中问题说明不能为空", vbOKOnly, "提示"
        Exit Sub
    ElseIf Len(txtwentilsh.Text) = 0 Then
        MsgBox "流水号不能为空", vbOKOnly, "提示"
        Exit Sub
    End If


    txtwentilsh.Text = txtwentilsh.Text + 1

    txtwentism.Text = Replace(Trim(txtwentism.Text), "'", "''")          '替换文本中的单引号
    txtshouzhongcssm.Text = Replace(Trim(txtshouzhongcssm.Text), "'", "''")

    '网格的行号等于当前最大行 -1
    brow = lstWenTiLB.getMaxRow
'    txtshijian.Text = Now                              '插入前更新时间
    '将控件的傎加载到网格中
'    With MSHwentilb
'        .Cols = 14
'        .TextMatrix(brow, 0) = ""       '流水号
'        .TextMatrix(brow, 1) = Trim(cbobanben.Text)          '版　本
'        .TextMatrix(brow, 2) = Trim(cboYYMC.Text)        '医院名称
'        .TextMatrix(brow, 3) = Trim(cmbshishiry.Text)        '实施人员
'        .TextMatrix(brow, 4) = Trim(cbomokuan.Text)          '模　块
'        .TextMatrix(brow, 5) = Trim(cbochuangti.Text)        '窗　体
'        .TextMatrix(brow, 6) = Trim(xggcs.Text)              '修改工程师
'        .TextMatrix(brow, 7) = Trim(cbojingjicd.Text)        '紧急程度
'        .TextMatrix(brow, 8) = Trim(txtwentism.Text)          '问题说明
'        .TextMatrix(brow, 9) = Trim(txtshouzhongcssm.Text)    '售中测试说明
'        .TextMatrix(brow, 10) = Now                       '接收时间
'        .TextMatrix(brow, 11) = user                        '问题反馈人
'        .TextMatrix(brow, 12) = ""                         '反馈人电话
'        .TextMatrix(brow, 13) = IIf(ChkShouHou.Value = 1, "否", "是") '                   '是否研发修改
'    End With
'    lstWenTiLB.ColumnCaptions = "流水号;软件版本;医院名称;跟进人员;模块;窗体;工程师;紧急程度;问题说明;售中测试说明;接收时间;问题反馈人;反馈人电话;研发修改;录入时间"
    Set col = New Collection
        col.Add ""     '流水号
        col.Add Trim(cbobanben.Text)            '版　本
        col.Add Trim(cboYYMC.Text)          '医院名称
        col.Add Trim(cmbshishiry.Text)         '跟进人员
        col.Add Trim(cbomokuan.Text)            '模块
        col.Add Trim(cbochuangti.Text)          '窗体
        col.Add Trim(xggcs.Text)               '工程师
        col.Add Trim(cbojingjicd.Text)         '紧急程度
        col.Add Trim(txtwentism.Text)           '问题说明
        col.Add Trim(txtshouzhongcssm.Text)      '售中测试说明
        col.Add Now                         '接收时间
        col.Add user                          '问题反馈人
        col.Add ""                           '反馈人电话
        col.Add IIf(ChkShouHou.Value = 1, "否", "是")   '                   '是否研发修改
        col.Add Now   '                   '录入时间
        
    lstWenTiLB.AddItem col
    lstWenTiLB.AutoSetSize = True
    txtwentism.Text = ""
    cbomokuan.SetFocus

    '从OK表中取中当前流水号给网格，并更新库里的最大流水号
    str = "select lsh as lsh from ok"
    Rs.Open str, conn
    If Not Rs.EOF Then
        Rs.MoveFirst

        lstWenTiLB.cellValue(lstWenTiLB.getMaxRow, "流水号") = Rs.Fields("lsh").Value + 1
        txtwentilsh.Text = Rs.Fields("lsh").Value + 1

        Set Rs = Nothing
        str = ""
        str = "update ok set lsh='" & Trim(txtwentilsh.Text) & "'"
        Rs.Open str, conn                                             '更新库里的流水号

    End If
    'txtlujing.Text = ""

End Sub

Function GetLSH() As String
    '问题录入流水号取库里的流水号最大傎
    Set Rs = Nothing
    str = "SELECT lsh as lsh from ok "
    Rs.Open str, conn

    If Not Rs.EOF Then
        Rs.MoveFirst

        GetLSH = Rs.Fields("lsh").Value + 1
        Set Rs = Nothing

    End If
End Function

Sub loadMK(cbo As ComboBox)
Dim str2 As String
Dim i As Integer
'加载模块
    cbo.Clear
    Set Rs = Nothing
    str2 = "select mokuaimc from zd_mokuai where banben='HIS'"
    Rs.CursorLocation = adUseClient
    Rs.Open str2, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cbo.AddItem Rs.Fields("mokuaimc").Value
            Rs.MoveNext
        Next i
    End If
    Set Rs = Nothing
End Sub

Private Sub Form_Load()
    Dim i As Integer
    Dim str As String
    Dim str1 As String
    Dim str2 As String
    Dim str3 As String

    frmwentily.Width = 13080
    frmwentily.Height = 9405
'    txtkssj.Value = Date
'    txtjssj.Value = Date

'    cmbshishiry.Text = user

    txtwentilsh.Text = GetLSH

    Call LoadYYMC(cboYYMC)
    
    Call loadMK(cbomokuan)

    '当前登录者
'    txtszcsgcs.Text = user

    '加载工程师名称
    Set Rs = Nothing
    str = "select usename from [user] where quxian='工程师' and zhuangtai='1'"
    Rs.CursorLocation = adUseClient
    Rs.Open str, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            xggcs.AddItem Rs.Fields("usename").Value
            Rs.MoveNext
        Next i
        Set Rs = Nothing
    End If
    
            '加载模板
    msfshouhou.ColWidth(0) = 4000
    str = "select moban as 模板 from zd_moban where mobanlx='修改后测试'"

    Rs.Open str, conn
    Set msfshouhou.DataSource = Rs
    Rs.Close


'    '加载医院名称
'    Set rs = Nothing
'    str = "select yiyuanmc from   st_yw_kehuxinxi with(nolock)  where bEnd=0"
'    rs.CursorLocation = adUseClient
'    rs.Open str, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cboyymc.AddItem StringEnDeCodecn(rs("yiyuanmc").Value, 75)
'            rs.MoveNext
'        Next i
'        rs.Close
'    End If

    '加载人员
    Set Rs = Nothing
    str1 = "select xingming from zd_jishuyuan where zhuangtai='1'and zhiwu<>'销售人员'"
    Rs.CursorLocation = adUseClient
    Rs.Open str1, conn
    If Not Rs.EOF Then
        For i = 1 To Rs.RecordCount
            cmbshishiry.AddItem Rs.Fields("xingming").Value
            Rs.MoveNext
        Next i
        Rs.Close
    End If

'    '加载版本
'    Set rs = Nothing
'    str1 = "SELECT  banben FROM yw_banben"
'    rs.CursorLocation = adUseClient
'    rs.Open str1, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cbobanben.AddItem rs.Fields("banben").Value
'            rs.MoveNext
'        Next i
'        rs.Close
'    End If

'    '加载模块
'    Set rs = Nothing
'    str2 = "select mokuaimc from zd_mokuai where banben='" & Trim(cbobanben.Text) & "'"
'    rs.CursorLocation = adUseClient
'    rs.Open str2, conn
'    If Not rs.EOF Then
'        For i = 1 To rs.RecordCount
'            cbomokuan.AddItem rs.Fields("mokuaimc").Value
'            rs.MoveNext
'        Next i
'    End If
'    Set rs = Nothing

    lstWenTiLB.ColumnCaptions = "流水号;软件版本;医院名称;跟进人员;模块;窗体;工程师;紧急程度;问题说明;售中测试说明;接收时间;问题反馈人;反馈人电话;研发修改;录入时间"
    lstWenTiLB.ColumnName = lstWenTiLB.ColumnCaptions

    '加载列标题
'    With MSHwentilb
'        .Cols = 15
'        .TextMatrix(0, 0) = "流水号"
'        .TextMatrix(0, 1) = "软件版本"
'        .TextMatrix(0, 2) = "医院名称"
'        .TextMatrix(0, 3) = "跟进人员"
'        .TextMatrix(0, 4) = "模块"
'        .TextMatrix(0, 5) = "窗体"
'        .TextMatrix(0, 6) = "工程师"
'        .TextMatrix(0, 7) = "紧急程度"
'        .TextMatrix(0, 8) = "问题说明"
'        .TextMatrix(0, 9) = "售中测试说明"
'        .TextMatrix(0, 10) = "接收时间"
'        .TextMatrix(0, 11) = "问题反馈人"
'        .TextMatrix(0, 12) = "反馈人电话"
'        .TextMatrix(0, 13) = "是否研发修改"
'        .TextMatrix(0, 14) = "录入时间"
'        .ColWidth(2) = 2000
'        .ColWidth(8) = 2000
'        .ColWidth(10) = 2500
'        .ColWidth(9) = 5000
'        .ColWidth(14) = 2500
'
'
'    End With
'    txtshijian.Text = GetServerTime
'    msfshouzhong.ColWidth(0) = 4000
    '加载模板
    Set Rs = Nothing
    str = "select moban as 模板 from zd_moban where mobanlx='售中测试'"
    Rs.Open str, conn
    Set msfshouhou.DataSource = Rs
    Set Rs = Nothing
    '    txtkssj.Text = Now - 1
    '    txtjssj.Text = Now
'    txtkssj.Value = Now
'    txtjssj.Value = Now

End Sub

Public Function LoadYYMC(cboZhuangZai As cbo, Optional strTiaoJian As String = "") As Boolean
Dim strSQL As String
   '* 功    能：装载患者类别2
   '* 参    数： 1.组合框
   '*            2.条件,如DaiMa='01'
   '* 返 回 值：是否加载成功
   '* 创 建 人：WangLiguo
   '* 修 改 人：
   '* 修改日期：

   On Error GoTo PROC_ERR
   
   '装载患者类别2
   strSQL = "select YHMC,dbo.fn_GetPy(YHMC) PYM,MK,SYQ,BeiZhu from xt_ConfigServer where ZuoFeiBZ='否' and qy<>'内部'"
          
   '有条件传入时
   If strTiaoJian <> "" Then
      strSQL = strSQL & Chr(13) _
            & "WHERE 1=1" & Chr(13) _
            & "AND " & strTiaoJian
   End If
   
   '代码;拼音码;名称;
   LoadYYMC = objFormSetting.LoadcboData(cboZhuangZai, recorddata, strSQL)

PROC_EXIT:
   Exit Function

PROC_ERR:
   If ERR.Number <> 0 Then
      LoadYYMC = False
      Call ShowError("modLoadData", "LoadHuanZheLB2", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

'Private Sub msfshouzhong_DblClick()
'    txtshouzhongcssm.Text = msfshouzhong.TextMatrix(msfshouzhong.row, 0)
'End Sub

'Private Sub txtshijian_GotFocus()
''取当前时间
'    txtshijian.Text = Now
'End Sub

Private Sub txtshouzhongcssm_KeyDown(KeyCode As Integer, Shift As Integer)
'If KeyCode = 13 And txtshouzhongcssm.Text <> "" Then
'    If cmdzhengjia.Enabled = True Then
''       cmdzhengjia.SetFocus
'    Else
'       MsgBox "查询状态不能录入问题，请先点击“清空”后再录入！", vbOKOnly + vbInformation, "提示"
'       Exit Sub
'    End If
'End If
End Sub

Private Sub txtwentism_KeyDown(KeyCode As Integer, Shift As Integer)
'If KeyCode = 13 And txtwentism.Text <> "" Then
'    txtshouzhongcssm.SetFocus
'End If
'If KeyCode = vbKeyDown And txtwentism.Text <> "" Then
'    txtwentism.Text = txtwentism.Text & Chr(10)
'End If

End Sub
