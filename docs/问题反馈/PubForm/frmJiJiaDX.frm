VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.0#0"; "HISControl1.ocx"
Begin VB.Form frmJiJiaDX 
   Caption         =   "计价对象"
   ClientHeight    =   5985
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9090
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5985
   ScaleWidth      =   9090
   Begin UserControl.lst lstData 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   900
      Width           =   8595
      _ExtentX        =   15161
      _ExtentY        =   7435
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MergeCells      =   4
      BackColorFixed  =   -2147483633
      BackColorSel    =   -2147483635
      ForeColorFixed  =   -2147483640
      ForeColorSel    =   -2147483640
      RowHeightMin    =   300
      ColumnCaptions  =   "代码;名称;拼音码"
      ColWidths       =   $"frmJiJiaDX.frx":0000
      ColumnName      =   "DaiMa;MingCheng;PinYinM"
   End
   Begin UserControl.txt txtDaiMa 
      Height          =   300
      Left            =   660
      TabIndex        =   1
      Top             =   315
      Width           =   2220
      _ExtentX        =   3916
      _ExtentY        =   529
      Caption         =   "代码"
      Text            =   "txtDaiMa"
      Hwnd            =   3212484
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtMingCheng 
      Height          =   300
      Left            =   3360
      TabIndex        =   2
      Top             =   315
      Width           =   2220
      _ExtentX        =   3916
      _ExtentY        =   529
      Caption         =   "名称"
      Text            =   "txtMingCheng"
      Hwnd            =   1770636
      hint            =   "txtMingCheng"
      IMEMode         =   1
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.txt txtPinYinM 
      Height          =   300
      Left            =   5880
      TabIndex        =   3
      Top             =   315
      Width           =   2220
      _ExtentX        =   3916
      _ExtentY        =   529
      Caption         =   "拼音码"
      Text            =   "txtPinYinM"
      Hwnd            =   3081412
      hint            =   "txtPinYinM"
      CaptionForeColor=   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.cmd cmdTuiChu 
      Height          =   375
      Left            =   7095
      TabIndex        =   4
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退出(&Q)"
   End
   Begin UserControl.cmd cmdZengJia 
      Height          =   375
      Left            =   1440
      TabIndex        =   5
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "增加(&A)"
   End
   Begin UserControl.cmd cmdXiuGai 
      Height          =   375
      Left            =   2355
      TabIndex        =   6
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      Enabled         =   0   'False
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "修改(&M)"
   End
   Begin UserControl.cmd cmdChaXun 
      Height          =   375
      Left            =   4170
      TabIndex        =   7
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "查询(&S)"
   End
   Begin UserControl.cmd cmdQingChuTJ 
      Height          =   375
      Left            =   5070
      TabIndex        =   8
      Top             =   5400
      Width           =   1065
      _ExtentX        =   1879
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "清除条件(&C)"
   End
   Begin UserControl.cmd cmdDaoChu 
      Height          =   375
      Left            =   6195
      TabIndex        =   9
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "导出(&E)"
   End
   Begin UserControl.cmd cmdShanChu 
      Height          =   375
      Left            =   3270
      TabIndex        =   10
      Top             =   5400
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   661
      Enabled         =   0   'False
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "删除(&D)"
   End
   Begin UserControl.rsz rsz 
      Left            =   255
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
   End
End
Attribute VB_Name = "frmJiJiaDX"
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
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
   Call ImportFromExcel(Me, lstData, "zd_MinZu")

End Sub

Private Sub cmdShanChu_Click()

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuTS) = vbNo Then
      GoTo PROC_EXIT
   End If
   
   '判断字典是否已经被用用过，如果被引用了，将不能被删除
   If IsAllowDeleted("zd_JiJiaDX", lstData.cellValue(lstData.getSelectedRow, "DaiMa")) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NotAllowDeleted)
      GoTo PROC_EXIT
   End If
   
   '调用删除函数，删除选中数据,需要改
   If ShanChuSJ() Then
      '提示操作完毕
      g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ShanChuCG)
      lstData.RemoveItem (lstData.getSelectedRow)
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
   g_strTiaoJian = "DaiMa = '" & lstData.cellValue(m_lngRow, "DaiMa") & "'"
   If objExecuteSQL.DeleteRecord("zd_JiJiaDX", g_strTiaoJian) = False Then
      ShanChuSJ = False
      GoTo PROC_EXIT
   End If
   
   ShanChuSJ = True
   
