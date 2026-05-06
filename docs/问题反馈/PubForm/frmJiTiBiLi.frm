VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Object = "{A964BDA3-3E93-11CF-9A0F-9E6261DACD1C}#3.0#0"; "RESIZE32.OCX"
Begin VB.Form frmJiTiBiLi 
   BackColor       =   &H00FFFFFF&
   Caption         =   "计提对象"
   ClientHeight    =   7560
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   11700
   Icon            =   "frmJiTiBiLi.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   7560
   ScaleWidth      =   11700
   Begin UserControl.pic pic1 
      Height          =   390
      Left            =   60
      TabIndex        =   38
      Top             =   0
      Width           =   11595
      _ExtentX        =   20452
      _ExtentY        =   688
      Caption         =   "计提对象"
   End
   Begin ResizeLibCtl.ReSize ReSize1 
      Left            =   10860
      Top             =   7020
      _Version        =   196608
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   64
      Enabled         =   -1  'True
      FormMinWidth    =   0
      FormMinHeight   =   0
      FormDesignHeight=   7560
      FormDesignWidth =   11700
   End
   Begin UserControl.cbo cboKeShi 
      Height          =   225
      Left            =   9360
      TabIndex        =   0
      Top             =   1740
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   397
      Caption         =   "开单科室"
      BackColor       =   16777215
      ForeColor       =   16711680
      Caption         =   "开单科室"
      ListHeight      =   2000
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "500;700;1200;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboKaLeiB 
      Height          =   225
      Left            =   6765
      TabIndex        =   1
      Top             =   1740
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   397
      Caption         =   "卡类别"
      CaptionWidth    =   600
      BackColor       =   16777215
      ForeColor       =   16711680
      Caption         =   "卡类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboXingBie 
      Height          =   225
      Left            =   3960
      TabIndex        =   2
      Top             =   1365
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "性别"
      CaptionWidth    =   500
      BackColor       =   16777215
      TextColumn      =   2
      ForeColor       =   16711680
      Caption         =   "性别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "代码;名称;"
      ColWidths       =   "600;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.txt txtJiTiBLLSH 
      Height          =   225
      Left            =   1320
      TabIndex        =   3
      Top             =   7665
      Visible         =   0   'False
      Width           =   1710
      _ExtentX        =   3149
      _ExtentY        =   397
      Caption         =   "流水号"
      CaptionWidth    =   630
      Hwnd            =   263756
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
   Begin UserControl.cmd cmdTuiChu 
      Height          =   435
      Left            =   8100
      TabIndex        =   4
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退出(&Q)"
   End
   Begin UserControl.cmd cmdZengJia 
      Height          =   435
      Left            =   60
      TabIndex        =   5
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "增加(&A)"
   End
   Begin UserControl.cmd cmdXiuGai 
      Height          =   435
      Left            =   1110
      TabIndex        =   6
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      Enabled         =   0   'False
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "修改(&M)"
   End
   Begin UserControl.cmd cmdChaXun 
      Height          =   435
      Left            =   3210
      TabIndex        =   7
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "查询(&S)"
   End
   Begin UserControl.cmd cmdQingChuTJ 
      Height          =   435
      Left            =   5730
      TabIndex        =   8
      Top             =   7065
      Width           =   1245
      _ExtentX        =   2196
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "清除条件(&C)"
   End
   Begin UserControl.cmd cmdDaoChu 
      Height          =   435
      Left            =   7050
      TabIndex        =   9
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "导出(&E)"
   End
   Begin UserControl.cbo cboHuanZheLB1 
      Height          =   225
      Left            =   9315
      TabIndex        =   10
      Top             =   1365
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   397
      Caption         =   "患者类别1"
      BackColor       =   16777215
      Caption         =   "患者类别1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.lst lstJiTiBL 
      Height          =   3615
      Left            =   3900
      TabIndex        =   11
      Top             =   3345
      Width           =   7755
      _ExtentX        =   13679
      _ExtentY        =   6376
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   4
      Cols            =   1
      BackColorBkg    =   16777215
      BackColorFixed  =   14737632
      BackColorFrozen =   8454143
      BackColorSel    =   -2147483635
      ForeColorFixed  =   -2147483640
      ForeColorSel    =   -2147483640
      RowHeightMin    =   300
      ColumnCaptions  =   "序号"
      ColWidths       =   "800"
   End
   Begin UserControl.dtm dtmJieShuRQ 
      Height          =   225
      Left            =   7980
      TabIndex        =   12
      Top             =   660
      Width           =   3675
      _ExtentX        =   6482
      _ExtentY        =   397
      Caption         =   "结束日期"
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
   Begin UserControl.cbo cboHuanZheLB2 
      Height          =   225
      Left            =   4020
      TabIndex        =   13
      Top             =   1740
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
      Caption         =   "患者类别2"
      BackColor       =   16777215
      Caption         =   "患者类别2"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.dtm dtmKaiShiRQ 
      Height          =   225
      Left            =   3960
      TabIndex        =   14
      Top             =   660
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   397
      Caption         =   "开始日期"
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
   Begin UserControl.cmd cmdShanChu 
      Height          =   435
      Left            =   2160
      TabIndex        =   15
      Top             =   7065
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   767
      Enabled         =   0   'False
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "删除(&D)"
   End
   Begin UserControl.cbo cboFeiYongLB 
      Height          =   225
      Left            =   120
      TabIndex        =   16
      Top             =   780
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   397
      Caption         =   "费用类别"
      BackColor       =   16777215
      ForeColor       =   16711680
      Caption         =   "费用类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboYaoPinDM 
      Height          =   225
      Left            =   120
      TabIndex        =   17
      Top             =   1140
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   397
      Caption         =   "具体项目"
      BackColor       =   16777215
      ForeColor       =   16711680
      Caption         =   "具体项目"
      MuchItems       =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.lst lstJiTiLeiBie 
      Height          =   5415
      Left            =   120
      TabIndex        =   18
      Top             =   1560
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   9551
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   4
      Cols            =   2
      BackColorBkg    =   16777215
      BackColorFixed  =   14737632
      BackColorFrozen =   8454143
      BackColorSel    =   16768220
      GridColor       =   12582912
      GridColorFixed  =   12582912
      RowHeightMin    =   300
      ColumnCaptions  =   "序号"
      ColWidths       =   ""
      EnableChecked   =   -1  'True
      EnableDrag      =   -1  'True
      EnableSort      =   -1  'True
   End
   Begin UserControl.cmd cmdChaXunALL 
      Height          =   435
      Left            =   4260
      TabIndex        =   19
      Top             =   7065
      Width           =   1395
      _ExtentX        =   2461
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "查询全部(&Q)"
   End
   Begin UserControl.num numJieShuNL 
      Height          =   285
      Left            =   8040
      TabIndex        =   20
      Top             =   1020
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   503
      Caption         =   "数值"
      CaptionWidth    =   420
      Hwnd            =   197890
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
   Begin UserControl.num numKaiShiNL 
      Height          =   285
      Left            =   6720
      TabIndex        =   21
      Top             =   1020
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   503
      Caption         =   "数值"
      CaptionWidth    =   420
      Hwnd            =   197896
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
   Begin UserControl.cbo cboJiFeiLB 
      Height          =   225
      Left            =   9240
      TabIndex        =   22
      Top             =   3720
      Visible         =   0   'False
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   397
      Caption         =   "计费类别"
      BackColor       =   16777215
      Caption         =   "计费类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboJiJiaDX 
      Height          =   225
      Left            =   9000
      TabIndex        =   23
      Top             =   3720
      Visible         =   0   'False
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   397
      Caption         =   "计价对象"
      BackColor       =   16777215
      Caption         =   "计价对象"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboZhuanZhenYS 
      Height          =   225
      Left            =   3960
      TabIndex        =   24
      Top             =   2160
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "转诊医生"
      BackColor       =   16777215
      Caption         =   "转诊医生"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboHuanZheLY 
      Height          =   225
      Left            =   6720
      TabIndex        =   25
      Top             =   2580
      Width           =   2340
      _ExtentX        =   4128
      _ExtentY        =   397
      Caption         =   "患者来源"
      BackColor       =   16777215
      ValueColumn     =   3
      InputColumn     =   3
      Caption         =   "患者来源"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColWidths       =   "600;800;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.cbo cboXinXiLY 
      Height          =   225
      Left            =   9375
      TabIndex        =   26
      Top             =   2580
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   397
      Caption         =   "信息来源"
      BackColor       =   16777215
      ValueColumn     =   3
      InputColumn     =   3
      Caption         =   "信息来源"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColWidths       =   "600;800;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.cbo cboGuaHaoLB 
      Height          =   225
      Left            =   9270
      TabIndex        =   27
      Top             =   1020
      Width           =   2340
      _ExtentX        =   4128
      _ExtentY        =   397
      Caption         =   "挂号类别"
      BackColor       =   16777215
      ValueColumn     =   2
      TextColumn      =   2
      Caption         =   "挂号类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColWidths       =   "600;800;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.cbo cboChuFuZ 
      Height          =   225
      Left            =   6660
      TabIndex        =   28
      Top             =   1365
      Width           =   2400
      _ExtentX        =   4233
      _ExtentY        =   397
      Caption         =   "初复诊"
      CaptionWidth    =   600
      BackColor       =   16777215
      ValueColumn     =   2
      TextColumn      =   2
      Caption         =   "初复诊"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColumnCaptions  =   "序号;名称;"
      ColWidths       =   "600;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin UserControl.num numJieShuZK 
      Height          =   285
      Left            =   9120
      TabIndex        =   29
      Top             =   2940
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   503
      Caption         =   "数值"
      CaptionWidth    =   420
      Hwnd            =   197890
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
   Begin UserControl.num numKaiShiZK 
      Height          =   285
      Left            =   6660
      TabIndex        =   30
      Top             =   2940
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   503
      Caption         =   "数值"
      CaptionWidth    =   420
      Hwnd            =   197896
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
   Begin UserControl.cbo cboJiTiFS 
      Height          =   225
      Left            =   3960
      TabIndex        =   31
      Top             =   2580
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   397
      Caption         =   "计提方式"
      BackColor       =   16777215
      Caption         =   "计提方式"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColWidths       =   "600;800;800;"
      ListText        =   ""
   End
   Begin UserControl.num numJiTiJE 
      Height          =   285
      Left            =   3960
      TabIndex        =   32
      Top             =   2955
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   503
      Caption         =   "数值"
      CaptionWidth    =   420
      BackColor       =   -2147483633
      Hwnd            =   135522
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
   Begin UserControl.cbo cboYeWuXZ 
      Height          =   225
      Left            =   6720
      TabIndex        =   33
      Top             =   2160
      Width           =   2340
      _ExtentX        =   4128
      _ExtentY        =   397
      Caption         =   "业务小组"
      BackColor       =   16777215
      Caption         =   "业务小组"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColumnCaptions  =   "代码;拼音;名称;"
      ColWidths       =   "800;800;1000;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboYeWuY 
      Height          =   225
      Left            =   9375
      TabIndex        =   34
      Top             =   2160
      Width           =   2235
      _ExtentX        =   3942
      _ExtentY        =   397
      Caption         =   "业务员"
      CaptionWidth    =   600
      BackColor       =   16777215
      Caption         =   "业务员"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColumnCaptions  =   "代码;拼音;名称;"
      ColWidths       =   "800;800;1000;"
      ListText        =   ""
   End
   Begin UserControl.txt txtDaiMa 
      Height          =   225
      Left            =   3120
      TabIndex        =   35
      Top             =   7680
      Visible         =   0   'False
      Width           =   1710
      _ExtentX        =   3149
      _ExtentY        =   397
      Caption         =   "代码"
      CaptionWidth    =   420
      Hwnd            =   263756
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
   Begin UserControl.cbo cboLeiBie 
      Height          =   225
      Left            =   4035
      TabIndex        =   36
      Top             =   1020
      Width           =   2340
      _ExtentX        =   4128
      _ExtentY        =   397
      Caption         =   "类别"
      CaptionWidth    =   600
      BackColor       =   16777215
      ValueColumn     =   2
      TextColumn      =   2
      Caption         =   "类别"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      EnableAdjustHeight=   -1  'True
      ColumnCaptions  =   "序号;名称;"
      ColWidths       =   "600;800;"
      isSearch        =   0   'False
      ListText        =   ""
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "计提类别"
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
      Height          =   975
      Left            =   60
      TabIndex        =   37
      Top             =   480
      Width           =   3795
   End
