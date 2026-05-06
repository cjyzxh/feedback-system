VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form frmchakantp 
   BackColor       =   &H00E0E0E0&
   Caption         =   "图片查看"
   ClientHeight    =   10230
   ClientLeft      =   60
   ClientTop       =   855
   ClientWidth     =   15210
   Icon            =   "frmchakantp.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   10230
   ScaleWidth      =   15210
   WindowState     =   2  'Maximized
   Begin VB.ComboBox cbotpnum 
      Height          =   300
      ItemData        =   "frmchakantp.frx":7F6A
      Left            =   6300
      List            =   "frmchakantp.frx":7F80
      TabIndex        =   18
      Top             =   0
      Width           =   795
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   5
      Left            =   4680
      TabIndex        =   16
      Top             =   7560
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   4
      Left            =   3840
      TabIndex        =   15
      Top             =   7560
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   3
      Left            =   3000
      TabIndex        =   14
      Top             =   7560
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   2
      Left            =   2160
      TabIndex        =   13
      Top             =   7560
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   1
      Left            =   1320
      TabIndex        =   12
      Top             =   7560
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox txttpnum 
      Height          =   375
      Index           =   0
      Left            =   360
      TabIndex        =   11
      Top             =   7560
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmddelete 
      BackColor       =   &H008080FF&
      Caption         =   "删除图片"
      Height          =   375
      Left            =   13080
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   0
      Width           =   975
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 6"
      Height          =   375
      Index           =   5
      Left            =   12105
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   0
      Width           =   915
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 5"
      Height          =   375
      Index           =   4
      Left            =   11115
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   0
      Width           =   915
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 4"
      Height          =   375
      Index           =   3
      Left            =   10140
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   0
      Width           =   915
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 3"
      Height          =   375
      Index           =   2
      Left            =   9165
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   0
      Width           =   915
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 2"
      Height          =   375
      Index           =   1
      Left            =   8175
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   0
      Width           =   915
   End
   Begin VB.TextBox txtlsh 
      Height          =   270
      Left            =   1440
      TabIndex        =   2
      Text            =   "41"
      Top             =   1200
      Visible         =   0   'False
      Width           =   735
   End
   Begin MSComDlg.CommonDialog cdl1 
      Left            =   5760
      Top             =   4140
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdxyz 
      BackColor       =   &H00C0E0FF&
      Caption         =   "图 1"
      Height          =   375
      Index           =   0
      Left            =   7200
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   0
      Width           =   915
   End
   Begin VB.CommandButton cmdtuichu 
      BackColor       =   &H00FFC0C0&
      Caption         =   "退 出"
      Height          =   375
      Left            =   14160
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   0
      Width           =   915
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "图片号"
      Height          =   180
      Left            =   5700
      TabIndex        =   17
      Top             =   120
      Width           =   540
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "注：一共可显示六张图片，有几个按钮可用代表此问题共有几张图片"
      ForeColor       =   &H000000FF&
      Height          =   180
      Left            =   240
      TabIndex        =   9
      Top             =   240
      Width           =   5400
   End
   Begin VB.Label Label1 
      Caption         =   "图片流水号"
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   1200
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Image IMGwentitp 
      Height          =   8775
      Index           =   5
      Left            =   120
      Top             =   480
      Visible         =   0   'False
      Width           =   14475
   End
   Begin VB.Image IMGwentitp 
      Height          =   8790
      Index           =   4
      Left            =   120
      Top             =   480
      Width           =   14475
   End
   Begin VB.Image IMGwentitp 
      Height          =   8775
      Index           =   3
      Left            =   105
      Top             =   480
      Width           =   14475
   End
   Begin VB.Image IMGwentitp 
      Height          =   8775
      Index           =   2
      Left            =   105
      Top             =   480
      Width           =   14475
   End
   Begin VB.Image IMGwentitp 
      Height          =   8775
      Index           =   1
      Left            =   105
      Top             =   480
      Width           =   14475
   End
   Begin VB.Image IMGwentitp 
      Height          =   8775
      Index           =   0
      Left            =   105
      Top             =   480
      Width           =   14475
   End
End
Attribute VB_Name = "frmchakantp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim num As Integer
Dim i As Integer




Private Sub cmddelete_Click()
If cbotpnum.Text <> "" Then
    If MsgBox("确定要删除 [" & Trim(cbotpnum.Text) & "] 吗？它将不可恢复！", vbYesNo + vbQuestion, "提示") = vbYes Then
        str = "'"
        str = "delete from yw_wentitp where lsh='" & Trim(txtlsh.Text) & "'"
        
    '根据选择删除图片
        Select Case cbotpnum.Text
          Case "图1"
            str = str & "and tpnum='" & Trim(txttpnum(0).Text) & "'"
          Case "图2"
            str = str & "and tpnum='" & Trim(txttpnum(1).Text) & "'"
          Case "图3"
            str = str & "and tpnum='" & Trim(txttpnum(2).Text) & "'"
          Case "图4"
            str = str & "and tpnum='" & Trim(txttpnum(3).Text) & "'"
          Case "图5"
            str = str & "and tpnum='" & Trim(txttpnum(4).Text) & "'"
          Case "图6"
            str = str & "and tpnum='" & Trim(txttpnum(5).Text) & "'"
        End Select
        
            Rs.Open str, conn
        MsgBox "图片删除成功！", vbOKOnly + vbInformation, "提示"
        Set Rs = Nothing
    Else
        Exit Sub
    End If
Else
    MsgBox "请先在图片号中选择要删除的图片！", vbOKOnly + vbInformation, "提示"
End If
cbotpnum.Text = ""
Call Form_Load
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

