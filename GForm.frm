VERSION 5.00
Begin VB.Form GForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Break-Out By Simon Price"
   ClientHeight    =   4320
   ClientLeft      =   36
   ClientTop       =   276
   ClientWidth     =   5688
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   360
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   474
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   100
      Left            =   4320
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   8
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   31
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   7
      Top             =   2520
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   10
      Left            =   4320
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   6
      Top             =   600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Timer AddBall 
      Interval        =   1000
      Left            =   4920
      Top             =   120
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   30
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   5
      Top             =   2040
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   2
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   4
      Top             =   1560
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   1
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   3
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Pic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Index           =   0
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   2
      Top             =   600
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox PaddlePic 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   3480
      ScaleHeight     =   360
      ScaleWidth      =   480
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox PB 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      FillColor       =   &H00FFFFFF&
      FillStyle       =   0  'Solid
      ForeColor       =   &H000000FF&
      Height          =   2412
      Left            =   120
      ScaleHeight     =   201
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   261
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   3132
   End
End
Attribute VB_Name = "GForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const BOXFRAMES = 7
Const TNTFRAMES = 6
Const BOMBFRAMES = 8
Const METALFRAMES = 5
Const PADDLEFRAMES = 2
Const EXPLODEFRAMES = 10
Const EXPLODINGBOMBFRAMES = 10
Const ABOVE = 0
Const TORIGHT = 1
Const BELOW = 2
Const TOLEFT = 3
Const LEVELWIDTH = 9
Const LEVELHEIGHT = 7
Const BALLRADIUS = 5
Const PBWIDTH = 400
Const PBHEIGHT = 300

Dim DispWidth As Integer
Dim DispHeight As Integer
Dim x As Byte
Dim y As Byte
Dim BoxPic(1 To BOXFRAMES) As IPictureDisp
Dim TNTPic(1 To TNTFRAMES) As IPictureDisp
Dim BombPic(1 To BOMBFRAMES) As IPictureDisp
Dim MetalPic(1 To METALFRAMES) As IPictureDisp
Dim PadPic(1 To PADDLEFRAMES) As IPictureDisp
Dim ExplodePic(1 To EXPLODEFRAMES) As IPictureDisp
Dim ExplodingBombPic(1 To EXPLODINGBOMBFRAMES) As IPictureDisp
Dim BoxF As Byte
Dim BombF As Byte
Dim MetalF As Byte
Dim PadF As Byte
'Dim FrameCount As Integer
Dim TriedIt As Byte
Dim BallAdd As Byte
Dim FirstTime As Boolean

Public Sub CheckForHits(Where As Byte)
On Error Resume Next
'looks what's at the place input and decides
'on an appropriate reaction e.g. if there's
'a bomb there, then blow it up

'calculate co-ords of block
Select Case Where
  Case ABOVE
    x = (Ball(i).x + Ball(i).xm) \ 40
    y = (Ball(i).y + Ball(i).ym - BALLRADIUS) \ 30 - 1
  Case BELOW
    x = (Ball(i).x + Ball(i).xm) \ 40
    y = (Ball(i).y + Ball(i).ym + BALLRADIUS) \ 30 + 1
  Case TOLEFT
    x = (Ball(i).x + Ball(i).xm + BALLRADIUS) \ 40 - 1
    y = (Ball(i).y + Ball(i).ym) \ 30
  Case TORIGHT
    x = (Ball(i).x + Ball(i).xm - BALLRADIUS) \ 40 + 1
    y = (Ball(i).y + Ball(i).ym) \ 30
End Select