End
Attribute VB_Name = "frmJiTiBiLi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim strKaiShiNL As Integer
Dim strJieShuNL As Integer
Dim m_lngRow As Long            'list控件的选中行数
Dim m_blnXiuGai As Boolean

Private Sub cmdDaoRu_Click()
   
   '* 功    能：从Excel 文件导入信息
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
   Call ImportFromExcel(Me, lstJiTiBL, "zd_FuFeiBiLi")

End Sub

 

Private Sub cboFeiYongLB_LostFocus()
   Call LoadJiTiDX
End Sub

Private Sub cboYaoPinDM_KeyPress(KeyAscii As Integer)
  If KeyAscii = vbKeyReturn Then
      g_strTiaoJian = ""
      '选择新的费用类别
      If cboFeiYongLB.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & " FeiYongLB='" & cboFeiYongLB.Value & "'"
      End If
      '装载药品(医嘱名称)
      cboYaoPinDM.LoadOver = False
      If LoadYaoPin(cboYaoPinDM, g_strTiaoJian) = False Then
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
         GoTo PROC_EXIT
      End If
   End If
   
PROC_EXIT:
   Exit Sub
End Sub

Private Sub cboYaoPinDM_LostFocus()


    Dim rstFeiYongLB As ADODB.Recordset
    
    If cboFeiYongLB.Text = "" And cboYaoPinDM.Text <> "" Then
        g_strSQL = "SELECT FeiYOngLB FROM zd_ShouFeiZiDian WHERE DaiMa='" & cboYaoPinDM.Value & "'"
    
        Set rstFeiYongLB = objExecuteSQL.GetRs(g_strSQL)
        If Not rstFeiYongLB.EOF Then
            cboFeiYongLB.InitValue rstFeiYongLB(0)
        End If
    End If

    Call LoadJiTiDX
