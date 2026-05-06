VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Object = "{A964BDA3-3E93-11CF-9A0F-9E6261DACD1C}#3.0#0"; "RESIZE32.OCX"
Begin VB.Form frmJiTiDX 
   BackColor       =   &H00FFFFFF&
   Caption         =   "计提比例"
   ClientHeight    =   6840
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10185
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6840
   ScaleWidth      =   10185
   Begin UserControl.pic pic1 
      Height          =   390
      Left            =   60
      TabIndex        =   18
      Top             =   0
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   688
      Caption         =   "计提比例"
   End
   Begin ResizeLibCtl.ReSize ReSize1 
      Left            =   8340
      Top             =   6360
      _Version        =   196608
      _ExtentX        =   741
      _ExtentY        =   741
      _StockProps     =   64
      Enabled         =   -1  'True
      FormMinWidth    =   0
      FormMinHeight   =   0
      FormDesignHeight=   6840
      FormDesignWidth =   10185
   End
   Begin UserControl.cbo cboTingYongBZ 
      Height          =   225
      Left            =   4260
      TabIndex        =   0
      Top             =   1500
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
      Caption         =   "停用标志"
      BackColor       =   16777215
      ValueColumn     =   2
      TextColumn      =   2
      Caption         =   "停用标志"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ListText        =   ""
   End
   Begin UserControl.lst lstFuFeiLB 
      Height          =   4335
      Left            =   60
      TabIndex        =   1
      Top             =   1860
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   7646
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
   Begin UserControl.txt txtDaiMa 
      Height          =   225
      Left            =   180
      TabIndex        =   2
      Top             =   600
      Width           =   2310
      _ExtentX        =   4101
      _ExtentY        =   397
      Caption         =   "代码"
      CaptionWidth    =   420
      Text            =   "txtDaiMa"
      Hwnd            =   3212484
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
   Begin UserControl.txt txtMingCheng 
      Height          =   225
      Left            =   2640
      TabIndex        =   3
      Top             =   600
      Width           =   3930
      _ExtentX        =   6959
      _ExtentY        =   397
      Caption         =   "名称"
      CaptionWidth    =   420
      Text            =   "txtMingCheng"
      Hwnd            =   1770636
      hint            =   "txtMingCheng"
      IMEMode         =   1
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
   Begin UserControl.txt txtPinYinM 
      Height          =   225
      Left            =   6720
      TabIndex        =   4
      Top             =   600
      Width           =   3330
      _ExtentX        =   5900
      _ExtentY        =   397
      Caption         =   "拼音码"
      CaptionWidth    =   630
      Text            =   "txtPinYinM"
      Hwnd            =   3081412
      hint            =   "txtPinYinM"
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
   Begin UserControl.txt txtBeiZhu 
      Height          =   225
      Left            =   6840
      TabIndex        =   5
      Top             =   1500
      Width           =   3270
      _ExtentX        =   5794
      _ExtentY        =   397
      Caption         =   "备注"
      CaptionWidth    =   420
      Text            =   "txtBeiZhu"
      Hwnd            =   3212484
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
      Left            =   6780
      TabIndex        =   6
      Top             =   6300
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
      TabIndex        =   7
      Top             =   6300
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
      Left            =   1095
      TabIndex        =   8
      Top             =   6300
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
      Left            =   3150
      TabIndex        =   9
      Top             =   6300
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
      Left            =   4185
      TabIndex        =   10
      Top             =   6300
      Width           =   1515
      _ExtentX        =   2672
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
      Left            =   5745
      TabIndex        =   11
      Top             =   6300
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
   Begin UserControl.cmd cmdShanChu 
      Height          =   435
      Left            =   2115
      TabIndex        =   12
      Top             =   6300
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
   Begin UserControl.num numJiTiBL 
      Height          =   285
      Left            =   2700
      TabIndex        =   13
      Top             =   1500
      Width           =   1455
      _ExtentX        =   2566
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
   Begin UserControl.cbo cboDaLei 
      Height          =   225
      Left            =   180
      TabIndex        =   14
      Top             =   1020
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   397
      Caption         =   "大类"
      CaptionWidth    =   600
      BackColor       =   16777215
      TextColumn      =   2
      Caption         =   "大类"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "序号;名称;"
      ColWidths       =   "600;800;"
      ListText        =   ""
   End
   Begin UserControl.cbo cboYaoPinDM 
      Height          =   225
      Left            =   2640
      TabIndex        =   15
      Top             =   1020
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   397
      Caption         =   "药品代码"
      BackColor       =   16777215
      ForeColor       =   16711680
      Caption         =   "药品代码"
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
   Begin UserControl.cbo cboFeiYongLB 
      Height          =   225
      Left            =   6780
      TabIndex        =   16
      Top             =   1020
      Width           =   3255
      _ExtentX        =   5741
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
   Begin UserControl.cbo cboTongJiLB2 
      Height          =   225
      Left            =   180
      TabIndex        =   17
      Top             =   1500
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   397
      Caption         =   "统计类别2"
      BackColor       =   16777215
      Caption         =   "统计类别2"
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
      ColumnCaptions  =   $"frmJiTiDX.frx":0000
      ColWidths       =   "800;800;1000;"
      ListText        =   ""
   End
