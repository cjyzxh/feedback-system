VERSION 5.00
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.2#0"; "HISControl1.ocx"
Begin VB.Form frmTongYongChaXun 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "通用查询"
   ClientHeight    =   8520
   ClientLeft      =   1695
   ClientTop       =   2325
   ClientWidth     =   12915
   Icon            =   "frmTongYongChaXun.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8520
   ScaleWidth      =   12915
   Begin UserControl.pic pic1 
      Height          =   390
      Left            =   60
      TabIndex        =   10
      Top             =   0
      Width           =   12795
      _ExtentX        =   22569
      _ExtentY        =   714
   End
   Begin VB.TextBox TextMiMa 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFC0C0&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      IMEMode         =   3  'DISABLE
      Left            =   4920
      PasswordChar    =   "*"
      TabIndex        =   9
      Top             =   1800
      Visible         =   0   'False
      Width           =   1020
   End
   Begin UserControl.cbo cbo1 
      Height          =   225
      Index           =   0
      Left            =   2040
      TabIndex        =   8
      Top             =   1200
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
      Left            =   1500
      TabIndex        =   7
      Top             =   780
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
      Left            =   2820
      TabIndex        =   6
      Top             =   780
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   397
   End
   Begin UserControl.num num 
      Height          =   225
      Index           =   0
      Left            =   180
      TabIndex        =   5
      Top             =   735
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
      Height          =   435
      Left            =   4980
      TabIndex        =   4
      Top             =   2340
      Width           =   3015
      _ExtentX        =   6165
      _ExtentY        =   1217
   End
   Begin VB.Frame fraButton 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H80000008&
      Height          =   400
      Left            =   6000
      TabIndex        =   2
      Top             =   1800
      Width           =   6435
      Begin UserControl.cmd cmdChaXun 
         Height          =   405
         Left            =   0
         TabIndex        =   11
         Top             =   0
         Width           =   1095
         _ExtentX        =   1931
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
         Left            =   2632
         TabIndex        =   12
         Top             =   0
         Width           =   1425
         _ExtentX        =   2514
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
         Height          =   400
         Left            =   4113
         TabIndex        =   13
         Top             =   0
         Width           =   1155
         _ExtentX        =   2037
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
         Height          =   400
         Left            =   5325
         TabIndex        =   14
         Top             =   0
         Width           =   1035
         _ExtentX        =   1826
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
         Left            =   1151
         TabIndex        =   15
         Top             =   0
         Width           =   1425
         _ExtentX        =   2514
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
      Height          =   225
      Left            =   3900
      TabIndex        =   0
      Top             =   1200
      Visible         =   0   'False
      Width           =   1635
      _ExtentX        =   2884
      _ExtentY        =   397
      CaptionWidth    =   105
      Hwnd            =   198828
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
   Begin UserControl.lst lstChaXunJieGuo 
      Height          =   6180
      Left            =   60
      TabIndex        =   1
      Top             =   2280
      Width           =   12795
      _ExtentX        =   22569
      _ExtentY        =   10901
      MergeCells      =   2
      RowHeightMin    =   300
      ColWidths       =   "800"
      SelectionMode   =   1
      AutoSetSize     =   -1  'True
   End
   Begin UserControl.cbo cbo 
      Height          =   225
      Index           =   0
      Left            =   120
      TabIndex        =   3
      Top             =   1200
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
Attribute VB_Name = "frmTongYongChaXun"
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
Dim m_strXiaoJiLB As String    '小计列表 7;9;14
Dim m_strXiaoJiBTL As String   '小数列 1 只能有一个数，如按科室小计 列数就是科室那列
Dim m_lngZiDuanS As Long

Dim blnReturn                           '报表设计器的返回
Dim m_strDaYinLB As String    '打印类别
Dim m_strSQL As String

Dim m_arrJieMianCXTJ(51) As String
Dim m_TiaoJianLrz As String
Private Sub XianShiJieGuo()

'* 功    能： 显示结果
'* 参    数：
'* 返 回 值：
'* 创 建 人： xuzhaolin
'* 修 改 人：
'* 修改日期：

    On Error GoTo PROC_ERR
    Dim rstQuanXian As New ADODB.Recordset
    Dim rstChaXunSheZhi As ADODB.Recordset   '查询设置
    Dim colChaXunJieGuo As Collection        '数据(查询结果)
    Dim intZiDuanS As Integer  '字段数
    Dim strZiDuanM As String  '字段名(控件tag:如"BingLiH;>"的前部分)
    Dim strBiJiaoF As String  '比较符(控件tag:如"BingLiH;>"的后部分)
    Dim i As Integer
    Dim lngRow As Long        '行号
    Dim lngCol As Long
    Dim strcol As String      '列号
    Dim strBaoBiaoCXTJ As String     '报表查询条件
    Dim strRiQi As String        '日期
    Dim strShuRuMM As String
    Dim rstYongHu As ADODB.Recordset
    Dim mSuQian As String
    '清空列表数据
    lstChaXunJieGuo.RemoveAllItems
    g_strSql = ""
    M_strChaXunTJ = ""
    strBaoBiaoCXTJ = ""