End Sub
 

Private Sub cboYeWuXZ_LostFocus()
'装载营销人员
   Call LoadYingXiaoRY
End Sub
  
 Private Sub LoadYingXiaoRY()
  
   cboYeWuY.ClearData
   cboYeWuY.LoadOver = False
   If cboYeWuXZ.Text <> "" And cboYeWuY.Text = "" Then
      g_strTiaoJian = "AND KeShi='" & cboYeWuXZ.Value & "'"
      g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_YongHu WHERE LeiBie ='市场营销' AND " & Chr(13) _
               & " (TingYongBZ='否' OR ISNULL(TingYongBZ,'')='') " & g_strTiaoJian
      If objFormSetting.LoadcboData(cboYeWuY, recorddata, g_strSQL) = False Then
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      End If
   End If
End Sub
 

Private Sub cmdChaXunALL_Click()
   '生成查询需要的SQL语句
   g_strSQL = CreateSql(2)
   
   '把查询的记录插入到列表中
   If objFormSetting.FillList(lstJiTiBL, g_strSQL) = 0 Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
   End If

   '将修改按钮的属性改为无效
   cmdXiuGai.Enabled = False
   cmdShanChu.Enabled = False
End Sub

Private Sub cmdShanChu_Click()

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuTS) = vbNo Then
      GoTo PROC_EXIT
   End If
   
   '判断字典是否已经被用用过，如果被引用了，将不能被删除
   If IsAllowDeleted("zd_JiTiBL", lstJiTiBL.cellValue(lstJiTiBL.getSelectedRow, "JiTiBLLSH")) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NotAllowDeleted)
      GoTo PROC_EXIT
   End If
   
   '调用删除函数，删除选中数据,需要改
   If ShanChuSJ() Then
      '提示操作完毕
      g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuCG)
      lstJiTiBL.RemoveItem (lstJiTiBL.getSelectedRow)
      cmdShanChu.Enabled = False
      cmdXiuGai.Enabled = False
   Else
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.DeleteDataFailure)
   End If

PROC_EXIT:
   Exit Sub
   
End Sub

Private Function ShanChuSJ() As Boolean

   '* 功    能：删除记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：

   On Error GoTo PROC_ERR

   '如果没有执行成功SQL语句
   g_strTiaoJian = "JiTiBLLSH = '" & txtJiTiBLLSH.Text & "'"
   If objExecuteSQL.DeleteRecord("zd_JiTiBL", g_strTiaoJian) = False Then
      ShanChuSJ = False
      GoTo PROC_EXIT
   End If
   
   ShanChuSJ = True
   