TryAgain:
'see whats there
Select Case Block(x, y)
  Case TNT 'time to press the detonater button!
    Block(x, y) = TNTSETOFF
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\HitBomb.wav", &H1
  Case BOX 'box is there, so blow it up
    Block(x, y) = EXPLODE
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\Explode.wav", &H1
    Score = Score + 100
  Case BOMB 'bomb is there, so set it off
    Block(x, y) = EXPLODINGBOMB
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\HitBomb.wav", &H1
  Case METAL 'metal block is there, so do clang sound
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\Clang.wav", &H1
  Case NOWT
    Select Case Ball(i).y
    Case Is > 360
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\Paddle.wav", &H1
    Case Else
    x = (Ball(i).x + Ball(i).xm + 10) \ 40
    y = (Ball(i).y + Ball(i).ym) \ 30
    TriedIt = TriedIt + 1
    If TriedIt = 1 Then GoTo TryAgain
    End Select
End Select

End Sub

Public Sub LoseLife()
End
End Sub

Public Sub ResetLevel()
'reset the score
Score = 0

'reset the balls
ReDim Ball(0)
ReDim Ball(1 To 1)
Ball(1).x = LEVELWIDTH * 40 / 2 - 2
Ball(1).y = 260
Ball(1).ym = -5
Ball(1).xm = 1

'reset the paddle
Paddle.x = 185

'make a load of boxes
For x = 0 To LEVELWIDTH
For y = 0 To LEVELHEIGHT
   Block(x, y) = BOX
Next
Next
' + put in a few metal boxes
For i = 1 To 10
   Block(Int(Rnd * LEVELWIDTH), Int(Rnd * LEVELHEIGHT)) = METAL
Next
'chuck in some bombs
For i = 1 To 10
   Block(Int(Rnd * LEVELWIDTH), Int(Rnd * LEVELHEIGHT)) = BOMB
Next
' add a detonater button
Block(Int(Rnd * LEVELWIDTH), Int(Rnd * LEVELHEIGHT)) = TNT

'= a new level
End Sub

Private Sub AddBall_Timer()
'add something to the level
x = Int(Rnd * LEVELWIDTH)
y = Int(Rnd * LEVELHEIGHT)
If Block(x, y) = NOWT Or METAL Then
    Select Case Int(Rnd * 100)
    Case 1 To 2: Block(x, y) = TNT
    Case 3 To 20: Block(x, y) = BOMB
    Case 21 To 25: Block(x, y) = METAL
    Case Else: Block(x, y) = BOX
    End Select
End If

BallAdd = BallAdd + 1
'it's time to add another ball!
If BallAdd = 10 Then
   BallAdd = 0
   ReDim Preserve Ball(1 To UBound(Ball) + 1)
    Ball(UBound(Ball)).x = LEVELWIDTH * 40 / 2 - 2
    Ball(UBound(Ball)).y = 260
    Ball(UBound(Ball)).ym = -5
    Ball(UBound(Ball)).xm = Int(Rnd * 16) - 8
End If
End Sub

Private Sub cmdStart_Click()
cmdStart.Visible = False
MainLoop
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
  Case vbKeyEscape: End
  Case vbKeyS: SoundFX = Not SoundFX
  Case vbKeyR: ResetLevel
  Case vbKeyUp: If Paddle.Size <= 90 Then Paddle.Size = Paddle.Size + 10
  Case vbKeyDown: If Paddle.Size >= 20 Then Paddle.Size = Paddle.Size - 10
  Case vbKeyC
  PB.Picture = PB.Image
  SavePicture PB.Picture, App.Path & "\Resources\Pictures\BreakOut Pic.bmp"
  PB.Picture = LoadPicture()
End Select
End Sub

Private Sub Form_Load()
Caption = "Loading... Please wait"
On Error Resume Next
Randomize Timer
FirstTime = True
DispHeight = Screen.Height * 0.975 / Screen.TwipsPerPixelX
DispWidth = Screen.Height * 1.3 / Screen.TwipsPerPixelY
PB.Move 0, 0, PBWIDTH, PBHEIGHT
Move 0, 0, Screen.Width, Screen.Height
ScaleWidth = PBWIDTH
ScaleHeight = PBHEIGHT
Show
LoadPics
ResetLevel
Caption = "BreakOut - By Simon Price - visit my website to download loads more games : www.hispalace.fsbusiness.co.uk"
MsgBox "Click OK to play. When the game starts, your first ball will be right above you (i.e. don't move the mouse too much at first). More will keep being created and no-doubt you will drop a few. When you no longer have any balls in the air - it's game over.", vbInformation, "Get Ready for Si's BreakOut"
MainLoop
End Sub

