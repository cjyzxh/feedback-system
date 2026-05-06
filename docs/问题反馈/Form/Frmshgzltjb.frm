VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{5C4A4476-B718-43FD-930F-C23DB31AEA42}#1.2#0"; "HISControl1.ocx"
Begin VB.Form Frmshgzltjb 
   Caption         =   "售后工作量统计表"
   ClientHeight    =   6420
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13530
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   6420
   ScaleWidth      =   13530
   Begin UserControl.cmd cmd1 
      Height          =   375
      Index           =   0
      Left            =   9810
      TabIndex        =   7
      Top             =   285
      Width           =   1125
      _ExtentX        =   1984
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "查询"
   End
   Begin UserControl.lst lst1 
      Height          =   5565
      Left            =   90
      TabIndex        =   6
      Top             =   780
      Width           =   13395
      _ExtentX        =   23627
      _ExtentY        =   9816
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
      Cols            =   5
      BackColorFrozen =   16763080
      BackColorSel    =   49152
      RowHeightMin    =   300
      ColumnCaptions  =   "人员;一般;急;紧急;超出"
      ColWidths       =   "2000;2000;2000;2000;2000"
      ColumnName      =   "人员;一般;急;紧急;超出"
   End
   Begin UserControl.cbo cbo1 
      Height          =   300
      Left            =   90
      TabIndex        =   5
      Top             =   315
      Visible         =   0   'False
      Width           =   2745
      _ExtentX        =   4842
      _ExtentY        =   529
      Caption         =   "售后人员"
      BackColor       =   -2147483633
      ForeColor       =   16711680
      Caption         =   "售后人员"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCaptions  =   "编号;姓名;"
      ColWidths       =   ""
      ListText        =   ""
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   345
      Index           =   0
      Left            =   4230
      TabIndex        =   3
      Top             =   300
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   609
      _Version        =   393216
      Format          =   42729473
      CurrentDate     =   41288
   End
   Begin MSComCtl2.DTPicker DTPicker1 
      Height          =   345
      Index           =   1
      Left            =   7470
      TabIndex        =   4
      Top             =   300
      Width           =   1815
      _ExtentX        =   3201
      _ExtentY        =   609
      _Version        =   393216
      Format          =   42729473
      CurrentDate     =   41288
   End
   Begin UserControl.cmd cmd1 
      Height          =   375
      Index           =   1
      Left            =   11160
      TabIndex        =   8
      Top             =   285
      Width           =   1125
      _ExtentX        =   1984
      _ExtentY        =   661
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "打印"
   End
   Begin VB.Label Label1 
      Caption         =   "结束日期"
      Height          =   225
      Index           =   2
      Left            =   6540
      TabIndex        =   2
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "开始日期"
      Height          =   225
      Index           =   1
      Left            =   3270
      TabIndex        =   1
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label Label1 
      Height          =   225
      Index           =   0
      Left            =   180
      TabIndex        =   0
      Top             =   360
      Width           =   1095
   End
End
Attribute VB_Name = "Frmshgzltjb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmd1_Click(Index As Integer)
    Dim sWhere As String
    Select Case Index
    Case 0
        '        sWhere = ""
        '        If cbo1.Text <> "" Then
        '            sWhere = " and 售后人员='" & cbo1.Text & "'"
        '        End If
        '        If DTPicker1(0).CheckBox Then
        '            sWhere = " and 导入时间>='" & DTPicker1(0).Value & "'"
        '        End If
        '        If DTPicker1(1).CheckBox Then
        '            sWhere = " and 导入时间<='" & DTPicker1(1).Value & "'"
        '        End If
        objFormSetting.FillList Me.lst1, "select * from FN_yw_kehuxinxi1 ('" & DTPicker1(0).Value & "','" & DTPicker1(1).Value & "') "
    Case 2
    End Select
End Sub

Private Sub Form_Load()
    objFormSetting.LoadcboData cbo1, 0, "select  daima,usename  from   [user] with(nolocK)  where zhuangtai='1' "
    DTPicker1(0).Value = Now
    DTPicker1(1).Value = Now

End Sub

Private Sub Form_Resize()
'重新设置窗体上的控件大小
    With lst1
        .Width = Me.ScaleWidth - .Left
        .Height = Me.ScaleHeight - .Top
    End With
End Sub

Public Sub ShowWindows(iIndex As Integer)
'
    Select Case iIndex
    Case 1
        lst1.ColumnCaptions = "内容;接收时间;导入时间;接导时间;售后处理时间;导售数;转研发时间;研发解决时间;研解数;售后测试时间;售研数"

    Case 2
    End Select
End Sub
