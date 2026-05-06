VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.2#0"; "HISControl1.ocx"
Begin VB.Form FrmKeHuDingDan 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "Form1"
   ClientHeight    =   10365
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   15855
   LinkTopic       =   "Form1"
   ScaleHeight     =   10365
   ScaleWidth      =   15855
   StartUpPosition =   3  '窗口缺省
   Begin UserControl.cmd cmdChaXun 
      Height          =   555
      Left            =   11820
      TabIndex        =   5
      Top             =   60
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   979
      BackColor       =   12632256
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtMoKuai 
      Height          =   225
      Left            =   5880
      TabIndex        =   4
      Top             =   180
      Width           =   3135
      _ExtentX        =   5530
      _ExtentY        =   397
      Caption         =   "模块内容"
      CaptionWidth    =   840
      Hwnd            =   2624972
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
   End
   Begin UserControl.dtm dtm2 
      Height          =   225
      Left            =   2820
      TabIndex        =   3
      Top             =   180
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   397
      Caption         =   "----结"
   End
   Begin UserControl.dtm dtm1 
      Height          =   225
      Left            =   1020
      TabIndex        =   2
      Top             =   180
      Width           =   1755
      _ExtentX        =   3096
      _ExtentY        =   397
      Caption         =   "开"
   End
   Begin UserControl.lst lstMingXi 
      Height          =   9690
      Left            =   60
      TabIndex        =   1
      Top             =   660
      Width           =   15720
      _ExtentX        =   27728
      _ExtentY        =   17092
      MergeCells      =   4
      ForeColorFixed  =   -2147483630
      RowHeightMin    =   300
      ColWidths       =   ""
      SelectionMode   =   1
   End
   Begin VB.Label LblShiJian 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "时间段"
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
      Height          =   255
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   735
   End
End
Attribute VB_Name = "FrmKeHuDingDan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdChaXun_Click()
Dim strsql As String
Dim i As Long
    strsql = "SELECT a.yiyuanmc as 客户名称 ,b.yiyuanmokuai as 模块内容,b.ruanjianyk as 余款,b.ruanjianzj as 订单金额, b.xiaoshoury as 销售员," & Chr(13) _
        & "b.qtsm as 其它说明,b.xiadansj as 下单时间 FROM [yw_kehuxinxiMingxi]  b with(nolock) left join yw_kehuxinxi a with(nolock) on a.id=b.id" & Chr(13) _
        & "where  isnull(b.bShanchu,0)=0 and b.yiyuanmokuai like '%" & txtMoKuai.Text & "%' and b.xiadansj>='" & dtm1.GetDate & "' and b.xiadansj<='" & dtm2.GetDate & "'" & Chr(13) _
        & "order by 订单金额"
    '把查询的记录插入到列表中
   If objFormSetting.FillList(lstMingXi, strsql) = 0 Then
     
   End If
       '解密汉字
    For i = 1 To lstMingXi.Rows - 1
            lstMingXi.TextMatrix(i, 0) = StringEnDeCodecn(lstMingXi.TextMatrix(i, 0), 75)
    Next i
    For i = 1 To lstMingXi.Rows - 1
            lstMingXi.TextMatrix(i, 5) = StringEnDeCodecn(lstMingXi.TextMatrix(i, 5), 75)
    Next i
End Sub

Private Sub Form_Load()

    '设置窗体居中(Call objFormSetting.InitFormPosition)
    Const c_formWidth = 16095
    Const c_formHeight = 10935
    
    lstMingXi.ColumnCaptions = "客户名称;模块内容;余款;订单金额;销售员;其它说明;下单时间;"
'    lstMingXi.ColWidth(1) = 3000
    dtm1.SetDate Format(Now(), "yyyy-mm-dd")
    dtm2.SetDate Format(Now(), "yyyy-mm-dd")
End Sub
