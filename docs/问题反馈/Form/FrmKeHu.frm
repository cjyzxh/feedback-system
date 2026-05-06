VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form FrmKeHu 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "选择客户"
   ClientHeight    =   2355
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3810
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2355
   ScaleWidth      =   3810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.Frame FraKh 
      BorderStyle     =   0  'None
      Caption         =   "选择客户"
      ForeColor       =   &H000000FF&
      Height          =   2295
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3735
      Begin MSFlexGridLib.MSFlexGrid FxGridKeHu 
         Height          =   1935
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   3413
         _Version        =   393216
         Rows            =   1
         Cols            =   4
         AllowUserResizing=   1
         FormatString    =   "^   客户ID   |^ 医院负责人 |^ 销售人员 |^序号"
      End
   End
End
Attribute VB_Name = "FrmKeHu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Public strID As String          '客户ID
'Public strYyfzr As String       '医院负责人
'Public strXsry As String        '销售人员
Public strType As String        '客户类型：New=新客户 Old=升级客户


Private Sub Form_Load()
    With Me
        .Left = (Screen.Width - .Width) / 2
        .Top = (Screen.Height - .Height) / 2
    End With
    
    On Error Resume Next
    
    With FxGridKeHu
        .Rows = 1
        .ColWidth(3) = 0
        
        If strType = "Old" Then
            Do While Not rs.EOF
                .Rows = .Rows + 1
                .TextMatrix(.Rows - 1, 0) = rs("ID").Value
                .TextMatrix(.Rows - 1, 1) = StringEnDeCodecn(rs("yiyuanfuzher").Value, 75)
                .TextMatrix(.Rows - 1, 2) = StringEnDeCodecn(rs("xiaoshoury").Value, 75)
                rs.MoveNext
            Loop
        ElseIf strType = "New" Then
            Do While Not rs.EOF
                .Rows = .Rows + 1
                .TextMatrix(.Rows - 1, 0) = rs("Khbm").Value
                .TextMatrix(.Rows - 1, 1) = Decode(rs("Fzr").Value)
                .TextMatrix(.Rows - 1, 2) = rs("Xsry").Value
                rs.MoveNext
            Loop
        End If
        rs.MoveFirst
    End With
End Sub

Private Sub FxGridKeHu_Click()
    On Error Resume Next
    
    With FxGridKeHu
        If .Rows > 1 Then
            If .row > 0 Then
                rs.AbsolutePosition = .row
                
                If strType = "Old" Then
                    With frmdiandan
                        .txtfuzheren.Text = StringEnDeCodecn(rs("yiyuanfuzher").Value, 75)
                        .txtdianhua.Text = decipher(rs("gudingdh").Value)
                        .txtshoujihao.Text = decipher(rs("shoujihao").Value)
                        .cbobanben.Text = rs("banben").Value
                        .Text6.Text = StringEnDeCodecn(rs("dizhi").Value, 75)
                        
                        .txtxiaoshouren.Text = StringEnDeCodecn(rs("xiaoshoury").Value, 75)
                        .txtMoKuai.Text = rs("yiyuanmokuai").Value
                        .txtBj.Text = StringEnDeCodecn(rs("ruanjianzj").Value, 75)
                        .txtRjyk.Text = StringEnDeCodecn(rs("ruanjianyk").Value, 75)
                        .txtFkfs.Text = StringEnDeCodecn(rs("fukuanfs").Value, 75)
                        .Text4.Text = StringEnDeCodecn(rs("qtsm").Value, 75)
                    End With
                ElseIf strType = "New" Then
                    With frmdiandan
                        .txtfuzheren.Text = Decode(rs("fzr").Value)
                        .txtdianhua.Text = Decode(rs("gddh").Value)
                        .txtshoujihao.Text = Decode(rs("sj").Value)
                        .cbobanben.Text = rs("banben").Value
                        .Text6.Text = Decode(rs("khdz").Value)
                        .txtBj.Text = Decode(rs("bj").Value)
                        .txtxiaoshouren.Text = rs("xsry").Value
                        .txtMoKuai.Text = rs("sxmk").Value
                    End With
                End If
            End If
        End If
    End With
End Sub

Private Sub FxGridKeHu_DblClick()
    Unload Me
End Sub