PROC_EXIT:
   Exit Function
PROC_ERR:
   If ERR.Number <> 0 Then
      ShanChuSJ = False
      Call ShowError(Me.Name, "ShanChuSJ()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

Private Sub cmdTuiChu_Click()

   Unload Me
   
End Sub

Private Sub cmdZengJia_Click()
   
   '* 功    能：向数据库中添加记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
   '功能描述
   Dim colList As Collection   '集合
   Dim rstJiTiBLLSH As ADODB.Recordset  '付费比例流水号
   Dim lngRow As Long
   Dim strKaiShiRQ As String
   Dim strJieShuRQ As String
   Dim strKaiShiNL As Double
   Dim strJieShuNL As Double
   
   '修改调用不提示
   If m_blnXiuGai Then
      m_blnXiuGai = False
   Else
    '提示是否操作
    If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaTS) = vbNo Then
       GoTo PROC_EXIT
    End If
   End If
   
   For lngRow = 1 To lstJiTiLeiBie.getMaxRow
       If lstJiTiLeiBie.getCheckedValue(lngRow) Then
           '判断输入数据是否重复，且有效
            g_strTiaoJian = " AND DaiMa='" & lstJiTiLeiBie.cellValue(lngRow, "DaiMa") & "' "
            
           '查找流水号
           g_strSQL = "SELECT count(1)" & Chr(13) _
                    & "FROM zd_JiTiBL" & Chr(13) _
                    & "WHERE 1=1 " & g_strTiaoJian
           Set rstJiTiBLLSH = objExecuteSQL.GetRs(g_strSQL)
            
           If rstJiTiBLLSH(0) > 0 Then
              If MsgBox("有相似的比例设定,是否继续添加?", vbQuestion + vbYesNo, "系统提示") = vbYes Then
              Else
                 GoTo PROC_EXIT
              End If
           End If
                  '生成流水号
                  txtJiTiBLLSH.Text = GetLiuShuiH(g_eLiuShuiHXX.FuFeiBLLSH)
                   
                  
                  '调用增加函数，增加输入数据
                  If ZengJiaSJ(lstJiTiLeiBie.cellValue(lngRow, "DaiMa")) = True Then
                     '提示操作完毕完毕
                     g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaCG)
            
                     '把数据加 入到列表 中
'JiTiBLLSH;DaiMa;KaiShiRQ;JieShuRQ;KaiShiNL;JieShuNL;HuanZheLB1MC;HuanZheLB2MC;XingBie;KaLeiBMC;KaiDanKSMC;YeWuXZMC;YeWuYMC;ZhuanZhenYSMC;
' ChuFuZ;XinXiLY;HuanZheLY;GuaHaoLB;JiTiFSMC;JiTiJE;KaiShiZK;JieShuZK;
                     Set colList = New Collection
                     colList.Add txtJiTiBLLSH.Text
                     colList.Add lstJiTiLeiBie.cellValue(lngRow, "DaiMa")
                     colList.Add dtmKaiShiRQ.GetDate
                     colList.Add dtmJieShuRQ.GetDate
                     colList.Add cboLeiBie.Text
                     colList.Add numKaiShiNL.Text
                     colList.Add numJieShuNL.Text
                     colList.Add cboHuanZheLB1.Text
                     colList.Add cboHuanZheLB2.Text
                     colList.Add cboXingBie.Text
                     colList.Add cboKaLeiB.Text
                     colList.Add cboKeShi.Text
                     colList.Add cboYeWuXZ.Text
                     colList.Add cboYeWuY.Text
                     colList.Add cboZhuanZhenYS.Text
                     colList.Add cboChuFuZ.Text
                     colList.Add cboXinXiLY.Text
                     colList.Add cboHuanZheLY.Text
                     colList.Add cboGuaHaoLB.Text
                     colList.Add cboJiTiFS.Text
                     colList.Add numJiTiJE.Text
                     colList.Add numKaiShiZK.Text
                     colList.Add numJieShuZK.Text
                     
                     lstJiTiBL.AddItem colList
                     Set colList = Nothing
                  Else
                     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.AddDataFailure)
                     Exit For
                  End If

       End If
   Next lngRow
PROC_EXIT:
   Exit Sub

End Sub

