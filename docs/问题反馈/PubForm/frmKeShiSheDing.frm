VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.5#0"; "HISControl1.ocx"
Begin VB.Form frmKeShiSheDing 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "设定所属科室"
   ClientHeight    =   5685
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5220
   Icon            =   "frmKeShiSheDing.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5685
   ScaleWidth      =   5220
   StartUpPosition =   1  '所有者中心
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   3
      Top             =   0
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   714
      Caption         =   "科室设定"
   End
   Begin UserControl.cmd CmdTc 
      Height          =   495
      Left            =   1080
      TabIndex        =   2
      Top             =   5100
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   873
      BackColor       =   14737632
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "退 出"
   End
   Begin UserControl.cmd CmdBc 
      Height          =   495
      Left            =   60
      TabIndex        =   1
      Top             =   5100
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   873
      BackColor       =   14737632
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "保 存"
   End
   Begin UserControl.lst lstDengLuKS 
      Height          =   4515
      Left            =   60
      TabIndex        =   0
      Top             =   480
      Width           =   5115
      _ExtentX        =   9022
      _ExtentY        =   7964
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
      BackColorBkg    =   16777215
      BackColorFixed  =   14737632
      BackColorFrozen =   8454143
      BackColorSel    =   8454143
      GridColor       =   12582912
      GridColorFixed  =   12582912
      RowHeightMin    =   300
      ColWidths       =   ""
   End
End
Attribute VB_Name = "frmKeShiSheDing"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, lParam As Any) As Long

Private Sub CmdBc_Click()
  
   Dim lngRow As Long           '行号
   Dim strDengLuKS As String    '登录科室
  
   '把所有的科室连接成 '',''的形式
   strDengLuKS = ""
   For lngRow = 1 To lstDengLuKS.getMaxRow
      If lstDengLuKS.getCheckedValue(lngRow) Then
         strDengLuKS = strDengLuKS & "'" & lstDengLuKS.cellValue(lngRow, "KeShi") & "',"
      End If
   Next lngRow
   If strDengLuKS <> "" Then
      strDengLuKS = Left(strDengLuKS, Len(strDengLuKS) - 1)
   End If
   

   '保存设定的选中科室
   SaveSetting "CjySoftDengLuKS", App.Title, "DengLuKS", strDengLuKS
   
   MsgBox "保存成功！请继续！", vbInformation, "提示！"
  
End Sub

Private Sub CmdTc_Click()
   Unload Me
End Sub

Private Sub Form_Load()

   Dim strDengLuKS As String      '登陆科室
   Dim lngRow As Long             '当前行号
   Dim rstKeShiMC As ADODB.Recordset   '科室名称
   Dim colKeShi As Collection
   Dim strKeShiLB As String       '科室类别
   
    Const c_formWidth = 5310
    Const c_formHeight = 6165
    Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
    
    
   lstDengLuKS.EnableChecked = True
   
   lstDengLuKS.SetListCaption "选择;科室代码;科室;"
   lstDengLuKS.SetColumnWidth "600;1200;2000;"
   lstDengLuKS.ColumnName = "XuanZe;KeShi;KeShiMC;"

   '装载选中科室
   strDengLuKS = GetSetting("CjySoftDengLuKS", App.Title, "DengLuKS")
   
   lngRow = 0
      
   Select Case App.Title
   Case "门诊管理"
      strKeShiLB = "'门诊挂号','门诊收费'"
   Case "门诊药房"
      strKeShiLB = "'药房'"
   Case "病区药房"
      strKeShiLB = "'药房'"
   Case "综合药房"
      strKeShiLB = "'药房'"
   Case "药库管理"
      strKeShiLB = "'药库'"
   Case "单独药房管理"
      strKeShiLB = "'药房'"
   Case "药品管理"
      strKeShiLB = "'药库','药房'"
   Case "住院管理"
      strKeShiLB = "'住院处'"
   Case "住院护士站"
      strKeShiLB = "'住院就诊'"
   Case Else
      strKeShiLB = "'门诊挂号','门诊收费','门诊就诊','门诊护士','药房','药库','耗材','住院处','住院就诊','住院护士','医技','手术室','行政','其它'"
   End Select

   '取得所属科室
   g_strSQL = "SELECT DaiMa,MingCheng" & Chr(13) _
            & "FROM zd_KeShi" & Chr(13) _
            & "WHERE LeiBie in (" & strKeShiLB & ")"
   Set rstKeShiMC = objExecuteSQL.GetRs(g_strSQL)
   While Not rstKeShiMC.EOF
      lngRow = lngRow + 1
      '装载科室
      Set colKeShi = New Collection
      colKeShi.Add rstKeShiMC("DaiMa")
      colKeShi.Add rstKeShiMC("MingCheng")
      lstDengLuKS.AddItem colKeShi
      '如果当前科室属于选中科室，则选中
      If InStr(1, strDengLuKS, "'" & rstKeShiMC("DaiMa") & "'") > 0 Then
         lstDengLuKS.setCheckedValue True, lngRow
      Else
         lstDengLuKS.setCheckedValue False, lngRow
      End If
      rstKeShiMC.MoveNext
   Wend

  
End Sub


