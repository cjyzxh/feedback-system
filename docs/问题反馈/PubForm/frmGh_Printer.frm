VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Begin VB.Form FrmGh_Printer 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "请设置特用打印机"
   ClientHeight    =   7650
   ClientLeft      =   5475
   ClientTop       =   2325
   ClientWidth     =   7470
   Icon            =   "frmGh_Printer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7650
   ScaleWidth      =   7470
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   28
      Top             =   0
      Width           =   7395
      _ExtentX        =   13044
      _ExtentY        =   714
      Caption         =   "系统打印机设置"
   End
   Begin UserControl.txt txtXiYaoMB 
      Height          =   225
      Left            =   4290
      TabIndex        =   22
      Top             =   5505
      Width           =   2685
      _ExtentX        =   4736
      _ExtentY        =   397
      CaptionWidth    =   105
      RightLabelWidth =   1500
      RightCaption    =   "西药模版编号"
      Hwnd            =   2361034
      ForeColor       =   -2147483640
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
   Begin UserControl.cmd cmdCeShi 
      Height          =   495
      Left            =   2400
      TabIndex        =   19
      Top             =   7065
      Visible         =   0   'False
      Width           =   1140
      _ExtentX        =   2011
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
      Caption         =   "测试"
   End
   Begin UserControl.txt txtMenZhenGHD 
      Height          =   225
      Left            =   4440
      TabIndex        =   12
      Top             =   1020
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   656518
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.cmd CmdTc 
      Height          =   495
      Left            =   1185
      TabIndex        =   10
      Top             =   7065
      Width           =   1170
      _ExtentX        =   2064
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
      Caption         =   "退出"
   End
   Begin UserControl.cmd CmdBc 
      Height          =   495
      Left            =   90
      TabIndex        =   11
      Top             =   7065
      Width           =   1050
      _ExtentX        =   1852
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
      Caption         =   "确认"
   End
   Begin UserControl.cbo cboMenZhenGHD 
      Height          =   225
      Left            =   180
      TabIndex        =   2
      Top             =   1017
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊挂号单"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊挂号单"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboMenZhenFPD 
      Height          =   225
      Left            =   180
      TabIndex        =   4
      Top             =   2358
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊发票单(1)"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊发票单(1)"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboPuTongBB 
      Height          =   225
      Left            =   180
      TabIndex        =   1
      Top             =   570
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "普通报表"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "普通报表"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboZhuYuanYJT 
      Height          =   225
      Left            =   180
      TabIndex        =   9
      Top             =   4593
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "住院押金条"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "住院押金条"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboZhuYuanFPD 
      Height          =   225
      Left            =   180
      TabIndex        =   0
      Top             =   5040
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "住院发票单"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "住院发票单"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboMenZhenFPMX 
      Height          =   225
      Left            =   180
      TabIndex        =   5
      Top             =   2805
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊收费明细(2)"
      CaptionWidth    =   1350
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊收费明细(2)"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboKaZhongXFPD 
      Height          =   225
      Left            =   180
      TabIndex        =   3
      Top             =   1911
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "卡中心发票单"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "卡中心发票单"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboMenZhenSJ 
      Height          =   225
      Left            =   180
      TabIndex        =   6
      Top             =   3252
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊收据(3)"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊收据(3)"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboMenZhenQD 
      Height          =   225
      Left            =   180
      TabIndex        =   8
      Top             =   4146
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊清单"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊清单"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.cbo cboMenZhenTK 
      Height          =   225
      Left            =   180
      TabIndex        =   7
      Top             =   3699
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊退款红票"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊退款红票"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.txt txtKaZhongXFPD 
      Height          =   225
      Left            =   4440
      TabIndex        =   13
      Top             =   1908
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   788786
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtMenZhenFPD 
      Height          =   225
      Left            =   4440
      TabIndex        =   14
      Top             =   2352
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   657716
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtMenZhenFPMX 
      Height          =   225
      Left            =   4440
      TabIndex        =   15
      Top             =   2796
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   657724
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtMenZhenSJ 
      Height          =   225
      Left            =   4440
      TabIndex        =   16
      Top             =   3240
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   723276
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtZhuYuanYJSJ 
      Height          =   225
      Left            =   4605
      TabIndex        =   17
      Top             =   4635
      Width           =   2265
      _ExtentX        =   3995
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   723276
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtZhuYuanFPSJ 
      Height          =   225
      Left            =   4605
      TabIndex        =   18
      Top             =   4995
      Width           =   2265
      _ExtentX        =   3995
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   723276
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtBaoBiaoWJ 
      Height          =   225
      Left            =   180
      TabIndex        =   20
      Top             =   5487
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "报表文件夹名"
      CaptionWidth    =   1260
      Hwnd            =   923266
      ForeColor       =   -2147483640
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.cbo cboYiShengDYJ 
      Height          =   225
      Left            =   180
      TabIndex        =   21
      Top             =   5940
      Width           =   4035
      _ExtentX        =   7117
      _ExtentY        =   397
      Caption         =   "门诊医生打印机"
      CaptionWidth    =   1500
      BackColor       =   15459040
      TextColumn      =   1
      ForeColor       =   16711680
      Caption         =   "门诊医生打印机"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   ""
      ListText        =   ""
   End
   Begin UserControl.txt txtZhongYaoMB 
      Height          =   225
      Left            =   4290
      TabIndex        =   23
      Top             =   5910
      Width           =   2685
      _ExtentX        =   4736
      _ExtentY        =   397
      CaptionWidth    =   105
      RightLabelWidth =   1500
      RightCaption    =   "中药模版编号"
      Hwnd            =   329986
      ForeColor       =   -2147483640
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
   Begin UserControl.txt txtJianChaMB 
      Height          =   225
      Left            =   4305
      TabIndex        =   24
      Top             =   6300
      Width           =   2685
      _ExtentX        =   4736
      _ExtentY        =   397
      CaptionWidth    =   105
      RightLabelWidth =   1500
      RightCaption    =   "检查模版编号"
      Hwnd            =   264466
      ForeColor       =   -2147483640
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
   Begin UserControl.txt txtCaiLiaoMB 
      Height          =   225
      Left            =   4305
      TabIndex        =   25
      Top             =   6690
      Width           =   2685
      _ExtentX        =   4736
      _ExtentY        =   397
      CaptionWidth    =   105
      RightLabelWidth =   1500
      RightCaption    =   "材料模版编号"
      Hwnd            =   264476
      ForeColor       =   -2147483640
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
   Begin UserControl.cbo cboMenZhenGHFP 
      Height          =   225
      Left            =   180
      TabIndex        =   26
      Top             =   1464
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "门诊挂号发票"
      CaptionWidth    =   1200
      BackColor       =   15459040
      TextColumn      =   1
      Caption         =   "门诊挂号发票"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.txt txtMenZhenGHFP 
      Height          =   225
      Left            =   4440
      TabIndex        =   27
      Top             =   1464
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "模版号"
      CaptionWidth    =   630
      Hwnd            =   723276
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Line Line1 
      X1              =   4275
      X2              =   4275
      Y1              =   5640
      Y2              =   6840
   End