Private Function ZengJiaSJ(strJiTiDM As String) As Boolean

   '* 功    能：增加内容
   '* 参    数：
   '* 返 回 值：True-执行成功，
   '*        False-执行失败
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：

   On Error GoTo PROC_ERR
   Dim colInsert As Collection   '字段赋值的Collection对象
  
   

   If objConvertData.ConvertNumber(numKaiShiNL.Text) = 0 Then
      strKaiShiNL = 0
   Else
      strKaiShiNL = objConvertData.ConvertNumber(numKaiShiNL.Text)
   End If
   
   If objConvertData.ConvertNumber(numJieShuNL.Text) = 0 Then
      strJieShuNL = 200
   Else
      strJieShuNL = objConvertData.ConvertNumber(numJieShuNL.Text)
   End If
   '插入表中
   Set colInsert = New Collection
   '依次添加字段
   
      'JiTiBLLSH , DaiMa, KaiShiRQ, JieShuRQ,Leibie, KaiShiNL, JieShuNL, HuanZheLB1, HuanZheLB1MC, HuanZheLB2,
      'HuanZheLB2MC , XingBie, KaLeiB, KaLeiBMC, KaiDanKS, KaiDanKSMC, YeWuXZ, YeWuXZMC, YeWuY,YeWuYMC,
      'ZhuanZhenYS , ZhuanZhenYSMC, ChuFuZ, XinXiLY, HuanZheLY,GuaHaoLB,
      'JiTiFS , JiTiFSMC, JiTiJE, KaiShiZK, JieShuZK, JiLuSCR, JiLuSCRMC, JiLuSCRQ, ZuiHouXGR, ZuiHouXGRMC, ZuiHouXGRQ

   colInsert.Add "JiTiBLLSH =  '" & txtJiTiBLLSH.Text & "'"       '计提比例流水号
 
   colInsert.Add "DaiMa =  '" & strJiTiDM & "'"
   colInsert.Add "KaiShiRQ='" & dtmKaiShiRQ.GetDate & "'"
   colInsert.Add "JieShuRQ='" & dtmJieShuRQ.GetDate & "'"
   colInsert.Add " LeiBie='" & cboLeiBie.Text & "'"

   colInsert.Add " KaiShiNL='" & objConvertData.ConvertNumber(numKaiShiNL.Text) & "'"
   colInsert.Add " JieShuNL='" & objConvertData.ConvertNumber(numJieShuNL.Text) & "'"

   colInsert.Add " HuanZheLB1='" & cboHuanZheLB1.Value & "'"
   colInsert.Add " HuanZheLB1MC='" & cboHuanZheLB1.Text & "'"
   colInsert.Add " HuanZheLB2='" & cboHuanZheLB2.Value & "'"
   colInsert.Add " HuanZheLB2MC='" & cboHuanZheLB2.Text & "'"
   colInsert.Add " XingBie='" & cboXingBie.Text & "'"
   colInsert.Add " KaLeiB='" & cboKaLeiB.Value & "'"
   colInsert.Add " KaLeiBMC='" & cboKaLeiB.Text & "'"
   colInsert.Add " KaiDanKS='" & cboKeShi.Value & "'"
   colInsert.Add " KaiDanKSMC='" & cboKeShi.Text & "'"
   colInsert.Add " YeWuXZ='" & cboYeWuXZ.Value & "'"
   colInsert.Add " YeWuXZMC='" & cboYeWuXZ.Text & "'"
   colInsert.Add " YeWuY='" & cboYeWuY.Value & "'"
   colInsert.Add " YeWuYMC='" & cboYeWuY.Text & "'"
   colInsert.Add " ZhuanZhenYS='" & cboZhuanZhenYS.Value & "'"
   colInsert.Add " ZhuanZhenYSMC='" & cboZhuanZhenYS.Text & "'"
   colInsert.Add " ChuFuZ='" & cboChuFuZ.Text & "'"
   colInsert.Add " XinXiLY='" & cboXinXiLY.Text & "'"
   colInsert.Add " HuanZheLY='" & cboHuanZheLY.Text & "'"
   colInsert.Add " GuaHaoLB='" & cboGuaHaoLB.Text & "'"
    
   colInsert.Add "JiTiFS='" & cboJiTiFS.Value & "'"
   colInsert.Add "JiTiFSMC='" & cboJiTiFS.Text & "'"
   colInsert.Add "JiTiJE='" & objConvertData.ConvertNumber(numJiTiJE.Text) & "'"
   colInsert.Add "KaiShiZK='" & objConvertData.ConvertNumber(numKaiShiZK.Text) & "'"
   colInsert.Add "JieShuZK='" & objConvertData.ConvertNumber(numJieShuZK.Text) & "'"
   
   colInsert.Add "JiLuSCR =  '" & g_strYongHuDM & "'"               '记录生成人
   colInsert.Add "JiLuSCRMC =  '" & g_strYongHuMC & "'"             '记录生成人名称
   colInsert.Add "ZuiHouXGR =  '" & g_strYongHuDM & "'"             '最后修改人
   colInsert.Add "ZuiHouXGRMC =  '" & g_strYongHuMC & "'"           '最后修改人名称
   
   
   '如果没有执行成功SQL语句
   If objExecuteSQL.InsertRecord("zd_JiTiBL", colInsert) = False Then
      ZengJiaSJ = False
      GoTo PROC_EXIT
   End If
   Set colInsert = Nothing
   
   ZengJiaSJ = True

PROC_EXIT:
   Exit Function
PROC_ERR:
   If ERR.Number <> 0 Then
      ZengJiaSJ = False
      Call ShowError(Me.Name, "ZengJiaSJ()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function

Private Sub cmdQingChuTJ_Click()

   '清空条件
   Call objFormSetting.InitFormData(Me)
   
   '将修改按钮的属性改为无效
   cmdXiuGai.Enabled = False
   cmdShanChu.Enabled = False
   '开始日期，结束日期
   dtmKaiShiRQ.SetDate DateAdd("m", -3, objStandData.getSystemDate(Date))
   dtmJieShuRQ.SetDate objStandData.getSystemDate
   
End Sub

Private Sub cmdClose_Click()

   Unload Me
   
End Sub

Private Sub cmdDaoChu_Click()
   
   '* 功    能：列表信息导出Excel 文件
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：ky
   '* 修 改 人：
   '* 修改日期：
   
   Call ExportToExcel(Me, lstJiTiBL, "付费比例字典")

End Sub

Private Sub cmdXiuGai_Click()

   '* 功    能：修改数据库中记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR
   
   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.XiuGaiTS) = vbNo Then
      GoTo PROC_EXIT
   End If
   
'   objExecuteSQL.BeginTrans
'   g_intShiWuZT = 0
   
   If ShanChuSJ() Then
      lstJiTiBL.RemoveAllItems
      
      m_blnXiuGai = True
      Call cmdZengJia_Click
   End If

'   objExecuteSQL.CommitTrans
'   g_intShiWuZT = 2
   
PROC_EXIT:
    
'   If g_intShiWuZT = 1 Then
'      objExecuteSQL
'   ElseIf g_intShiWuZT = 0 Then
'      objExecuteSQL.CommitTrans
'   End If


   Exit Sub
