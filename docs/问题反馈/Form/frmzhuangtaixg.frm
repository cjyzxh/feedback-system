VERSION 5.00
Begin VB.Form frmzhuangtaixg 
   Caption         =   "Form2"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   Begin VB.CommandButton cmdqingkong 
      Caption         =   "清 空"
      Height          =   375
      Left            =   960
      TabIndex        =   7
      Top             =   2400
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   300
      Left            =   1080
      TabIndex        =   5
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton Command3 
      Caption         =   "退 出"
      Height          =   375
      Left            =   2880
      TabIndex        =   4
      Top             =   1800
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "修改为在职"
      Height          =   375
      Left            =   2880
      TabIndex        =   3
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "修改为离职"
      Height          =   375
      Left            =   2880
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
   Begin VB.ComboBox cboyonghu 
      Height          =   300
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "系统用户"
      Height          =   180
      Left            =   240
      TabIndex        =   6
      Top             =   1800
      Width           =   960
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "技术员"
      Height          =   180
      Left            =   480
      TabIndex        =   1
      Top             =   1080
      Width           =   540
   End
End
Attribute VB_Name = "frmzhuangtaixg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdqingkong_Click()
cboyonghu.Text = ""
Combo1.Text = ""
End Sub

Private Sub Command1_Click()



If cboyonghu.Text <> "" Then

    str = "update zd_jishuyuan set zhuangtai='0' where xingming='" & Trim(cboyonghu.Text) & "'"
    conn.Execute (str)
   
End If

If Combo1.Text <> "" Then

    str = ""
    str = "update [user] set zhuangtai='0' where usename='" & Trim(Combo1.Text) & "'"
    conn.Execute (str)
    str = "update yw_wentilb set szcsgcs='其它人员',csgcs='其它人员',shcsgcs='其它人员' where szcsgcs='" & Trim(Combo1.Text) & "'"
    conn.Execute (str)
End If

If Combo1.Text <> "" Or cboyonghu.Text <> "" Then
    MsgBox "状态修改成功！", vbOKOnly + vbInformation, "提示"
End If


End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim i As Integer
'加载技术员
Set rs = Nothing
    str1 = "select xingming from zd_jishuyuan"
    rs.CursorLocation = adUseClient
    rs.Open str1, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
      cboyonghu.AddItem rs.Fields("xingming").Value
      rs.MoveNext
  Next i
  rs.Close
End If

'加载系统用户
Set rs = Nothing
    str1 = "select usename from [user]"
    rs.CursorLocation = adUseClient
    rs.Open str1, conn
If Not rs.EOF Then
  For i = 1 To rs.RecordCount
      Combo1.AddItem rs.Fields("usename").Value
      rs.MoveNext
  Next i
  rs.Close
End If

End Sub