End
Attribute VB_Name = "FrmGh_Printer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim m_blnPTemp As Boolean         '是否读取个人模版

Private Type HD_ITEM
  lMask As Long
  cxy As Long
  pszText As String
  hbm As Long
  cchTextMax As Long
  lFmt As Long
  lParam As Long
  lImage As Long
  lOrder As Long
End Type
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Sub CheckListViewForValue(ByRef lvwX As MSComctlLib.ListView, ByVal sValue As String)
  ' Find given value within a listview and mark its checkbox
  Dim itmX As MSComctlLib.ListItem

  Set itmX = lvwX.FindItem(sValue, lvwText)

  If Not itmX Is Nothing Then  ' No match
    Call DeselectAll(lvwX)
    itmX.EnsureVisible
    itmX.Selected = True
    itmX.Checked = True
'    lvwX.SetFocus
    Set itmX = Nothing
  End If
End Sub
Private Sub DeselectAll(ByRef lvwX As MSComctlLib.ListView)
  ' Make sure no items are checked in the listview
  Dim lLoop As Long

  For lLoop = 1 To lvwX.ListItems.Count
    lvwX.ListItems(lLoop).Checked = False
  Next
End Sub
Private Sub ShowHeaderIcon(ByRef lvwX As MSComctlLib.ListView, ByVal lIconNo As Long)
  Dim lHeader As Long
  Dim tHD As HD_ITEM

  ' Get a handle to the listview header component
  lHeader = SendMessage(lvwX.hWnd, LVM_GETHEADER, 0, 0)

  ' Set up the required structure members
  With tHD
    .lMask = HDI_IMAGE Or HDI_FORMAT
    .lFmt = HDF_STRING Or HDF_IMAGE Or HDF_BITMAP_ON_RIGHT
    .lImage = lIconNo
  End With

  ' Modify the header
  Call SendMessage(lHeader, HDM_SETITEM, 0, tHD)
