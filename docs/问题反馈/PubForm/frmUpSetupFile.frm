VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#2.1#0"; "HISControl1.ocx"
Begin VB.Form frmUpSetupFile 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "上传更新文件"
   ClientHeight    =   4695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8115
   Icon            =   "frmUpSetupFile.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4695
   ScaleWidth      =   8115
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   Begin UserControl.pic pic1 
      Height          =   405
      Left            =   60
      TabIndex        =   17
      Top             =   0
      Width           =   7995
      _ExtentX        =   14102
      _ExtentY        =   714
      Caption         =   "上传程序"
   End
   Begin VB.CheckBox Check2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "自动创建"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6720
      TabIndex        =   16
      Top             =   1560
      Width           =   1245
   End
   Begin VB.CommandButton Command1 
      Caption         =   "…"
      Height          =   300
      Left            =   6360
      TabIndex        =   4
      Top             =   1080
      Width           =   285
   End
   Begin VB.ComboBox Combo1 
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
      Index           =   0
      ItemData        =   "frmUpSetupFile.frx":000C
      Left            =   1800
      List            =   "frmUpSetupFile.frx":0022
      TabIndex        =   6
      Top             =   600
      Visible         =   0   'False
      Width           =   1605
   End
   Begin VB.TextBox Text1 
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
      Height          =   300
      Left            =   1800
      MultiLine       =   -1  'True
      TabIndex        =   5
      Top             =   1080
      Width           =   4515
   End
   Begin VB.ComboBox Combo1 
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
      Index           =   1
      ItemData        =   "frmUpSetupFile.frx":0070
      Left            =   1800
      List            =   "frmUpSetupFile.frx":0083
      Sorted          =   -1  'True
      TabIndex        =   3
      Text            =   "\"
      Top             =   1560
      Width           =   4875
   End
   Begin VB.TextBox Text2 
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
      Height          =   1815
      Left            =   1800
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   2280
      Width           =   4875
   End
   Begin VB.TextBox Text3 
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
      Height          =   300
      Left            =   1800
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   1920
      Width           =   4875
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "整个目录"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   10.5
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6720
      TabIndex        =   0
      Top             =   1080
      Width           =   1245
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   7410
      Top             =   4200
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   ".*"
      DialogTitle     =   "请选择要上传的："
      Filter          =   "执行文件(*.exe)|*.exe|DLL(*.dll)|*.dll|OCX文件(*.ocx)|*.ocx|控件文件(*.ocx;*.dll)|*.ocx;*.dll|所有类型(*.*)|*.*|"
   End
   Begin UserControl.cmd cmdCancel 
      Height          =   495
      Left            =   1500
      TabIndex        =   14
      Top             =   4140
      Width           =   1335
      _ExtentX        =   2355
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
      Caption         =   "退出(&Q)"
   End
   Begin UserControl.cmd cmdOK 
      Height          =   495
      Left            =   60
      TabIndex        =   15
      Top             =   4140
      Width           =   1335
      _ExtentX        =   2355
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
      Caption         =   "上传(&F)"
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "请选择要上传的安装包类型："
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
      Index           =   0
      Left            =   -990
      TabIndex        =   13
      Top             =   630
      Visible         =   0   'False
      Width           =   2730
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "请选择上传文件："
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
      Index           =   1
      Left            =   120
      TabIndex        =   12
      Top             =   1080
      Width           =   1680
   End
   Begin VB.Label Label28 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Index           =   2
      Left            =   990
      TabIndex        =   11
      Top             =   3780
      Width           =   90
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Index           =   3
      Left            =   780
      TabIndex        =   10
      Top             =   3780
      Width           =   90
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "请选择目标目录："
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
      Index           =   4
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   1680
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "上传状态："
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
      Index           =   5
      Left            =   810
      TabIndex        =   8
      Top             =   3120
      Width           =   1050
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "上传说明："
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
      Index           =   6
      Left            =   810
      TabIndex        =   7
      Top             =   1920
      Width           =   1050
   End
End
Attribute VB_Name = "frmUpSetupFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim m_DBConnSys As New ADODB.Connection