PROC_ERR:
'    g_intShiWuZT = 1
    GoTo PROC_EXIT
End Sub

 

Private Sub cmdChaXun_Click()

   '* 功    能：查找数据库中记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：ky
   '* 修 改 人：
   '* 修改日期：

   '生成查询需要的SQL语句
   g_strSQL = CreateSql(1)
   
   '把查询的记录插入到列表中
   If objFormSetting.FillList(lstJiTiBL, g_strSQL) = 0 Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
   End If

   '将修改按钮的属性改为无效
   cmdXiuGai.Enabled = False
   cmdShanChu.Enabled = False
   
End Sub

Private Function CreateSql(intLeiBie As Integer) As String

   '* 功    能： 创建查询条件的SQL语句
   '* 参    数：
   '* 返 回 值： 生成的SQL语句
   '* 创 建 人： maji
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR
   
   Dim colSearch As Collection   '集合(查询)
   
   g_strTiaoJian = "1=1"
   
   If intLeiBie = 1 Then
      '加入查询条件
      
      '患者类别1
      If cboHuanZheLB1.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HuanZheLB1='" & cboHuanZheLB1.Value & "'"
      End If
      '患者类别2
      If cboHuanZheLB2.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HuanZheLB2='" & cboHuanZheLB2.Value & "'"
      End If
      '性别
      If cboXingBie.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND XingBie='" & cboXingBie.Text & "'"
      End If
      '卡类别
      If cboKaLeiB.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaLeiB='" & cboXingBie.Value & "'"
      End If
      '开单科室
      If cboKeShi.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND  KaiDanKS='" & cboKeShi.Value & "'"
      End If
      '转诊医生
      If cboZhuanZhenYS.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND ZhuanZhenYS='" & cboZhuanZhenYS.Value & "'"
      End If
      '初复诊
      If cboChuFuZ.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND  ChuFuZ='" & cboChuFuZ.Text & "'"
      End If
      '信息来源
      If cboXinXiLY.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND XinXiLY='" & cboXinXiLY.Text & "'"
      End If
      '患者来源
      If cboHuanZheLY.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND HuanZheLY='" & cboHuanZheLY.Text & "'"
      End If
      '挂号类别
      If cboGuaHaoLB.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND GuaHaoLB='" & cboGuaHaoLB.Text & "'"
      End If
      '性别
      If cboXingBie.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaLeiB='" & cboXingBie.Value & "'"
      End If
      '卡类别
      If cboKaLeiB.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaLeiB='" & cboXingBie.Value & "'"
      End If
      '开始年龄
      If numKaiShiNL.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiNL='" & numKaiShiNL.Text & "'"
      End If
      '结束年龄
      If numJieShuNL.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuNL='" & numJieShuNL.Text & "'"
      End If
      '业务小组
      If cboYeWuXZ.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND YeWuXZ='" & cboYeWuXZ.Value & "'"
      End If
      '业务员
      If cboYeWuY.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND YeWuY='" & cboYeWuY.Value & "'"
      End If
      '开始日期
      If dtmKaiShiRQ.IsNull Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiRQ>='" & dtmKaiShiRQ.GetDate & "'"
      End If
      '结束日期
      If dtmJieShuRQ.IsNull Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuRQ<='" & dtmJieShuRQ.GetDate & "'"
      End If
      '计提方式
      If cboJiTiFS.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JiTiFS='" & cboJiTiFS.Value & "'"
      End If
      '计提金额
      If numJiTiJE.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JiTiJE='" & numJiTiJE.Text & "'"
      End If
      '开始折扣
      If numKaiShiZK.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND KaiShiZK='" & numKaiShiZK.Text & "'"
      End If
      '结束折扣
      If numJieShuZK.Text <> "" Then
         g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JieShuZK='" & numJieShuZK.Text & "'"
      End If
      
         
   End If
   '生成查询字段
   Set colSearch = New Collection
'JiTiBLLSH;DaiMa;KaiShiRQ;JieShuRQ;KaiShiNL;JieShuNL;HuanZheLB1MC;HuanZheLB2MC;XingBie;KaLeiBMC;KaiDanKSMC;YeWuXZMC;YeWuYMC;ZhuanZhenYSMC;
' ChuFuZ;XinXiLY;HuanZheLY;GuaHaoLB;JiTiFSMC;JiTiJE;KaiShiZK;JieShuZK;
 
    colSearch.Add "JiTiBLLSH"
    colSearch.Add "DaiMa"
    colSearch.Add "KaiShiRQ"
    colSearch.Add "JieShuRQ"
    colSearch.Add "LeiBie"
    colSearch.Add "KaiShiNL"
    colSearch.Add "JieShuNL"
    colSearch.Add "HuanZheLB1MC"
    colSearch.Add "HuanZheLB2MC"
    colSearch.Add "XingBie"
    colSearch.Add "KaLeiBMC"
    colSearch.Add "KaiDanKSMC"
    colSearch.Add "YeWuXZMC"
    colSearch.Add "YeWuYMC"
    colSearch.Add "ZhuanZhenYSMC"
    colSearch.Add "ChuFuZ"
    colSearch.Add "XinXiLY"
    colSearch.Add "HuanZheLY"
    colSearch.Add "GuaHaoLB"
    colSearch.Add "JiTiFSMC"
    colSearch.Add "JiTiJE"
    colSearch.Add "KaiShiZK"
    colSearch.Add "JieShuZK"
   
   '转化标准SQL语句
   CreateSql = objExecuteSQL.CreateSelectSQL("zd_JiTiBL", colSearch, g_strTiaoJian)
   
   Set colSearch = Nothing
   
