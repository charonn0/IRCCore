#tag Class
Class IRCMessage
	#tag Method, Flags = &h0
		Sub Constructor(Raw As String ="")
		  Dim space As String = Chr(&h20)
		  Dim colon As String = Chr(&h3a)
		  Dim prefix, cmd, params, recip, trailing As String
		  If Left(Raw, 1) = colon Then 'has a prefix
		    prefix = NthField(Raw, space, 1).Trim
		    Raw = Replace(Raw, prefix, "").Trim
		    prefix = Replace(prefix, colon, "")
		  End If
		  cmd = NthField(Raw, space, 1).Trim
		  Raw = Replace(Raw, cmd, "").Trim
		  Dim i As Integer = InStr(Raw, colon)
		  If i > 0 Then 'trailing
		    trailing = Right(Raw, Raw.Len - i)
		    Raw = Replace(Raw, colon + trailing, "")
		  End If
		  If CountFields(Raw, space) > 1 Then
		    recip = NthField(Raw, space, 1).Trim
		    Raw = Replace(Raw, recip, "").Trim
		    params = Raw
		  Else
		    recip = Raw.Trim
		  End If
		  
		  Me.Arguments = Split(trailing, space)
		  Me.Command = cmd
		  Me.Parameters = params
		  If recip.Trim <> "" Then
		    Me.Target = New Hostmask(recip)
		  End If
		  If prefix.Trim <> "" Then
		    Me.Sender = New Hostmask(prefix)
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  'Dim data As String
		  'If Sender <> Nil Then
		  'data = data + ":" + Sender.ToString + " "
		  'End If
		  'data = data + Command + " "
		  ''If Target <> Nil Then
		  ''If Target.Nick <> "$$Transmitter$$" Then 
		  'data = data + Target.ToString + " "
		  ''End If
		  '
		  'If Parameters <> "" Then data = data + Parameters + " "
		  '
		  'If UBound(Arguments) >= 0 Then
		  'data = data + ":" + Join(Arguments, " ")
		  'End If
		  '
		  'Return data.Trim
		  
		  Dim msg As String
		  Static space As String = Chr(&h20)
		  Static colon As String = Chr(&h3a)
		  
		  If Sender <> Nil Then
		    msg = colon + Sender.ToString
		  End If
		  
		  If Command <> "" Then
		    msg = msg + space + Command
		  End If
		  
		  If Target <> Nil Then
		    msg = msg + space + Target.ToString
		  End If
		  
		  If Parameters.Trim <> "" Then
		    msg = msg + space + Parameters
		  End If
		  
		  If UBound(Arguments) > -1 Then
		    msg = msg + space + colon + Join(Arguments, space)
		  End If
		  
		  msg = msg + EndOfLine.Windows
		  
		  Return msg
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Arguments() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Command As String
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalMessage As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameters As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Sender As Hostmask
	#tag EndProperty

	#tag Property, Flags = &h0
		Target As Hostmask
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Command"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalMessage"
			Group="Behavior"
			Type="Boolean"
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
			Name="Parameters"
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
	#tag EndViewBehavior
End Class
#tag EndClass