PROC_EXIT:
   Exit Function
PROC_ERR:
   If Err.Number <> 0 Then
      ShanChuSJ = False
      Call ShowError(Me.Name, "ShanChuSJ()", Err.Number, Err.Description)
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

   '提示是否操作
   If objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaTS) = vbNo Then
      GoTo PROC_EXIT
   End If
      
   '判断代码是否为空，如果为空，自动生成(原号加1）
   If txtDaiMa.Text = "" Then
      txtDaiMa.Text = getDaiMa("zd_JiJiaDX", "DaiMa")
   End If
   
   If txtMingCheng.Text = "" Then
      MsgBox "必输项不能为空!", vbInformation, "系统提示"
      txtMingCheng.SetFocus
      Exit Sub
   End If
   
   
   '判断输入数据是否重复，且有效
   g_strTiaoJian = "DaiMa = '" & txtDaiMa.Text & "'"
   If objDataCheck.IsRepeated("zd_JiJiaDX", g_strTiaoJian, Me.Name, g_eTiShiXLH.ShuJvKSJCF) = False _
      And objDataCheck.IsValid(Me) Then
      
      '调用增加函数，增加输入数据
      If ZengJiaSJ() = True Then
         '提示操作完毕完毕
         g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZengJiaCG)

         '把数据加入到列表中
         Set colList = New Collection
         colList.Add txtDaiMa.Text
         colList.Add txtMingCheng.Text
         colList.Add txtPinYinM.Text
         lstData.AddItem colList
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
   Set colInsert = New Collection
   '依次添加字段
   colInsert.Add "DaiMa =  '" & txtDaiMa.Text & "'"          '代码
   colInsert.Add "MingCheng =  '" & txtMingCheng.Text & "'"  '名称
   colInsert.Add "PinYinM =  '" & txtPinYinM.Text & "'"      '拼音码
   colInsert.Add "JiLuSCR =  '" & g_strYongHuDM & "'"        '记录生成人
   colInsert.Add "JiLuSCRMC =  '" & g_strYongHuMC & "'"      '记录生成人名称
   colInsert.Add "ZuiHouXGR =  '" & g_strYongHuDM & "'"      '最后修改人
   colInsert.Add "ZuiHouXGRMC =  '" & g_strYongHuMC & "'"    '最后修改人名称
   
   '如果没有执行成功SQL语句
   If objExecuteSQL.InsertRecord("zd_JiJiaDX", colInsert) = False Then
      ZengJiaSJ = False
      GoTo PROC_EXIT
   End If
   Set colInsert = Nothing
   
   ZengJiaSJ = True

PROC_EXIT:
   Exit Function
PROC_ERR:
   If Err.Number <> 0 Then
      ZengJiaSJ = False
      Call ShowError(Me.Name, "ZengJiaSJ()", Err.Number, Err.Description)
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
   
   Call ExportToExcel(Me, lstData, "关系字典")

End Sub

Private Sub cmdXiuGai_Click()

   '* 功    能：修改数据库中记录
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
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
         lstData.cellValue(m_lngRow, "MingCheng") = txtMingCheng.Text
         lstData.cellValue(m_lngRow, "PinYinM") = txtPinYinM.Text
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
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
   On Error GoTo PROC_ERR

   Dim colUpdate As Collection   '字段赋值的Collection对象

   '修改表记录
   Set colUpdate = New Collection

   '循环修改字段
   colUpdate.Add "MingCheng =  '" & txtMingCheng.Text & "'"    '名称
   colUpdate.Add "PinYinM =  '" & txtPinYinM.Text & "'"        '拼音码
   colUpdate.Add "ZuiHouXGR =  '" & g_strYongHuDM & "'"        '最后修改人
   colUpdate.Add "ZuiHouXGRMC =  '" & g_strYongHuMC & "'"      '最后修改人名称
   colUpdate.Add "ZuiHouXGRQ =  '" & objStandData.getSystemDate & "'"          '最后修改日期

   '主键不能修改判断
   If txtDaiMa.Text <> lstData.cellValue(m_lngRow, "DaiMa") Then
      g_intMessage = objFormSetting.MessageBox(Me.Name, g_eTiShiXLH.ZhuJianBNXG)
   End If

   '如果没有执行成功SQL语句
   g_strTiaoJian = "DaiMa =  '" & lstData.cellValue(m_lngRow, "DaiMa") & "'"
   If objExecuteSQL.UpdateRecord("zd_JiJiaDX", g_strTiaoJian, colUpdate) = False Then
      XiuGaiSJ = False
      GoTo PROC_EXIT
   End If
   Set colUpdate = Nothing
   
   XiuGaiSJ = True

