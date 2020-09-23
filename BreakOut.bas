Attribute VB_Name = "BreakOut"
'******************************************************
'
'        BreakOut By Simon Price
'
'This game demonstates the following  VB programming principles :
'
'1/ Good use of the constants to make the code easy to read and change
'2/ Use of types to make it easy to simulate many objects
'3/ Uses of API to speed things up: BitBlt, StretchBlt , GetPixel and sndPlaysound
'4/ Uses of dynamic arrays for changing numbers of game elements
'5/ A cool game since it was made in one day
'
'How the game works
'
'The game space is divided into blocks : note that the
'size of the level can easily be adjusted by changing
'the constants. The type 'block' holds a number to
'represent what object is there. Remembering what object
'is which number is not fun so more constants are used.
'A collision is detected by testing for colors around
'the balls. If the cour isn't black ?: there's summit
'there so a sub 'CheckForHits' is called and resolves the
'problem by looking what's there. The balls are stored in
'a dynamic array so that balls can be added and removed
'as you please.
'
'At this point I should say some copywrite stuff like
'if you use this code include me in the credits, but I
'doubt that will happen. However, I would like you to
'visit my website, and I'm sure you will too. It's got
'all my games (this is definately not my best game)
'plus tutorials on how my games are made. Tell other
'programmers too! The address is :
'
'  www.hispalace.fsbusiness.co.uk
'
'*******************************************************

Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Public Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long
Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long

Public Type tBall
   x As Integer
   y As Integer
   xm As Integer
   ym As Integer
End Type

Public Type tPaddle
   x As Integer
   Size As Integer
End Type

Public Type POINTAPI
   x As Integer
   y As Integer
End Type

Public Block(0 To 9, 0 To 7) As Byte
'block type constants
Public Const NOWT = 0
Public Const BOX = 1
Public Const BOMB = 30
Public Const EXPLODINGBOMB = 31
Public Const EXPLODEDBOMB = 41
Public Const METAL = 2
Public Const EXPLODE = 10
Public Const EXPLODED = 20
Public Const TNT = 100
Public Const TNTSETOFF = 101
Public Const TNTBLOWUP = 106

Public Ball() As tBall
Public Score As Long
Public Paddle As tPaddle
Public i As Integer
Public i2 As Integer
Public SoundFX As Boolean
