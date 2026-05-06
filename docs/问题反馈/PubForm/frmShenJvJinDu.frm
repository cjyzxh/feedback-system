VERSION 5.00
Object = "{3DE7FF89-CA73-4A2B-943D-52F3317B62CD}#1.0#0"; "HISControl1.ocx"
Begin VB.Form frmShenJvJinDu 
   BackColor       =   &H00E0E0E0&
   Caption         =   "数据库自动升级"
   ClientHeight    =   1350
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3810
   LinkTopic       =   "Form1"
   ScaleHeight     =   1350
   ScaleWidth      =   3810
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   3225
      Top             =   150
   End
   Begin UserControl.pgb pgbShenJi 
      Height          =   435
      Left            =   375
      TabIndex        =   0
      Top             =   600
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   767
   End
   Begin VB.Label lblBiaoTi 
      BackStyle       =   0  'Transparent
      Caption         =   "数据库正在升级，请稍候..."
      ForeColor       =   &H00FF0000&
      Height          =   315
      Left            =   450
      TabIndex        =   1
      Top             =   225
      Width           =   2340
   End
End
Attribute VB_Name = "frmShenJvJinDu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
pgbShenJi.ProcStart
End Sub

Private Sub Form_Unload(Cancel As Integer)
pgbShenJi.ProcEnd
End Sub

Private Sub Timer1_Timer()
If lblBiaoTi.ForeColor = vbBlack Then
   lblBiaoTi.ForeColor = vbBlue
Else
   lblBiaoTi.ForeColor = vbBlack
End If

End Sub
