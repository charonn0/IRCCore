#tag Class
Protected Class ChannelManager
Inherits IRCClient
	#tag Event
		Sub ChannelMessage(Message As IRCMessage)
		  For i As Integer = 0 To UBound(Channels)
		    If Channels(i).Name.Matches(Message.Target) Then
		      Channels(i).HandleInboundMessage(Message)
		    End If
		  Next
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(Message As IRCMessage)
		  Select Case Message.Command
		  Case "263" //Try again later, server busy
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "401" //ERR_NOSUCHNICK "<nickname> :No such nick/channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "402" //ERR_NOSUCHSERVER "<server name> :No such server"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "403" //ERR_NOSUCHCHANNEL "<channel name> :No such channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "404" //ERR_CANNOTSENDTOCHAN "<channel name> :Cannot send to channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "405" //ERR_TOOMANYCHANNELS "<channel name> :You have joined too many channels"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "406" //ERR_WASNOSUCHNICK "<nickname> :There was no such nickname"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "407" //ERR_TOOMANYTARGETS "<target> :<error code> recipients. <abort message>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "408" //ERR_NOSUCHSERVICE "<service name> :No such service"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "409" //ERR_NOORIGIN ":No origin specified"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "411" //ERR_NORECIPIENT ":No recipient given (<command>)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "412" //ERR_NOTEXTTOSEND ":No text to send"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "413" //ERR_NOTOPLEVEL "<mask> :No toplevel domain specified"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "414" //ERR_WILDTOPLEVEL "<mask> :Wildcard in toplevel domain"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "415" //ERR_BADMASK "<mask> :Bad Server/host mask"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "421" //ERR_UNKNOWNCOMMAND "<command> :Unknown command"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "422" //ERR_NOMOTD ":MOTD File is missing"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "423" //ERR_NOADMININFO "<server> :No administrative info available"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "424" //ERR_FILEERROR ":File error doing <file op> on <file>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "431" //ERR_NONICKNAMEGIVEN ":No nickname given"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "432" //ERR_ERRONEUSNICKNAME "<nick> :Erroneous nickname"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "433" //ERR_NICKNAMEINUSE "<nick> :Nickname is already in use"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "436" //ERR_NICKCOLLISION "<nick> :Nickname collision KILL from <user>@<host>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "437" //ERR_UNAVAILRESOURCE "<nick/channel> :Nick/channel is temporarily unavailable"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "441" //ERR_USERNOTINCHANNEL "<nick> <channel> :They aren't on that channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "442" //ERR_NOTONCHANNEL "<channel> :You're not on that channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "443" //ERR_USERONCHANNEL "<user> <channel> :is already on channel"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "444" //ERR_NOLOGIN "<user> :User not logged in"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "445" //ERR_SUMMONDISABLED ":SUMMON has been disabled"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "446" //ERR_USERSDISABLED ":USERS has been disabled"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "451" //ERR_NOTREGISTERED ":You have not registered"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "461" //ERR_NEEDMOREPARAMS "<command> :Not enough parameters"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "462" //ERR_ALREADYREGISTRED ":Unauthorized command (already registered)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "463" //ERR_NOPERMFORHOST ":Your host isn't among the privileged"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "464" //ERR_PASSWDMISMATCH ":Password incorrect"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "465" //ERR_YOUREBANNEDCREEP ":You are banned from this server"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "466" //ERR_YOUWILLBEBANNED
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "467" //ERR_KEYSET "<channel> :Channel key already set"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "471" //ERR_CHANNELISFULL "<channel> :Cannot join channel (+l)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "472" //ERR_UNKNOWNMODE "<char> :is unknown mode char to me for <channel>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "473" //ERR_INVITEONLYCHAN "<channel> :Cannot join channel (+i)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "474" //ERR_BANNEDFROMCHAN "<channel> :Cannot join channel (+b)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "475" //ERR_BADCHANNELKEY "<channel> :Cannot join channel (+k)"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "476" //ERR_BADCHANMASK "<channel> :Bad Channel Mask"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "477" //ERR_NOCHANMODES "<channel> :Channel doesn't support modes"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "478" //ERR_BANLISTFULL "<channel> <char> :Channel list is full"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "481" //ERR_NOPRIVILEGES ":Permission Denied- You're not an IRC operator"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "482" //ERR_CHANOPRIVSNEEDED "<channel> :You're not channel operator"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "483" //ERR_CANTKILLSERVER ":You can't kill a server!"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "484" //ERR_RESTRICTED ":Your connection is restricted!"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "485" //ERR_UNIQOPPRIVSNEEDED ":You're not the original channel operator"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "491" //ERR_NOOPERHOST ":No O-lines for your host"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "501" //ERR_UMODEUNKNOWNFLAG ":Unknown MODE flag"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "502" //ERR_USERSDONTMATCH ":Cannot change mode for other users"
		    RaiseEvent Log(Message.ToString) 'TODO
		  End Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub Log(Line As String)
		  RaiseEvent Log(Line)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Meta(Message As IRCMessage)
		  Select Case Message.Command
		  Case "301" //User away msg
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "305" //RPL_UNAWAY ":You are no longer marked as being away"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "306" //RPL_NOWAWAY ":You have been marked as being away"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "311" //RPL_WHOISUSER <nick> <user> <host> * :<real name>
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "312" //RPL_WHOISSERVER "<nick> <server> :<server info>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "313" //RPL_WHOISOPERATOR "<nick> :is an IRC operator"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "317" //RPL_WHOISIDLE "<nick> <integer> :seconds idle"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "318" //RPL_ENDOFWHOIS "<nick> :End of WHOIS list"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "319" //RPL_WHOISCHANNELS "<nick> :*( ( "@" / "+" ) <channel> " " )"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "314" //RPL_WHOWASUSER "<nick> <user> <host> * :<real name>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "369" //RPL_ENDOFWHOWAS "<nick> :End of WHOWAS"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "321" //RPL_LISTSTART Obsolete. Not used.
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "322" //RPL_LIST "<channel> <# visible> :<topic>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "323" //RPL_LISTEND ":End of LIST"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "325" //RPL_UNIQOPIS "<channel> <nickname>"
		    RaiseEvent Log(Message.ToString) 'TODO
		  Case "324" //RPL_CHANNELMODEIS "<channel> <mode> <mode params>"
		    ModeChanged(Message.Target, Message.Sender, Message.Parameters)
		  Case "331" //RPL_NOTOPIC "<channel> :No topic is set"
		    TopicChanged(Message.Target, Message.Parameters, Message.Sender)
		  Case "332" //RPL_TOPIC "<channel> :<topic>"
		    TopicChanged(Message.Target, Message.Parameters, Message.Sender)
		    
		    
		    
		  Else
		    RaiseEvent Log(Message.ToString)
		  End Select
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Log(Line As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Meta(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ModeChanged(Target As HostMask, ModifiedBy As HostMask, ModeString As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TopicChanged(Channel As HostMask, NewTopic As String, ChangedBy As HostMask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserAway(User As HostMask, NoLongerAway As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UserJoin(Nick As HostMask, Channel As String, IsParting As Boolean)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Channels() As IRCCore
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
