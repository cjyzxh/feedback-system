VERSION 5.00
Begin VB.Form frmMEGConfig 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "系统设置"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5400
   Icon            =   "frmMEGConfig.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   5400
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame3 
      Caption         =   "Frame3"
      Height          =   3735
      Left            =   2640
      TabIndex        =   19
      Top             =   120
      Width           =   15
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "取消(&C)"
      Height          =   375
      Left            =   4200
      TabIndex        =   18
      Top             =   3360
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "确定(&K)"
      Height          =   375
      Left            =   2880
      TabIndex        =   17
      Top             =   3360
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Caption         =   "数据记录参数"
      Height          =   2895
      Left            =   2880
      TabIndex        =   1
      Top             =   240
      Width           =   2295
      Begin VB.ComboBox cboPos 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   2250
         Width           =   975
      End
      Begin VB.CheckBox chkDensity 
         Caption         =   "二轨高密"
         Height          =   180
         Left            =   240
         TabIndex        =   12
         Top             =   1680
         Width           =   1095
      End
      Begin VB.OptionButton optFormat 
         Caption         =   "IBM格式"
         Height          =   180
         Index           =   1
         Left            =   240
         TabIndex        =   7
         Top             =   1050
         Width           =   1095
      End
      Begin VB.OptionButton optFormat 
         Caption         =   "ISO格式"
         Height          =   180
         Index           =   0
         Left            =   240
         TabIndex        =   6
         Top             =   420
         Width           =   1095
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "起始位置"
         Height          =   180
         Left            =   240
         TabIndex        =   13
         Top             =   2310
         Width           =   720
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "通信参数"
      Height          =   3495
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2295
      Begin VB.ComboBox cboVerify 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   16
         Top             =   2880
         Width           =   975
      End
      Begin VB.ComboBox cboStop 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   2250
         Width           =   975
      End
      Begin VB.ComboBox cboData 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   1620
         Width           =   975
      End
      Begin VB.ComboBox cboBaud 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   990
         Width           =   975
      End
      Begin VB.ComboBox cboCom 
         Height          =   300
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   360
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   "奇偶校验"
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   2940
         Width           =   735
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "停 止 位"
         Height          =   180
         Left            =   240
         TabIndex        =   5
         Top             =   2310
         Width           =   720
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "数 据 位"
         Height          =   180
         Left            =   240
         TabIndex        =   4
         Top             =   1680
         Width           =   720
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "波 特 率"
         Height          =   180
         Left            =   240
         TabIndex        =   3
         Top             =   1050
         Width           =   720
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "通信串口"
         Height          =   180
         Left            =   240
         TabIndex        =   2
         Top             =   420
         Width           =   720
      End
   End
End
Attribute VB_Name = "frmMEGConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public g_intCom As Integer
Public g_strBaudRate As String
Public g_strData As String
Public g_strStop As String
Public g_strVerify As String

Public g_strFormat As String
Public g_bDensity As Boolean
Public g_strPos As String

Private Sub cmdCancel_Click()
    
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Dim vSendFormat As Variant
    Dim vSendDensity As Variant
    Dim vSendPos As Variant
    
    g_intMEGCOM = CInt(cboCom.Text)
    g_strBaudRate = cboBaud.Text
    g_strData = cboData.Text
    g_strStop = cboStop.Text
    
    Select Case cboVerify.Text
        Case "奇"
            g_strVerify = "E"
        Case "偶"
            g_strVerify = "O"
        Case "无"
            g_strVerify = "N"
    End Select
    
    If optFormat(0).Value = True Then
        g_strFormat = "ISO"
        vSendFormat = Chr(&H1B) & "0" & Chr(&H1B) & "T1"
    ElseIf optFormat(1).Value = True Then
        g_strFormat = "IBM"
        vSendFormat = Chr(&H1B) & "0" & Chr(&H1B) & "T2"
    End If
    
    If chkDensity.Value = Checked Then
        g_bDensity = True
        vSendDensity = Chr(&H1B) & "0" & Chr(&H1B) & "H"
    Else
        g_bDensity = False
        vSendDensity = Chr(&H1B) & "0" & Chr(&H1B) & "L"
    End If
    
    g_strPos = cboPos.Text
    Select Case g_strPos
        Case "16"
            vSendPos = Chr(&H1B) & "0" & Chr(&H1B) & "6"
        Case "20"
            vSendPos = Chr(&H1B) & "0" & Chr(&H1B) & "7"
        Case "22"
            vSendPos = Chr(&H1B) & "0" & Chr(&H1B) & "8"
        Case "25"
            vSendPos = Chr(&H1B) & "0" & Chr(&H1B) & "9"
    End Select
    
   '创建注册表项,并设置键值
   CreateNewKey HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS"
   SetKeyValue HKEY_LOCAL_MACHINE, "Software\北京创佳益软件公司\New_HIS", "MEGCOM", cboCom.Text, REG_SZ
   g_intMEGCOM = Val(cboCom.Text)
   MsgBox "系数设置成功!", vbInformation, "系统提示"
   
   Unload Me
End Sub

Private Sub Form_Load()

    g_intCom = 1
    g_strBaudRate = "9600"
    g_strData = "8"
    g_strStop = "1"
    g_strVerify = "N"
    
    g_strFormat = "ISO"
    g_bDensity = False
    g_strPos = "16"
    
    Dim i As Integer
    
    With cboCom
        For i = 1 To 16
            .AddItem CStr(i)
        Next i
        
        .Text = CStr(IIf(g_intMEGCOM = 0, 1, g_intMEGCOM))
    End With

    With cboBaud
        .AddItem "1200"
        .AddItem "2400"
        .AddItem "4800"
        .AddItem "9600"
        
        .Text = g_strBaudRate
    End With
    
    With cboData
        For i = 4 To 8
            .AddItem CStr(i)
        Next i
                
        .Text = g_strData
    End With
    
    With cboStop
        .AddItem "1"
        .AddItem "1.5"
        .AddItem "2"
        
        .Text = g_strStop
    End With
    
    With cboVerify
        .AddItem "奇"
        .AddItem "偶"
        .AddItem "无"

        Select Case g_strVerify
            Case "E"
                .Text = "奇"
            Case "O"
                .Text = "偶"
            Case "N"
                .Text = "无"
        End Select
    End With
    
    With cboPos
        .AddItem "16"
        .AddItem "20"
        .AddItem "22"
        .AddItem "25"
        
       .Text = g_strPos
    End With
    
    If g_strFormat = "ISO" Then
        optFormat(0).Value = True
    Else
        optFormat(1).Value = True
    End If

    If g_bDensity Then
        chkDensity.Value = Checked
    Else
        chkDensity.Value = Unchecked
    End If
End Sub