'    DoEvents
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
'        DoEvents
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
'        DoEvents
    Next i

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

            If strBiJiaoF = "=" Then
                strRiQi = m_ctl.GetDate
            End If
        Else
            If strBiJiaoF = ">=" Then
                strRiQi = m_ctl.GetDate
            End If
            If strBiJiaoF = "<=" Then
                strRiQi = m_ctl.GetDate
            End If

            If strBiJiaoF = "=" Then
                strRiQi = m_ctl.GetDate
            End If
        End If

        If m_ctl.IsNull Then
        Else
            M_strChaXunTJ = M_strChaXunTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & strRiQi & "'"
            strBaoBiaoCXTJ = strBaoBiaoCXTJ & Chr(13) & "AND " & strZiDuanM & " " & strBiJiaoF & "'" & strRiQi & "'"
        End If
'        DoEvents
    Next i

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
'        DoEvents
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
'        DoEvents
    Next i

    '如果选择条件,去掉第一个多余的AND
    If M_strChaXunTJ <> "" Then
        M_strChaXunTJ = Mid(M_strChaXunTJ, 5)
    End If
    If strBaoBiaoCXTJ <> "" Then
        strBaoBiaoCXTJ = Mid(strBaoBiaoCXTJ, 5)
    End If
'    DoEvents
    If txtChaXunMC.Text = "病案查询" Then
        g_strSql = "SELECT isnull(zhicheng,0) as ZhiWei  " & Chr(13) _
                 & "FROM ZD_YONGHU A with(nolock) " & Chr(13) _
                 & "WHERE DAIMA='" & Trim(g_strYongHuDM) & "'"

        Set rstQuanXian = objExecuteSQL.GetRs(g_strSql)
        If Not (rstQuanXian.BOF Or rstQuanXian.EOF) Then
            '当职称 比创建人大时可以修改时 可以修改同科室其他医生的病历
            If rstQuanXian("ZhiWei").Value < 5 Then
                M_strChaXunTJ = M_strChaXunTJ & " and RuYuanKS='" & g_strKeShiDM & "'"
            End If
        End If
    End If

    'SQL=查询语句+查询条件
    If M_strChaXunTJ <> "" Then
        If m_strFuJiaTJ = "" Then
            g_strSql = m_strChaXunYJ & " WHERE " & M_strChaXunTJ
        Else
            g_strSql = m_strChaXunYJ & Chr(13) _
                     & "AND " & M_strChaXunTJ
        End If
    Else
        g_strSql = m_strChaXunYJ
    End If
'    DoEvents
      g_strSql = Replace(g_strSql, "{0}", M_strChaXunTJ)

    If txtChaXunMC.Text = "挂号列表明细" And ReplaceChar(g_strCenterName) = "济南协和肝病医院" Then
        g_strSql = g_strSql & "and YiShengMC='" & g_strYongHuMC & "'"
    End If
    If txtChaXunMC.Text = "药品总帐" Then
        If ReplaceChar(g_strCenterName) = "新乡仁爱医院" Then
            TextMiMa.Visible = True
            If Len(TextMiMa.Text) > 0 Then
                Set rstYongHu = objExecuteSQL.GetRs("SELECT ISNULL(MiMa,'') AS MiMa  FROM ZD_YONGHU WHERE DAIMA='1011'")

                If ReplaceChar(TextMiMa.Text) = ReplaceChar(rstYongHu("MiMa").Value) Then
                Else
                    g_strSql = g_strSql & " AND GuiZhongBZ<>'是' "
                End If
            Else
                g_strSql = g_strSql & " AND GuiZhongBZ<>'是' "
            End If
        End If
    End If
    'lrz12-1-17
    If txtChaXunMC.Text = "宿迁医保职工统计" Or txtChaXunMC.Text = "宿迁医保居民统计" Or txtChaXunMC.Text = "宿迁医保市区统计" Then
        mSuQian = "  drop table tmpSuquanYIbao " & vbCrLf
        mSuQian = mSuQian & "   select QuXianBH,QXMC,YiLiaoLeiBie,count(icount) as  icount into tmpSuquanYIbao from (select  zhuyuanlsh ,QuXianBH,YiLiaoLeiBie,QXMC,count( QuXianBH) as icount From st_tongshiceshi where   zhuanghuzf<>0  " & vbCrLf
        mSuQian = mSuQian & " and isnull(QuXianBH,'')<>'' and " & vbCrLf

        mSuQian = mSuQian & IIf(M_strChaXunTJ = "", " 1=1", M_strChaXunTJ)
        ' --and QuXianBH='321399'
        '-- and jiesuansj   between '2011-12-1' and '2011-12-31 23:59:59'
        mSuQian = mSuQian & "group by  zhuyuanlsh ,YiLiaoLeiBie,QXMC,QuXianBH having sum(cast( LeiBie as int))<>0) a group by YiLiaoLeiBie,QXMC,QuXianBH" & vbCrLf
        objExecuteSQL.ExecuteSQL mSuQian
        g_strSql = Replace(m_strChaXunYJ, "{0}", M_strChaXunTJ)
        '    lstChaXunJieGuo.SetMergeCells flexMergeRestrictAll, vbNull
        '   lstChaXunJieGuo.MergeCompare = 0

    End If
    
    
 If txtChaXunMC.Text = "门诊疾病统计表3" Then
    If M_strChaXunTJ = "" Then
    M_strChaXunTJ = " 1=1"
    End If
       g_strSql = Replace(m_strChaXunYJ, "{0}", M_strChaXunTJ)

 End If

    '    If txtChaXunMC.Text = "沈阳医保职工统计" Or txtChaXunMC.Text = "沈阳医保居民统计" Or txtChaXunMC.Text = "宿迁医保市区统计" Then
    '        mSuQian = "  drop table tmpSuquanYIbao " & vbCrLf
    '        mSuQian = mSuQian & "   select YiLiaoLeiBie,count(icount) as  icount into tmpSuquanYIbao from (select  zhuyuanlsh ,YiLiaoLeiBie,count( QuXianBH) as icount From st_tongshiceshi where   zhuanghuzf<>0  " & vbCrLf
    '
    '        mSuQian = mSuQian & IIf(M_strChaXunTJ = "", " 1=1", M_strChaXunTJ)
    '        ' --and QuXianBH='321399'
    '        '-- and jiesuansj   between '2011-12-1' and '2011-12-31 23:59:59'
    '        mSuQian = mSuQian & "group by  zhuyuanlsh ,YiLiaoLeiBie,having sum(cast( LeiBie as int))<>0) a group by YiLiaoLeiBie" & vbCrLf
    '        objExecuteSQL.ExecuteSQL mSuQian
    '        g_strSQL = Replace(m_strChaXunYJ, "{0}", M_strChaXunTJ)
    '        '    lstChaXunJieGuo.SetMergeCells flexMergeRestrictAll, vbNull
    '        '   lstChaXunJieGuo.MergeCompare = 0
    '
    '    End If

    '加分组字段
    If m_strFenZuZD <> "" Then
        g_strSql = g_strSql & Chr(13) _
                 & "GROUP BY " & m_strFenZuZD
    End If
