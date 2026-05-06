VERSION 5.00
Begin VB.Form frmAbout 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   4680
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7080
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4680
   ScaleWidth      =   7080
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox picIcon 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   4680
      Left            =   0
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   3265.85
      ScaleMode       =   0  'User
      ScaleWidth      =   4951.45
      TabIndex        =   0
      Top             =   0
      Width           =   7080
      Begin VB.Label Label5 
         BackColor       =   &H00FFFFFF&
         Height          =   375
         Left            =   6360
         TabIndex        =   9
         Top             =   4260
         Width           =   675
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "QQ支持:139139050、189633633"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   4020
         TabIndex        =   8
         Top             =   4080
         Width           =   2430
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "咨询网址:www.cjysoft.com"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   330
         TabIndex        =   7
         Top             =   4170
         Width           =   2160
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "技术支持:54425250@qq.com"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   3840
         TabIndex        =   6
         Top             =   3840
         Width           =   2160
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "售后电话:(010)60777177"
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   330
         TabIndex        =   5
         Top             =   3900
         Width           =   1980
      End
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "软件名称"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   5400
         TabIndex        =   4
         Top             =   2640
         Width           =   900
      End
      Begin VB.Label lblVersion 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "&Version"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   10.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   150
         TabIndex        =   3
         Top             =   3450
         Width           =   810
      End
      Begin VB.Label UserLab 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "测试用户"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   210
         Left            =   1230
         TabIndex        =   2
         Top             =   3120
         Width           =   900
      End
      Begin VB.Label Serial 
         AutoSize        =   -1  'True
         BackColor       =   &H00FFC0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "授权用户:"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.5
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   210
         Left            =   120
         TabIndex        =   1
         Top             =   3120
         Width           =   1020
      End
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Click()
Unload Me
End Sub

Private Sub Form_Load()
   '设置窗体居中(call initFormPosition)111111 牡丹江市肛肠医院
   Const c_formWidth = 7080
   Const c_formHeight = 4680
   Call objFormSetting.InitFormPosition(Me, True, , c_formWidth, c_formHeight)
   If g_strCenterName = "牡丹江市肛肠医院" Then
        picIcon.Picture = Nothing
        Label1.Caption = ""
        Label2.Caption = ""
        Label3.Caption = ""
        Label4.Caption = ""
        
   End If
   

    Me.Caption = "关于 " & App.Title
    lblVersion.Caption = "数据库版本：" & cBanBenH & "." & cXiuZhengH _
         & "  程序版本号：" & App.Major & "." & App.Minor & "." & App.Revision

    lblTitle.Caption = App.Title
    UserLab.Caption = g_strCenterName
    
End Sub

Private Sub picIcon_Click()
Unload Me
End Sub