End
Attribute VB_Name = "frmJiTiDX"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim m_lngRow As Long   'list控件的选中行数

Private Sub cmdDaoRu_Click()
   
   '* 功    能：从Excel 文件导入信息
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：
   
   Call ImportFromExcel(Me, lstFuFeiLB, "zd_FuFeiLeiBie")

End Sub

 

 
 

Private Sub cboYaoPinDM_KeyPress(KeyAscii As Integer)
  If KeyAscii = vbKeyReturn Then
  
'     '未装载完成退出操作
'     If cboYaoPinDM.LoadOver = False Then
'         KeyAscii = 0
'         cboYaoPinDM.nextFocus = False
'         Exit Sub
'     End If
     
      '装载药品(医嘱名称)
      If cboFeiYongLB.Text <> "" Then
        g_strTiaoJian = " FeiYongLB='" & cboFeiYongLB.Value & "'"
      Else
        g_strTiaoJian = ""
      End If
      
      If LoadYaoPin_MZ(cboYaoPinDM, g_strTiaoJian, "%%") = False Then
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
         Exit Sub
      End If

    
  End If
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
End Sub

Private Sub cmdShanChu_Click()

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuTS) = vbNo Then
      GoTo PROC_EXIT
   End If
   
   '判断字典是否已经被用用过，如果被引用了，将不能被删除
   If IsAllowDeleted("zd_JiTiDX", lstFuFeiLB.cellValue(lstFuFeiLB.getSelectedRow, "DaiMa")) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NotAllowDeleted)
      GoTo PROC_EXIT
   End If
   
   '调用删除函数，删除选中数据,需要改
   If ShanChuSJ() Then
      '提示操作完毕
      g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuCG)
      lstFuFeiLB.RemoveItem (lstFuFeiLB.getSelectedRow)
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
   g_strTiaoJian = "DaiMa = '" & lstFuFeiLB.cellValue(m_lngRow, "DaiMa") & "'"
   If objExecuteSQL.DeleteRecord("zd_JiTiDX", g_strTiaoJian) = False Then
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
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：
   
   '功能描述
   Dim colList As Collection   '集合

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaTS) = vbNo Then
      GoTo PROC_EXIT
   End If
      
   '判断代码是否为空，如果为空，自动生成(原号加1）
   If txtDaiMa.Text = "" Then
      txtDaiMa.Text = getDaiMa("zd_JiTiDX", "DaiMa")
   End If
   
   If numJiTiBL.Text = "" Then
      numJiTiBL.Text = 100
   End If
   
   '判断输入数据是否重复，且有效
   g_strTiaoJian = "DaiMa = '" & txtDaiMa.Text & "'"
   If objDataCheck.IsRepeated("zd_JiTiDX", g_strTiaoJian, Me.Name, g_eTiShiXLH.ShuJvKSJCF) = False _
      And objDataCheck.IsValid(Me) Then
      
      '调用增加函数，增加输入数据
      If ZengJiaSJ() = True Then
         '提示操作完毕完毕
         g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaCG)

         '把数据加入到列表中
         Set colList = New Collection
         
         '代码;名称;拼音码;大类;费用类别;药品代码;统计类别2;计提比例;停用标准;备注;
         
         colList.Add txtDaiMa.Text
         colList.Add txtMingCheng.Text
         colList.Add txtPinYinM.Text
         colList.Add cboDaLei.Text
         colList.Add cboTongJiLB2.Text
         colList.Add numJiTiBL.Text
         colList.Add cboFeiYongLB.Text
         colList.Add cboYaoPinDM.Value
         colList.Add cboYaoPinDM.Text
         colList.Add cboTingYongBZ.Text
         colList.Add txtBeiZhu.Text

 
         
         lstFuFeiLB.AddItem colList
         Set colList = Nothing
         '设置焦点
         txtDaiMa.SetFocus
      Else
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.AddDataFailure)
      End If
   End If
   
