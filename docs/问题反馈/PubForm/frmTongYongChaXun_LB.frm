VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.1#0"; "HISControl1.ocx"
Begin VB.Form frmTongYongChaXun_LB 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "通用查询"
   ClientHeight    =   8490
   ClientLeft      =   1695
   ClientTop       =   2325
   ClientWidth     =   12000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   12000
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   14
      Top             =   0
      Width           =   11895
      _ExtentX        =   20981
      _ExtentY        =   714
   End
   Begin UserControl.cbo cbo1 
      Height          =   225
      Index           =   0
      Left            =   6000
      TabIndex        =   13
      Top             =   1320
      Visible         =   0   'False
      Width           =   1710
      _ExtentX        =   3016
      _ExtentY        =   397
      ListWidth       =   4370
      Caption         =   "cbo1"
      ForeColor       =   16744576
      Caption         =   "cbo1"
      ListHeight      =   1815
      MuchItems       =   -1  'True
      ColWidths       =   ""
      ListText        =   ""
   End
   Begin UserControl.txt txt 
      Height          =   225
      Index           =   0
      Left            =   1980
      TabIndex        =   12
      Top             =   1320
      Visible         =   0   'False
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   397
      Caption         =   "txt"
      CaptionWidth    =   315
      Hwnd            =   2229996
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
   Begin UserControl.dtm dtm 
      Height          =   225
      Index           =   0
      Left            =   3420
      TabIndex        =   11
      Top             =   1320
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
   End
   Begin UserControl.num num 
      Height          =   225
      Index           =   0
      Left            =   600
      TabIndex        =   10
      Top             =   1320
      Visible         =   0   'False
      Width           =   1185
      _ExtentX        =   2090
      _ExtentY        =   397
      Caption         =   "num"
      CaptionWidth    =   315
      Hwnd            =   1378222
      CaptionForeColor=   -2147483630
   End
   Begin UserControl.pgb pgb1 
      Height          =   690
      Left            =   4560
      TabIndex        =   9
      Top             =   2580
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   1217
   End
   Begin VB.Frame fraButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   435
      Left            =   6120
      TabIndex        =   2
      Top             =   1860
      Width           =   5775
      Begin UserControl.cmd cmdChaXun 
         Height          =   405
         Left            =   60
         TabIndex        =   3
         Top             =   0
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "查询(&S)"
      End
      Begin UserControl.cmd cmdPreview 
         Height          =   405
         Left            =   2400
         TabIndex        =   4
         Top             =   0
         Width           =   1305
         _ExtentX        =   2302
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "打印预览(&V)"
      End
      Begin UserControl.cmd cmdPrint 
         Height          =   405
         Left            =   3765
         TabIndex        =   5
         Top             =   0
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "打印(&P)"
      End
      Begin UserControl.cmd cmdClose 
         Height          =   405
         Left            =   4800
         TabIndex        =   6
         Top             =   0
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "退出(&Q)"
      End
      Begin UserControl.cmd cmdQingKongTJ 
         Height          =   405
         Left            =   1035
         TabIndex        =   7
         Top             =   0
         Width           =   1305
         _ExtentX        =   2302
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "清空条件(&C)"
      End
   End
   Begin UserControl.txt txtChaXunMC 
      Height          =   375
      Left            =   975
      TabIndex        =   0
      Top             =   8025
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   344
      CaptionWidth    =   15
      Hwnd            =   198828
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin UserControl.lst lstChaXunJieGuo 
      Height          =   5400
      Left            =   60
      TabIndex        =   1
      Top             =   2520
      Width           =   11895
      _ExtentX        =   20981
      _ExtentY        =   9525
      MergeCells      =   4
      RowHeightMin    =   300
      ColWidths       =   "800"
      SelectionMode   =   1
      AutoSetSize     =   -1  'True
   End
   Begin UserControl.cbo cbo 
      Height          =   225
      Index           =   0
      Left            =   7920
      TabIndex        =   8
      Top             =   1320
      Visible         =   0   'False
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   397
      ListWidth       =   2350
      Caption         =   "cbo"
      AllowNull       =   "是"
      Caption         =   "cbo"
      ListHeight      =   1815
      ListText        =   ""
   End
End
Attribute VB_Name = "frmTongYongChaXun_LB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim m_intKongJianS_txt As Integer   '文本框使用个数
Dim m_intKongJianS_num As Integer   '数值框使用个数
Dim m_intKongJianS_cbo As Integer   '组合框使用个数
Dim m_intKongJianS_cbo1 As Integer  '组合框(大数据量)使用个数
Dim m_intKongJianS_dtm As Integer   '日期控件使用个数
Dim m_blnPanDuan As Boolean         '是否加载控件
Dim m_strChaXunYJ As String         '查询语句

Dim m_ctl As Control                '当前使用的控件

Dim m_rstChaXunJieGuo As ADODB.Recordset   '查询结果

Dim M_strChaXunTJ As String    '查询条件

Dim m_strBaoBiaoSQL As String  '报表SQL

Dim m_strHeJiLB As String      '合计列表
Dim m_strXiaoShuWS As String   '小数位数
Dim m_strFuJiaTJ As String     '附加条件
Dim m_strFenZuZD As String     '分组字段
Dim m_strPaiXuZD As String     '排序字段
Dim m_strShuJvLY As String
Dim m_strShuJvLY1 As String
Dim m_strLeiBieBM As String
Dim m_strLeiBieLM As String
Dim m_strTongJiZD As String
Dim m_strYunSuanFS As String
Dim m_intHeJiQSL As Integer    '合计开始列
Dim m_lngZiDuanS As Long
Dim m_JiTiBiaoZhi As String    '计提标志
Dim m_TongJiZD1 As String      '计提统计1
Dim m_ChuangTiM As String

Dim blnReturn                           '报表设计器的返回
Dim m_blnDaYinLB As Boolean    '打印类别
Dim m_strSQL As String
Dim m_strXiaoJiL As String    '小计列

Dim m_arrJieMianCXTJ(51) As String

Private Sub XianShiJieGuo()