Public Sub MainLoop()
On Error Resume Next

Do
DoEvents

'animate all explosions
'animate all bomb countdowns
'animate detonations
For x = 0 To LEVELWIDTH
For y = 0 To LEVELHEIGHT
   Select Case Block(x, y)
   
   Case TNTBLOWUP 'time to set off all the bombs at once!!!
   Block(x, y) = EXPLODE
    For i = 0 To LEVELWIDTH
    For i2 = 0 To LEVELHEIGHT
       If Block(i, i2) = BOMB Then Block(i, i2) = EXPLODINGBOMB
    Next
    Next
   
   Case TNTSETOFF To TNTBLOWUP 'push down that lever a bit more!
   Block(x, y) = Block(x, y) + 1
   
   Case EXPLODED
   Block(x, y) = NOWT 'totally blown up
   
   Case EXPLODE To EXPLODED
   Block(x, y) = Block(x, y) + 1 'move to next frame
   
   Case EXPLODEDBOMB 'blow up loadsa boxes
    
    Block(x, y) = EXPLODE
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\BombExplode.wav", &H1
    
    For i2 = x + 1 To LEVELWIDTH
    If Block(i2, y) = BOX Then
       Block(i2, y) = EXPLODE
    Score = Score + 100
    Else
    If Block(i2, y) = BOMB Then Block(i2, i) = EXPLODINGBOMB
    If Block(i2, y) = TNT Then Block(i2, i) = TNTSETOFF
      Exit For
    End If
    Next
    
    For i2 = x - 1 To 0 Step -1
    If Block(i2, y) = BOX Then
       Block(i2, y) = EXPLODE
    Score = Score + 100
    Else
    If Block(i2, y) = BOMB Then Block(i2, i) = EXPLODINGBOMB
    If Block(i2, y) = TNT Then Block(i2, i) = TNTSETOFF
       Exit For
    End If
    Next
    
    For i2 = y + 1 To LEVELHEIGHT
    If Block(x, i2) = BOX Then
       Block(x, i2) = EXPLODE
     Score = Score + 100
   Else
    If Block(x, i2) = BOMB Then Block(i2, i) = EXPLODINGBOMB
    If Block(i2, y) = TNT Then Block(i2, i) = TNTSETOFF
      Exit For
    End If
    Next
   
    For i2 = y - 1 To 0 Step -1
    If Block(x, i2) = BOX Then
       Block(x, i2) = EXPLODE
    Score = Score + 100
    Else
    If Block(x, i2) = BOMB Then Block(i2, i) = EXPLODINGBOMB
    If Block(i2, y) = TNT Then Block(i2, i) = TNTSETOFF
      Exit For
    End If
    Next
  
   Case EXPLODINGBOMB To EXPLODEDBOMB 'animate countdown
    Block(x, y) = Block(x, y) + 1
   End Select
Next
Next



'paint each bit of the level onto the backbuffer, then copies onto form
PB.Cls
For x = 0 To LEVELWIDTH
For y = 0 To LEVELHEIGHT
   Select Case Block(x, y)
   Case TNT To TNTBLOWUP
   Pic(TNT) = TNTPic(Block(x, y) - 99)
   BitBlt PB.hdc, x * 40, y * 30, 40, 30, Pic(TNT).hdc, 0, 0, vbSrcCopy
   Case EXPLODE To EXPLODED
   Pic(EXPLODE) = ExplodePic(Block(x, y) - 10)
   BitBlt PB.hdc, x * 40, y * 30, 40, 30, Pic(EXPLODE).hdc, 0, 0, vbSrcCopy
   Case EXPLODINGBOMB To EXPLODEDBOMB
   Pic(EXPLODINGBOMB) = ExplodingBombPic(Block(x, y) - 30)
   BitBlt PB.hdc, x * 40, y * 30, 40, 30, Pic(EXPLODINGBOMB).hdc, 0, 0, vbSrcCopy
   Case Else
   BitBlt PB.hdc, x * 40, y * 30, 40, 30, Pic(Block(x, y)).hdc, 0, 0, vbSrcCopy
   End Select