PROC_EXIT:
   Exit Function
PROC_ERR:
   If ERR.Number <> 0 Then
      CreateSql = ""
      Call ShowError(Me.Name, "CreateSql()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If

End Function




Private Sub dtmJieShuRQ_LostFocus()
    If Not dtmKaiShiRQ.IsNull Then
        If dtmJieShuRQ.GetDate < dtmKaiShiRQ.GetDate Then
            MsgBox "开始时间不能大于截止时间！", vbInformation, "系统提示"
            dtmJieShuRQ.SetFocus
        End If
    End If
End Sub



Private Sub dtmKaiShiRQ_LostFocus()
    If Not dtmJieShuRQ.IsNull Then
        If dtmJieShuRQ.GetDate < dtmKaiShiRQ.GetDate Then
            MsgBox "开始时间不能大于截止时间！", vbInformation, "系统提示"
            dtmKaiShiRQ.SetFocus
        End If
    End If
End Sub

Private Sub Form_Activate()
   On Error GoTo ToExit '打开错误陷阱
   '------------------------------------------------
    
   
   '把焦点移至第一个控件
   Call objFormSetting.DiYiGKJ(Me)
   m_blnXiuGai = False
   '------------------------------------------------
   Exit Sub
   '----------------
ToExit:
   Resume Next
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)
   
End Sub

Private Sub Form_Load()

   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人： maji
   '* 修 改 人：
   '* 修改日期：
   
   '自动创建窗体信息
   Call objFormSetting.CreateFormInfo(Me)
   
   Const c_EnableChecked = False
   lstJiTiBL.EnableChecked = c_EnableChecked
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 11820
   Const c_formHeight = 8070
   '重新设置窗体上的控件大小
   
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
      GoTo PROC_EXIT
   End If
   
  '费用类别
  g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_FeiYongLeiBie WHERE TingYongBZ='否'"
  If objFormSetting.LoadcboData(cboFeiYongLB, recorddata, g_strSQL) = False Then
     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
     GoTo PROC_EXIT
  End If

  '卡 类别
  g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_KaLeiBie WHERE isnull(TingYongBZ,'否')='否'"
  If objFormSetting.LoadcboData(cboKaLeiB, recorddata, g_strSQL) = False Then
     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
     GoTo PROC_EXIT
  End If
  
  '科室
  g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_KeShi WHERE isnull(TingYongBZ,'否')='否'"
  If objFormSetting.LoadcboData(cboKeShi, recorddata, g_strSQL) = False Then
     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
     GoTo PROC_EXIT
  End If
  
  '装载患者类别1
   g_strTiaoJian = "TingYongBZ='否'"
   If LoadHuanZheLB1(cboHuanZheLB1, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
      
  '装载患者类别2
   g_strTiaoJian = "TingYongBZ='否'"
   If LoadHuanZheLB2(cboHuanZheLB2, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
      
   '装载计费类别
   g_strTiaoJian = ""
   If LoadJiFeiLeiBie(cboJiFeiLB, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   
   '费用类别
  g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_FeiYongLeiBie WHERE TingYongBZ='否'"
  If objFormSetting.LoadcboData(cboFeiYongLB, recorddata, g_strSQL) = False Then
     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
     GoTo PROC_EXIT
  End If
  
  '计价对象
  g_strTiaoJian = ""
   If LoadJiJiaDX(cboJiJiaDX, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
  '装载患者来源
   g_strTiaoJian = ""
   If LoadHuanZheLY(cboHuanZheLY, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If

    '装载信息来源
   g_strTiaoJian = ""
   If LoadXinXiLY(cboXinXiLY, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If

   '装载挂号类别
   g_strTiaoJian = ""
   If LoadGuaHaoLB(cboGuaHaoLB, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   '装载转诊医生
   g_strTiaoJian = "LeiBie='转诊人员' and (TingYongBZ='否' OR ISNULL(TingYongBZ,'')='')"
   If LoadYongHu(cboZhuanZhenYS, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If

 
   '装载业务小组
   g_strTiaoJian = "LeiBie ='市场营销' AND  (TingYongBZ='否' OR ISNULL(TingYongBZ,'')='')"
   If LoadKeShi(cboYeWuXZ, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   
   '装载计提方式
   g_strTiaoJian = ""
   If LoadJiTiFS(cboJiTiFS, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
  '给各个控件赋缺省值
   If objFormSetting.InitFormData(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
      GoTo PROC_EXIT
   End If

   '初始化列表
   Const c_EnableEdit = False    '允许编辑单元格
   Const c_EditColString = ""    '可编辑的列
   Const c_MergeCellType = g_eMergeCells.flexMergeNever     '合并类型：不合并
   Const c_MergeCols = ""        '合并列：
   Const c_FocusDirection = g_eFocusDirection.focusDown     '焦点方向：向右
   Const c_EnableDrag = False    '允许拖拽
   Const c_EnableSort = True    '允许排序
   If objFormSetting.InitList(lstJiTiBL, c_EnableEdit, c_EditColString, c_MergeCellType, c_MergeCols, _
               c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
      GoTo PROC_EXIT
   End If
   
      '开始日期，结束日期
   dtmKaiShiRQ.SetDate DateAdd("m", -3, objStandData.getSystemDate(Date))
   dtmJieShuRQ.SetDate objStandData.getSystemDate
   
   '计提对象
   Call LoadJiTiDX
PROC_EXIT:
   Exit Sub

End Sub
 

  



Private Sub lstJiTiBL_Click()

   '* 功    能：点击列表框将数据赋给txt、cbo、num控件
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：ky
   '* 修 改 人：
   '* 修改日期：
   
   '保存当前行号
   m_lngRow = lstJiTiBL.getSelectedRow
   
   '将列表框数据赋给txt、cbo、num控件
 
                     
   txtJiTiBLLSH.Text = lstJiTiBL.cellValue(m_lngRow, "JiTiBLLSH")
   dtmKaiShiRQ.SetDate lstJiTiBL.cellValue(m_lngRow, "KaiShiRQ")
   dtmJieShuRQ.SetDate lstJiTiBL.cellValue(m_lngRow, "JieShuRQ")
   cboLeiBie.Text = lstJiTiBL.cellValue(m_lngRow, "LeiBie")
   numKaiShiNL.Text = lstJiTiBL.cellValue(m_lngRow, "KaiShiNL")
   numJieShuNL.Text = lstJiTiBL.cellValue(m_lngRow, "JieShuNL")
   cboHuanZheLB1.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "HuanZheLB1"))
   cboHuanZheLB1.Text = lstJiTiBL.cellValue(m_lngRow, "HuanZheLB1MC")
   cboHuanZheLB2.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "HuanZheLB2"))
   cboHuanZheLB2.Text = lstJiTiBL.cellValue(m_lngRow, "HuanZheLB2MC")
   cboXingBie.Text = lstJiTiBL.cellValue(m_lngRow, "XingBie")
   cboKaLeiB.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "KaLeiB"))
   cboKaLeiB.Text = lstJiTiBL.cellValue(m_lngRow, "KaLeiBMC")
   
   cboKeShi.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "KaiDanKS"))
   cboKeShi.Text = lstJiTiBL.cellValue(m_lngRow, "KaiDanKSMC")
   cboYeWuXZ.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "YeWuXZ"))
   cboYeWuXZ.Text = lstJiTiBL.cellValue(m_lngRow, "YeWuXZMC")
   cboYeWuY.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "YeWuY"))
   cboYeWuY.Text = lstJiTiBL.cellValue(m_lngRow, "YeWuYMC")
   cboZhuanZhenYS.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "ZhuanZhenYS"))
   cboZhuanZhenYS.Text = lstJiTiBL.cellValue(m_lngRow, "ZhuanZhenYSMC")

   cboChuFuZ.Text = lstJiTiBL.cellValue(m_lngRow, "ChuFuZ")
   cboXinXiLY.Text = lstJiTiBL.cellValue(m_lngRow, "XinXiLY")
   cboHuanZheLY.Text = lstJiTiBL.cellValue(m_lngRow, "HuanZheLY")
   cboGuaHaoLB.Text = lstJiTiBL.cellValue(m_lngRow, "GuaHaoLB")
   cboJiTiFS.InitValue objConvertData.ConvertString(lstJiTiBL.cellValue(m_lngRow, "JiTiFS"))
   cboJiTiFS.Text = lstJiTiBL.cellValue(m_lngRow, "JiTiFSMC")
  
   numJiTiJE.Text = lstJiTiBL.cellValue(m_lngRow, "JiTiJE")
   numKaiShiZK.Text = lstJiTiBL.cellValue(m_lngRow, "KaiShiZK")
   numJieShuZK.Text = lstJiTiBL.cellValue(m_lngRow, "JieShuZK")
 
   
   g_strTiaoJian = " AND DaiMa='" & lstJiTiBL.cellValue(m_lngRow, "DaiMa") & "'"
    g_strSQL = "SELECT DaiMa,FuFeiBL,MingCheng,FeiYongLBMC,YaoPinMC FROM zd_FuFeiLeiBie WHERE" & Chr(13) _
             & "1=1 " & g_strTiaoJian
             
    If objFormSetting.FillList(lstJiTiLeiBie, g_strSQL) = 0 Then
    
    End If
   '将修改按钮的属性改为有效s
   cmdXiuGai.Enabled = True
   cmdShanChu.Enabled = True
   