PROC_EXIT:
   Exit Sub

End Sub

Private Function ZengJiaSJ() As Boolean

   '* 功    能：增加内容
   '* 参    数：
   '* 返 回 值：True-执行成功，
   '*        False-执行失败
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：

   On Error GoTo PROC_ERR

   Dim colInsert As Collection   '字段赋值的Collection对象

   '插入表中
   'DaiMa;MingCheng;PinYinM;DaLei;DaLeiMC;FeiYongLB;FeiYongLBMC;YaoPinDM;YaoPinMC;JiTiBL;TingYongBZ;BeiZhu;
   Set colInsert = New Collection
   '依次添加字段
   colInsert.Add "DaiMa =  '" & txtDaiMa.Text & "'"                 '代码
   colInsert.Add "MingCheng =  '" & txtMingCheng.Text & "'"         '名称
   colInsert.Add "PinYinM =  '" & txtPinYinM.Text & "'"             '拼音码
   

   colInsert.Add "DaLei =  '" & cboDaLei.Value & "'"               '大类
   colInsert.Add "DaLeiMC =  '" & cboDaLei.Text & "'"
   colInsert.Add "FeiYongLB =  '" & cboFeiYongLB.Value & "'"        '费用类别
   colInsert.Add "FeiYongLBMC =  '" & cboFeiYongLB.Text & "'"
   colInsert.Add "YaoPinDM =  '" & cboYaoPinDM.Value & "'"          '药品
   colInsert.Add "YaoPinMC =  '" & cboYaoPinDM.Text & "'"
   colInsert.Add "TongJiLB2 =  '" & cboTongJiLB2.Value & "'"            '统计类别2
   colInsert.Add "TongJiLB2MC =  '" & cboTongJiLB2.Text & "'"
   colInsert.Add "JiTiBL =  '" & numJiTiBL.Text & "'"               '计提比例
   colInsert.Add "TingYongBZ =  '" & cboTingYongBZ.Value & "'"      '停用标志
   colInsert.Add "BeiZhu =  '" & txtBeiZhu.Text & "'"               '备注
   colInsert.Add "JiLuSCR =  '" & g_strYongHuDM & "'"               '记录生成人
   colInsert.Add "JiLuSCRMC =  '" & g_strYongHuMC & "'"             '记录生成人名称
   colInsert.Add "ZuiHouXGR =  '" & g_strYongHuDM & "'"             '最后修改人
   colInsert.Add "ZuiHouXGRMC =  '" & g_strYongHuMC & "'"           '最后修改人名称
   
   '如果没有执行成功SQL语句
   If objExecuteSQL.InsertRecord("zd_JiTiDX", colInsert, g_strSQL) = False Then
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
       
End Sub

Private Sub cmdClose_Click()

   Unload Me
   
End Sub

Private Sub cmdDaoChu_Click()
   
   '* 功    能：列表信息导出Excel 文件
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：
   
   Call ExportToExcel(Me, lstFuFeiLB, "付费类别字典")

End Sub

Private Sub cmdXiuGai_Click()

   '* 功    能：修改数据库中记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.XiuGaiTS) = vbNo Then
      GoTo PROC_EXIT
   End If
   
   '判断输入数据有效性
   If objDataCheck.IsValid(Me) Then
      '调用修改函数，修改输入数据
      If XiuGaiSJ() = True Then
         '提示操作完毕
         g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.XiuGaiCG)
         
         '把修改列表框数据中
         ' DaiMa;MingCheng;PinYinM;DaLei;DaLeiMC;FeiYongLB;FeiYongLBMC;YaoPinDM;YaoPinMC;JiTiBL;TingYongBZ;BeiZhu;
