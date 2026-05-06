VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  '窗口缺省
   Begin VB.ComboBox Combo1 
      Height          =   300
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   5
      Text            =   "Combo1"
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton Command3 
      Caption         =   "退 出"
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   1800
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "修改为在职"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "修改为离职"
      Height          =   375
      Left            =   3000
      TabIndex        =   2
      Top             =   600
      Width           =   1455
   End
   Begin VB.ComboBox cboyonghu 
      Height          =   300
      Left            =   1200
      Locked          =   -1  'True
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "系统用户"
      Height          =   180
      Left            =   360
      TabIndex        =   6
      Top             =   1800
      Width           =   960
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "技术员"
      Height          =   180
      Left            =   600
      TabIndex        =   1
      Top             =   1080
      Width           =   540
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