End Sub
 

Private Sub LoadJiTiDX()
    '加载计提对象
    
    Dim rstJiTiDX As ADODB.Record
    Dim lngRow As Long
    
    g_strTiaoJian = ""
    If cboFeiYongLB.Text <> "" Then
        g_strTiaoJian = " AND FeiYongLB='" & cboFeiYongLB.Value & "'"
    End If
    
    If cboYaoPinDM.Text <> "" Then
        g_strTiaoJian = g_strTiaoJian & " AND YaoPinDM='" & cboYaoPinDM.Value & "'"
    End If
    g_strSQL = "SELECT DaiMa,MingCheng,JiTiBL,DaLeiMC,FeiYongLBMC,YaoPinMC  FROM zd_JiTiDX WHERE" & Chr(13) _
             & "1=1 " & g_strTiaoJian


    If objFormSetting.FillList(lstJiTiLeiBie, g_strSQL) = 0 Then
        g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
    End If
    
    For lngRow = 1 To lstJiTiLeiBie.getMaxRow
        lstJiTiLeiBie.setCheckedValue False, lngRow
    Next lngRow
  
End Sub
 
Private Sub numJieShuNL_LostFocus()
    If numKaiShiNL.Text > numJieShuNL.Text Then
        MsgBox "请确认年龄段！", vbExclamation, "系统提示"
        numJieShuNL.Text = numKaiShiNL.Text
    End If
End Sub

 
Private Sub numKaiShiNL_LostFocus()
    If numKaiShiNL.Text > numJieShuNL.Text Then
        numJieShuNL.Text = numKaiShiNL.Text
    End If
End Sub

Private Sub ReSize1_PreResize(ControlName As String, ControlType As String, NewTop As Single, NewLeft As Single, NewHeight As Single, NewWidth As Single, NewFontSize As Single, IgnoreControl As Boolean, ByVal CurrentControl As Object)
    ReSize1.AutoCenterFormOnLoad = True
End Sub
