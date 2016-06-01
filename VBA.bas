'PRUEBA LA BAINA
'Es un comentario
Sub Queloque(x) 

Dim y As Integer

y = x - 5

letra = "F"

If x > 59 And x < 70  Then
letra = "D"
ElseIf x > 69 And x < 80 Then
letra = "C"
ElseIf x > 79 And x < 90 Then
letra = "B"
ElseIf x > 89 And x < 101 Then
letra = "A"
Else
letra = "F"
End If


Select Case x
Case 1  
      y = 1
Case 3 
		y = 3
Case 4 To 5
		y = 4
End Select
y=1

Do
y = y+1
Loop While y<5

End Sub