'         lstFuFeiLB.cellValue(m_lngRow, "DaiMa") = txtDaiMa.Text
         lstFuFeiLB.cellValue(m_lngRow, "MingCheng") = txtMingCheng.Text
         '得到拼音码
'         txtPinYinM.Text = objStandData.getPinYinM(txtMingCheng.Text)
         lstFuFeiLB.cellValue(m_lngRow, "PinYinM") = txtPinYinM.Text
         lstFuFeiLB.cellValue(m_lngRow, "DaLeiMC") = cboDaLei.Text
         lstFuFeiLB.cellValue(m_lngRow, "FeiYongLBMC") = cboFeiYongLB.Text
         lstFuFeiLB.cellValue(m_lngRow, "YaoPinDM") = cboYaoPinDM.Value
         lstFuFeiLB.cellValue(m_lngRow, "YaoPinMC") = cboYaoPinDM.Text
         lstFuFeiLB.cellValue(m_lngRow, "TongJiLB2MC") = cboTongJiLB2.Text
         lstFuFeiLB.cellValue(m_lngRow, "JiTiBL") = numJiTiBL.Text
         lstFuFeiLB.cellValue(m_lngRow, "TingYongBZ") = cboTingYongBZ.Text
         lstFuFeiLB.cellValue(m_lngRow, "BeiZhu") = txtBeiZhu.Text
      
          Else
         g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.UpdateDataFailure)
      End If
   End If
   
PROC_EXIT:
   Exit Sub

End Sub

Private Function XiuGaiSJ() As Boolean

   '* 功    能：修改数据库内容
   '* 参    数：
   '* 返 回 值：True-执行成功，
   '*           False-执行失败
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR

   Dim colUpdate As Collection   '字段赋值的Collection对象

   '修改表记录
   Set colUpdate = New Collection
'DaiMa;MingCheng;PinYinM;DaLei;FeiYongLB;YaoPinDM;JiTiBL;TingYongBZ;BeiZhu;
   '循环修改字段
    
   colUpdate.Add "MingCheng =  '" & txtMingCheng.Text & "'"            '名称
   colUpdate.Add "PinYinM =  '" & txtPinYinM.Text & "'"
   colUpdate.Add "DaLei =  '" & cboDaLei.Value & "'"                   '大类
   colUpdate.Add "DaLeiMC =  '" & cboDaLei.Text & "'"
   colUpdate.Add "FeiYongLB =  '" & cboFeiYongLB.Value & "'"           '费用类别
   colUpdate.Add "FeiYongLBMC =  '" & cboFeiYongLB.Text & "'"
   colUpdate.Add "YaoPinDM =  '" & cboYaoPinDM.Value & "'"             '药品
   colUpdate.Add "YaoPinMC =  '" & cboYaoPinDM.Text & "'"
   colUpdate.Add "TongJiLB2 =  '" & cboTongJiLB2.Value & "'"             '统计类别2
   colUpdate.Add "TongJiLB2MC =  '" & cboTongJiLB2.Text & "'"
   colUpdate.Add "JiTiBL =  '" & numJiTiBL.Text & "'"                  '计提比例
   colUpdate.Add "TingYongBZ =  '" & cboTingYongBZ.Value & "'"         '停用标志
   colUpdate.Add "BeiZhu =  '" & txtBeiZhu.Text & "'"                  '备注
   
 
   colUpdate.Add "ZuiHouXGR =  '" & g_strYongHuDM & "'"                '最后修改人
   colUpdate.Add "ZuiHouXGRMC =  '" & g_strYongHuMC & "'"              '最后修改人名称
   colUpdate.Add "ZuiHouXGRQ =  '" & objStandData.getSystemDate & "'"  '最后修改日期

   '主键不能修改判断
   If txtDaiMa.Text <> lstFuFeiLB.cellValue(m_lngRow, "DaiMa") Then
      g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZhuJianBNXG)
      GoTo PROC_EXIT
   End If

   '如果没有执行成功SQL语句
   g_strTiaoJian = "DaiMa =  '" & lstFuFeiLB.cellValue(m_lngRow, "DaiMa") & "'"
   If objExecuteSQL.UpdateRecord("zd_JiTiDX", g_strTiaoJian, colUpdate) = False Then
      XiuGaiSJ = False
      GoTo PROC_EXIT
   End If
   Set colUpdate = Nothing
   
   XiuGaiSJ = True

