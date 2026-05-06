VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.4#0"; "HISControl1.ocx"
Begin VB.Form frmUpSetup 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "上传安装包"
   ClientHeight    =   7635
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11370
   Icon            =   "frmUpSetup.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmUpSetup.frx":000C
   ScaleHeight     =   7635
   ScaleWidth      =   11370
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '所有者中心
   Begin VB.CommandButton Command1 
      Caption         =   "…"
      Height          =   300
      Left            =   6360
      TabIndex        =   0
      Top             =   1560
      Width           =   285
   End
   Begin VB.ComboBox Combo1 
      Height          =   300
      ItemData        =   "frmUpSetup.frx":D797
      Left            =   2400
      List            =   "frmUpSetup.frx":D7A4
      TabIndex        =   2
      Top             =   840
      Width           =   4215
   End
   Begin VB.TextBox Text1 
      Height          =   300
      Left            =   2400
      TabIndex        =   1
      Top             =   1560
      Width           =   3945
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5040
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DialogTitle     =   "请选择要上传的安装包："
      Filter          =   "安装包(*.exe)|*.exe"
   End
   Begin UserControl.cmd cmdCancel 
      Height          =   495
      Left            =   4080
      TabIndex        =   7
      Top             =   2400
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   873
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
   Begin UserControl.cmd cmdOK 
      Height          =   495
      Left            =   2160
      TabIndex        =   8
      Top             =   2400
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   873
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
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
      Height          =   180
      Index           =   2
      Left            =   3000
      TabIndex        =   6
      Top             =   2760
      Width           =   2940
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Index           =   3
      Left            =   3000
      TabIndex        =   5
      Top             =   3030
      Width           =   2940
   End
   Begin VB.Label Label28 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "请选择上传的安装包类型："
      Height          =   180
      Index           =   0
      Left            =   240
      TabIndex        =   4
      Top             =   960
      Width           =   2160
   End
   Begin VB.Label Label28 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "请选择上传的安装包："
      Height          =   180
      Index           =   1
      Left            =   600
      TabIndex        =   3
      Top             =   1680
      Width           =   1800
   End
End
Attribute VB_Name = "frmUpSetup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Dim m_DBConnSys As adodb.Connection
Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    On Error GoTo er01
    Combo1.Text = Trim(Combo1.Text)
    Text1.Text = Trim(Text1.Text)
    If Combo1.Text = "" Or Text1.Text = "" Then
        MsgBox "请先选择上传的安装包和安装包类型！"
        Combo1.SetFocus
        Exit Sub
    End If
    If Dir(Text1.Text) = "" Then
        MsgBox "请先选择有效的安装包！"
        Text1.SetFocus
        Exit Sub
    End If
    If MsgBox("您确定要上传该该安装包？", vbYesNo + vbQuestion + vbDefaultButton2) = vbNo Then Exit Sub
    cmdOK.Enabled = False
    Dim Rsttemp As New adodb.Recordset
    Dim sFilePath As String
    sFilePath = Mid(Text1.Text, 1, InStrRev(Text1.Text, "\"))
    m_DBConnSys.Execute (("if not exists(select LoginType from xt_ShangChuan where LoginType='" & Val(Combo1.Text) & "' and  sFielName='setup.exe') insert into xt_ShangChuan(LoginType,Ver,sFielName,FilePath) values('" & Val(Combo1.Text) & "'," & Val(App.Major & "." & App.Minor & App.Revision) & ",'setup.exe','')"))
    Rsttemp.Open ("select * from xt_ShangChuan where LoginType='" & Val(Combo1.Text) & "' and  sFielName='setup.exe'"), m_DBConnSys, adOpenStatic, adLockOptimistic
    FunFileToDB Text1.Text, Rsttemp, "SetupFile"
    sFilePath = sFilePath + "readme.docx"
    If Dir(sFilePath) <> "" Then
    If Rsttemp.State = 1 Then Rsttemp.Close
     Rsttemp.Open ("select * from xt_ShangChuan where LoginType='" & Val(Combo1.Text) & "'"), m_DBConnSys, adOpenStatic, adLockOptimistic
        FunFileToDB sFilePath, Rsttemp, "cMemoFile"
    End If
er01:
    cmdOK.Enabled = True
End Sub
Private Function FunFileToDB(ByVal strFileName As String, rsWrite As adodb.Recordset, ByVal strField As String) As Boolean
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
    rsWrite.Fields("Ver") = Val(App.Major & "." & App.Minor & App.Revision)
    rsWrite.Fields("sFielName") = "setup.exe"
    rsWrite.Update
    Close #2
    Label28(2).Caption = "上传完成!"
    Label28(3).Caption = ""
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
        .filename = Text1.Text
        .ShowOpen
        Text1.Text = .filename
    End With
er01:

End Sub

Private Sub Form_Load()
  Set m_DBConnSys = objExecuteSQL.GetDBConnection
End Sub