Dim ObjFileSystem As New FileSystemObject
Dim ObjFile As File
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    On Error GoTo er01
    Combo1(0).Text = 3    ' Trim(Combo1(0).Text)
    Combo1(1).Text = Trim(Combo1(1).Text)
    Text1.Text = Trim(Text1.Text)
    If Combo1(1).Text = "" Or Combo1(0).Text = "" Or Text1.Text = "" Then
        MsgBox "请先选择上传的文件、安装包类型、目录！"
        Combo1(0).SetFocus
        Exit Sub
    End If
    '    If Dir(Text1.Text) = "" Then
    '        MsgBox "请先选择有效的文件！"
    '        Text1.SetFocus
    '        Exit Sub
    '    End If
    If MsgBox("您确定要上传这些文件？", vbYesNo + vbQuestion + vbDefaultButton2) = vbNo Then Exit Sub
    cmdOK.Enabled = False

    Dim sFilePath As String
    sFilePath = Mid(Text1.Text, 1, InStrRev(Text1.Text, "\"))
    Text2.Text = "上传文件列表：" & vbCrLf
    Dim i As Long, sFilees() As String
    If Check1.Value Then
        i = InStrRev(CommonDialog1.filename, "\")
        Text1.Text = Left(CommonDialog1.filename, i)
        sFilePath = Dir(Text1.Text)
        If sFilePath <> "" Then
            Upfile Text1.Text, sFilePath
        End If
        Do While sFilePath <> ""
            sFilePath = Dir
            If sFilePath = "" Then
                GoTo er01
            End If
            Upfile Text1.Text, sFilePath
        Loop
    Else
        sFilees = Split(CommonDialog1.filename, Chr(0))
        i = InStrRev(CommonDialog1.filename, Chr(0))
        If i = 0 Then
            i = InStrRev(CommonDialog1.filename, "\")
            Upfile Left(CommonDialog1.filename, i), Right(CommonDialog1.filename, Len(CommonDialog1.filename) - i)
        End If
        For i = 1 To UBound(sFilees)    ' LBound(sFilees)
            Upfile sFilees(0), sFilees(i)
        Next

    End If
er01:
    cmdOK.Enabled = True
    If ERR.Number <> 0 Then MsgBox "" & ERR.Description
End Sub
Private Function Upfile(sFilePath As String, sFileName As String)
    Dim Rsttemp As New ADODB.Recordset
    m_DBConnSys.Execute (("if not exists(select LoginType from xt_ShangChuan where FilePath='" & (Combo1(1).Text) & "' and sFielName='" & sFileName & "') insert into xt_ShangChuan(LoginType,Ver,FilePath,sFielName,dLastDate) values('" & Val(Combo1(0).Text) & "'," & Val(App.Major & "." & App.Minor & App.Revision) & ",'" & (Combo1(1).Text) & "','" & sFileName & "','2010-1-1')"))
    If Rsttemp.State = 1 Then Rsttemp.Close
    Rsttemp.Open ("select * from xt_ShangChuan where  FilePath='" & (Combo1(1).Text) & "' and sFielName='" & sFileName & "'"), m_DBConnSys, adOpenStatic, adLockOptimistic
    Text2.Text = Text2.Text & sFileName & vbTab
    Set ObjFile = ObjFileSystem.GetFile(sFilePath & "\" & sFileName)     '文件名
    dDateLocal = Format(ObjFile.DateLastModified, "yyyy-mm-dd HH:mm:ss")
    dDateRemote = Format(IIf(IsNull(Rsttemp.Fields("dLastDate")), "1901-1-1", Rsttemp.Fields("dLastDate")), "yyyy-mm-dd HH:mm:ss")
    If DateDiff("s", dDateLocal, dDateRemote) > 0 Then
        Text2.Text = Text2.Text & "服务器上的日期[" & dDateRemote & "]比您要上传的[" & dDateLocal & "]新！" & vbTab
    Else
        Rsttemp.Fields("Ver") = CStr(Val(App.Major & "." & App.Minor & App.Revision))

        Rsttemp!cMemo = Trim(Text3.Text)
        Rsttemp!dLastDate = dDateLocal
        Rsttemp!bAutoCreate = Check2.Value
        FunFileToDB sFilePath & "\" & sFileName, Rsttemp, "SetupFile"
    End If

    Text2.Text = Text2.Text & vbCrLf
End Function
Private Function FunFileToDB(ByVal strFileName As String, rsWrite As ADODB.Recordset, ByVal strField As String) As Boolean
'把用二进制打开的文件strfilename 存放到数据库中的一个字段
    Dim lFilelen As Long        '文件长度
    Dim Offset As Long
    Dim ChunkSize As Long
    Dim TheBytes() As Byte

    If strFileName = "" Or strField = "" Or rsWrite.State = 0 Then
        FunFileToDB = False
        Exit Function
    End If

    On Error GoTo m_eRr
  
    lFilelen = FileLen(strFileName)
    Label28(2).Caption = "/" & lFilelen & ",正在上传最新的安装包,请稍候......"
    ChunkSize = 1000
    If ChunkSize > lFilelen Then ChunkSize = lFilelen
    Offset = ChunkSize
    ReDim TheBytes(0 To ChunkSize - 1)
    Open strFileName For Binary Access Read As #2       'get source file len
    Do While Offset < lFilelen
        Get #2, , TheBytes
        rsWrite(strField).AppendChunk TheBytes
        If Offset + ChunkSize > lFilelen Then ChunkSize = lFilelen - Offset
        Offset = Offset + ChunkSize

        Label28(3).Caption = Offset    '& "/" & lTotalSize & ",正在上传最新的安装包,请稍候......"
    Loop
  
    If ChunkSize <> 0 Then
        ReDim TheBytes(0 To ChunkSize - 1)
        Get #2, , TheBytes
        rsWrite(strField).AppendChunk TheBytes
    End If
    rsWrite.Update
    Close #2
    Label28(2).Caption = "上传完成!"
    Label28(3).Caption = ""
    Text2.Text = Text2.Text & "上传完成!"
    FunFileToDB = True
    Exit Function
m_eRr:

    FunFileToDB = False
    Close #2
End Function



Private Sub Command1_Click()
    On Error GoTo er01
    With CommonDialog1
        If Text1.Text <> "" Then .InitDir = Text1.Text
        .flags = cdlOFNAllowMultiselect Or cdlOFNExplorer
        .filename = Text1.Text
        .ShowOpen
        Text1.Text = .filename
    End With
er01:

End Sub

Private Sub Form_Load()
'牡丹江市肛肠医院

    Const c_formWidth = 8205
    Const c_formHeight = 5175
    Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)


    Set m_DBConnSys = objExecuteSQL.GetDBConnection
    If g_strCenterName = "牡丹江市肛肠医院" Then
        Me.Picture = Nothing
    End If
    
End Sub
