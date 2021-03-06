Public Class DataAnnotations

	''' <summary>
	''' Adds Knockout Binding to Editor for property if autogenerated.
	''' </summary>
	Public Class AutoBindings
		Inherits Attribute

		Public Property Bindings As List(Of AutoBinding)

		Public Sub New(Binding As KnockoutBindingString, JSString As String)
			Bindings = New List(Of AutoBinding)
			Bindings.Add(New AutoBinding(Binding, JSString))
		End Sub

		Public Sub New(Bindings As List(Of AutoBinding))
			Me.Bindings = Bindings
		End Sub

		Public Class AutoBinding

			Public Property Binding As KnockoutBindingString
			Public Property JSString As String

			Public Sub New(Binding As KnockoutBindingString, JSString As String)
				Me.Binding = Binding
				Me.JSString = JSString
			End Sub

		End Class

	End Class

End Class
