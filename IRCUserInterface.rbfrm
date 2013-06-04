#tag Window
Begin ContainerControl IRCUserInterface
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   557
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   963
   Begin Listbox UserList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   557
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   737
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   226
      _ScrollWidth    =   -1
   End
   Begin Listbox ScrollBack
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   "10%, *"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   530
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   734
      _ScrollWidth    =   -1
   End
   Begin TextField TextInput
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   2
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   533
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   732
   End
   Begin MessageEndPoint IRCInterface
      Height          =   32
      Index           =   -2147483648
      Left            =   9.81e+2
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0.0e+
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  IRCInterface.Connect("Andrew2", "Andrew2", "192.168.1.4")
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events TextInput
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = &h0D Then
		    IRCInterface.SendMessage(Me.Text)
		    ScrollBack.AddRow(IRCInterface.Host.Nick, Me.Text)
		    Me.Text = ""
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events IRCInterface
	#tag Event
		Sub Log(Message As IRCMessage)
		  ScrollBack.AddRow(Message.Sender.Nick, Join(Message.Arguments, " "))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Meta(Message As IRCMessage)
		  ScrollBack.AddRow(Message.Sender.Nick, Join(Message.Arguments, " "))
		End Sub
	#tag EndEvent
	#tag Event
		Sub ModeChanged(Target As HostMask, ModifiedBy As HostMask, ModeString As String)
		  ScrollBack.AddRow(ModifiedBy.Nick, "set " + Target.Nick + "'s mode to " + ModeString)
		End Sub
	#tag EndEvent
	#tag Event
		Sub PrivateMessage(Message As IRCMessage)
		  ScrollBack.AddRow(Message.Sender.Nick, Join(Message.Arguments, " "))
		End Sub
	#tag EndEvent
	#tag Event
		Sub TopicChanged(Channel As HostMask, NewTopic As String, ChangedBy As HostMask)
		  ScrollBack.AddRow(ChangedBy.Nick, "set the topic for " + Channel.Nick + " to " + NewTopic)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserAway(User As HostMask, NoLongerAway As Boolean)
		  If NoLongerAway Then
		    ScrollBack.AddRow(User.Nick, "is no longer away.")
		  Else
		    ScrollBack.AddRow(User.Nick, "is now away.")
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserJoin(Nick As HostMask, Channel As String, IsParting As Boolean)
		  If IsParting Then
		    ScrollBack.AddRow(Nick.Nick, " parted " + Channel)
		  Else
		    ScrollBack.AddRow(Nick.Nick, " joined " + Channel)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
