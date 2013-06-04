#tag Class
Protected Class IRCClient
	#tag Method, Flags = &h0
		Sub Connect(Username As String, NickName As String, Server As String, Port As Integer = 6667, Password As String = "")
		  Dim c As IRC.CoreInterface = IRC.ConnectRemote(Server, Username, NickName, Password, Port)
		  Me.Core = IRCCore(c)
		  Me.Core.Name.Password = Password
		  AddHandler Core.MessageReceived, AddressOf Me.MessageReceivedHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectInternal(TargetHost As Hostmask)
		  Me.Core = IRC.ConnectInternal(TargetHost)
		  AddHandler Core.MessageReceived, AddressOf Me.MessageReceivedHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Host() As HostMask
		  If Core <> Nil Then Return Core.Host
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MessageReceivedHandler(Sender As IRCCore, Message As IRCMessage)
		  Select Case Message.command
		  Case "001" //Welcome...
		    Log(Message)
		  Case "002" //Your host is...
		    Log(Message)
		  Case "003" //Server created on...
		    Log(Message)
		  Case "004" //Server info...
		    Log(Message)
		  Case "005" //Either server redirect info or depending on the ircd it could be a bunch of mode info
		    Log(Message)
		  Case "302" //RPL_USERHOST
		    Log(Message)
		  Case "303" //RPL_ISON
		    Log(Message)
		  Case "301" //User away msg
		    Meta(Message)
		  Case "305" //RPL_UNAWAY ":You are no longer marked as being away"
		    Meta(Message)
		  Case "306" //RPL_NOWAWAY ":You have been marked as being away"
		    Meta(Message)
		  Case "311" //RPL_WHOISUSER <nick> <user> <host> * :<real name>
		    Meta(Message)
		  Case "312" //RPL_WHOISSERVER "<nick> <server> :<server info>"
		    Meta(Message)
		  Case "313" //RPL_WHOISOPERATOR "<nick> :is an IRC operator"
		    Meta(Message)
		  Case "317" //RPL_WHOISIDLE "<nick> <integer> :seconds idle"
		    Meta(Message)
		  Case "318" //RPL_ENDOFWHOIS "<nick> :End of WHOIS list"
		    Meta(Message)
		  Case "319" //RPL_WHOISCHANNELS "<nick> :*( ( "@" / "+" ) <channel> " " )"
		    Meta(Message)
		  Case "314" //RPL_WHOWASUSER "<nick> <user> <host> * :<real name>"
		    Meta(Message)
		  Case "369" //RPL_ENDOFWHOWAS "<nick> :End of WHOWAS"
		    Meta(Message)
		  Case "321" //RPL_LISTSTART Obsolete. Not used.
		    Meta(Message)
		  Case "322" //RPL_LIST "<channel> <# visible> :<topic>"
		    Meta(Message)
		  Case "323" //RPL_LISTEND ":End of LIST"
		    Meta(Message)
		  Case "325" //RPL_UNIQOPIS "<channel> <nickname>"
		    Meta(Message)
		  Case "324" //RPL_CHANNELMODEIS "<channel> <mode> <mode params>"
		    Meta(Message)
		  Case "331" //RPL_NOTOPIC "<channel> :No topic is set"
		    Meta(Message)
		  Case "332" //RPL_TOPIC "<channel> :<topic>"
		    Meta(Message)
		  Case "341" //RPL_INVITING "<channel> <nick>"
		    Meta(Message)
		  Case "342" //RPL_SUMMONING "<user> :Summoning user to IRC"
		    Meta(Message)
		  Case "346" //RPL_INVITELIST "<channel> <invitemask>"
		    Meta(Message)
		  Case "347" //RPL_ENDOFINVITELIST "<channel> :End of channel invite list"
		    Meta(Message)
		  Case "348" //RPL_EXCEPTLIST "<channel> <exceptionmask>"
		    Meta(Message)
		  Case "349" //RPL_ENDOFEXCEPTLIST "<channel> :End of channel exception list"
		    Meta(Message)
		  Case "351" //RPL_VERSION "<version>.<debuglevel> <server> :<comments>"
		    Meta(Message)
		  Case "352" //RPL_WHOREPLY "<channel> <user> <host> <server> <nick> ( "H" / "G" > ["*"] [ ( "@" / "+" ) ] :<hopcount> <real name>"
		    Meta(Message)
		  Case "315" //RPL_ENDOFWHO "<name> :End of WHO list"
		    Meta(Message)
		  Case "353" //RPL_NAMREPLY "( "=" / "*" / "@" ) <channel> :[ "@" / "+" ] <nick> *( " " [ "@" / "+" ] <nick> )
		    Meta(Message)
		  Case "366" //RPL_ENDOFNAMES "<channel> :End of NAMES list"
		    Meta(Message)
		  Case "364" //RPL_LINKS "<mask> <server> :<hopcount> <server info>"
		    Meta(Message)
		  Case "365" //RPL_ENDOFLINKS "<mask> :End of LINKS list"
		    Meta(Message)
		  Case "367" //RPL_BANLIST "<channel> <banmask>"
		    Meta(Message)
		  Case "368" //RPL_ENDOFBANLIST "<channel> :End of channel ban list"
		    Log(Message)
		  Case "371" //RPL_INFO ":<string>"
		    Meta(Message)
		  Case "374" //RPL_ENDOFINFO ":End of INFO list"
		    Meta(Message)
		  Case "375" //RPL_MOTDSTART ":- <server> Message of the day - "
		    Meta(Message)
		  Case "372" //RPL_MOTD ":- <text>"
		    Meta(Message)
		  Case "376" //RPL_ENDOFMOTD ":End of MOTD command"
		    Meta(Message)
		  Case "381" //RPL_YOUREOPER ":You are now an IRC operator"
		    Meta(Message)
		  Case "382" //RPL_REHASHING "<config file> :Rehashing"
		    Meta(Message)
		  Case "383" //RPL_YOURESERVICE "You are service <servicename>"
		    Meta(Message)
		  Case "391" //RPL_TIME "<server> :<string showing server's local time>"
		    Meta(Message)
		  Case "392" //RPL_USERSSTART ":UserID   Terminal  Host"
		    Meta(Message)
		  Case "393" //RPL_USERS ":<username> <ttyline> <hostname>"
		    Meta(Message)
		  Case "394" //RPL_ENDOFUSERS ":End of users"
		    Meta(Message)
		  Case "395" //RPL_NOUSERS ":Nobody logged in"
		    Meta(Message)
		  Case "200" //RPL_TRACELINK "Link <version & debug level> <destination> <next server> V<protocol version> <link uptime in seconds> <backstream sendq> <upstream sendq>"
		    Meta(Message)
		  Case "201" //RPL_TRACECONNECTING "Try. <class> <server>"
		    Meta(Message)
		  Case "202" //RPL_TRACEHANDSHAKE "H.S. <class> <server>"
		    Meta(Message)
		  Case "203" //RPL_TRACEUNKNOWN "???? <class> [<client IP address in dot form>]"
		    Meta(Message)
		  Case "204" //RPL_TRACEOPERATOR "Oper <class> <nick>"
		    Meta(Message)
		  Case "205" //RPL_TRACEUSER "User <class> <nick>"
		    Meta(Message)
		  Case "206" //RPL_TRACESERVER "Serv <class> <int>S <int>C <server> <nick!user|*!*>@<host|server> V<protocol version>"
		    Meta(Message)
		  Case "207" //RPL_TRACESERVICE "Service <class> <name> <type> <active type>"
		    Meta(Message)
		  Case "208" //RPL_TRACENEWTYPE "<newtype> 0 <client name>"
		    Meta(Message)
		  Case "209" //RPL_TRACECLASS "Class <class> <count>"
		    Meta(Message)
		  Case "210" //RPL_TRACERECONNECT Unused.
		    Meta(Message)
		  Case "261" //RPL_TRACELOG "File <logfile> <debug level>"
		    Meta(Message)
		  Case "262" //RPL_TRACEEND "<server name> <version & debug level> :End of TRACE"
		    Meta(Message)
		  Case "211" //RPL_STATSLINKINFO "<linkname> <sendq> <sent messages> <sent Kbytes> <received messages> <received Kbytes> <time open>"
		    Meta(Message)
		  Case "212" //RPL_STATSCOMMANDS "<command> <count> <byte count> <remote count>"
		    Meta(Message)
		  Case "219" //RPL_ENDOFSTATS "<stats letter> :End of STATS report"
		    Meta(Message)
		  Case "242" //RPL_STATSUPTIME ":Server Up %d days %d:%02d:%02d"
		    Meta(Message)
		  Case "243" //RPL_STATSOLINE "O <hostmask> * <name>"
		    Meta(Message)
		  Case "221" //RPL_UMODEIS "<user mode string>"
		    Meta(Message)
		  Case "234" //RPL_SERVLIST "<name> <server> <mask> <type> <hopcount> <info>"
		    Meta(Message)
		  Case "235" //RPL_SERVLISTEND "<mask> <type> :End of service listing"
		    Meta(Message)
		  Case "251" //RPL_LUSERCLIENT ":There are <integer> users and <integer> services on <integer> servers"
		    Meta(Message)
		  Case "252" //RPL_LUSEROP "<integer> :operator(s) online"
		    Meta(Message)
		  Case "253" //RPL_LUSERUNKNOWN "<integer> :unknown connection(s)"
		    Meta(Message)
		  Case "254" //RPL_LUSERCHANNELS "<integer> :channels formed"
		    Meta(Message)
		  Case "255" //RPL_LUSERME ":I have <integer> clients and <integer> servers"
		    Meta(Message)
		  Case "256" //RPL_ADMINME "<server> :Administrative info"
		    Meta(Message)
		  Case "257" //RPL_ADMINLOC1 ":<admin info>"
		    Meta(Message)
		  Case "258" //RPL_ADMINLOC2 ":<admin info>"
		    Meta(Message)
		  Case "259" //RPL_ADMINEMAIL ":<admin info>"
		    Meta(Message)
		  Case "263" //Try again later, server busy
		    Meta(Message)
		  Case "401" //ERR_NOSUCHNICK "<nickname> :No such nick/channel"
		    Error(Message)
		  Case "402" //ERR_NOSUCHSERVER "<server name> :No such server"
		    Error(Message)
		  Case "403" //ERR_NOSUCHCHANNEL "<channel name> :No such channel"
		    Error(Message)
		  Case "404" //ERR_CANNOTSENDTOCHAN "<channel name> :Cannot send to channel"
		    Error(Message)
		  Case "405" //ERR_TOOMANYCHANNELS "<channel name> :You have joined too many channels"
		    Error(Message)
		  Case "406" //ERR_WASNOSUCHNICK "<nickname> :There was no such nickname"
		    Error(Message)
		  Case "407" //ERR_TOOMANYTARGETS "<target> :<error code> recipients. <abort message>"
		    Error(Message)
		  Case "408" //ERR_NOSUCHSERVICE "<service name> :No such service"
		    Error(Message)
		  Case "409" //ERR_NOORIGIN ":No origin specified"
		    Error(Message)
		  Case "411" //ERR_NORECIPIENT ":No recipient given (<command>)"
		    Error(Message)
		  Case "412" //ERR_NOTEXTTOSEND ":No text to send"
		    Error(Message)
		  Case "413" //ERR_NOTOPLEVEL "<mask> :No toplevel domain specified"
		    Error(Message)
		  Case "414" //ERR_WILDTOPLEVEL "<mask> :Wildcard in toplevel domain"
		    Error(Message)
		  Case "415" //ERR_BADMASK "<mask> :Bad Server/host mask"
		    Error(Message)
		  Case "421" //ERR_UNKNOWNCOMMAND "<command> :Unknown command"
		    Error(Message)
		  Case "422" //ERR_NOMOTD ":MOTD File is missing"
		    Error(Message)
		  Case "423" //ERR_NOADMININFO "<server> :No administrative info available"
		    Error(Message)
		  Case "424" //ERR_FILEERROR ":File error doing <file op> on <file>"
		    Error(Message)
		  Case "431" //ERR_NONICKNAMEGIVEN ":No nickname given"
		    Error(Message)
		  Case "432" //ERR_ERRONEUSNICKNAME "<nick> :Erroneous nickname"
		    Error(Message)
		  Case "433" //ERR_NICKNAMEINUSE "<nick> :Nickname is already in use"
		    Error(Message)
		  Case "436" //ERR_NICKCOLLISION "<nick> :Nickname collision KILL from <user>@<host>"
		    Error(Message)
		  Case "437" //ERR_UNAVAILRESOURCE "<nick/channel> :Nick/channel is temporarily unavailable"
		    Error(Message)
		  Case "441" //ERR_USERNOTINCHANNEL "<nick> <channel> :They aren't on that channel"
		    Error(Message)
		  Case "442" //ERR_NOTONCHANNEL "<channel> :You're not on that channel"
		    Error(Message)
		  Case "443" //ERR_USERONCHANNEL "<user> <channel> :is already on channel"
		    Error(Message)
		  Case "444" //ERR_NOLOGIN "<user> :User not logged in"
		    Error(Message)
		  Case "445" //ERR_SUMMONDISABLED ":SUMMON has been disabled"
		    Error(Message)
		  Case "446" //ERR_USERSDISABLED ":USERS has been disabled"
		    Error(Message)
		  Case "451" //ERR_NOTREGISTERED ":You have not registered"
		    Error(Message)
		  Case "461" //ERR_NEEDMOREPARAMS "<command> :Not enough parameters"
		    Error(Message)
		  Case "462" //ERR_ALREADYREGISTRED ":Unauthorized command (already registered)"
		    Error(Message)
		  Case "463" //ERR_NOPERMFORHOST ":Your host isn't among the privileged"
		    Error(Message)
		  Case "464" //ERR_PASSWDMISMATCH ":Password incorrect"
		    Error(Message)
		  Case "465" //ERR_YOUREBANNEDCREEP ":You are banned from this server"
		    Error(Message)
		  Case "466" //ERR_YOUWILLBEBANNED
		    Error(Message)
		  Case "467" //ERR_KEYSET "<channel> :Channel key already set"
		    Error(Message)
		  Case "471" //ERR_CHANNELISFULL "<channel> :Cannot join channel (+l)"
		    Error(Message)
		  Case "472" //ERR_UNKNOWNMODE "<char> :is unknown mode char to me for <channel>"
		    Error(Message)
		  Case "473" //ERR_INVITEONLYCHAN "<channel> :Cannot join channel (+i)"
		    Error(Message)
		  Case "474" //ERR_BANNEDFROMCHAN "<channel> :Cannot join channel (+b)"
		    Error(Message)
		  Case "475" //ERR_BADCHANNELKEY "<channel> :Cannot join channel (+k)"
		    Error(Message)
		  Case "476" //ERR_BADCHANMASK "<channel> :Bad Channel Mask"
		    Error(Message)
		  Case "477" //ERR_NOCHANMODES "<channel> :Channel doesn't support modes"
		    Error(Message)
		  Case "478" //ERR_BANLISTFULL "<channel> <char> :Channel list is full"
		    Error(Message)
		  Case "481" //ERR_NOPRIVILEGES ":Permission Denied- You're not an IRC operator"
		    Error(Message)
		  Case "482" //ERR_CHANOPRIVSNEEDED "<channel> :You're not channel operator"
		    Error(Message)
		  Case "483" //ERR_CANTKILLSERVER ":You can't kill a server!"
		    Error(Message)
		  Case "484" //ERR_RESTRICTED ":Your connection is restricted!"
		    Error(Message)
		  Case "485" //ERR_UNIQOPPRIVSNEEDED ":You're not the original channel operator"
		    Error(Message)
		  Case "491" //ERR_NOOPERHOST ":No O-lines for your host"
		    Error(Message)
		  Case "501" //ERR_UMODEUNKNOWNFLAG ":Unknown MODE flag"
		    Error(Message)
		  Case "502" //ERR_USERSDONTMATCH ":Cannot change mode for other users"
		    Error(Message)
		    //END NUMERIC REPLIES
		  Case "JOIN"
		    Meta(Message)
		  Case "MODE" //mode changes
		    Meta(Message)
		  Case "NICK" //changed/new nicks
		    Meta(Message)
		  Case "QUIT" //Someone's client quit
		    Meta(Message)
		  Case "PART" //Someone's leaving
		    Meta(Message)
		  Case "TOPIC" //Someone set or changed the channel topic
		    Meta(Message)
		  Case "INVITE" //We are invited to a channel
		    Meta(Message)
		  Case "KICK" //someone has been kicked off the chanel
		    Meta(Message)
		  Case "PRIVMSG" //Client to channel or to user messages
		    If Left(Message.Target.Nick, 1) = "#" Then
		      ChannelMessage(Message)
		    Else
		      PrivateMessage(Message)
		    End If
		    
		    //Parse out CTCP commands
		    'If InStr(msg, Chr(1)) <> 0 then //embeded ctcp
		    'if InStr(msg, Chr(1) + "FINGER" + Chr(1)) <> 0 then ctcp.Append "FINGER"
		    'if InStr(msg, Chr(1) + "VERSION" + Chr(1)) <> 0 then ctcp.Append "VERSION"
		    '//if InStr(msg, Chr(1) + "SOURCE" + Chr(1)) <> 0 then ctcp.Append "SOURCE"
		    '//if InStr(msg, Chr(1) + "USERINFO" + Chr(1)) <> 0 then ctcp.Append "USERINFO"
		    'if InStr(msg, Chr(1) + "CLIENTINFO" + Chr(1)) <> 0 then ctcp.Append "CLIENTINFO"
		    'if InStr(msg, Chr(1) + "TIME" + Chr(1)) <> 0 then ctcp.Append "TIME"
		    'if InStr(msg, Chr(1) + "ERRMSG" + Chr(1)) <> 0 then ctcp.Append "ERRMSG"
		    'if InStr(msg, Chr(1) + "PING") <> 0 then
		    'temp = Mid(msg, InStr(msg, Chr(1) + "PING"))
		    'temp = NthField(temp, Chr(1), 2)
		    'temp = temp.ReplaceAll(chr(1),"")
		    'ctcp.Append temp
		    'end if
		    'CTCPReply(ctcp, prefix)
		    'goto privmsgdone
		    'end if
		    
		    'if params.Left(1) = "#" then //to the channel
		    'PrintConsole(NthField(prefix, "!", 1) + " " + msg , 3)
		    'else //its to our nick, otherwise we should not have recieved the msg
		    'PrintConsole(NthField(prefix, "!", 1) + " " + msg , 4)
		    'end if
		    'privmsgdone:
		  Case "NOTICE" //Client to channel or to user messages
		    PrivateMessage(Message)
		  Else
		    Log(Message)
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendMessage(Message As String, Channel As HostMask = Nil)
		  Dim msg As New IRCMessage
		  If Left(Message, 1) = "/" Then 'a command
		    Dim cmd As String = NthField(Message, " ", 1).Uppercase
		    Dim mesg As String = Right(Message, Message.Len - (cmd.Len + 1))
		    msg.Target = New HostMask(NthField(mesg, " ", 1))
		    mesg = Replace(mesg, NthField(mesg, " ", 1), "").Trim
		    msg.Parameters = mesg
		    Select Case cmd
		    Case "/JOIN"
		      msg.Command = "JOIN"
		    Case "/PART"
		      msg.Command = "PART"
		      msg.Parameters = "Sweet sorrow..."
		    Case "/PM", "/NOTICE", "/MSG"
		      msg.Command = "NOTICE"
		    Case "/MODE"
		      msg.Command = "MODE"
		    Case "/QUIT"
		      msg.Command = "QUIT"
		      msg.Parameters = "Sweet sorrow..."
		    Else
		      Break
		    End Select
		    
		  Else
		    msg.Target = Channel
		    msg.Command = "PRIVMSG"
		    msg.Parameters = Message
		  End If
		  
		  Me.Core.SendMessage(msg)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ChannelMessage(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Log(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Meta(Message As IRCMessage)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PrivateMessage(Message As IRCMessage)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Core As IRCCore
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
