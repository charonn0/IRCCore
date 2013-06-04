#tag Class
Class IRCCore
Implements IRC.CoreInterface
	#tag Method, Flags = &h0
		Sub Constructor(Mask As Hostmask)
		  Me.HostName = Mask
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleInboundMessage(Message As IRCMessage)
		  RaiseEvent MessageReceived(Message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Host() As HostMask
		  Return Me.HostName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As IRC.HostMask
		  Return Me.HostName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(Message As IRCMessage)
		  IRC.DispatchHandler(Me, Message)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event HandleInboundMessage(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MessageReceived(Message As IRCMessage)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected HostName As Hostmask
	#tag EndProperty


	#tag ViewBehavior
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