End Sub

Private Sub ChckqY_Click()
  If ChckqY.Value = "1" Then
    Frame1.Enabled = True
    Frame2.Enabled = True
  Else
    Frame1.Enabled = False
    Frame2.Enabled = False
  End If
End Sub




Private Sub cboKaZhongXFPD_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboMenZhenFPD_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboMenZhenFPMX_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboMenZhenGHD_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboMenZhenGHFP_SelectChanged()
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboMenZhenQD_SelectChanged()
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub cboPuTongBB_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub


Private Sub cboZhuYuanFPD_KeyPress(KeyAscii As Integer)
    CmdBc.SetFocus
End Sub

Private Sub cboZhuYuanYJT_KeyPress(KeyAscii As Integer)
   '跳下一格控件
   If KeyAscii = vbKeyReturn Then
      Call SendKeys
   End If
End Sub

Private Sub CmdBc_Click()
  
   '保存打印机
   '普通报表
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "PuTongBBDYJ", cboPuTongBB.Value
   '卡中心发票
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "KaZhongXFPDYJ", cboKaZhongXFPD.Value
   '门诊挂号单
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenGHDYJ", cboMenZhenGHD.Value
   '门诊挂号发票
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenGHFPYJ", cboMenZhenGHFP.Value
   '门诊发票
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenFPDDYJ", cboMenZhenFPD.Value
   '门诊明细
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenFPMX", cboMenZhenFPMX.Value
   '门诊收据
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenSJ", cboMenZhenSJ.Value
   '门诊退款
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenTK", cboMenZhenTK.Value
   '门诊清单
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "MenZhenQD", cboMenZhenQD.Value
   '住院押金
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "ZhuYuanYJDYJ", cboZhuYuanYJT.Value
   '住院发票
   SaveSetting "CjySoftPrinter", "CjySoftPrinter", "ZhuYuanFPDYJ", cboZhuYuanFPD.Value
   '医生站打印机
    SaveSetting "CjySoftPrinter", "CjySoftPrinter", "YiShengZDYJ", cboYiShengDYJ.Value

'''
''''模版号保存
   '卡中心发票
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "KaZhongXFPD", txtKaZhongXFPD.Text
   '门诊挂号单
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "MenZhenGHD", txtMenZhenGHD.Text
   '门诊挂号发票
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "MenZhenGHFP", txtMenZhenGHFP.Text
   '门诊发票
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "MenZhenFPD", txtMenZhenFPD.Text         '一般  对应1号模版   DaYinZSFP
   '门诊明细
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "MenZhenFPMX", txtMenZhenFPMX.Text       '对因2号      DaYinyyFP 提示
   '门诊收据
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "MenZhenSJ", txtMenZhenSJ.Text           '对因明细      DaYinMX 提示
  
   '住院押金收据
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "ZhuYuanYJSJ", txtZhuYuanYJSJ.Text
   '住院发票
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "ZhuYuanFPSJ", txtZhuYuanFPSJ.Text
   '新报表文件夹存放名
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "XinBaoBiaoWJJM", txtBaoBiaoWJ.Text
   '医生站处方模版
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "YiShengXYMB", txtXiYaoMB.Text
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "YiShengCYMB", txtZhongYaoMB.Text
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "YiShengJCMB", txtJianChaMB.Text
   SaveSetting "CjySoftPrinter", "CjySoftTemplate", "YiShengHCMB", txtCaiLiaoMB.Text
   
   '设置普通报表为默认打印机
   If cboPuTongBB.Value <> "" Then
      SetDefaultPrinter cboPuTongBB.Value
   End If
   
   MsgBox "保存成功！请继续！", vbInformation, "提示！"
  
End Sub