'    DoEvents

    '加排序字段
    If m_strPaiXuZD <> "" Then
        g_strSql = g_strSql & Chr(13) _
                 & "ORDER BY " & m_strPaiXuZD
    End If
'    DoEvents

    m_strBaoBiaoSQL = g_strSql
        'lz2016-04-21 迁移位置
'    If GetChkOld = True Then  '特殊报表需要在中间插入合计列的 用老加载方法  ZXH 2015-12-07
'        If objFormSetting.FillList_Old(lstChaXunJieGuo, g_strSql) Then
'            m_strSQL = g_strSql
'        End If
'    Else
'        If objFormSetting.FillList_New(lstChaXunJieGuo, g_strSql) Then
'            m_strSQL = g_strSql
'        End If
'    End If
   '需要小计 小计则不能合计
    Dim rstDate As ADODB.Recordset
    
    Set rstDate = New ADODB.Recordset
    Set rstDate = objExecuteSQL.GetRs(g_strSql)
    If Not (rstDate.BOF Or rstDate.EOF) Then

        If Len(m_strXiaoJiLB) > 0 Then
            Call ProFilllst(rstDate)
            Exit Sub
        Else
            'lz2016-04-21 如果没有设置小计, 则直接加载 从上方移到此处
            If objFormSetting.FillList_New(lstChaXunJieGuo, g_strSql) Then
                m_strSQL = g_strSql
            End If
        End If

    End If
    '需要合计
    If m_strHeJiLB <> "" Then
        Dim strDaiHeJL As String  '待合计列
        strDaiHeJL = m_strHeJiLB
        Call AddColSum(lstChaXunJieGuo, strDaiHeJL)

        If Me.Caption = "患者流失明细" Then
            lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, 2) = lstChaXunJieGuo.Rows - 2
        End If
    End If

    '格式化数据
    lstChaXunJieGuo.XiaoShuWS = m_strXiaoShuWS
    lstChaXunJieGuo.FormatData

    Call LieBiaoYS '列表颜色
    'lrz12-1-17
    If txtChaXunMC.Text = "宿迁医保职工统计" Or txtChaXunMC.Text = "宿迁医保居民统计" Or txtChaXunMC.Text = "宿迁医保市区统计" _
        Or txtChaXunMC.Text = "医保月结汇总" Then
        lstChaXunJieGuo.cellValue(lstChaXunJieGuo.Rows - 1, "yingfujexj") = lstChaXunJieGuo.cellValue(lstChaXunJieGuo.Rows - 1, "yingfuje")
        MergeCol 0, lstChaXunJieGuo.Cols - 1
    End If
    
      If txtChaXunMC.Text = "卡报表" Then
            MergeColSum 3, 5
            MergeColSum 4, 5
            MergeColSum 5, 5
      End If
      
PROC_ERR:
    If ERR.Number <> 0 Then
        Call ShowError(Me.Name, "XianShiJieGuo()", ERR.Number, ERR.Description)
    End If

End Sub

Private Function GetChkOld() As Boolean
'检查当前报表名称 确定用新或旧的数据加载方式  ZXH 2015-11-30
GetChkOld = False
    Select Case txtChaXunMC.Text
        Case "门诊医生电子账单2"
            GetChkOld = True
        Case Else
        
    End Select
        
