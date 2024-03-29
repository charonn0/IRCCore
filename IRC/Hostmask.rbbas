#tag Class
Class Hostmask
	#tag Method, Flags = &h0
		Sub Constructor(RawHostMask As String)
		  Me.Host = NthField(RawHostMask, "@", 2)
		  RawHostMask = Replace(RawHostMask, "@" + Me.Host, "")
		  Me.UserName = NthField(RawHostMask, "!", 2)
		  Me.Nick = NthField(RawHostMask, "!", 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Username As String, Nickname As String, Hostname As String)
		  Me.Host = Hostname
		  Me.Nick = Nickname
		  Me.UserName = Username
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Matches(OtherMask As Hostmask) As Boolean
		  'Returns True if the passed OtherMask can apply to the current Hostmask
		  If OtherMask.Type <> Me.Type Then Return False
		  'Select Case Me.HostTypes
		  'Case HostTypes.Network 'Normal
		  If OtherMask = Me Then Return True
		  
		  Dim u, h, n As Boolean
		  
		  If OtherMask.Nick = Me.Nick Then
		    n = True
		  ElseIf OtherMask.Nick = "*" Then
		    n = True
		  ElseIf Me.Nick = "*" Then
		    n = True
		  End If
		  
		  If OtherMask.Host = Me.Host Then
		    h = True
		  ElseIf OtherMask.Host = "*" Then
		    h = True
		  ElseIf Me.Host = "*" Then
		    h = True
		  End If
		  
		  If OtherMask.UserName = Me.UserName Then
		    u = True
		  ElseIf OtherMask.UserName = "*" Then
		    u = True
		  ElseIf Me.UserName = "*" Then
		    u = True
		  End If
		  
		  Return n And h And u
		  
		  'Case HostTypes.Local 'local endpoint
		  '
		  'Case HostTypes.Internal 'internal comms
		  '
		  'End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MatchExact(OtherMask As Hostmask) As Boolean
		  'Returns exact matches only
		  Dim match As Boolean
		  
		  match = (OtherMask.Nick = Me.Nick)
		  match = (OtherMask.UserName = Me.UserName)
		  match = (OtherMask.Host = Me.Host)
		  
		  Return match
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Dim data As String
		  If Me.UserName <> "" Then
		    data = data + Me.UserName + "!"
		  End If
		  If Me.Nick <> "" Then
		    data = data + Me.Nick
		  End If
		  If Me.Host <> "" Then
		    data = data + "@" + Me.Host
		  End If
		  Return data
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Host As String = "*"
	#tag EndProperty

	#tag Property, Flags = &h0
		Ident As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Nick As String = "*"
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As HostTypes
	#tag EndProperty

	#tag Property, Flags = &h0
		UserName As String = "*"
	#tag EndProperty


	#tag Enum, Name = HostTypes, Type = Integer, Flags = &h0
		Network
		  Local
		Internal
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Host"
			Group="Behavior"
			InitialValue="*"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ident"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Nick"
			Group="Behavior"
			InitialValue="*"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserName"
			Group="Behavior"
			InitialValue="*"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