Private Sub cmdCeShi_Click()

   Dim rstData       As ADODB.Recordset
   Dim dblFaPiaoSL   As Double
   Dim dblTuiPiaoSL  As Double
   Dim dblHeJiJE     As Double
   Dim colData       As Collection
   
   Dim dblChuFangSL     As Double
   Dim dblChuFangJE     As Double
   Dim dblChuFangTFSL   As Double
   Dim dblChuFangTFJE   As Double
   
   Dim dblJianChaSL     As Double
   Dim dblJianChaJE     As Double
   Dim dblJianChaTFSL   As Double
   Dim dblJianChaTFJE   As Double
   
   Dim strYuJu     As Boolean
   Dim blnReturn   As Boolean
   Dim strBaoBiaoM As String
   Dim strXiTongCS As String
   Dim strSQL      As String
   Dim objShouJv   As Object
   Dim ctl         As Control
   
   
   If GetPrinter("MenZhenQD") <> "" Then
      SetDefaultPrinter GetPrinter("MenZhenQD")
   End If
   If CheckPrinter("MenZhenQD") = False Then
      Exit Sub
   End If
      
   Set colData = New Collection
   colData.Add "交款日结单"
   colData.Add ""
   colData.Add "处方数量"
   colData.Add dblChuFangSL
   colData.Add "处方收费金额"
   colData.Add dblChuFangJE
   colData.Add "退费数量"
   colData.Add dblChuFangTFSL
   colData.Add "处方退费金额"
   colData.Add dblChuFangTFJE
   colData.Add "检查单数量"
   colData.Add dblJianChaSL
   colData.Add "检查单收费金额"
   colData.Add dblJianChaJE
   colData.Add "退费检查单数量"
   colData.Add dblJianChaTFSL
   colData.Add "检查单退费金额"
   colData.Add dblJianChaTFJE
   colData.Add "发票数量合计"
   colData.Add dblFaPiaoSL
   colData.Add "打废发票数量"
   colData.Add dblTuiPiaoSL
   colData.Add "现金"
   colData.Add dblHeJiJE
   colData.Add "打印时间"
   colData.Add objStandData.getSystemDate(DateTime)
   colData.Add "交款人"
   colData.Add g_strYongHuMC
   colData.Add "部门"
   colData.Add g_strKeShiMC

   
   blnReturn = objPrt1.PutVariant(colData)

   g_strSQL = "SELECT '111111' 列 UNION select '333333' "
   
   strBaoBiaoM = "1.fr3"
      '是否设计报表
   If strXiTongCS = "0" Then
      blnReturn = objPrt1.ReportDesignex(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   ElseIf 1 Then
      blnReturn = objPrt1.ReportPreviewEX(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   Else
      blnReturn = objPrt1.ReportPrintEX(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   End If
   
   strBaoBiaoM = "2.fr3"
   g_strSQL = "SELECT '22222' 列 UNION select '444444' "
      '是否设计报表
   If strXiTongCS = "0" Then
      blnReturn = objPrt1.ReportDesignex(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   ElseIf 1 Then
      blnReturn = objPrt1.ReportPreviewEX(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   Else
      blnReturn = objPrt1.ReportPrintEX(g_strSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM)
   End If
End Sub

Private Sub cmdTC_Click()
   Unload Me
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Click()
   CmdBc.SetFocus
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)
End Sub

Private Sub Form_Load()

   Dim prtX As VB.Printer
   Dim strPrinter As String     '打印机信息
   Dim colPrinter As Collection

   m_blnPTemp = False
   If getXiTongCS(g_eXiTongCS.MenZhenDYMBDYFS) = "2" Then
      m_blnPTemp = True
   End If
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 7560 '5760
   Const c_formHeight = 8130
 
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

   If g_objRegCheck.CenterName = "北京同济男科医院" Then
      cboMenZhenSJ.Caption = "门诊日结单"
   End If

   cboMenZhenGHD.SetListCaption "选择打印机;"
   cboMenZhenGHD.SetColumnWidth "4000;"
   cboMenZhenGHFP.SetListCaption "选择打印机;"
   cboMenZhenGHFP.SetColumnWidth "4000;"
   cboKaZhongXFPD.SetListCaption "选择打印机;"
   cboKaZhongXFPD.SetColumnWidth "4000;"
   cboMenZhenFPD.SetListCaption "选择打印机;"
   cboMenZhenFPD.SetColumnWidth "4000;"
   cboPuTongBB.SetListCaption "选择打印机;"
   cboPuTongBB.SetColumnWidth "4000;"
   cboZhuYuanYJT.SetListCaption "选择打印机;"
   cboZhuYuanYJT.SetColumnWidth "4000;"
   cboZhuYuanFPD.SetListCaption "选择打印机;"
   cboZhuYuanFPD.SetColumnWidth "4000;"
   cboMenZhenFPMX.SetListCaption "选择打印机;"
   cboMenZhenFPMX.SetColumnWidth "4000;"
   cboMenZhenSJ.SetListCaption "选择打印机;"
   cboMenZhenSJ.SetColumnWidth "4000;"
   cboMenZhenQD.SetListCaption "选择打印机;"
   cboMenZhenQD.SetColumnWidth "4000;"
   cboMenZhenTK.SetListCaption "选择打印机;"
   cboMenZhenTK.SetColumnWidth "4000;"
   
   cboYiShengDYJ.SetListCaption "选择打印机;"
   cboYiShengDYJ.SetColumnWidth "4000;"
   
   '装载打印机选项
   Select Case WinVer
      Case "NT", "00", "XP"
      sPath = "Software\Microsoft\Windows NT\CurrentVersion\Windows"
      Case "95", "98", "ME"
      sPath = "Software\Microsoft\Windows\CurrentVersion\Windows"
   End Select

   For Each prtX In VB.Printers
      Set colPrinter = New Collection
      strPrinter = prtX.DeviceName & "," & prtX.DriverName & "," & prtX.Port
      colPrinter.Add strPrinter
      '加载到所有的组合框
      cboMenZhenGHD.SetData colPrinter
      cboMenZhenGHFP.SetData colPrinter
      cboKaZhongXFPD.SetData colPrinter
      cboMenZhenFPD.SetData colPrinter
      cboPuTongBB.SetData colPrinter
      cboZhuYuanYJT.SetData colPrinter
      cboZhuYuanFPD.SetData colPrinter
      cboMenZhenFPMX.SetData colPrinter
      cboMenZhenSJ.SetData colPrinter
      cboMenZhenQD.SetData colPrinter
      cboMenZhenTK.SetData colPrinter
      
      cboYiShengDYJ.SetData colPrinter
   Next
   

   '提取打印机
   cboMenZhenGHD.InitValue GetPrinter("MenZhenGHDYJ")
   cboMenZhenGHFP.InitValue GetPrinter("MenZhenGHFPYJ")
   cboKaZhongXFPD.InitValue GetPrinter("KaZhongXFPDYJ")
   cboMenZhenFPD.InitValue GetPrinter("MenZhenFPDDYJ")
   cboPuTongBB.InitValue GetPrinter("PuTongBBDYJ")
   cboZhuYuanYJT.InitValue GetPrinter("ZhuYuanYJDYJ")
   cboZhuYuanFPD.InitValue GetPrinter("ZhuYuanFPDYJ")
   cboMenZhenFPMX.InitValue GetPrinter("MenZhenFPMX")
   cboMenZhenSJ.InitValue GetPrinter("MenZhenSJ")
   cboMenZhenQD.InitValue GetPrinter("MenZhenQD")
   cboMenZhenTK.InitValue GetPrinter("MenZhenTK")
   '医生站设置
   cboYiShengDYJ.InitValue GetPrinter("YiShengZDYJ")
    
   Set prtX = Nothing
   
   '医生站设置
   txtXiYaoMB.Text = GetTemplate("YiShengXYMB")
   txtZhongYaoMB.Text = GetTemplate("YiShengCYMB")
   txtJianChaMB.Text = GetTemplate("YiShengJCMB")
   txtCaiLiaoMB.Text = GetTemplate("YiShengHCMB")
   
   txtKaZhongXFPD.Text = GetTemplate("KaZhongXFPD")
   txtMenZhenGHD.Text = GetTemplate("MenZhenGHD")
   txtMenZhenGHFP.Text = GetTemplate("MenZhenGHFP")
   txtMenZhenFPD.Text = GetTemplate("MenZhenFPD")
   txtMenZhenFPMX.Text = GetTemplate("MenZhenFPMX")
   txtMenZhenSJ.Text = GetTemplate("MenZhenSJ")

   txtZhuYuanYJSJ.Text = GetTemplate("ZhuYuanYJSJ")
   txtZhuYuanFPSJ.Text = GetTemplate("ZhuYuanFPSJ")
   
   
    
   '新报表文件夹存放名
   txtBaoBiaoWJ.Text = GetTemplate("XinBaoBiaoWJJM")
End Sub

Private Sub OptT1_Click()
  OptT2.Value = False
  OptZ2.Value = True
End Sub

Private Sub Label4_Click()

End Sub

Private Sub OptT2_Click()
  OptT1.Value = False
  OptZ1.Value = True
End Sub

Private Sub OptZ1_Click()
    OptT2.Value = True
    OptZ2.Value = False
End Sub

Private Sub OptZ2_Click()
     OptT1.Value = True
     OptZ1.Value = False
End Sub


