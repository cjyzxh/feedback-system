Attribute VB_Name = "DCxls"
' 标准模块 PictureLoader.bas
Option Explicit

' API 声明和常量
Private Declare Function CLSIDFromString Lib "ole32" ( _
    ByVal lpsz As Long, _
    pclsid As GUID) As Long

Private Declare Function OleLoadPicture Lib "oleaut32" ( _
    pStream As Any, _
    ByVal lSize As Long, _
    ByVal fRunmode As Long, _
    riid As GUID, _
    ppvObj As IPicture) As Long

Private Type GUID
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(7) As Byte
End Type

Private Const IID_IPicture As String = "{7BF80980-BF32-101A-8BBB-00AA00300CAB}"

' 从字节数组加载图片的函数
Public Function LoadPictureFromBytes(byteData() As Byte) As StdPicture
    On Error GoTo ErrorHandler
    
    Dim IID_IPictureGUID As GUID
    Dim hResult As Long
    Dim oPicture As IPicture
    
    ' 将字符串形式的GUID转换为GUID结构
    hResult = CLSIDFromString(StrPtr(IID_IPicture), IID_IPictureGUID)
    If hResult <> 0 Then
        Err.Raise vbObjectError + 1, "LoadPictureFromBytes", "Failed to convert GUID"
    End If
    
    ' 加载图片
    hResult = OleLoadPicture( _
        ByVal VarPtr(byteData(0)), _
        UBound(byteData) + 1, _
        0, _
        IID_IPictureGUID, _
        oPicture)
    
    If hResult <> 0 Then
        Err.Raise vbObjectError + 2, "LoadPictureFromBytes", "Failed to load picture"
    End If
    
    Set LoadPictureFromBytes = oPicture
    Exit Function
    
ErrorHandler:
    ' 错误处理
    Set LoadPictureFromBytes = Nothing
    MsgBox "Error " & Err.Number & ": " & Err.Description, vbCritical
End Function

' 从ADODB.Stream加载图片的函数
Public Function LoadPictureFromStream(stream As ADODB.stream) As StdPicture
    Dim byteData() As Byte
    byteData = stream.Read
    Set LoadPictureFromStream = LoadPictureFromBytes(byteData)
End Function






























Public Function FillDataArray(asArray(), adoRS As ADODB.Recordset) As Long

'将数据送 Excel 函数

Dim nRow As Integer
Dim nCol As Integer

On Error GoTo FillError
ReDim asArray(100000, adoRS.Fields.Count)

nRow = 0

    For nCol = 0 To adoRS.Fields.Count - 1
        asArray(nRow, nCol) = adoRS.Fields(nCol).Name
    Next nCol
    nRow = 1

Do While Not adoRS.EOF
    For nCol = 0 To adoRS.Fields.Count - 1
        asArray(nRow, nCol) = adoRS.Fields(nCol).Value
    Next nCol
    adoRS.MoveNext
    nRow = nRow + 1
Loop

nRow = nRow + 1

FillDataArray = nRow
Exit Function

FillError:
  MsgBox Error$
  Exit Function
  Resume

End Function



'VB版rc4算法

Public Sub zxhmain()
Dim key As String
Dim i As Integer
For i = 1 To 16
Randomize
key = key & Chr(Rnd * 255)
Next i
MsgBox RC4(RC4("Welcome To Plindge Studio!", key), key)
End Sub

Public Function RC4(inp As String, key As String) As String
Dim s(0 To 255) As Byte, K(0 To 255) As Byte, i As Long
Dim j As Long, temp As Byte, Y As Byte, t As Long, X As Long
Dim Outp As String

For i = 0 To 255
s(i) = i
Next

j = 1
For i = 0 To 255
If j > Len(key) Then j = 1
K(i) = Asc(Mid(key, j, 1))
j = j + 1
Next i

j = 0
For i = 0 To 255
j = (j + s(i) + K(i)) Mod 256
temp = s(i)
s(i) = s(j)
s(j) = temp
Next i

i = 0
j = 0
For X = 1 To Len(inp)
i = (i + 1) Mod 256
j = (j + s(i)) Mod 256
temp = s(i)
s(i) = s(j)
s(j) = temp
t = (s(i) + (s(j) Mod 256)) Mod 256
Y = s(t)

Outp = Outp & Chr(Asc(Mid(inp, X, 1)) Xor Y)
Next
RC4 = Outp
End Function