PROC_EXIT:
   Exit Function
PROC_ERR:
   If ERR.Number <> 0 Then
      XiuGaiSJ = False
      Call ShowError(Me.Name, "XiuGaiSJ()", ERR.Number, ERR.Description)
      GoTo PROC_EXIT
   End If
   
End Function

Private Sub cmdChaXun_Click()

   '* 功    能：查找数据库中记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：maji
   '* 修 改 人：
   '* 修改日期：

   '生成查询需要的SQL语句
   g_strSQL = CreateSql()
   
   '把查询的记录插入到列表中
   If objFormSetting.FillList(lstFuFeiLB, g_strSQL) = 0 Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
   End If

   '将修改按钮的属性改为无效
   cmdXiuGai.Enabled = False
   cmdShanChu.Enabled = False
   
   
End Sub

Private Function CreateSql() As String

   '* 功    能： 创建查询条件的SQL语句
   '* 参    数：
   '* 返 回 值： 生成的SQL语句
   '* 创 建 人： maji
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR
   
   Dim colSearch As Collection   '集合(查询)
   
   g_strTiaoJian = "1=1"

   '加入查询条件
   '代码
   If txtDaiMa.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND DaiMa LIKE '" & txtDaiMa.Text & "%'"
   End If
   '名称
   If txtMingCheng.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND MingCheng LIKE '" & txtMingCheng.Text & "%'"
   End If
   '拼音码
   If txtPinYinM.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND PinYinM LIKE '" & txtPinYinM.Text & "%'"
   End If
   '大类
   If cboDaLei.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND DaLei='" & cboDaLei.Value & "'"
   End If
   '费用类别
   If cboFeiYongLB.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND FeiYongLB like '" & cboFeiYongLB.Value & "%'"
   End If
   '统计类别2
   If cboTongJiLB2.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND TongJiLB2 = '" & cboTongJiLB2.Value & "'"
   End If
   '计提比例
   If numJiTiBL.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND JiTiBL=" & numJiTiBL.Text
   End If
    '药品代码
   If cboYaoPinDM.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND YaoPinDM like '" & cboYaoPinDM.Value & "%'"
   End If
   '停用标志
   If cboTingYongBZ.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND TingYongBZ='" & cboTingYongBZ.Text & "'"
   End If
   '备注
   If txtBeiZhu.Text <> "" Then
      g_strTiaoJian = g_strTiaoJian & Chr(13) & "AND BeiZhu like '" & txtBeiZhu.Text & "%'"
   End If

 
                   
   
   '生成查询字段
   Set colSearch = New Collection
   
         colSearch.Add "DaiMa"
         colSearch.Add "MingCheng"
         colSearch.Add "PinYinM"
         colSearch.Add "DaLeiMC"
         
         colSearch.Add "FeiYongLBMC"
         colSearch.Add "YaoPinDM"
         colSearch.Add "YaoPinMC"
         colSearch.Add "TongJiLB2MC"
         colSearch.Add "JiTiBL"
         colSearch.Add "TingYongBZ"
         colSearch.Add "BeiZhu"
         
 

   '转化标准SQL语句
   CreateSql = objExecuteSQL.CreateSelectSQL("zd_JiTiDX", colSearch, g_strTiaoJian)
   
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