Next
Next

'paint the paddle - stretching it to size
StretchBlt PB.hdc, Paddle.x, 280, Paddle.Size, 15, PaddlePic.hdc, 0, 0, 40, 30, vbSrcCopy

'move each ball
For i = 1 To UBound(Ball)
    'check for ball going out of bounds
    Select Case Ball(i).x + Ball(i).xm
        Case BALLRADIUS To 390
        Case Else 'ball hit sides
        Ball(i).xm = -Ball(i).xm
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\HitSide.wav", &H1
    End Select
    Select Case Ball(i).y
        Case Is < BALLRADIUS 'ball hits roof
        Ball(i).ym = -Ball(i).ym
    If SoundFX Then sndPlaySound App.Path & "\Resources\SoundFX\HitSide.wav", &H1
        Case Is > PBHEIGHT - 15 'ball lost of bottom of screen
        If UBound(Ball) = 1 Then GameOver 'if no more balls, it's game over
        For i2 = i + 1 To UBound(Ball)
        Ball(i2 - 1) = Ball(i2) 'else lose that ball
        Next
        ReDim Preserve Ball(1 To UBound(Ball) - 1)
    End Select
    
    'check for collisions
    If GetPixel(PB.hdc, Ball(i).x + Ball(i).xm + BALLRADIUS, Ball(i).y + Ball(i).ym) Then
        Ball(i).xm = -Ball(i).xm
        CheckForHits (TORIGHT)
        GoTo MoveIt
    End If
    
    If GetPixel(PB.hdc, Ball(i).x + Ball(i).xm - BALLRADIUS, Ball(i).y + Ball(i).ym) Then
        Ball(i).xm = -Ball(i).xm
        CheckForHits (TOLEFT)
        GoTo MoveIt
    End If
    
    If GetPixel(PB.hdc, Ball(i).x + Ball(i).xm, Ball(i).y + Ball(i).ym + BALLRADIUS) Then
        Ball(i).ym = -Ball(i).ym
        CheckForHits (BELOW)
        GoTo MoveIt
    End If
    
    If GetPixel(PB.hdc, Ball(i).x + Ball(i).xm, Ball(i).y + Ball(i).ym - BALLRADIUS) Then
        Ball(i).ym = -Ball(i).ym
        CheckForHits (ABOVE)
        GoTo MoveIt
    End If
MoveIt:
    'now move the ball
    Ball(i).x = Ball(i).x + Ball(i).xm
    Ball(i).y = Ball(i).y + Ball(i).ym
    'and paint it on the backbuffer
    PB.Circle (Ball(i).x, Ball(i).y), BALLRADIUS

Next

StretchBlt hdc, 0, 0, DispWidth, DispHeight, PB.hdc, 0, 0, 400, 300, vbSrcCopy

'I used this code to check the speed of the game
'FrameCount = FrameCount + 1
'Caption = FrameCount

'animate blocks to their next frame
BoxF = BoxF + 1
BombF = BombF + 1
PadF = PadF + 1
MetalF = MetalF + 1
If BoxF > BOXFRAMES Then BoxF = 0
If MetalF > METALFRAMES Then MetalF = 0
If BombF > BOMBFRAMES Then BombF = 0
If PadF > PADDLEFRAMES Then PadF = 0
Pic(BOX) = BoxPic(BoxF)
Pic(BOMB) = BombPic(BombF)
Pic(METAL) = MetalPic(MetalF)
PaddlePic = PadPic(PadF)

'display the score
Caption = "BreakOut - By Simon Price - Score = " & Score

Loop

End Sub

Public Sub LoadPics()
'load all the pictures
For i = 1 To PADDLEFRAMES
   Set PadPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\Paddle" & i & ".bmp")
Next
For i = 1 To BOXFRAMES
   Set BoxPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\Box" & i & ".bmp")
