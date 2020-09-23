VERSION 5.00
Begin VB.Form SForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Break-Out - by Simon Price"
   ClientHeight    =   5976
   ClientLeft      =   36
   ClientTop       =   276
   ClientWidth     =   5364
   Icon            =   "SForm.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5976
   ScaleWidth      =   5364
   StartUpPosition =   2  'CenterScreen
   Begin VB.HScrollBar BatSizeS 
      Height          =   252
      Left            =   2640
      Max             =   100
      Min             =   10
      TabIndex        =   10
      Top             =   3240
      Value           =   30
      Width           =   2652
   End
   Begin VB.Frame Frame3 
      Caption         =   "Stuff to hit !"
      Height          =   1812
      Left            =   120
      TabIndex        =   5
      Top             =   4080
      Width           =   5172
      Begin VB.Label Label3 
         Caption         =   "Metal blocks do not blow up! >>"
         Height          =   252
         Index           =   2
         Left            =   2160
         TabIndex        =   9
         Top             =   600
         Width           =   2292
      End
      Begin VB.Label Label3 
         Caption         =   "<< Blow up the blocks for points!"
         Height          =   252
         Index           =   1
         Left            =   840
         TabIndex        =   8
         Top             =   240
         Width           =   3372
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         Height          =   492
         Index           =   3
         Left            =   4440
         Picture         =   "SForm.frx":030A
         Stretch         =   -1  'True
         Top             =   480
         Width           =   612
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         Height          =   492
         Index           =   2
         Left            =   120
         Picture         =   "SForm.frx":0BFC
         Stretch         =   -1  'True
         Top             =   240
         Width           =   612
      End
      Begin VB.Label Label4 
         Caption         =   "Detonator : sets off all the bombs at once! >>"
         Height          =   252
         Left            =   1200
         TabIndex        =   7
         Top             =   1320
         Width           =   3132
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         Height          =   492
         Index           =   1
         Left            =   4440
         Picture         =   "SForm.frx":14EE
         Stretch         =   -1  'True
         Top             =   1200
         Width           =   612
      End
      Begin VB.Label Label3 
         Caption         =   "<< Bomb : set off a chain reaction of explosions!"
         Height          =   252
         Index           =   0
         Left            =   720
         TabIndex        =   6
         Top             =   960
         Width           =   3372
      End
      Begin VB.Image Image1 
         BorderStyle     =   1  'Fixed Single
         Height          =   492
         Index           =   0
         Left            =   120
         Picture         =   "SForm.frx":1DE0
         Stretch         =   -1  'True
         Top             =   960
         Width           =   612
      End
   End
   Begin VB.CommandButton cmdGO 
      Caption         =   "GO!"
      Height          =   372
      Left            =   3360
      TabIndex        =   4
      Top             =   3600
      Width           =   1332
   End
   Begin VB.Frame Frame2 
      Caption         =   "See More Games"
      Height          =   2772
      Left            =   2640
      TabIndex        =   2
      Top             =   120
      Width           =   2532
      Begin VB.Label Label2 
         Caption         =   $"SForm.frx":26D2
         Height          =   2292
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   2292
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "How to Play"
      Height          =   3732
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2412
      Begin VB.Label Label1 
         Caption         =   $"SForm.frx":2815
         Height          =   3252
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   2172
      End
   End
   Begin VB.Label BatSizeL 
      Caption         =   "Size of bat = 30"
      Height          =   252
      Left            =   2640
      TabIndex        =   11
      Top             =   3000
      Width           =   2532
   End
End
Attribute VB_Name = "SForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub BatSizeS_Change()
Paddle.Size = BatSizeS.Value
BatSizeL = "Size of bat = " & Paddle.Size
End Sub

Private Sub cmdGO_Click()
GForm.Visible = True
Unload Me
End Sub

Private Sub Form_Load()
Paddle.Size = 30
End Sub
