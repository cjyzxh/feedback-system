VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   5175
   ClientTop       =   3960
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   Begin VB.CommandButton cmdtuichu 
      Caption         =   "ÍË ³ö"
      Height          =   495
      Left            =   2520
      TabIndex        =   5
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton cmddenglu 
      Caption         =   "µÇ Â¼"
      Height          =   495
      Left            =   480
      TabIndex        =   4
      Top             =   2160
      Width           =   1215
   End
   Begin VB.TextBox txtmima 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   1800
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox txtxingming 
      Height          =   375
      Left            =   1800
      TabIndex        =   2
      Top             =   480
      Width           =   1695
   End
   Begin VB.Label labmima 
      AutoSize        =   -1  'True
      Caption         =   "ÃÜ  Âë"
      Height          =   180
      Left            =   480
      TabIndex        =   1
      Top             =   1080
      Width           =   540
   End
   Begin VB.Label labxingmin 
      AutoSize        =   -1  'True
      Caption         =   "ÐÕ  Ãû"
      Height          =   180
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   540
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Label1_Click()

End Sub

Private Sub cmddenglu_Click()
If txtxingming = "ÕÅÏþ»ª" Then
   If txtmima = "123" Then
    Unload Me
    frmmain.Show
   Else
    txtmima = ""
   End If
Else
txtxingming = ""
txtmima = ""
txtxingming.SetFocus
End If
End Sub

Private Sub cmdtuichu_Click()
Unload Me
End Sub