Private Sub Form_Activate()
   
   '把焦点移至第一个控件
   Call objFormSetting.DiYiGKJ(Me)
   
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
   lstFuFeiLB.EnableChecked = c_EnableChecked
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 10305
   Const c_formHeight = 7350
   '重新设置窗体上的控件大小
  
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
      GoTo PROC_EXIT
   End If
   
  
    '装载统计类别2
   g_strTiaoJian = "TingYongBZ='否'"
   If LoadTongJiLB2(cboTongJiLB2, g_strTiaoJian) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.LoadcboDataFailure)
      GoTo PROC_EXIT
   End If
   
  '费用类别
  g_strSQL = "SELECT DaiMa,PinYinM,MingCheng FROM zd_FeiYongLeiBie WHERE TingYongBZ='否'"
  If objFormSetting.LoadcboData(cboFeiYongLB, recorddata, g_strSQL) = False Then
     g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
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
   If objFormSetting.InitList(lstFuFeiLB, c_EnableEdit, c_EditColString, c_MergeCellType, c_MergeCols, _
               c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
      GoTo PROC_EXIT
   End If
   
   '开始日期，结束日期
'   dtmKaiShiRQ.SetDate DateAdd("m", -3, objStandData.getSystemDate(Date))
'   dtmJieShuRQ.SetDate objStandData.getSystemDate
            
PROC_EXIT:
   Exit Sub

End Sub
 


Private Sub lstFuFeiLB_Click()

   '* 功    能：点击列表框将数据赋给txt、cbo、num控件
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   Dim rstPinYinM As ADODB.Recordset
   Dim strPinYinM As String
   
   Call cboYaoPinDM.ClearData
    cboYaoPinDM.LoadOver = False
   '保存当前行号
   m_lngRow = lstFuFeiLB.getSelectedRow
   
   If m_lngRow > 0 Then
   Else
      Exit Sub
   End If
   '将列表框数据赋给txt、cbo、num控件
   txtDaiMa.Text = lstFuFeiLB.cellValue(m_lngRow, "DaiMa")
   txtMingCheng.Text = lstFuFeiLB.cellValue(m_lngRow, "MingCheng")
   '得到拼音码
'   txtPinYinM.Text = objStandData.getPinYinM(txtMingCheng.Text)
   txtPinYinM.Text = lstFuFeiLB.cellValue(m_lngRow, "PinYinM")
   cboDaLei.InitValue objConvertData.ConvertString(lstFuFeiLB.cellValue(m_lngRow, "DaLei"))
   cboDaLei.Text = lstFuFeiLB.cellValue(m_lngRow, "DaLeiMC")
   cboFeiYongLB.InitValue objConvertData.ConvertString(lstFuFeiLB.cellValue(m_lngRow, "FeiYongLB"))
   cboFeiYongLB.Text = lstFuFeiLB.cellValue(m_lngRow, "FeiYongLBMC")
   cboTongJiLB2.InitValue objConvertData.ConvertString(lstFuFeiLB.cellValue(m_lngRow, "TongJiLB2MC"))
   cboTongJiLB2.Text = lstFuFeiLB.cellValue(m_lngRow, "TongJiBL2MC")
   numJiTiBL.Text = lstFuFeiLB.cellValue(m_lngRow, "JiTiBL")
   cboTingYongBZ.Text = lstFuFeiLB.cellValue(m_lngRow, "TingYongBZ")
   txtBeiZhu.Text = lstFuFeiLB.cellValue(m_lngRow, "BeiZhu")
   '药品代码
   cboYaoPinDM.Text = ""
   If lstFuFeiLB.cellValue(m_lngRow, "YaoPinDM") <> "" Then
      g_strSQL = "SELECT daima,PinYinM,MingCheng FROM zd_ShouFeiZiDian where DaiMa='" & lstFuFeiLB.cellValue(m_lngRow, "YaoPinDM") & "'"
       If objFormSetting.LoadcboData(cboYaoPinDM, recorddata, g_strSQL) Then
           cboYaoPinDM.InitValue lstFuFeiLB.cellValue(m_lngRow, "YaoPinDM")
       End If
   End If
         
          
    
   '将修改按钮的属性改为有效
   cmdXiuGai.Enabled = True
   cmdShanChu.Enabled = True
   
End Sub

Private Sub ReSize1_PreResize(ControlName As String, ControlType As String, NewTop As Single, NewLeft As Single, NewHeight As Single, NewWidth As Single, NewFontSize As Single, IgnoreControl As Boolean, ByVal CurrentControl As Object)
    ReSize1.AutoCenterFormOnLoad = True
End Sub

Private Sub txtMingCheng_LostFocus()
   '得到拼音码
   txtPinYinM.Text = objStandData.getPinYinM(txtMingCheng.Text)
End Sub