Next
For i = 1 To TNTFRAMES
   Set TNTPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\TNT" & i & ".bmp")
Next
For i = 1 To BOMBFRAMES
   Set BombPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\Bomb" & i & ".bmp")
Next
For i = 1 To METALFRAMES
   Set MetalPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\Metal" & i & ".bmp")
Next
For i = 1 To EXPLODEFRAMES
   Set ExplodePic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\Explode" & i & ".bmp")
Next
For i = 1 To EXPLODINGBOMBFRAMES
   Set ExplodingBombPic(i) = LoadPicture(App.Path & "\Resources\Pictures\Blocks\ExplodingBomb" & i & ".bmp")
Next
'put default pics in their places
PaddlePic.Picture = PadPic(1)
Pic(BOX).Picture = BoxPic(1)
Pic(BOMB).Picture = BombPic(1)
Pic(METAL).Picture = MetalPic(1)
Pic(EXPLODE).Picture = ExplodePic(1)
Pic(TNT).Picture = TNTPic(1)
End Sub

Sub GameOver()
Const CRAPSCORE = 1000
Const BADSCORE = 4000
Const OKSCORE = 7000
Const GOODSCORE = 10000
Const GREATSCORE = 20000
Const EXSCORE = 50000
Caption = "Game Over - Thankyou for playing one one King Si's Games - www.hispalace.fsbusiness.co.uk"
Select Case Score
Case NOWT
MsgBox "You didn't even score 1 point - that's terrible!", vbExclamation, "Game Over"
Case Is < CRAPSCORE
MsgBox "That score was abosolute crap! You only managed to get " & Score & " points!", vbExclamation, "Game Over"
Case Is < BADSCORE
MsgBox "You didn't do very well - you only scored " & Score & " points.", vbExclamation, "Game Over"
Case Is < OKSCORE
MsgBox "Not too bad, but you should do better than just " & Score & " points.", vbExclamation, "Game Over"
Case Is < GOODSCORE
MsgBox "Good score! - " & Score & " points.", vbInformation, "Game Over"
Case Is < GREATSCORE
MsgBox "Great score! - " & Score & " points. You are getting good at this game!", vbInformation, "Game Over"
Case Is < EXSCORE
MsgBox "Excellent score! - " & Score & " points. What a brilliant BreakOut player you are!", vbInformation, "Game Over"
Case Is >= EXSCORE
MsgBox "Unbelieveable score! - " & Score & " points. If you got this score, here this : You are very sad for playing this game for so long!", vbInformation, "Game Over"
End Select

If MsgBox("Do you want to play again?", vbYesNo + vbQuestion, "Just One More Go...") = vbYes Then
x = Int(Rnd * 6)
    If FirstTime Then
    FirstTime = False
    x = 0
    End If
Select Case x
Case 0
MsgBox "If you want to adjust your paddle size mid-game, just press the up and down arrow keys", vbInformation, "Game Tips"
Case 1
MsgBox "You can reset the game at any time by pressing the 'R' key", vbInformation, "Game Tip"
Case 2
MsgBox "You can quit instantly at any time by pressing escape", vbInformation, "Game Tip"
Case 3
MsgBox "Look for the bombs which will cause the biggest chain reactions", vbInformation, "Game Tip"
Case 4
MsgBox "Save your detonators until there are lots of bombs on the screen", vbInformation, "Game Tip"
Case Else
MsgBox "If you have to make a choice about which ball to lose, lose the one which has the least boxes around it", vbInformation, "Game Tip"
End Select
ResetLevel
Else
MsgBox "Thankyou for playing one of Si's Games. Don't forget to visit my website to download more games : www.hispalace.fsbusiness.co.uk", vbInformation, "Thankyou for playing"
End
End If
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Paddle.x = x
Select Case Paddle.x
Case Is < 0: Paddle.x = 0
Case Is > PBWIDTH - (Paddle.Size / 2): Paddle.x = PBWIDTH - Paddle.Size
End Select
End Sub