End Function



Private Sub MergeColSum(StartCol As Long, EdnCol As Long)
    Dim i As Integer
    Dim l As Integer
    Dim str1 As Double
    Dim Str2 As Double
    str1 = 0
    With lstChaXunJieGuo
        '        If IsNumeric(.TextMatrix(1, StartCol)) = False Then
        '            Exit Sub
        '        End If
        '.MergeCol(9) = False
        str1 = Val(.TextMatrix(1, StartCol))
        Str2 = str1   'CStr(.TextMatrix(1, EdnCol))
        For i = 2 To .Rows - 2
            DoEvents
            If Val(.TextMatrix(i, StartCol)) <> str1 Then
                str1 = Val(.TextMatrix(i, StartCol))
                Str2 = Str2 + str1
            End If
        Next
        .TextMatrix(.Rows - 1, StartCol) = Str2


    End With

End Sub
''’endcol 相对startcol 来合并 lrz12-2-23
Public Sub MergeCol(StartCol As Long, EdnCol As Long)
    Dim i As Integer
    Dim l As Integer
    Dim str1 As String
    Dim Str2 As String
    str1 = ""
    With lstChaXunJieGuo
        '.MergeCol(9) = False
        str1 = .TextMatrix(1, StartCol)
        Str2 = CStr(.TextMatrix(1, EdnCol))
        For i = 2 To .Rows - 1
            DoEvents
            If .TextMatrix(i, StartCol) <> str1 Then
                str1 = .TextMatrix(i, StartCol)
                If .TextMatrix(i, EdnCol) = .TextMatrix(i - 1, EdnCol) Then
                    Str2 = .TextMatrix(i, EdnCol) & " "    ' Chr(10)
                    .TextMatrix(i, EdnCol) = Str2
                Else
                    Str2 = CStr(.TextMatrix(i, EdnCol))
                End If
            Else
                .TextMatrix(i, EdnCol) = Str2
            End If
        Next
        '  .MergeCol(9) = True


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

    Dim strMergeCols As String
    Dim rstChaXunSheZhi As ADODB.Recordset   '查询设置
    Dim rstChaXunTiaoJianSZ As ADODB.Recordset   '查询条件设置
    Dim colChaXunJieGuo As Collection   '数据(查询结果)
    Dim m_rstChaXunJieGuo As ADODB.Recordset   '查询结果
    Dim intZiDuanS As Integer  '字段数
    Dim intSuoYinH As Integer  'TabIndex
    Dim strQueShengZ As String  '缺省值
    'Dim strQianYiGKJM As String   '前一个控件

    '条件区的控件不可见
    '   For intSuoYinH = 1 To 10
    '      txt(intSuoYinH).Visible = False
    '      num(intSuoYinH).Visible = False
    '      dtm(intSuoYinH).Visible = False
    '      cbo(intSuoYinH).Visible = False
    '      cbo1(intSuoYinH).Visible = False
    '      txt(intSuoYinH).BackStyle = Transparent
    '      num(intSuoYinH).BackStyle = Transparent
    '      cbo(intSuoYinH).BackStyle = Transparent
    '      cbo1(intSuoYinH).BackStyle = Transparent
    '      txt(intSuoYinH).BackColor = vbWhite
    '      num(intSuoYinH).BackColor = vbWhite
    '      dtm(intSuoYinH).BackColor = vbWhite
    '      cbo(intSuoYinH).BackColor = vbWhite
    '      cbo1(intSuoYinH).BackColor = vbWhite
    '   Next intSuoYinH

    '清空列表数据
    lstChaXunJieGuo.RemoveAllItems
    '装载结果区界面
    g_strSql = "SELECT ChaXunYJ,XianShiLBSBJ, LieBiaoT, LieMingC," & Chr$(13) _
             & "       LieKuanD,ISNULL(FuJiaTJ,'') FuJiaTJ,ISNULL(FenZuZD,'') FenZuZD,ISNULL(PaiXuZD,'') PaiXuZD," & Chr$(13) _
             & "       ISNULL(DuiQiFS,'') DuiQiFS,ISNULL(XiaoJiLB,'') XiaoJiLB,ISNULL(XiaoJiBTL,'') XiaoJiBTL,ISNULL(HeJiLB,'') HeJiLB,ISNULL(HeBingLS,'') HeBingLS," & Chr$(13) _
             & "       isnull(XiaoShuWS,'') XiaoShuWS,ISNULL(ZiTiCC,'') ZiTiCC,ISNULL(DaYinLB,0) DaYinLB" & Chr$(13) _
             & "FROM xt_ChaXunSheZhi " & Chr$(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'"
    Set rstChaXunSheZhi = objExecuteSQL.GetRs(g_strSql)
    If Not rstChaXunSheZhi.EOF Then
        '查询语句
        m_strChaXunYJ = rstChaXunSheZhi("ChaXunYJ")
        '附加条件
        m_strFuJiaTJ = rstChaXunSheZhi("FuJiaTJ")

        '打印类别

        m_strDaYinLB = Trim(objConvertData.ConvertNumber(rstChaXunSheZhi("DaYinLB")))                '用新打印方式


        If m_strFuJiaTJ <> "" Then
            m_strChaXunYJ = m_strChaXunYJ & Chr$(13) _
                          & "WHERE " & m_strFuJiaTJ
        End If




        lstChaXunJieGuo.Top = rstChaXunSheZhi("XianShiLBSBJ")                    '设置列表上边界
        lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 1100          '设置列表高度
        lstChaXunJieGuo.SetListCaption rstChaXunSheZhi("LieBiaoT")               '设置列表标题
        lstChaXunJieGuo.ColumnName = rstChaXunSheZhi("LieMingC")               '设置列表名称
        lstChaXunJieGuo.SetColumnWidth rstChaXunSheZhi("LieKuanD")               '设置列表列宽度
        lstChaXunJieGuo.AlignColString = rstChaXunSheZhi("DuiQiFS")              '设置列表对齐方式
        '      lstChaXunJieGuo.SetMergeCells 3, rstChaXunSheZhi("HeBingLS")
        '
        '      lstChaXunJieGuo.MergeCells = flexMergeRestrictRows

        strMergeCols = rstChaXunSheZhi("HeBingLS")

        '初始化列表
        Const c_EnableEdit = False      '允许编辑单元格
        Const c_EditColString = ""  '可编辑的列：数量
        Const c_MergeCellType = g_eMergeCells.flexMergeRestrictColumns      '合并类型：
        '       Const c_MergeCols = strMergeCols       '合并列：
        Const c_FocusDirection = g_eFocusDirection.focusDown     '焦点方向：向下
        Const c_EnableDrag = True   '允许拖拽
        Const c_EnableSort = True   '允许排序
        If objFormSetting.InitList(lstChaXunJieGuo, c_EnableEdit, c_EditColString, c_MergeCellType, strMergeCols, _
                                   c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
            g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
        End If




'        pgb1.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + 100



        '设置字体
'        Dim strZiTiCC As String
'        strZiTiCC = rstChaXunSheZhi("ZiTiCC")
'        If strZiTiCC <> "" Then
'            lstChaXunJieGuo.Font.Size = strZiTiCC
'            cmdChaXun.Font.Size = strZiTiCC
'            cmdPreview.Font.Size = strZiTiCC
'            cmdPrint.Font.Size = strZiTiCC
'            cmdClose.Font.Size = strZiTiCC
'        End If
        m_strXiaoJiLB = rstChaXunSheZhi("XiaoJiLB")
        m_strHeJiLB = rstChaXunSheZhi("HeJiLB")
        m_strXiaoShuWS = rstChaXunSheZhi("XiaoShuWS")
        m_strFenZuZD = rstChaXunSheZhi("FenZuZD")
        m_strPaiXuZD = rstChaXunSheZhi("PaiXuZD")
        m_strXiaoJiBTL = rstChaXunSheZhi("XiaoJiBTL")
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
    'strQianYiGKJM = ""
    g_strSql = "SELECT ZiDuan, BiJiaoF,BiaoTi, KongJianLX, ShuJvLY," & Chr$(13) _
             & "       ZuoBianJ, ShangBianJ, GaoDu, KuanDu, " & Chr$(13) _
             & "       LieZongKD , LieBiaoT, LieKuanD,ShuRuL, " & Chr$(13) _
             & "       ZhiLie,XianShiL,isnull(QueShengZ,'') QueShengZ,ISNULL(ZiTiCC,'') ZiTiCC,YouXiaoX " & Chr$(13) _
             & "FROM xt_ChaXunTiaoJianSZ" & Chr$(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr$(13) _
             & "ORDER BY ShangBianJ,ZuoBianJ"

    Set rstChaXunTiaoJianSZ = objExecuteSQL.GetRs(g_strSql)
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
'        If rstChaXunTiaoJianSZ("ZiTiCC") <> "" Then
'            m_ctl.Font.Size = rstChaXunTiaoJianSZ("ZiTiCC")
'        End If

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
 pic1.Caption = Me.Caption & "(T)"
 lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 600
 TextMiMa.Move fraButton.Left - 1100, fraButton.Top, 1050, fraButton.Height
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

    g_strSql = "SELECT ShuJvLY,isnull(QueShengZ,'') QueShengZ" & Chr(13) _
             & "FROM xt_ChaXunTiaoJianSZ" & Chr(13) _
             & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr(13) _
             & "AND ZiDuan+';'+BiJiaoF='" & m_arrJieMianCXTJ(cbo(Index).Tag) & "'"
    Set rstShuJvLY = objExecuteSQL.GetRs(g_strSql)

    '加载数据
    Select Case rstShuJvLY("QueShengZ")
    Case "登录者"
        strQueShengZ = g_strYongHuDM
    Case "登录科室"
        strQueShengZ = g_strKeShiDM
    Case Else
        strQueShengZ = rstShuJvLY("QueShengZ")
    End Select
    g_strSql = rstShuJvLY("ShuJvLY")
    If Left(g_strSql, 6) = "SELECT" Then
        '动态从数据库中提取
        Call objFormSetting.LoadcboData(cbo(Index), recorddata, g_strSql)
        cbo(Index).InitValue strQueShengZ
        '   Else
        '      '固定列表
        '      Call LoadcboData(cbo(Index), FixedData, g_strSql)
        '      cbo(Index).InitValue strQueShengZ
    End If
   
       If g_strCenterName = "渑池中原医院" And Me.Caption = "输液卡打印" And Index = 2 Then
        cbo(Index).LoadOver = False
       g_strSql = "SELECT distinct chuanghao,huanzhexm,zhuyuanlsh  FROM st_shuyedan_df where KeShi='" & cbo(1).Value & "'"
       Call objFormSetting.LoadcboData(cbo(Index), recorddata, g_strSql)
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
            g_strSql = "SELECT ShuJvLY,isnull(QueShengZ,'') QueShengZ" & Chr(13) _
                     & "FROM xt_ChaXunTiaoJianSZ" & Chr(13) _
                     & "WHERE ChaXunMC='" & txtChaXunMC.Text & "'" & Chr(13) _
                     & "AND ZiDuan+';'+BiJiaoF='" & m_arrJieMianCXTJ(cbo1(Index).Tag) & "'"
            Set rstShuJvLY = objExecuteSQL.GetRs(g_strSql)

            g_strSql = rstShuJvLY("ShuJvLY")

            If cbo1(Index).InputColumn = 1 Then
                '按代码查找
                g_strSql = g_strSql & Chr(13) & " AND TingYongBZ='否' AND (PinYinM like '%" & cbo1(Index).Text & "%'" _
                         & Chr(13) & " OR MingCheng like '%" & cbo1(Index).Text & "%'" _
                         & Chr(13) & " OR DaiMa='" & cbo1(Index).Text & "')"
            Else
                '按拼音码查找
                g_strSql = g_strSql & Chr(13) & " AND  (TingYongBZ='否' AND PinYinM like '%" & cbo1(Index).Text & "%')"
            End If

            '代码;拼音码;名称;规格;剂型;单价;单位;包装价;包装单位;
            Call objFormSetting.LoadcboData(cbo1(Index), recorddata, g_strSql)

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
    pgb1.Visible = True
    pgb1.ProcStart
'    DoEvents
    Call XianShiJieGuo
    pgb1.ProcEnd
    pgb1.Visible = False
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdPreview_Click()
    Dim strBaoBiaoM As String    '报表名
    Dim colCanShu As New Collection  '传递参数
    Dim ctl As Control

    Select Case m_strDaYinLB

    Case "0"
        '传递报表参数
        If ChuanDiBBCS(Me) Then
        End If

        '打印预览
        objPrt.PrintPreGrid lstChaXunJieGuo, txtChaXunMC.Text, 0, False
    Case "1"
        Call NewDaYin(2)
    Case "2"
        '传参数
        colCanShu.Add "制表人"
        colCanShu.Add g_strYongHuMC
        colCanShu.Add "制表科室"
        colCanShu.Add g_strKeShiMC
        colCanShu.Add "日期"
        colCanShu.Add objStandData.getSystemDate()

        '      colCanShu.Add "摆药科室"
        '      colCanShu.Add cboBaiYaoKeShi.Text
        '遍历窗体的所有控件，全部作为报表参数
        For Each ctl In Me.Controls
            '只有cbo、num、txt、dtm处理
            If TypeOf ctl Is cbo _
               Or TypeOf ctl Is txt _
               Or TypeOf ctl Is num Then
                '只有可见可见传递
                If ctl.Visible Then
                    colCanShu.Add ctl.Caption
                    colCanShu.Add ctl.Text
                End If
            Else
                If TypeOf ctl Is dtm Then
                    '只有可见可见传递
                    If ctl.Visible Then
                        colCanShu.Add ctl.Caption
                        colCanShu.Add ctl.GetDate()
                    End If
                End If
            End If
        Next ctl



        '打印预览
        strBaoBiaoM = Trim(txtChaXunMC.Text)
        '单给北京海华医院做的
        If txtChaXunMC.Text = "月经营报表门诊" Then
            strBaoBiaoM = strBaoBiaoM & Me.Controls("cbo").Item(1).Text

        End If


        '传递参数
        If objPrt1.PutVariant(colCanShu) Then
        End If
        If Trim(m_strBaoBiaoSQL) <> "" Then
            Dim tmpFilePath As String
            tmpFilePath = App.Path & "\ReportTemplet\" & strBaoBiaoM & ".frf"

            If FileExists(tmpFilePath) Then
                If getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
                    '进入设计状态
                    If objPrt1.ReportDesign(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                ElseIf getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "1" Then
                    '进入预览状态
                    If objPrt1.ReportPreview(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                End If
            Else
                tmpFilePath = App.Path & "\ReportTemplet\" & strBaoBiaoM & ".fr3"
                If getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
                    '进入设计状态
                    If objPrt1.ReportDesignex(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                ElseIf getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "1" Then
                    '进入预览状态
                    If objPrt1.ReportPreviewEX(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                Else
                    If objPrt1.ReportPrintEX(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                End If
            End If
        End If
    End Select
End Sub


Private Sub cmdPrint_Click()

    Dim strBaoBiaoM As String    '报表名
    Dim colCanShu As New Collection  '传递参数
    Dim ctl As Control

    Select Case m_strDaYinLB

    Case "0"
        '传递报表参数
        If ChuanDiBBCS(Me) Then
        End If

        '打印预览
        objPrt.PrintPreGrid lstChaXunJieGuo, txtChaXunMC.Text, g_intDaYinYLDZT, False
    Case "1"
        Call NewDaYin(3)
    Case "2"
        '传参数
        colCanShu.Add "制表人"
        colCanShu.Add g_strYongHuMC
        colCanShu.Add "制表科室"
        colCanShu.Add g_strKeShiMC
        colCanShu.Add "日期"
        colCanShu.Add objStandData.getSystemDate()

        '      colCanShu.Add "摆药科室"
        '      colCanShu.Add cboBaiYaoKeShi.Text
        '遍历窗体的所有控件，全部作为报表参数
        For Each ctl In Me.Controls
            '只有cbo、num、txt、dtm处理
            If TypeOf ctl Is cbo _
               Or TypeOf ctl Is txt _
               Or TypeOf ctl Is num Then
                '只有可见可见传递
                If ctl.Visible Then
                    colCanShu.Add ctl.Caption
                    colCanShu.Add ctl.Text
                End If
            Else
                If TypeOf ctl Is dtm Then
                    '只有可见可见传递
                    If ctl.Visible Then
                        colCanShu.Add ctl.Caption
                        colCanShu.Add ctl.GetDate()
                    End If
                End If
            End If
        Next ctl


        '打印预览
        strBaoBiaoM = Trim(txtChaXunMC.Text)

        '传递参数
        If objPrt1.PutVariant(colCanShu) Then
        End If

        If Trim(m_strBaoBiaoSQL) <> "" Then
            Dim tmpFilePath As String
            tmpFilePath = App.Path & "\ReportTemplet\" & strBaoBiaoM & ".frf"

            If FileExists(tmpFilePath) Then
                If getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
                    '进入设计状态
                    If objPrt1.ReportDesign(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                ElseIf getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "1" Then
                    '进入预览状态
                    If objPrt1.ReportPreview(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                End If
            Else
                tmpFilePath = App.Path & "\ReportTemplet\" & strBaoBiaoM & ".fr3"
                If getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
                    '进入设计状态
                    If objPrt1.ReportDesignex(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                ElseIf getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "1" Then
                    '进入预览状态
                    If objPrt1.ReportPreviewEX(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                Else
                    If objPrt1.ReportPrintEX(m_strBaoBiaoSQL, tmpFilePath) Then
                    End If
                End If
            End If
        End If
    End Select

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
    If Trim(m_strBaoBiaoSQL) <> "" Then
        '是否设计报表
        If intLeiBie = "1" Or getXiTongCS(g_eXiTongCS.DaYinYLDZT) = "0" Then
            blnReturn = objPrt1.ReportDesignex(m_strBaoBiaoSQL, strPath)
        ElseIf intLeiBie = "2" Then
            blnReturn = objPrt1.ReportPreviewEX(m_strBaoBiaoSQL, strPath)
        Else
            blnReturn = objPrt1.ReportPrintEX(m_strBaoBiaoSQL, strPath)
        End If
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

    '  '初始化列表
    '   Const c_EnableEdit = False      '允许编辑单元格
    '   Const c_EditColString = ""  '可编辑的列：数量
    '   Const c_MergeCellType = g_eMergeCells.flexMergeNever    '合并类型：
    '   Const c_MergeCols = ""      '合并列：
    '   Const c_FocusDirection = g_eFocusDirection.focusDown     '焦点方向：向下
    '   Const c_EnableDrag = True   '允许拖拽
    '   Const c_EnableSort = True  '允许排序
    '   If objFormSetting.InitList(lstChaXunJieGuo, c_EnableEdit, c_EditColString, c_MergeCellType, c_MergeCols, _
        '               c_FocusDirection, c_EnableDrag, c_EnableSort) = False Then
    '      g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitListFailure)
    '      GoTo PROC_EXIT
    '   End If

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
    On Error GoTo PROC_EXIT

    '设置窗体居中(Call objFormSetting.InitFormPosition)
    Const c_formWidth = 13000
    Const c_formHeight = 9000
    '   '重新设置窗体上的控件大小
    '     rsz.ReadXY Me ' ', c_formWidth, c_formHeight
    Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)

    '初始化窗体属性
    If objFormSetting.InitFormProperty(Me) = False Then
        g_intMessage = objFormSetting.MessageBox(gc_GongYongTS, g_eGongYongTS.InitFormProPertyFailure)
        GoTo PROC_EXIT
    End If
    m_blnPanDuan = False

    TextMiMa.BackColor = Me.BackColor
    
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
    lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 1000 - pgb1.Height
    

'    pgb1.Left = Me.Width - pgb1.Width - 200
'
'    pgb1.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + 50
'
'    TextMiMa.Left = Me.Width - pgb1.Width - 200 - TextMiMa.Width
'    TextMiMa.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + 50
'    TextMiMa.Top = lstChaXunJieGuo.Top + lstChaXunJieGuo.Height + TextMiMa.Height
    pic1.Move 0, 0, Me.Width, pic1.Height
    lstChaXunJieGuo.Height = Me.Height - lstChaXunJieGuo.Top - 600
    TextMiMa.Move fraButton.Left - 1100, fraButton.Top, 1050, fraButton.Height
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

' 测试文件是否存在(不能测试隐含文件和系统文件)
Public Function FileExists(FileName As String) As Boolean
    On Error Resume Next
    FileExists = (Dir$(FileName) <> "")
End Function

'Private Sub lstChaXunJieGuo_DblClick()
'On Error Resume Next
' Dim intCaoZuoBZ     As Integer
'    Dim flage           As Boolean
'    If txtChaXunMC.Text = "病案查询" Then
'            intCaoZuoBZ = ProQuanXian_New(lstChaXunJieGuo.cellValue(lstChaXunJieGuo.getSelectedRow, "gsbh"), lstChaXunJieGuo.cellValue(lstChaXunJieGuo.getSelectedRow, "LSH"))
'            If intCaoZuoBZ >= 0 Then
'               '1、查询病人基本信息     2、写病历时自动调用的空白病历编号--写病历必填,设计模式即为模板对应的编号，为0或小于0的数表示新增模板
'               '3、 工作人员姓名或卡号  4、 门诊病历为0，住院病历为1  --必填  5、 0写病历模式 1一级审核 2 二级审核 3 三级审核
'
'               flage = Wirte("select * from zy_LS_GHDJB where LSH='" & lstChaXunJieGuo.cellValue(lstChaXunJieGuo.getSelectedRow, "LSH") & "'", lstChaXunJieGuo.cellValue(lstChaXunJieGuo.getSelectedRow, "gsbh"), g_strYongHuDM, 1, intCaoZuoBZ)
'            Else
'               MsgBox "没有权限查看该患者病历！", vbInformation, "提示！"
'            End If
'    End If
'End Sub


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
        strOLDXiaoJi = Trim(rstDate(CInt(m_strXiaoJiLB)))

        For lngRow = 1 To rstDate.RecordCount
            lngDangQianH = lngDangQianH + 1
            .Rows = .Rows + 1

            '小计赋值
            If Trim(rstDate(CInt(m_strXiaoJiLB))) <> Trim(strOLDXiaoJi) Then

                .TextMatrix(lngDangQianH, 0) = strOLDXiaoJi & "小计："

                For lngSuoYin = m_strXiaoJiBTL To UBound(strXiaoJiSZ)
                    .TextMatrix(lngDangQianH, lngSuoYin) = strXiaoJiSZ(lngSuoYin)
                    strXiaoJiSZ(lngSuoYin) = "0"
                Next

                strOLDXiaoJi = Trim(rstDate(CInt(m_strXiaoJiLB)))
                lngDangQianH = lngDangQianH + 1
                .Rows = .Rows + 1
            End If

            For lngCol = 0 To rstDate.Fields.count - 1
                If lngRow = 1 Then
                    lstChaXunJieGuo.TextMatrix(0, lngCol) = rstDate.Fields.Item(lngCol).Name
                End If

                .TextMatrix(lngDangQianH, lngCol) = IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol))

                '当前列是否大于等于 合计开始列
                If m_strXiaoJiBTL <= lngCol Then
                    '求小计 lz2016-04-21 包含非数字字符的列合计为0
                    strXiaoJiSZ(lngCol) = Val(strXiaoJiSZ(lngCol)) + IIf(IsNumeric(rstDate(lngCol)), Val(Replace(rstDate(lngCol), "%", "")), 0)
                    '求合计
                    strZongJi(lngCol) = Val(strZongJi(lngCol)) + IIf(IsNumeric(rstDate(lngCol)), Val(Replace(rstDate(lngCol), "%", "")), 0)
                    '                 lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol) = Val(lstChaXunJieGuo.TextMatrix(lstChaXunJieGuo.Rows - 1, lngCol)) + Val(IIf(IsNull(rstDate(lngCol)), 0, rstDate(lngCol)))
                End If

            Next
            rstDate.MoveNext
        Next

        '最后 小计赋值 总计赋值
        '        If Trim(rstDate(CInt(m_strXiaoJiLB))) <> Trim(strOLDXiaoJi) Then
        lngDangQianH = lngDangQianH + 1
        .Rows = .Rows + 1
        '小计
        .TextMatrix(lngDangQianH, 0) = strOLDXiaoJi & "小计："

        For lngSuoYin = m_strXiaoJiBTL To UBound(strXiaoJiSZ)
            .TextMatrix(lngDangQianH, lngSuoYin) = strXiaoJiSZ(lngSuoYin)
        Next

        '总计
        lngDangQianH = lngDangQianH + 1
        .Rows = .Rows + 1
        .TextMatrix(lngDangQianH, 0) = "合计："

        For lngSuoYin = m_strXiaoJiBTL To UBound(strZongJi)
            .TextMatrix(lngDangQianH, lngSuoYin) = strZongJi(lngSuoYin)
        Next

        '        End If
    End With
End Sub
