#tag Module
Protected Module IRC
	#tag Method, Flags = &h0
		Function ConnectInternal(TargetHost As Hostmask) As IRCCore
		  Dim node As New IRCCore(TargetHost)
		  AddHandler Node.HandleInboundMessage, AddressOf IRC.DispatchHandler
		  Listeners.Append(node)
		  Return node
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectRemote(ServerAddress As String, Username As String, Nickname As String, Password As String = "", Port As Integer = 6667, Secure As Boolean = False) As IRC.CoreInterface
		  Dim sock As New IRCSocket
		  sock.Address = ServerAddress
		  sock.Port = Port
		  sock.Host = New Hostmask(Username, Nickname, ServerAddress)
		  AddHandler sock.MessageReceived, AddressOf IRC.DispatchHandler
		  Sock.Connect
		  Listeners.Append(sock)
		  Dim ret As New IRCCore(New Hostmask(Username, NickName, ServerAddress))
		  Listeners.Append(ret) 
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DispatchHandler(Sender As IRC.CoreInterface, Message As IRCMessage)
		  For i As Integer = 0 To UBound(Listeners)
		    If Listeners(i) Is Sender Then Continue
		    Listeners(i).HandleInboundMessage(Message)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SocketErrorMessage(ErrorCode As Integer) As String
		  Dim err As String = "socket error " + Str(ErrorCode)
		  Select Case ErrorCode
		  Case 102
		    err = err + ": Disconnected."
		  Case 100
		    err = err + ": Could not create a socket!"
		  Case 103
		    err = err + ": Connection timed out."
		  Case 105
		    err = err + ": That port number is already in use."
		  Case 106
		    err = err + ": Socket is not ready for that command."
		  Case 107
		    err = err + ": Could not bind to port."
		  Case 108
		    err = err + ": Out of memory."
		  Else
		    err = err + ": System error code."
		  End Select
		  
		  Return err
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Listeners() As IRC.CoreInterface
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
End Module
#tag EndModule