Private Sub cmdxyz_Click(Index As Integer)

cmddelete.Enabled = True
Select Case Index
    Case 2
        IMGwentitp(0).Visible = False
        IMGwentitp(1).Visible = False
        IMGwentitp(2).Visible = True
        IMGwentitp(3).Visible = False
        IMGwentitp(4).Visible = False
        IMGwentitp(5).Visible = False
        num = 3
        cbotpnum.Text = "图3"
    Case 3
        IMGwentitp(0).Visible = False
        IMGwentitp(1).Visible = False
        IMGwentitp(2).Visible = False
        IMGwentitp(3).Visible = True
        IMGwentitp(4).Visible = False
        IMGwentitp(5).Visible = False
        num = 4
        cbotpnum.Text = "图4"
    Case 1
        IMGwentitp(0).Visible = False
        IMGwentitp(1).Visible = True
        IMGwentitp(2).Visible = False
        IMGwentitp(3).Visible = False
        IMGwentitp(4).Visible = False
        IMGwentitp(5).Visible = False
        num = 2
        cbotpnum.Text = "图2"
    Case 5
        IMGwentitp(0).Visible = False
        IMGwentitp(1).Visible = False
        IMGwentitp(2).Visible = False
        IMGwentitp(3).Visible = False
        IMGwentitp(4).Visible = False
        IMGwentitp(5).Visible = True
        num = 6
        cbotpnum.Text = "图6"
    Case 0
        IMGwentitp(0).Visible = True
        IMGwentitp(1).Visible = False
        IMGwentitp(2).Visible = False
        IMGwentitp(3).Visible = False
        IMGwentitp(4).Visible = False
        IMGwentitp(5).Visible = False
        num = 1
        cbotpnum.Text = "图1"
    Case 4
        IMGwentitp(0).Visible = False
        IMGwentitp(1).Visible = False
        IMGwentitp(2).Visible = False
        IMGwentitp(3).Visible = False
        IMGwentitp(4).Visible = True
        IMGwentitp(5).Visible = False
        num = 5
        cbotpnum.Text = "图5"
End Select
End Sub

Private Sub Form_Load()
'查看图片
  Dim prs1 As New ADODB.stream
  Dim str As String
  Dim i As Integer
  Set Rs = Nothing

txtlsh.Text = tplsh             '加载流水号


'有权限的操作员才能删除图片
str = ""
str = "select quxian from [user] where usename='" & user & "'"
Rs.Open str, conn
If Not Rs.EOF Then
    Rs.MoveFirst
'  If Rs.Fields("quxian").Value = "工程师" Then
'    cbotpnum.Visible = False
'    Label3.Visible = False
'    cmddelete.Visible = False
'  End If
    Set Rs = Nothing
End If
Set Rs = Nothing

'让所有查看图片按钮不可用，为后面做准备
cmdxyz(0).Enabled = False
cmdxyz(1).Enabled = False
cmdxyz(2).Enabled = False
cmdxyz(3).Enabled = False
cmdxyz(4).Enabled = False
cmdxyz(5).Enabled = False

'让图片框的第一个可见，其他为不可见
IMGwentitp(0).Visible = True
IMGwentitp(1).Visible = False
IMGwentitp(2).Visible = False
IMGwentitp(3).Visible = False
IMGwentitp(4).Visible = False
IMGwentitp(5).Visible = False

'加载图片号到网格
str = "select tpnum from yw_wentitp where lsh='" & Trim(txtlsh.Text) & "'"
Rs.CursorLocation = adUseClient
Rs.Open str, conn, adOpenStatic, adLockReadOnly  ' 只读模式更快
If Not Rs.EOF Then
   
    For i = 1 To Rs.RecordCount
        txttpnum(i - 1).Text = Rs.Fields("tpnum").Value
        Rs.MoveNext
    Next i
    
End If
  Set Rs = Nothing
  
str = "select pic1 from yw_wentitp where lsh='" & Trim(txtlsh.Text) & "'"
    Rs.Open str, conn, adOpenStatic, adLockReadOnly  ' 只读模式更快

    prs1.Mode = adModeReadWrite
    prs1.Open
'循环写入图片到IMG数组
For i = 0 To 5
   If Not Rs.EOF Then
    With prs1
       .Type = adTypeBinary                   '定义流对象变量的类型为二进制
       .Write Rs.Fields("pic1")
       .SaveToFile App.Path & ".jpg"           '将图片保存到程序文件夹下
    End With
      IMGwentitp(i).Picture = LoadPicture(App.Path & ".jpg")
      Kill App.Path & ".jpg"                   '删除临时图片
      cmdxyz(i).Enabled = True

      Rs.MoveNext
     Else
        IMGwentitp(i).Picture = LoadPicture()
        Set Rs = Nothing
        Exit Sub
    End If
Next i
    Set Rs = Nothing
'
'' 只查询必要字段，启用异步
'str = "SELECT pic1 FROM yw_wentitp WHERE lsh='" & Trim(txtlsh.Text) & "'"
'rs.Open str, conn, adOpenStatic, adLockReadOnly  ' 只读模式更快
'
'For i = 0 To 5
'    If Not rs.EOF Then
'        ' 使用内存流直接加载
'        Dim memStream As New ADODB.stream
'        memStream.Type = adTypeBinary
'        memStream.Open
'        memStream.Write rs.Fields("pic1").Value
'        memStream.Position = 0
'
'        IMGwentitp(i).Picture = LoadPictureFromStream(memStream)
'        memStream.Close
'
'        cmdxyz(i).Enabled = True
'        rs.MoveNext
'    End If
'Next
End Sub