'* 功    能： 显示结果
'* 参    数：
'* 返 回 值：
'* 创 建 人： xuzhaolin
'* 修 改 人：
'* 修改日期：

    On Error GoTo PROC_ERR

    Dim rstChaXunSheZhi As ADODB.Recordset   '查询设置
    Dim colChaXunJieGuo As Collection        '数据(查询结果)
    Dim intZiDuanS As Integer  '字段数
    Dim strZiDuanM As String  '字段名(控件tag:如"BingLiH;>"的前部分)
    Dim strBiJiaoF As String  '比较符(控件tag:如"BingLiH;>"的后部分)
    Dim i As Integer

    Dim strcol As String      '列号
    Dim strBaoBiaoCXTJ As String     '报表查询条件
    Dim strRiQi As String        '日期
    Dim rstDate As New ADODB.Recordset
    Dim strSQL As String
    Dim lngRow As Long
    Dim lngCol As Long

    '清空列表数据
    lstChaXunJieGuo.RemoveAllItems
    g_strSQL = ""
    M_strChaXunTJ = ""
    strBaoBiaoCXTJ = ""
    DoEvents
    '文本框条件
    For i = 1 To m_intKongJianS_txt
        Set m_ctl = Me.Controls("txt").Item(i)
        '字段名
        strZiDuanM = Mid(m_arrJieMianCXTJ(m_ctl.Tag), 1, InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") - 1)
        '比较符
        strBiJiaoF = Mid(m_arrJieMianCXTJ(m_ctl.Tag), InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") + 1)
        If m_ctl.Text <> "" Then
            If strBiJiaoF = "like" Then
                M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " like '%" & m_ctl.Text & "%'"
                strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & "AND " & strZiDuanM & " like '%" & m_ctl.Text & "%'"
            Else
                M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Text & "'"
                strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Text & "'"

            End If
        End If
        DoEvents
    Next i

    '数值输入框条件
    For i = 1 To m_intKongJianS_num
        Set m_ctl = Me.Controls("num").Item(i)
        '字段名
        strZiDuanM = Mid(m_arrJieMianCXTJ(m_ctl.Tag), 1, InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") - 1)
        '比较符
        strBiJiaoF = Mid(m_arrJieMianCXTJ(m_ctl.Tag), InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") + 1)
        If m_ctl.Text <> "" And strZiDuanM <> "BaoBiaoMC" Then
            M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Text & "'"
            strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Text & "'"
        End If
        DoEvents
    Next i
 If Me.Caption = "三院绩效考核按医生全院" Then
    m_strShuJvLY = Replace(m_strShuJvLY1, "{0}", Me.Controls("dtm").Item(1).GetDate)
    m_strShuJvLY = Replace(m_strShuJvLY, "{1}", Me.Controls("dtm").Item(2).GetDate)
 Else
    '日期控件条件
    For i = 1 To m_intKongJianS_dtm
        Set m_ctl = Me.Controls("dtm").Item(i)
        '字段名
        strZiDuanM = Mid(m_arrJieMianCXTJ(m_ctl.Tag), 1, InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") - 1)
        '比较符
        strBiJiaoF = Mid(m_arrJieMianCXTJ(m_ctl.Tag), InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") + 1)

        '根据日期格式处理
        If m_ctl.DateFormat = Date Then
            If strBiJiaoF = ">=" Then
                strRiQi = m_ctl.GetDate & " 00:00:00"
            End If
            If strBiJiaoF = "<=" Then
                strRiQi = m_ctl.GetDate & " 23:59:59"
            End If
        Else
            If strBiJiaoF = ">=" Then
                strRiQi = m_ctl.GetDate
            End If
            If strBiJiaoF = "<=" Then
                strRiQi = m_ctl.GetDate
            End If
        End If

        If m_ctl.IsNull Then
        Else
            M_strChaXunTJ = M_strChaXunTJ & Chr(13) & " AND " & strZiDuanM & " " & strBiJiaoF & "'" & strRiQi & "'"
            strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & " AND " & strZiDuanM & " " & strBiJiaoF & "'" & strRiQi & "'"
        End If
        DoEvents
    Next i
    End If

    '组合框条件
    For i = 1 To m_intKongJianS_cbo
        Set m_ctl = Me.Controls("cbo").Item(i)
        '字段名
        strZiDuanM = Mid(m_arrJieMianCXTJ(m_ctl.Tag), 1, InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") - 1)
        '比较符
        strBiJiaoF = Mid(m_arrJieMianCXTJ(m_ctl.Tag), InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") + 1)
        If m_ctl.Value <> "" Then
            M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Value & "'"
        End If
        DoEvents
    Next i

    '组合框(大数据量)条件
    For i = 1 To m_intKongJianS_cbo1
        Set m_ctl = Me.Controls("cbo1").Item(i)
        '字段名
        strZiDuanM = Mid(m_arrJieMianCXTJ(m_ctl.Tag), 1, InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") - 1)
        '比较符
        strBiJiaoF = Mid(m_arrJieMianCXTJ(m_ctl.Tag), InStr(1, m_arrJieMianCXTJ(m_ctl.Tag), ";") + 1)
        If m_ctl.Value <> "" Then
            M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Value & "'"
            strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & m_ctl.Value & "'"
        End If
        DoEvents
    Next i

    '如果选择条件,去掉第一个多余的AND
    '   If M_strChaXunTJ <> "" Then
    '      M_strChaXunTJ = Mid(M_strChaXunTJ, 5)
    '   End If
    '   If strBaoBiaoCXTJ <> "" Then
    '      strBaoBiaoCXTJ = Mid(strBaoBiaoCXTJ, 5)
    '   End If

    strBaoBiaoCXTJ = "WHERE 1=1 " & strBaoBiaoCXTJ & m_strFuJiaTJ
    M_strChaXunTJ = "WHERE 1=1 " & M_strChaXunTJ & m_strFuJiaTJ

    lstChaXunJieGuo.Rows = 1

    '   strSQL = "EXEC CorssTab '" & m_strShuJvLY & "','" & m_strLeiBieBM & "','" & m_strLeiBieLM & "'" _
        '          & " ,'" & m_strFenZuZD & "','" & m_strChaXunYJ & "','" & m_strTongJiZD & "'" _
        '          & " ,'" & m_strYunSuanFS & "','" & M_strChaXunTJ & "','" & m_strPaiXuZD & "'"

    Set rstDate = FunFuZaBaoBiaoTY(m_strShuJvLY, m_strLeiBieBM, _
                                   m_strLeiBieLM, m_strFenZuZD, m_strChaXunYJ, m_strTongJiZD, _
                                   m_TongJiZD1, m_strYunSuanFS, M_strChaXunTJ, m_strPaiXuZD, _
                                   strSQL, m_JiTiBiaoZhi, m_ChuangTiM)

    m_strBaoBiaoSQL = strSQL
    m_strSQL = strSQL
    If Not (rstDate.BOF Or rstDate.EOF) Then

        If Len(m_strXiaoJiL) > 0 Then
            Call ProFilllst(rstDate)
            Exit Sub
        End If

        '加两行 一个是标题行和总合计行
        lstChaXunJieGuo.Rows = rstDate.RecordCount + 2
        lstChaXunJieGuo.Cols = rstDate.Fields.count

        rstDate.MoveFirst
        For lngRow = 1 To rstDate.RecordCount
            For lngCol = 0 To rstDate.Fields.count - 1
                If lngRow = 1 Then
                    lstChaXunJieGuo.TextMatrix(0, lngCol) = rstDate.Fields.Item(lngCol).Name
                End If
                lstChaXunJieGuo.TextMatrix(lngRow, lngCol) = IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol))
                '当前列是否大于等于 合计开始列
                If m_intHeJiQSL <= lngCol Then
                    lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol) = Val(lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol)) + Val(IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol)))
                End If
            Next lngCol
            rstDate.MoveNext
        Next lngRow
    End If

PROC_EXIT:
    Exit Sub
PROC_ERR:
    If m_ChuangTiM <> "市场计提_按患者明细" Then
        If ERR.Number <> 0 Then
            Call ShowError(Me.Name, "XianShiJieGuo()", ERR.Number, ERR.Description)
            GoTo PROC_EXIT
        End If
    End If
End Sub

Private Sub ProFilllst(rstDate As ADODB.Recordset)
    Dim lngRow As Long
    Dim lngCol As Long
    Dim lngDangQianH As Long
    Dim lngSuoYin As Long

    Dim strOLDXiaoJi As String
    Dim strXiaoJiSZ() As String
    Dim strZongJi() As String

    '指定网格列数
    lstChaXunJieGuo.Cols = rstDate.Fields.count

    ReDim strXiaoJiSZ(lstChaXunJieGuo.Cols - 1)
    ReDim strZongJi(lstChaXunJieGuo.Cols - 1)

    rstDate.MoveFirst
    With lstChaXunJieGuo
        '获取第一个值
        strOLDXiaoJi = Trim(rstDate(CInt(m_strXiaoJiL)))

        For lngRow = 1 To rstDate.RecordCount
            lngDangQianH = lngDangQianH + 1
            .Rows = .Rows + 1

            '小计赋值
            If Trim(rstDate(CInt(m_strXiaoJiL))) <> Trim(strOLDXiaoJi) Then

                .TextMatrix(lngDangQianH, 0) = strOLDXiaoJi & "小计："

                For lngSuoYin = m_intHeJiQSL To UBound(strXiaoJiSZ)
                    .TextMatrix(lngDangQianH, lngSuoYin) = strXiaoJiSZ(lngSuoYin)
                    strXiaoJiSZ(lngSuoYin) = "0"
                Next

                strOLDXiaoJi = Trim(rstDate(CInt(m_strXiaoJiL)))
                lngDangQianH = lngDangQianH + 1
                .Rows = .Rows + 1
            End If

            For lngCol = 0 To rstDate.Fields.count - 1
                If lngRow = 1 Then
                    lstChaXunJieGuo.TextMatrix(0, lngCol) = rstDate.Fields.Item(lngCol).Name
                End If

                .TextMatrix(lngDangQianH, lngCol) = IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol))

                '当前列是否大于等于 合计开始列
                If m_intHeJiQSL <= lngCol Then
                    '求小计
                    strXiaoJiSZ(lngCol) = Val(strXiaoJiSZ(lngCol)) + Val(rstDate(lngCol))
                    '求合计
                    strZongJi(lngCol) = Val(strZongJi(lngCol)) + Val(rstDate(lngCol))
                    '                 lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol) = Val(lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol)) + Val(IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol)))
                End If

            Next
            rstDate.MoveNext
        Next

        '最后 小计赋值 总计赋值
        '        If Trim(rstDate(CInt(m_strXiaoJiL))) <> Trim(strOLDXiaoJi) Then
        lngDangQianH = lngDangQianH + 1
        .Rows = .Rows + 1
        '小计
        .TextMatrix(lngDangQianH, 0) = strOLDXiaoJi & "小计："

        For lngSuoYin = m_intHeJiQSL To UBound(strXiaoJiSZ)
            .TextMatrix(lngDangQianH, lngSuoYin) = strXiaoJiSZ(lngSuoYin)
        Next

        '总计
        lngDangQianH = lngDangQianH + 1
        .Rows = .Rows + 1
        .TextMatrix(lngDangQianH, 0) = "合计："

        For lngSuoYin = m_intHeJiQSL To UBound(strZongJi)
            .TextMatrix(lngDangQianH, lngSuoYin) = strZongJi(lngSuoYin)
        Next

        '        End If
    End With
End Sub

Private Sub ZhuangZaiJieMian()

'* 功    能： 装载界面
'* 参    数：
'* 返 回 值：
'* 创 建 人： xuzhaolin
'* 修 改 人：
'* 修改日期：

    On Error GoTo PROC_ERR

    Dim rstChaXunSheZhi As ADODB.Recordset   '查询设置
    Dim rstChaXunTiaoJianSZ As ADODB.Recordset   '查询条件设置
    Dim colChaXunJieGuo As Collection   '数据(查询结果)
    Dim m_rstChaXunJieGuo As ADODB.Recordset   '查询结果
    Dim intZiDuanS As Integer  '字段数
    Dim intSuoYinH As Integer  'TabIndex
    Dim strQueShengZ As String  '缺省值
    Dim rstBT As ADODB.Recordset
    Dim strLieBTi As String
    Dim strLieBTi2 As String
    Dim lngRow As Long

    '清空列表数据
    lstChaXunJieGuo.RemoveAllItems
    '装载结果区界面
    g_strSQL = "SELECT ChaXunMC,ChaXunYJ,XianShiLBSBJ,ISNULL(FuJiaTJ,'') FuJiaTJ,ISNULL(FenZuZD,'') FenZuZD,ISNULL(PaiXuZD,'') PaiXuZD," & Chr$(13) _
             & "     ISNULL(ZiTiCC,'') ZiTiCC,ISNULL(DaYinLB,0) DaYinLB,ShuJvLY, LeiBieBM,   " & Chr$(13) _
             & "      LeiBieLM , TongJiZD, YunSuanFS,isnull(HeJiQSL,0) as HeJiQSL,isnull(LieBaoT,'') as LieBaoT, isnull(LeiBieBM,'') as LeiBieBM, " & Chr$(13) _
             & "       isnull(XiaoJiL,'') as XiaoJiL,JiTiBZ,TongJiZD1 " & Chr$(13) _
             & "FROM xt_ChaXunSheZhi_LB " & Chr$(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'"
    Set rstChaXunSheZhi = objExecuteSQL.GetRs(g_strSQL)
    If Not rstChaXunSheZhi.EOF Then
        '查询语句
        m_strChaXunYJ = rstChaXunSheZhi("ChaXunYJ")
        '附加条件
        m_strFuJiaTJ = rstChaXunSheZhi("FuJiaTJ")

        m_strShuJvLY = rstChaXunSheZhi("ShuJvLY")
        m_strShuJvLY1 = m_strShuJvLY
        m_strLeiBieBM = rstChaXunSheZhi("LeiBieBM")
        m_strLeiBieLM = rstChaXunSheZhi("LeiBieLM")
        m_strTongJiZD = rstChaXunSheZhi("TongJiZD")
        m_strYunSuanFS = rstChaXunSheZhi("YunSuanFS")
        m_intHeJiQSL = rstChaXunSheZhi("HeJiQSL")
        strLieBTi = Trim(rstChaXunSheZhi("LieBaoT"))
        strLieBTi2 = Trim(rstChaXunSheZhi("LeiBieBM"))
        '小计列
        m_strXiaoJiL = Trim(rstChaXunSheZhi("XiaoJiL"))

        '      m_JiTiBiaoZhi = rstChaXunSheZhi("JiTiBZ")   '计提标志

        '========= 2009-08-20 JEN ==========
        '功能：处理NULL
        m_JiTiBiaoZhi = IIf(IsNull(rstChaXunSheZhi("JiTiBZ")), "0", rstChaXunSheZhi("JiTiBZ"))    '计提标志
        '//=================================

        m_ChuangTiM = rstChaXunSheZhi("ChaXunMC")
        If rstChaXunSheZhi("TongJiZD1") <> "" Then
            m_TongJiZD1 = rstChaXunSheZhi("TongJiZD1")   '计提统计
        Else
            m_TongJiZD1 = ""
        End If

        '打印类别
        If rstChaXunSheZhi("DaYinLB") = 1 Then    '用新打印方式
            m_blnDaYinLB = True
        Else
            m_blnDaYinLB = False
        End If

        lstChaXunJieGuo.Top = rstChaXunSheZhi("XianShiLBSBJ")                    '设置列表上边界
        lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 1100          '设置列表高度
        'lstChaXunJieGuo.SetListCaption rstChaXunSheZhi("LieBiaoT")               '设置列表标题
        'lstChaXunJieGuo.ColumnName = rstChaXunSheZhi("LieMingC")               '设置列表名称
        'lstChaXunJieGuo.SetColumnWidth rstChaXunSheZhi("LieKuanD")               '设置列表列宽度
        'lstChaXunJieGuo.AlignColString = rstChaXunSheZhi("DuiQiFS")              '设置列表对齐方式
'        pgb1.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + 100
        '设置字体
        Dim strZiTiCC As String
        strZiTiCC = rstChaXunSheZhi("ZiTiCC")
        If strZiTiCC <> "" Then
            lstChaXunJieGuo.Font.Size = strZiTiCC
            cmdChaXun.Font.Size = strZiTiCC
            cmdPreview.Font.Size = strZiTiCC
            cmdPrint.Font.Size = strZiTiCC
            cmdClose.Font.Size = strZiTiCC
        End If

        m_strFenZuZD = rstChaXunSheZhi("FenZuZD")
        m_strPaiXuZD = rstChaXunSheZhi("PaiXuZD")
        '查询按钮的位置
        fraButton.Top = lstChaXunJieGuo.Top - 600
    Else
        m_strHeJiLB = ""
        m_strXiaoShuWS = ""
        m_strFenZuZD = ""
        m_strPaiXuZD = ""
    End If

    '装载查询条件区界面
    m_intKongJianS_txt = 0
    m_intKongJianS_cbo = 0
    m_intKongJianS_cbo1 = 0
    m_intKongJianS_num = 0
    m_intKongJianS_dtm = 0
    intSuoYinH = 0

    If Right(Trim(strLieBTi), 1) <> ";" Then
        strLieBTi = strLieBTi & ";"
    End If

    ''   Set rstBT = objExecuteSQL.GetRs("SELECT MINGCHENG  FROM " & strLieBTi2)
    ''   If Not (rstBT.BOF Or rstBT.EOF) Then
    ''       rstBT.MoveFirst
    ''       For lngRow = 1 To rstBT.RecordCount
    ''          strLieBTi = strLieBTi & Trim(rstBT(0)) & ";"
    ''          rstBT.MoveNext
    ''       Next lngRow
    ''   End If
    ''   lstChaXunJieGuo.ColumnCaptions = strLieBTi
    ''   lstChaXunJieGuo.ColumnName = strLieBTi
    'strQianYiGKJM = ""
    g_strSQL = "SELECT ZiDuan, BiJiaoF,BiaoTi, KongJianLX, ShuJvLY," & Chr$(13) _
             & "       ZuoBianJ, ShangBianJ, GaoDu, KuanDu, " & Chr$(13) _
             & "       LieZongKD , LieBiaoT, LieKuanD,ShuRuL, " & Chr$(13) _
             & "       ZhiLie,XianShiL,isnull(QueShengZ,'') QueShengZ,ISNULL(ZiTiCC,'') ZiTiCC,YouXiaoX " & Chr$(13) _
             & "FROM xt_ChaXunTiaoJianSZ_LB" & Chr$(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr$(13) _
             & "ORDER BY ShangBianJ,ZuoBianJ"

    Set rstChaXunTiaoJianSZ = objExecuteSQL.GetRs(g_strSQL)
    '循环装载条件区
    While Not rstChaXunTiaoJianSZ.EOF

        strQueShengZ = rstChaXunTiaoJianSZ("QueShengZ")
        '文本框控件
        If rstChaXunTiaoJianSZ("KongJianLX") = "txt" Then
            m_intKongJianS_txt = m_intKongJianS_txt + 1
            If txt.UBound < m_intKongJianS_txt Then
                Load txt(m_intKongJianS_txt)
            End If
            Set m_ctl = txt(m_intKongJianS_txt)    'Me.Controls("txt").Item(m_intKongJianS_txt)
            m_ctl.Text = strQueShengZ
        End If

        '数值输入框控件
        If rstChaXunTiaoJianSZ("KongJianLX") = "num" Then
            m_intKongJianS_num = m_intKongJianS_num + 1
            If num.UBound < m_intKongJianS_num Then
                Load num(m_intKongJianS_num)
            End If

            Set m_ctl = num(m_intKongJianS_num)    'Me.Controls("num").Item(m_intKongJianS_num)
            m_ctl.Text = strQueShengZ
        End If

        '日期控件
        If rstChaXunTiaoJianSZ("KongJianLX") = "dtm" Or rstChaXunTiaoJianSZ("KongJianLX") = "dtm1" Then
            m_intKongJianS_dtm = m_intKongJianS_dtm + 1
            If dtm.UBound < m_intKongJianS_dtm Then
                Load dtm(m_intKongJianS_dtm)
            End If

            Set m_ctl = dtm(m_intKongJianS_dtm)    ' Me.Controls("dtm").Item(m_intKongJianS_dtm)

            '如果日期为"dtm1",则为时分格式
            If rstChaXunTiaoJianSZ("KongJianLX") = "dtm1" Then
                m_ctl.DateFormat = DateTime
            End If

            '先清空
            m_ctl.SetDate ""

            If strQueShengZ = "今天" Then
                m_ctl.SetDate objStandData.getSystemDate(Date)
            End If
            '缺省值为当前加分钟数
            Dim dtmShiJian As Date

            If Left$(strQueShengZ, 3) = "今日加" Then
                dtmShiJian = DateAdd("n", Mid$(strQueShengZ, 4), Format$(objStandData.getSystemDate(Date), "YYYY-MM-DD"))
                If Minute(dtmShiJian) = 59 Then
                    dtmShiJian = DateAdd("s", 59, dtmShiJian)
                End If
                m_ctl.SetDate CStr(dtmShiJian)
            End If
        End If

        '组合框控件
        If rstChaXunTiaoJianSZ("KongJianLX") = "cbo" Then
            m_intKongJianS_cbo = m_intKongJianS_cbo + 1
            If cbo.UBound < m_intKongJianS_cbo Then
                Load cbo(m_intKongJianS_cbo)
            End If

            Set m_ctl = cbo(m_intKongJianS_cbo)    'Me.Controls("cbo").Item(m_intKongJianS_cbo)

            '列总宽度
            m_ctl.ListWidth = rstChaXunTiaoJianSZ("LieZongKD")

            '列标题
            If rstChaXunTiaoJianSZ("LieBiaoT") <> "" Then
                m_ctl.SetListCaption rstChaXunTiaoJianSZ("LieBiaoT")
            End If
            '列宽度
            If rstChaXunTiaoJianSZ("LieKuanD") <> "" Then
                m_ctl.SetColumnWidth rstChaXunTiaoJianSZ("LieKuanD")
            End If

            '输入列、值列、显示列
            m_ctl.InputColumn = rstChaXunTiaoJianSZ("ShuRuL")
            m_ctl.ValueColumn = rstChaXunTiaoJianSZ("ZhiLie")
            m_ctl.TextColumn = rstChaXunTiaoJianSZ("XianShiL")

            '固定组合

            If rstChaXunTiaoJianSZ("ShuJvLY") <> "" And Left$(rstChaXunTiaoJianSZ("ShuJvLY"), 6) <> "SELECT" Then
                '固定列表
                Call objFormSetting.LoadcboData(m_ctl, fixeddata, rstChaXunTiaoJianSZ("ShuJvLY"))


                Select Case strQueShengZ
                Case "登录者"
                    cbo_GotFocus m_intKongJianS_cbo
                    m_ctl.InitValue g_strYongHuDM
                Case "登录科室"
                    m_ctl.InitValue g_strYongHuDM
                Case Else
                    m_ctl.InitValue strQueShengZ
                End Select
            End If

        End If

        '组合框(大数据量)控件
        If rstChaXunTiaoJianSZ("KongJianLX") = "cbo1" Then
            m_intKongJianS_cbo1 = m_intKongJianS_cbo1 + 1
            If cbo1.UBound < m_intKongJianS_cbo1 Then
                Load cbo1(m_intKongJianS_cbo1)
            End If

            Set m_ctl = cbo1(m_intKongJianS_cbo1)    ' Me.Controls("cbo1").Item(m_intKongJianS_cbo1)

            '列总宽度
            m_ctl.ListWidth = rstChaXunTiaoJianSZ("LieZongKD")

            '列标题
            If rstChaXunTiaoJianSZ("LieBiaoT") <> "" Then
                m_ctl.SetListCaption rstChaXunTiaoJianSZ("LieBiaoT")
            End If
            '列宽度
            If rstChaXunTiaoJianSZ("LieKuanD") <> "" Then
                m_ctl.SetColumnWidth rstChaXunTiaoJianSZ("LieKuanD")
            End If

            '输入列、值列、显示列
            m_ctl.InputColumn = rstChaXunTiaoJianSZ("ShuRuL")
            m_ctl.ValueColumn = rstChaXunTiaoJianSZ("ZhiLie")
            m_ctl.TextColumn = rstChaXunTiaoJianSZ("XianShiL")

        End If

        '转化为可见
        m_ctl.Visible = True

        '设置字体
        If rstChaXunTiaoJianSZ("ZiTiCC") <> "" Then
            m_ctl.Font.Size = rstChaXunTiaoJianSZ("ZiTiCC")
        End If

        '有效性
        If rstChaXunTiaoJianSZ("YouXiaoX") = "否" Then
            m_ctl.Enabled = False

        End If

        m_ctl.Caption = rstChaXunTiaoJianSZ("BiaoTi")
        m_ctl.Left = rstChaXunTiaoJianSZ("ZuoBianJ")
        m_ctl.Top = rstChaXunTiaoJianSZ("ShangBianJ")
        m_ctl.Height = rstChaXunTiaoJianSZ("GaoDu")
        m_ctl.Width = rstChaXunTiaoJianSZ("KuanDu")
        '存放(字段;比较符)
        'Debug.Print rstChaXunTiaoJianSZ("ZiDuan") & ";" _
         & rstChaXunTiaoJianSZ("BiJiaoF")
        m_arrJieMianCXTJ(intSuoYinH) = rstChaXunTiaoJianSZ("ZiDuan") & ";" _
                                     & rstChaXunTiaoJianSZ("BiJiaoF")

        '设定tag标志(回车使用)
        m_ctl.Tag = intSuoYinH
        intSuoYinH = intSuoYinH + 1

        If rstChaXunTiaoJianSZ("KongJianLX") = "cbo" Then
            cbo_GotFocus m_intKongJianS_cbo
            Select Case strQueShengZ
            Case "登录者"
                m_ctl.InitValue g_strYongHuDM
            Case "登录科室"
                m_ctl.InitValue g_strKeShiDM
            Case Else
                m_ctl.InitValue strQueShengZ
            End Select
        End If
        '下一条记录
        rstChaXunTiaoJianSZ.MoveNext

    Wend

    '把焦点移至tag=0的控件
       For Each m_ctl In Me.Controls
        If m_ctl.Tag = "0" Then
            m_ctl.SetFocus
        End If
        
        If TypeOf m_ctl Is lst Or TypeOf m_ctl Is pgb Or TypeOf m_ctl Is pic Or TypeOf m_ctl Is cmd Then
        ElseIf TypeOf m_ctl Is Frame Then
            m_ctl.Top = m_ctl.Top + 130
        
        Else
            m_ctl.Top = m_ctl.Top + 270
            m_ctl.Left = m_ctl.Left + 50
        End If
    Next
 '以下2015-10-3 ZXH 修改
 pic1.Caption = Me.Caption & "(T2)"
 lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 600
 'TextMiMa.Move fraButton.Left - 1100, fraButton.Top, 1050, fraButton.Height
 pgb1.Move Me.Width / 2, Me.Height - 1500, 3015, 435
 pgb1.Visible = False

PROC_EXIT:
    Exit Sub
PROC_ERR:
    If ERR.Number <> 0 Then
        Call ShowError(Me.Name, "ZhuangZaiJieMian()", ERR.Number, ERR.Description)
        GoTo PROC_EXIT
    End If

End Sub

Private Sub cbo_GotFocus(Index As Integer)

    Dim rstShuJvLY As ADODB.Recordset   '数据来源
    Dim strQueShengZ As String          '缺省值

    g_strSQL = "SELECT ShuJvLY,isnull(QueShengZ,'') QueShengZ" & Chr(13) _
             & "FROM xt_ChaXunTiaoJianSZ_LB" & Chr(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr(13) _
             & "AND ZiDuan+';'+BiJiaoF='" & m_arrJieMianCXTJ(cbo(Index).Tag) & "'"
    Set rstShuJvLY = objExecuteSQL.GetRs(g_strSQL)

    '加载数据
    Select Case rstShuJvLY("QueShengZ")
    Case "登录者"
        strQueShengZ = g_strYongHuDM
    Case "登录科室"
        strQueShengZ = g_strKeShiDM
    Case Else
        strQueShengZ = rstShuJvLY("QueShengZ")
    End Select
    g_strSQL = rstShuJvLY("ShuJvLY")
    If Left(g_strSQL, 6) = "SELECT" Then
        '动态从数据库中提取
        Call objFormSetting.LoadcboData(cbo(Index), recorddata, g_strSQL)
        cbo(Index).InitValue strQueShengZ
        '   Else
        '      '固定列表
        '      Call LoadcboData(cbo(Index), FixedData, g_strSql)
        '      cbo(Index).InitValue strQueShengZ
    End If

End Sub


Private Sub cbo1_KeyPress(Index As Integer, KeyAscii As Integer)

    Dim rstShuJvLY As ADODB.Recordset

    If KeyAscii = vbKeyReturn Then
        If cbo1(Index).nextFocus = False Then
            '清空列表选项
            cbo1(Index).LoadOver = False
            cbo1(Index).ClearData

            '装载药品
            g_strSQL = "SELECT ShuJvLY,isnull(QueShengZ,'') QueShengZ" & Chr(13) _
                     & "FROM xt_ChaXunTiaoJianSZ_LB" & Chr(13) _
                     & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr(13) _
                     & "AND ZiDuan+';'+BiJiaoF='" & m_arrJieMianCXTJ(cbo1(Index).Tag) & "'"
            Set rstShuJvLY = objExecuteSQL.GetRs(g_strSQL)

            g_strSQL = rstShuJvLY("ShuJvLY")

            If cbo1(Index).InputColumn = 1 Then
                '按代码查找
                g_strSQL = g_strSQL & Chr(13) & " AND TingYongBZ='否' AND (PinYinM like '%" & cbo1(Index).Text & "%'" _
                         & Chr(13) & " OR MingCheng like '%" & cbo1(Index).Text & "%'" _
                         & Chr(13) & " OR DaiMa='" & cbo1(Index).Text & "')"
            Else
                '按拼音码查找
                g_strSQL = g_strSQL & Chr(13) & " AND  (TingYongBZ='否' AND PinYinM like '%" & cbo1(Index).Text & "%')"
            End If

            '代码;拼音码;名称;规格;剂型;单价;单位;包装价;包装单位;
            Call objFormSetting.LoadcboData(cbo1(Index), recorddata, g_strSQL)

            '回车焦点移至指定的控件
            If cbo1(Index).nextFocus = True Then
                Call objFormSetting.nextFocus(cbo1(Index))
            End If
        Else
            Call objFormSetting.nextFocus(cbo1(Index))
        End If
    End If

End Sub

Private Sub cmdChaXun_Click()
'显示结果
    pgb1.ProcStart
'    DoEvents
    Call XianShiJieGuo
    pgb1.ProcEnd
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdPreview_Click()
    Call NewDaYin(2)
    '
    '    Dim strBaoBiaoM As String    '报表名
    '    Dim colCanShu As New Collection  '传递参数
    '    Dim ctl As Control
    '
    '    If m_blnDaYinLB = True Then
    '
    '    Else
    '        If Not m_blnDaYinLB Then
    '            '传递报表参数
    '            If ChuanDiBBCS(Me) Then
    '            End If
    '
    '            '打印预览
    '            objPrt.PrintPreGrid lstChaXunJieGuo, txtChaXunMC.Text, g_intDaYinYLDZT, False
    '        Else
    '            Call NewDaYin(3)
    '        End If
    '        Exit Sub
    '    End If
    '    '传参数
    '    colCanShu.Add "制表人"
    '    colCanShu.Add g_strYongHuMC
    '    colCanShu.Add "制表科室"
    '    colCanShu.Add g_strKeShiMC
    '    colCanShu.Add "日期"
    '    colCanShu.Add objStandData.getSystemDate()
    '
    '    '      colCanShu.Add "摆药科室"
    '    '      colCanShu.Add cboBaiYaoKeShi.Text
    '    '遍历窗体的所有控件，全部作为报表参数
    '    For Each ctl In Me.Controls
    '        '只有cbo、num、txt、dtm处理
    '        If TypeOf ctl Is cbo _
             '           Or TypeOf ctl Is txt _
             '           Or TypeOf ctl Is num Then
    '            '只有可见可见传递
    '            If ctl.Visible Then
    '                colCanShu.Add ctl.Caption
    '                colCanShu.Add ctl.Text
    '            End If
    '        Else
    '            If TypeOf ctl Is dtm Then
    '                '只有可见可见传递
    '                If ctl.Visible Then
    '                    colCanShu.Add ctl.Caption
    '                    colCanShu.Add ctl.GetDate()
    '                End If
    '            End If
    '        End If
    '    Next ctl
    '
    '
    '    '打印预览
    '    strBaoBiaoM = Trim(txtChaXunMC.Text)
    '
    '
    '    '传递参数
    '    If objPrt1.PutVariant(colCanShu) Then
    '    End If
    '    Dim strPath As String
    '    strPath = App.Path & "\ReportTemplet\" & strBaoBiaoM & ".fr3"
    '    If Dir(strPath) = "" Then
    '        MsgBox "找不到：" & strPath
    '        Exit Sub
    '    End If
    '    If g_intDaYinYLDZT = "0" Then
    '        '进入设计状态
    '        '             If objPrt1.ReportDesign(m_strBaoBiaoSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM & ".frf") Then
    '        '             End If
    '        blnReturn = objPrt1.ReportDesignex(m_strSQL, strPath)
    '    Else
    '        blnReturn = objPrt1.ReportPreviewEX(m_strSQL, strPath)
    '        '进入预览状态
    '        '   If objPrt1.ReportPreview(m_strBaoBiaoSQL, App.Path & "\ReportTemplet\" & strBaoBiaoM & ".frf") Then
    '        '  End If
    '    End If
End Sub

Private Sub cmdPrint_Click()
    If Not m_blnDaYinLB Then
        '传递报表参数
        If ChuanDiBBCS(Me) Then
        End If

        '打印预览
        objPrt.PrintPreGrid lstChaXunJieGuo, txtChaXunMC.Text, g_intDaYinYLDZT, False
    Else
        Call NewDaYin(3)
    End If
End Sub

Private Sub NewDaYin(intLeiBie As Integer)
'* 功    能： 新打印方式
'* 参    数： 1 设计,2 预览，其他-直接打印
'* 返 回 值：
'* 创 建 人：
'* 修 改 人：ky
'* 修改日期：

    Dim ctl As Control            '控件
    Dim arrBaoBiaoCS(50, 1) As Variant            '报表参数表（前一变量为参数名，后一变量为参数值）
    Dim colMX As Collection
    Dim strPath As String


    Set colMX = New Collection
    '传参数
    colMX.Add "制表人"
    colMX.Add g_strYongHuMC
    colMX.Add "制表科室"
    colMX.Add g_strKeShiMC

    '遍历窗体的所有控件，全部作为报表参数
    For Each ctl In Me.Controls

        '只有cbo、num、txt、dtm处理
        If TypeOf ctl Is cbo _
           Or TypeOf ctl Is txt _
           Or TypeOf ctl Is num Then
            '只有可见可见传递
            If ctl.Visible Then
                colMX.Add ctl.Caption
                colMX.Add ctl.Text
            End If
        Else
            If TypeOf ctl Is dtm Then
                '只有可见可见传递
                If ctl.Visible Then
                    colMX.Add ctl.Caption
                    colMX.Add ctl.GetDate()
                End If
            End If
        End If
    Next ctl

    blnReturn = objPrt1.PutVariant(colMX)

    If Right(CStr(App.Path), 1) = "\" Then
        strPath = App.Path & "ReportTemplet\" & Me.Caption & ".fr3"
    Else
        strPath = App.Path & "\ReportTemplet\" & Me.Caption & ".fr3"
    End If
    If Dir(strPath) = "" Then
        MsgBox "找不到：" & strPath
        Exit Sub
    End If
    '是否设计报表
    If intLeiBie = "1" Or getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
        blnReturn = objPrt1.ReportDesignex(m_strSQL, strPath)
    ElseIf intLeiBie = "2" Then
        blnReturn = objPrt1.ReportPreviewEX(m_strSQL, strPath)
    Else
        blnReturn = objPrt1.ReportPrintEX(m_strSQL, strPath)
    End If
    Set colMX = Nothing
End Sub

Private Sub cmdQingKongTJ_Click()

'* 功    能： 清空条件
'* 参    数：
'* 返 回 值：
'* 创 建 人：
'* 修 改 人：yangronghui
'* 修改日期：20061230

    Dim intSuoYinH As Integer

    '条件区的控件不可见
    For intSuoYinH = 0 To txt.UBound
        If txt(intSuoYinH).Enabled = True Then
            txt(intSuoYinH).Text = ""
        End If
    Next intSuoYinH

    For intSuoYinH = 0 To num.UBound
        If num(intSuoYinH).Enabled = True Then
            num(intSuoYinH).Text = ""
        End If
    Next intSuoYinH

    '日期条件不变
    '   For intSuoYinH = 0 To dtm.UBound
    '      If dtm(intSuoYinH).Enabled = True Then
    '         dtm(intSuoYinH).SetDate ""
    '      End If
    '   Next intSuoYinH

    For intSuoYinH = 0 To cbo.UBound
        If cbo(intSuoYinH).Enabled = True Then
            cbo(intSuoYinH).InitValue ""
        End If
    Next intSuoYinH

    For intSuoYinH = 0 To cbo1.UBound
        If cbo1(intSuoYinH).Enabled = True Then
            cbo1(intSuoYinH).InitValue ""
        End If
    Next intSuoYinH

    lstChaXunJieGuo.RemoveAllItems


End Sub

Private Sub Form_Activate()

'* 功    能： 装载界面
'* 参    数：
'* 返 回 值：
'* 创 建 人：
'* 修 改 人：yangronghui
'* 修改日期：20061230


'如果已经加载就退出 ，
    If m_blnPanDuan = True Then
        GoTo PROC_EXIT
    End If

    '装载界面
    Call ZhuangZaiJieMian
    m_blnPanDuan = True

    '初始化列表
    Const c_EnableEdit = False      '允许编辑单元格
    Const c_EditColString = ""  '可编辑的列：数量
    Const c_MergeCellType = g_eMergeCells.flexMergeNever    '合并类型：
    Const c_MergeCols = ""      '合并列：
    Const c_FocusDirection = g_eFocusDirection.focusDown     '焦点方向：向下
    Const c_EnableDrag = True   '允许拖拽
    Const c_EnableSort = True  '允许排序
    If objFormSetting.InitList(lstChaXunJieGuo, c_EnableEdit, c_EditColString, c_MergeCellType, c_MergeCols, _
                               c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
        g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
        GoTo PROC_EXIT
    End If

PROC_EXIT:
    Exit Sub
End Sub

Private Sub Form_Click()
    cmdChaXun.SetFocus
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)

    Dim strTiShiXX As String    '提示信息
    Dim lngTag As Long          '当前控件的tag
    Dim blnLast As Boolean      '是否为条件的最后一个控件

'按键触发
    If KeyAscii = vbKeyReturn Then
        blnLast = True    '默认是

        If IsNumeric(Me.ActiveControl.Tag) = False Then
            GoTo PROC_EXIT
        Else
            lngTag = Me.ActiveControl.Tag
        End If
        '如果是大数量的组合框，特殊处理
        If Me.ActiveControl.Name = "cbo1" Then
            If Me.ActiveControl.nextFocus = False Then
                GoTo PROC_EXIT
            End If
        End If


        '把焦点移至tag=0的控件
        For Each m_ctl In Me.Controls
            If m_ctl.Tag = lngTag + 1 Then
                m_ctl.SetFocus
                blnLast = False
            End If
        Next
        If blnLast Then
            cmdChaXun.SetFocus
        End If
    End If

    'ECS 快捷键
    If KeyAscii = 27 Then
        Call Form_Activate
    End If


PROC_EXIT:
    Exit Sub

End Sub

Private Sub Form_Load()


'设置窗体居中(Call objFormSetting.InitFormPosition)
    Const c_formWidth = 12090
    Const c_formHeight = 8970
    '   '重新设置窗体上的控件大小
    '    rsz.ReadXY Me ', c_formWidth, c_formHeight
    Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

    '初始化窗体属性
    If objFormSetting.InitFormProperty(Me) = False Then
        g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
        GoTo PROC_EXIT
    End If
    m_blnPanDuan = False

PROC_EXIT:
    Exit Sub

End Sub

'鼠标的状态不能这样改变，如果还有事务在进行就不能改变
'Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'  Me.MousePointer = 1
'End Sub

Private Sub Form_Resize()
'   rsz.ReSetXY Me
    On Error Resume Next
    fraButton.Left = Me.Width - fraButton.Width - 200
    lstChaXunJieGuo.Width = Me.Width - lstChaXunJieGuo.Left * 2 - 100
    lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 1000
'    pgb1.Left = Me.Width - pgb1.Width - 200
'    pgb1.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + 50
    
    
     '以下2015-10-3 ZXH 修改
 pic1.Caption = Me.Caption & "(T2)"
 lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 600
 'TextMiMa.Move fraButton.Left - 1100, fraButton.Top, 1050, fraButton.Height
 pgb1.Move Me.Width / 2, Me.Height - 1500, 3015, 435

 pgb1.Visible = False
End Sub


Private Sub LieBiaoYS()
    Dim lngRow As Long

    If Me.Caption = "挂号明细" Then
        For lngRow = 1 To lstChaXunJieGuo.getMaxRow
            If lstChaXunJieGuo.TextMatrix(lngRow, 18) = "是" Then    '19列 从0开始计算
                lstChaXunJieGuo.SetItemBackColor vbYellow, lngRow
            End If
        Next
    End If
End Sub