PROC_EXIT:
   Exit Function
PROC_ERR:
   If Err.Number <> 0 Then
      XiuGaiSJ = False
      Call ShowError(Me.Name, "XiuGaiSJ()", Err.Number, Err.Description)
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
   If objFormSetting.FillList(lstData, g_strSQL) = 0 Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.NoSearchData)
   End If

   '将修改按钮的属性改为无效
   cmdXiuGai.Enabled = False
   cmdXiuGai.Enabled = False
   
End Sub

Private Function CreateSql() As String

   '* 功    能： 创建查询条件的SQL语句
   '* 参    数：
   '* 返 回 值： 生成的SQL语句
   '* 创 建 人：
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
   
   '生成查询字段
   Set colSearch = New Collection
   
   colSearch.Add "DaiMa"      '代码
   colSearch.Add "MingCheng"  '名称
   colSearch.Add "PinYinM"    '拼音码

   '转化标准SQL语句
   CreateSql = objExecuteSQL.CreateSelectSQL("zd_JiJiaDX", colSearch, g_strTiaoJian)
   
   Set colSearch = Nothing
   
PROC_EXIT:
   Exit Function
PROC_ERR:
   If Err.Number <> 0 Then
      CreateSql = ""
      Call ShowError(Me.Name, "CreateSql()", Err.Number, Err.Description)
      GoTo PROC_EXIT
   End If

End Function

'Private Sub Form_Activate()
'
'   '把焦点移至第一个控件
'   Call objFormSetting.DiYiGKJ(Me)
'
'End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)

   '按键触发
   Call objFormSetting.FormKeypress(Me, KeyAscii)
   
End Sub

Private Sub Form_Load()

   '* 功    能： 初始化窗体
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人：
   '* 修 改 人：
   '* 修改日期：
   
'   自动创建窗体信息
   Call objFormSetting.CreateFormInfo(Me)
   
   Const c_EnableChecked = False
   lstData.EnableChecked = c_EnableChecked
   
   '设置窗体居中(Call objFormSetting.InitFormPosition)
   Const c_formWidth = 9180
   Const c_formHeight = 6795
    '重新设置窗体上的控件大小
   rsz.ReadXY Me, c_formWidth, c_formHeight
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

   '初始化窗体属性
   If objFormSetting.InitFormProperty(Me) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormDataFailure)
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
   If objFormSetting.InitList(lstData, c_EnableEdit, c_EditColString, c_MergeCellType, c_MergeCols, _
               c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
      GoTo PROC_EXIT
   End If
   
PROC_EXIT:
   Exit Sub

End Sub

Private Sub Form_Resize()
   '重新设置窗体上的控件大小
   rsz.ReSetXY Me
End Sub

Private Sub lstData_Click()

   '* 功    能：点击列表框将数据赋给txt、cbo、num控件
   '* 参    数：
   '* 返 回 值：
   '* 创 建 人
   '* 修 改 人：
   '* 修改日期：
   
   '保存当前行号
   m_lngRow = lstData.getSelectedRow
   
   '将列表框数据赋给txt、cbo、num控件
   txtDaiMa.Text = lstData.cellValue(m_lngRow, "DaiMa")
   txtMingCheng.Text = lstData.cellValue(m_lngRow, "MingCheng")
   txtPinYinM.Text = lstData.cellValue(m_lngRow, "PinYinM")
   
   '将修改按钮的属性改为有效
   cmdXiuGai.Enabled = True
   cmdShanChu.Enabled = True
   
End Sub

Private Sub txtMingCheng_LostFocus()
   '得到拼音码
   txtPinYinM.Text = objStandData.getPinYinM(txtMingCheng.Text)
End Sub











