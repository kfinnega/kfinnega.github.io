( defclass piece ()
  ( 
    ( color :accessor color )
	( type :accessor type )
	( current-square :accessor cs )
	( desired-square :accessor ds :initargs nil )
  )
)



( defclass rook ( piece )
  (
	( val :accessor val :initform 5 )
  )
)

( setf *wrook-table*
  ( make-array '( 8 8 ) :initial-contents
    '( ( 0  0  0  0  0  0  0  0 )
       ( 0.5 1  1  1  1  1  1  0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( 0  0  0  0.5 0.5  0  0  0 ) 
	 ) 
  ) 
)

( setf *brook-table*
  ( make-array '( 8 8 ) :initial-contents
    '( ( 0  0  0  0  0  0  0  0 )
       ( -0.5 0  0  0  0  0  0  -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( -0.5 0  0  0  0  0  0 -0.5 )
       ( 0.5 1  1  1  1  1  1 0.5 )
       ( 0  0  0  0.5 0.5  0  0  0 ) 
    ) 
  ) 
)


( defmethod initialize-instance :after ( ( rook rook ) &rest initargs )
  ( setf ( type rook ) 'rook)
)

( defclass bishop ( piece )
  (
	( val :accessor val :initform 3 )
  )
)

( setf *wbishop-table*
  ( make-array '(8 8) :initial-contents
    '( ( -2 -1 -1 -1 -1 -1 -1 -2 )
       ( -1  0  0  0  0  0  0 -1 )
       ( -1  0  0.5 1  1  0.5 0 -1 )
       ( -1  0.5 0.5 1  1  0.5 0.5 -1 )
       ( -1  0  1  1  1  1  0 -1 )
       ( -1  1  1  1  1  1  1 -1 )
       ( -1  0.5 0  0  0  0  0.5 -1 )
       ( -2 -1 -1 -1 -1 -1 -1 -2 ) 
	 ) 
  ) 
)

( setf *bbishop-table*
  ( make-array '(8 8) :initial-contents
    '( ( -2 -1 -1 -1 -1 -1 -1 -2 )
       ( -1  0.5 0  0  0  0  0.5 -1 )
       ( -1  1  1  1  1  1  1 -1 )
       ( -1  0  1  1  1  1  0 -1 )
       ( -1  0.5 0.5 1  1  0.5 0.5 -1 )
       ( -1  0  0.5 1  1  0.5 0 -1 )
       ( -1  0  0  0  0  0  0 -1 )
       ( -2 -1 -1 -1 -1 -1 -1 -2 ) 
	 ) 
  ) 
)


( defmethod initialize-instance :after ( ( bishop bishop ) &rest initargs )
  ( setf ( type bishop ) 'bishop)
)



( defclass queen ( piece )
  (
	( val :accessor val :initform 9 )
  )
)

( setf *queen-table*
  ( make-array '(8 8) :initial-contents
    '( ( -2  -1  -1  -0.5 -0.5 -1  -1  -2 )
       ( -1   0   0   0   0   0   0  -1 )
       ( -1   0   0.5 0.5 0.5 0.5  0  -1 )
       ( -0.5 0   0.5 0.5 0.5 0.5  0  -0.5 )
       ( 0    0   0.5 0.5 0.5 0.5  0  -0.5 )
       ( -1   0.5 0.5 0.5 0.5 0.5 0.5 -1 )
       ( -1   0   0   0   0   0   0  -1 )
       ( -2  -1  -1  -0.5 -0.5 -1  -1  -2 )
	 )
  )
)

( defmethod initialize-instance :after ( ( queen queen ) &rest initargs )
  ( setf ( type queen ) 'queen)
)

( defclass king ( piece )
  (
	( caputered :accessor caputered :initargs nil )
  )
)

( setf *wking-table*
  ( make-array '(8 8) :initial-contents
    '( ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -2 -3 -3 -4 -4 -3 -3 -2 )
       ( -1 -2 -2 -2 -2 -2 -2 -1 )
       ( 2  2  0  0  0  0  2  2 )
       ( 2  3  1  0  0  1  3  2 )
	 )
  )
)

( setf *bking-table*
  ( make-array '(8 8) :initial-contents
    '( ( -2 -3 -3 -4 -4 -3 -3 -2 )
       ( -1 -2 -2 -2 -2 -2 -2 -1 )
       ( 2  2  0  0  0  0  2  2 )
       ( 2  3  1  0  0  1  3  2 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
       ( -3 -4 -4 -5 -5 -4 -4 -3 )
	 )
  )
)


( defmethod initialize-instance :after ( ( king king ) &rest initargs )
  ( setf ( type king ) 'king)
)


( defclass knight ( piece )
  (
	( val :accessor val :initform 3 )
  )
)

( setf *knight-table*
  ( make-array '( 8 8 ) :initial-contents
    '( ( -5 -4 -3 -3 -3 -3 -4 -5 )
       ( -4 -2  0  0  0  0 -2 -4 )
       ( -3  0  1  1.5 1.5  1  0 -3 )
       ( -3  0.5 1.5  2  2  1.5 0.5 -3 )
       ( -3  0.5 1.5  2  2  1.5 0.5 -3 )
       ( -3  0  1  1.5 1.5  1  0 -3 )
       ( -4 -2  0  0  0  0 -2 -4 )
       ( -5 -4 -3 -3 -3 -3 -4 -5 ) 
	 )
  )
)

( defmethod initialize-instance :after ( ( knight knight ) &rest initargs )
  ( setf ( type knight ) 'knight)
)


( defclass pawn ( piece ) 
  (
	( val :accessor val :initform 1 )
  )
)

( defmethod initialize-instance :after ( ( pawn pawn ) &rest initargs )
  ( setf ( type pawn ) 'pawn)
)

( setf *wpawn-table*
  ( make-array '(8 8) :initial-contents
    '( ( 0  0  0  0  0  0  0  0 )
       ( 5  5  5  5  5  5  5  5 )
       ( 1  1  2  3  3  2  1  1 )
       ( 0  0  0  4  4  0  0  0 )
       ( 1  1  1 -2 -2  1  1  1 )
       ( 1 -1 -2  0  0 -2 -1  1 )
       ( 1  2  2 -1 -1  2  2  1 )
       ( 0  0  0  0  0  0  0  0 ) 
	) 
  ) 
)

( setf *bpawn-table*
  ( make-array '(8 8) :initial-contents
    '( ( 0  0  0  0  0  0  0  0 )
      ( 1  2  2 -1 -1  2  2  1 ) 
      ( 1 -1 -2  0  0 -2 -1  1 )
      ( 1  1  1 -2 -2  1  1  1 )
      ( 0  0  0  4  4  0  0  0 )
      ( 1  1  2  3  3  2  1  1 )
      ( 5  5  5  5  5  5  5  5 )
      ( 0  0  0  0  0  0  0  0 )
	)
  )
)



( defun make-wpieces () 
	( setf wrook1 (make-instance 'rook) )
	( setf wrook2 (make-instance 'rook) )

	( setf wbishop1 (make-instance 'bishop) )
	( setf wbishop2 (make-instance 'bishop) )

	( setf wknight1 (make-instance 'knight) )
	( setf wknight2 (make-instance 'knight) )

	( setf wking (make-instance 'king) )
	( setf wqueen (make-instance 'queen) )

	( setf wpawn1 ( make-instance 'pawn ) )
	( setf wpawn2 ( make-instance 'pawn ) )
	( setf wpawn3 ( make-instance 'pawn ) )
	( setf wpawn4 ( make-instance 'pawn ) )
	( setf wpawn5 ( make-instance 'pawn ) )
	( setf wpawn6 ( make-instance 'pawn ) )
	( setf wpawn7 ( make-instance 'pawn ) )
	( setf wpawn8 ( make-instance 'pawn ) )


	( setf ( cs wrook1 ) a1)
	( setf ( cs wrook2 ) h1)

	( setf ( cs wknight1 ) b1)
	( setf ( cs wknight2 ) g1)

	( setf ( cs wking ) e1)
	( setf ( cs wqueen ) d1)

	( setf ( cs wpawn1 ) a2 ) 
	( setf ( cs wpawn2 ) b2 ) 
	( setf ( cs wpawn3 ) c2 ) 
	( setf ( cs wpawn4 ) d2 ) 
	( setf ( cs wpawn5 ) e2 ) 
	( setf ( cs wpawn6 ) f2 ) 
	( setf ( cs wpawn7 ) g2 ) 
	( setf ( cs wpawn8 ) h2 ) 

	( setf ( cs wbishop1 ) c1)
	( setf ( cs wbishop2 ) f1)

	( setf ( occupier (cs wbishop1) ) wbishop1) 
	( setf ( occupier (cs wbishop2) ) wbishop2)

	( setf ( occupier (cs wknight1) ) wknight1)
	( setf ( occupier (cs wknight2) ) wknight2)
	 
	( setf ( occupier (cs wrook1) ) wrook1) 
	( setf ( occupier (cs wrook2) ) wrook2) 

	( setf ( occupier (cs wking) ) wking) 
	( setf ( occupier (cs wqueen) ) wqueen) 

	( setf ( occupier (cs wpawn1) ) wpawn1 )
	( setf ( occupier (cs wpawn2) ) wpawn2 )
	( setf ( occupier (cs wpawn3) ) wpawn3 )
	( setf ( occupier (cs wpawn4) ) wpawn4 )
	( setf ( occupier (cs wpawn5) ) wpawn5 )
	( setf ( occupier (cs wpawn6) ) wpawn6 )
	( setf ( occupier (cs wpawn7) ) wpawn7 )
	( setf ( occupier (cs wpawn8) ) wpawn8 )

	( setf ( color wpawn1 ) 'w )
	( setf ( color wpawn2 ) 'w )
	( setf ( color wpawn3 ) 'w )
	( setf ( color wpawn4 ) 'w )
	( setf ( color wpawn5 ) 'w )
	( setf ( color wpawn6 ) 'w )
	( setf ( color wpawn7 ) 'w )
	( setf ( color wpawn8 ) 'w )

	( setf ( color wrook1 ) 'w )
	( setf ( color wrook2 ) 'w )

	( setf ( color wbishop1 ) 'w )
	( setf ( color wbishop2 ) 'w )

	( setf ( color wknight1 ) 'w )
	( setf ( color wknight2 ) 'w )

	( setf ( color wqueen ) 'w )
	( setf ( color wking ) 'w )
	( setf *white-pieces* ( list wking wqueen wknight1 wknight2 wbishop1 wbishop2 wrook1 wrook2 wpawn1 wpawn2 wpawn3 wpawn4 wpawn5 wpawn6 wpawn7 wpawn8 ) )
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


( defun make-bpieces () 
	( setf brook1 (make-instance 'rook) )
	( setf brook2 (make-instance 'rook) )

	( setf bbishop1 (make-instance 'bishop) )
	( setf bbishop2 (make-instance 'bishop) )

	( setf bknight1 (make-instance 'knight) )
	( setf bknight2 (make-instance 'knight) )

	( setf bking (make-instance 'king) )
	( setf bqueen (make-instance 'queen) )

	( setf bpawn1 ( make-instance 'pawn ) )
	( setf bpawn2 ( make-instance 'pawn ) )
	( setf bpawn3 ( make-instance 'pawn ) )
	( setf bpawn4 ( make-instance 'pawn ) )
	( setf bpawn5 ( make-instance 'pawn ) )
	( setf bpawn6 ( make-instance 'pawn ) )
	( setf bpawn7 ( make-instance 'pawn ) )
	( setf bpawn8 ( make-instance 'pawn ) )


	( setf ( cs brook1 ) a8)
	( setf ( cs brook2 ) h8)
	( setf ( cs bknight1 ) b8)
	( setf ( cs bknight2 ) g8)
	( setf ( cs bking ) d8)
	( setf ( cs bqueen ) e8)
	( setf ( cs bpawn1 ) a7 ) 
	( setf ( cs bpawn2 ) b7 ) 
	( setf ( cs bpawn3 ) c7 ) 
	( setf ( cs bpawn4 ) d7 ) 
	( setf ( cs bpawn5 ) e7 ) 
	( setf ( cs bpawn6 ) f7 ) 
	( setf ( cs bpawn7 ) g7 ) 
	( setf ( cs bpawn8 ) h7 ) 
	( setf ( cs bbishop1 ) c8)
	( setf ( cs bbishop2 ) f8)

	( setf ( occupier (cs bbishop1) ) bbishop1) 
	( setf ( occupier (cs bbishop2) ) bbishop2)
	( setf ( occupier (cs bknight1) ) bknight1)
	( setf ( occupier (cs bknight2) ) bknight2)
	( setf ( occupier (cs brook1) ) brook1) 
	( setf ( occupier (cs brook2) ) brook2) 
	( setf ( occupier (cs bking) ) bking) 
	( setf ( occupier (cs bqueen) ) bqueen) 
	( setf ( occupier (cs bpawn1) ) bpawn1 )
	( setf ( occupier (cs bpawn2) ) bpawn2 )
	( setf ( occupier (cs bpawn3) ) bpawn3 )
	( setf ( occupier (cs bpawn4) ) bpawn4 )
	( setf ( occupier (cs bpawn5) ) bpawn5 )
	( setf ( occupier (cs bpawn6) ) bpawn6 )
	( setf ( occupier (cs bpawn7) ) bpawn7 )
	( setf ( occupier (cs bpawn8) ) bpawn8 )

	( setf ( color bpawn1 ) 'b )
	( setf ( color bpawn2 ) 'b )
	( setf ( color bpawn3 ) 'b )
	( setf ( color bpawn4 ) 'b )
	( setf ( color bpawn5 ) 'b )
	( setf ( color bpawn6 ) 'b )
	( setf ( color bpawn7 ) 'b )
	( setf ( color bpawn8 ) 'b )

	( setf ( color brook1 ) 'b )
	( setf ( color brook2 ) 'b )

	( setf ( color bbishop1 ) 'b )
	( setf ( color bbishop2 ) 'b )

	( setf ( color bknight1 ) 'b )
	( setf ( color bknight2 ) 'b )

	( setf ( color bqueen ) 'b )
	( setf ( color bking ) 'b )
	
	( setf *black-pieces* ( list bking bqueen bknight1 bknight2 bbishop1 bbishop2 brook1 brook2 bpawn1 bpawn2 bpawn3 bpawn4 bpawn5 bpawn6 bpawn7 bpawn8 ) )
)

( defun reset-wpieces () 
  ( setf ( cs wrook1 ) a1)
  ( setf ( cs wrook2 ) h1)
  ( setf ( cs wknight1 ) b1)
  ( setf ( cs wknight2 ) g1)
  ( setf ( cs wking ) e1)
  ( setf ( cs wqueen ) d1)
  ( setf ( cs wpawn1 ) a2 ) 
  ( setf ( cs wpawn2 ) b2 ) 
  ( setf ( cs wpawn3 ) c2 ) 
  ( setf ( cs wpawn4 ) d2 ) 
  ( setf ( cs wpawn5 ) e2 ) 
  ( setf ( cs wpawn6 ) f2 ) 
  ( setf ( cs wpawn7 ) g2 ) 
  ( setf ( cs wpawn8 ) h2 ) 
  ( setf ( cs wbishop1 ) c1)
  ( setf ( cs wbishop2 ) f1)
  ( setf ( occupier (cs wbishop1) ) wbishop1) 
  ( setf ( occupier (cs wbishop2) ) wbishop2)
  ( setf ( occupier (cs wknight1) ) wknight1)
  ( setf ( occupier (cs wknight2) ) wknight2)
  ( setf ( occupier (cs wrook1) ) wrook1) 
  ( setf ( occupier (cs wrook2) ) wrook2) 
  ( setf ( occupier (cs wking) ) wking) 
  ( setf ( occupier (cs wqueen) ) wqueen) 
  ( setf ( occupier (cs wpawn1) ) wpawn1 )
  ( setf ( occupier (cs wpawn2) ) wpawn2 )
  ( setf ( occupier (cs wpawn3) ) wpawn3 )
  ( setf ( occupier (cs wpawn4) ) wpawn4 )
  ( setf ( occupier (cs wpawn5) ) wpawn5 )
  ( setf ( occupier (cs wpawn6) ) wpawn6 )
  ( setf ( occupier (cs wpawn7) ) wpawn7 )
  ( setf ( occupier (cs wpawn8) ) wpawn8 )
 )
 
 ( defun reset-bpieces () 
   	( setf ( cs brook1 ) a8)
	( setf ( cs brook2 ) h8)
	( setf ( cs bknight1 ) b8)
	( setf ( cs bknight2 ) g8)
	( setf ( cs bking ) d8)
	( setf ( cs bqueen ) e8)
	( setf ( cs bpawn1 ) a7 ) 
	( setf ( cs bpawn2 ) b7 ) 
	( setf ( cs bpawn3 ) c7 ) 
	( setf ( cs bpawn4 ) d7 ) 
	( setf ( cs bpawn5 ) e7 ) 
	( setf ( cs bpawn6 ) f7 ) 
	( setf ( cs bpawn7 ) g7 ) 
	( setf ( cs bpawn8 ) h7 ) 
	( setf ( cs bbishop1 ) c8)
	( setf ( cs bbishop2 ) f8)
	( setf ( occupier (cs bbishop1) ) bbishop1) 
	( setf ( occupier (cs bbishop2) ) bbishop2)
	( setf ( occupier (cs bknight1) ) bknight1)
	( setf ( occupier (cs bknight2) ) bknight2)
	( setf ( occupier (cs brook1) ) brook1) 
	( setf ( occupier (cs brook2) ) brook2) 
	( setf ( occupier (cs bking) ) bking) 
	( setf ( occupier (cs bqueen) ) bqueen) 
	( setf ( occupier (cs bpawn1) ) bpawn1 )
	( setf ( occupier (cs bpawn2) ) bpawn2 )
	( setf ( occupier (cs bpawn3) ) bpawn3 )
	( setf ( occupier (cs bpawn4) ) bpawn4 )
	( setf ( occupier (cs bpawn5) ) bpawn5 )
	( setf ( occupier (cs bpawn6) ) bpawn6 )
	( setf ( occupier (cs bpawn7) ) bpawn7 )
	( setf ( occupier (cs bpawn8) ) bpawn8 )
 )
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions and objects used to create the chessboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( defclass chessboard () 
  ( 
    ( squares :accessor board :initform ( make-blank-chessboard ) )
  )
)


( defclass square () 
  (  
    ( rank :initarg :rank :accessor rank )
	( file :initarg :file :accessor file )
	( occupied-by :accessor occupier :initform nil )
	( northwest-square :accessor nw :initform nil )
	( north-square :accessor n :initform nil )
	( northeast-square :accessor ne :initform nil )
	( east-square :accessor e :initform nil )
	( southwest-square :accessor sw :initform nil )
	( south-square :accessor s :initform nil )
	( southeast-square :accessor se :initform nil )
	( west-square :accessor w :initform nil )
	( number :initarg :number :accessor number :initform nil )
  )
)

(defmethod print-square ((sq square))
  (format t "~A, ~A~%" (file sq) (rank sq)))



( defun make-blank-chessboard ( &aux board num )
  ( setf num 0 )
  ( setf board ( make-array '(8 8) ) )
  ( loop for i from 0 to 7 do
    ( loop for j from 0 to 7 do
      ( setf ( aref board i j ) ( make-instance 'square :rank i :file j :number num) )
      ( incf num )	  
	) 
  )
  board  
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to display the game board
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defun display-border ()
  ( format t "  |----------------------------------| ~%" )
)

( defun display-no-square-row () 
  ( format t "  |                                  | ~%" )
)

( defun display-empty-row () 
  ( display-no-square-row)
  ( format t "|  --  --  --  --  --  --  --  --  | ~%" )
)

( defun display-empty-board () 
	( display-border )
	( loop for i downto 1 from 8 do 
	  ( display-empty-row )
	)
	( display-no-square-row )
	( display-border )
)

( defun display-last-line () 
  ( format t "     A   B   C   D    E   F   G   H  ~%~%" )
)

( defmethod display-square ( ( square square ) )
  ( cond 
    ( ( equal nil ( occupier square ) ) 
	  ( format t " -- " )
    )
	( ( eq (type ( occupier square ) ) 'rook )
	  ( format t " ~AR " ( color ( occupier square ) ) ) 
	)
	( ( eq (type ( occupier square ) ) 'king )
	  ( format t " ~AK " ( color ( occupier square ) ) ) 
	)
	( ( eq (type ( occupier square ) ) 'bishop )
	  ( format t " ~AB " ( color ( occupier square ) ) )
	)
	( ( eq (type ( occupier square ) ) 'queen )
	  ( format t " ~AQ " ( color ( occupier square ) ) )
	)
	( ( eq (type ( occupier square ) ) 'pawn )
	  ( format t " ~AP " ( color ( occupier square ) ) )
	)
	( ( eq (type ( occupier square ) ) 'knight )
	  ( format t " ~AN " ( color ( occupier square ) ) )
	)
  )
)

( defmethod display-row ( ( x integer ) ( board chessboard ) )
  (format t "~A | " ( + x 1 ) )
  ( loop for i from 0 to 7 do
    ( let ( ( square ( aref ( board board ) x i ) ) ) 
    ( display-square square ) )
  )
  ( format t " | ~%")
)

( defmethod display-board ( ( board chessboard ) )
  ( display-border )
  ( display-no-square-row )
  ( loop for i downto 0 from 7 do 
	( display-row i board )
	( display-no-square-row )
  )
  ( display-border )
  ( display-last-line )
)

( defun make-gameboard () 
  ( setf *gameboard* ( make-instance 'chessboard ) )

  (setf A1 (aref (board *gameboard*) 0 0)) (setf B1 (aref (board *gameboard*) 0 1)) (setf C1 (aref (board *gameboard*) 0 2)) (setf D1 (aref (board *gameboard*) 0 3)) (setf E1 (aref (board *gameboard*) 0 4)) (setf F1 (aref (board *gameboard*) 0 5)) (setf G1 (aref (board *gameboard*) 0 6)) (setf H1 (aref (board *gameboard*) 0 7))
  (setf A2 (aref (board *gameboard*) 1 0)) (setf B2 (aref (board *gameboard*) 1 1)) (setf C2 (aref (board *gameboard*) 1 2)) (setf D2 (aref (board *gameboard*) 1 3)) (setf E2 (aref (board *gameboard*) 1 4)) (setf F2 (aref (board *gameboard*) 1 5)) (setf G2 (aref (board *gameboard*) 1 6)) (setf H2 (aref (board *gameboard*) 1 7))
  (setf A3 (aref (board *gameboard*) 2 0)) (setf B3 (aref (board *gameboard*) 2 1)) (setf C3 (aref (board *gameboard*) 2 2)) (setf D3 (aref (board *gameboard*) 2 3)) (setf E3 (aref (board *gameboard*) 2 4)) (setf F3 (aref (board *gameboard*) 2 5)) (setf G3 (aref (board *gameboard*) 2 6)) (setf H3 (aref (board *gameboard*) 2 7))
  (setf A4 (aref (board *gameboard*) 3 0)) (setf B4 (aref (board *gameboard*) 3 1)) (setf C4 (aref (board *gameboard*) 3 2)) (setf D4 (aref (board *gameboard*) 3 3)) (setf E4 (aref (board *gameboard*) 3 4)) (setf F4 (aref (board *gameboard*) 3 5)) (setf G4 (aref (board *gameboard*) 3 6)) (setf H4 (aref (board *gameboard*) 3 7))
  (setf A5 (aref (board *gameboard*) 4 0)) (setf B5 (aref (board *gameboard*) 4 1)) (setf C5 (aref (board *gameboard*) 4 2)) (setf D5 (aref (board *gameboard*) 4 3)) (setf E5 (aref (board *gameboard*) 4 4)) (setf F5 (aref (board *gameboard*) 4 5)) (setf G5 (aref (board *gameboard*) 4 6)) (setf H5 (aref (board *gameboard*) 4 7))
  (setf A6 (aref (board *gameboard*) 5 0)) (setf B6 (aref (board *gameboard*) 5 1)) (setf C6 (aref (board *gameboard*) 5 2)) (setf D6 (aref (board *gameboard*) 5 3)) (setf E6 (aref (board *gameboard*) 5 4)) (setf F6 (aref (board *gameboard*) 5 5)) (setf G6 (aref (board *gameboard*) 5 6)) (setf H6 (aref (board *gameboard*) 5 7))
  (setf A7 (aref (board *gameboard*) 6 0)) (setf B7 (aref (board *gameboard*) 6 1)) (setf C7 (aref (board *gameboard*) 6 2)) (setf D7 (aref (board *gameboard*) 6 3)) (setf E7 (aref (board *gameboard*) 6 4)) (setf F7 (aref (board *gameboard*) 6 5)) (setf G7 (aref (board *gameboard*) 6 6)) (setf H7 (aref (board *gameboard*) 6 7))
  (setf A8 (aref (board *gameboard*) 7 0)) (setf B8 (aref (board *gameboard*) 7 1)) (setf C8 (aref (board *gameboard*) 7 2)) (setf D8 (aref (board *gameboard*) 7 3)) (setf E8 (aref (board *gameboard*) 7 4)) (setf F8 (aref (board *gameboard*) 7 5)) (setf G8 (aref (board *gameboard*) 7 6)) (setf H8 (aref (board *gameboard*) 7 7))

  (setf rank1 (list (setf A1 (aref (board *gameboard*) 0 0)) (setf B1 (aref (board *gameboard*) 0 1)) (setf C1 (aref (board *gameboard*) 0 2)) (setf D1 (aref (board *gameboard*) 0 3)) (setf E1 (aref (board *gameboard*) 0 4)) (setf F1 (aref (board *gameboard*) 0 5)) (setf G1 (aref (board *gameboard*) 0 6)) (setf H1 (aref (board *gameboard*) 0 7))))
  (setf rank2 (list (setf A2 (aref (board *gameboard*) 1 0)) (setf B2 (aref (board *gameboard*) 1 1)) (setf C2 (aref (board *gameboard*) 1 2)) (setf D2 (aref (board *gameboard*) 1 3)) (setf E2 (aref (board *gameboard*) 1 4)) (setf F2 (aref (board *gameboard*) 1 5)) (setf G2 (aref (board *gameboard*) 1 6)) (setf H2 (aref (board *gameboard*) 1 7))))
  (setf rank3 (list (setf A3 (aref (board *gameboard*) 2 0)) (setf B3 (aref (board *gameboard*) 2 1)) (setf C3 (aref (board *gameboard*) 2 2)) (setf D3 (aref (board *gameboard*) 2 3)) (setf E3 (aref (board *gameboard*) 2 4)) (setf F3 (aref (board *gameboard*) 2 5)) (setf G3 (aref (board *gameboard*) 2 6)) (setf H3 (aref (board *gameboard*) 2 7))))
  (setf rank4 (list (setf A4 (aref (board *gameboard*) 3 0)) (setf B4 (aref (board *gameboard*) 3 1)) (setf C4 (aref (board *gameboard*) 3 2)) (setf D4 (aref (board *gameboard*) 3 3)) (setf E4 (aref (board *gameboard*) 3 4)) (setf F4 (aref (board *gameboard*) 3 5)) (setf G4 (aref (board *gameboard*) 3 6)) (setf H4 (aref (board *gameboard*) 3 7))))
  (setf rank5 (list (setf A5 (aref (board *gameboard*) 4 0)) (setf B5 (aref (board *gameboard*) 4 1)) (setf C5 (aref (board *gameboard*) 4 2)) (setf D5 (aref (board *gameboard*) 4 3)) (setf E5 (aref (board *gameboard*) 4 4)) (setf F5 (aref (board *gameboard*) 4 5)) (setf G5 (aref (board *gameboard*) 4 6)) (setf H5 (aref (board *gameboard*) 4 7))))
  (setf rank6 (list (setf A6 (aref (board *gameboard*) 5 0)) (setf B6 (aref (board *gameboard*) 5 1)) (setf C6 (aref (board *gameboard*) 5 2)) (setf D6 (aref (board *gameboard*) 5 3)) (setf E6 (aref (board *gameboard*) 5 4)) (setf F6 (aref (board *gameboard*) 5 5)) (setf G6 (aref (board *gameboard*) 5 6)) (setf H6 (aref (board *gameboard*) 5 7))))
  (setf rank7 (list (setf A7 (aref (board *gameboard*) 6 0)) (setf B7 (aref (board *gameboard*) 6 1)) (setf C7 (aref (board *gameboard*) 6 2)) (setf D7 (aref (board *gameboard*) 6 3)) (setf E7 (aref (board *gameboard*) 6 4)) (setf F7 (aref (board *gameboard*) 6 5)) (setf G7 (aref (board *gameboard*) 6 6)) (setf H7 (aref (board *gameboard*) 6 7))))
  (setf rank8 (list (setf A8 (aref (board *gameboard*) 7 0)) (setf B8 (aref (board *gameboard*) 7 1)) (setf C8 (aref (board *gameboard*) 7 2)) (setf D8 (aref (board *gameboard*) 7 3)) (setf E8 (aref (board *gameboard*) 7 4)) (setf F8 (aref (board *gameboard*) 7 5)) (setf G8 (aref (board *gameboard*) 7 6)) (setf H8 (aref (board *gameboard*) 7 7))))

  (setf fileA (list (setf A1 (aref (board *gameboard*) 0 0)) (setf A2 (aref (board *gameboard*) 1 0)) (setf A3 (aref (board *gameboard*) 2 0)) (setf A4 (aref (board *gameboard*) 3 0)) (setf A5 (aref (board *gameboard*) 4 0)) (setf A6 (aref (board *gameboard*) 5 0)) (setf A7 (aref (board *gameboard*) 6 0)) (setf A8 (aref (board *gameboard*) 7 0))))
  (setf fileB (list (setf B1 (aref (board *gameboard*) 0 1)) (setf B2 (aref (board *gameboard*) 1 1)) (setf B3 (aref (board *gameboard*) 2 1)) (setf B4 (aref (board *gameboard*) 3 1)) (setf B5 (aref (board *gameboard*) 4 1)) (setf B6 (aref (board *gameboard*) 5 1)) (setf B7 (aref (board *gameboard*) 6 1)) (setf B8 (aref (board *gameboard*) 7 1))))
  (setf fileC (list (setf D1 (aref (board *gameboard*) 0 2)) (setf D2 (aref (board *gameboard*) 1 2)) (setf D3 (aref (board *gameboard*) 2 2)) (setf D4 (aref (board *gameboard*) 3 2)) (setf D5 (aref (board *gameboard*) 4 2)) (setf D6 (aref (board *gameboard*) 5 2)) (setf D7 (aref (board *gameboard*) 6 2)) (setf D8 (aref (board *gameboard*) 7 2))))
  (setf fileD (list (setf D1 (aref (board *gameboard*) 0 3)) (setf D2 (aref (board *gameboard*) 1 3)) (setf D3 (aref (board *gameboard*) 2 3)) (setf D4 (aref (board *gameboard*) 3 3)) (setf D5 (aref (board *gameboard*) 4 3)) (setf D6 (aref (board *gameboard*) 5 3)) (setf D7 (aref (board *gameboard*) 6 3)) (setf D8 (aref (board *gameboard*) 7 3))))
  (setf fileE (list (setf E1 (aref (board *gameboard*) 0 4)) (setf E2 (aref (board *gameboard*) 1 4)) (setf E3 (aref (board *gameboard*) 2 4)) (setf E4 (aref (board *gameboard*) 3 4)) (setf E5 (aref (board *gameboard*) 4 4)) (setf E6 (aref (board *gameboard*) 5 4)) (setf E7 (aref (board *gameboard*) 6 4)) (setf E8 (aref (board *gameboard*) 7 4))))
  (setf fileF (list (setf F1 (aref (board *gameboard*) 0 5)) (setf F2 (aref (board *gameboard*) 1 5)) (setf F3 (aref (board *gameboard*) 2 5)) (setf F4 (aref (board *gameboard*) 3 5)) (setf F5 (aref (board *gameboard*) 4 5)) (setf F6 (aref (board *gameboard*) 5 5)) (setf F7 (aref (board *gameboard*) 6 5)) (setf F8 (aref (board *gameboard*) 7 5))))
  (setf fileG (list (setf G1 (aref (board *gameboard*) 0 6)) (setf G2 (aref (board *gameboard*) 1 6)) (setf G3 (aref (board *gameboard*) 2 6)) (setf G4 (aref (board *gameboard*) 3 6)) (setf G5 (aref (board *gameboard*) 4 6)) (setf G6 (aref (board *gameboard*) 5 6)) (setf G7 (aref (board *gameboard*) 6 6)) (setf G8 (aref (board *gameboard*) 7 6))))
  (setf fileH (list (setf H1 (aref (board *gameboard*) 0 7)) (setf H2 (aref (board *gameboard*) 1 7)) (setf H3 (aref (board *gameboard*) 2 7)) (setf H4 (aref (board *gameboard*) 3 7)) (setf H5 (aref (board *gameboard*) 4 7)) (setf H6 (aref (board *gameboard*) 5 7)) (setf H7 (aref (board *gameboard*) 6 7)) (setf H8 (aref (board *gameboard*) 7 7))))

  ( setf ( n a1 ) a2 ) ( setf ( ne a1 ) b2 ) ( setf ( e a1 ) b1 )
  ( setf ( w b1 ) a1 ) ( setf ( nw c1 ) c2 ) ( setf ( n b1 ) b2 ) ( setf ( ne b1 ) c2 ) ( setf ( e b1 ) c1 )
  ( setf ( w c1 ) b1 ) ( setf ( nw c1 ) b2 ) ( setf ( n c1 ) c2 ) ( setf ( ne c1 ) d2 ) ( setf ( e c1 ) d1 )
  ( setf ( w d1 ) c1 ) ( setf ( nw d1 ) c2 ) ( setf ( n d1 ) d2 ) ( setf ( ne d1 ) e2 ) ( setf ( e d1 ) e1 )
  ( setf ( w e1 ) d1 ) ( setf ( nw e1 ) d2 ) ( setf ( n e1 ) e2 ) ( setf ( ne e1 ) f2 ) ( setf ( e e1 ) f1 )
  ( setf ( w f1 ) e1 ) ( setf ( nw f1 ) e2 ) ( setf ( n f1 ) f2 ) ( setf ( ne f1 ) g2 ) ( setf ( e f1 ) g1 )
  ( setf ( w g1 ) f1 ) ( setf ( nw g1 ) d2 ) ( setf ( n g1 ) e2 ) ( setf ( ne g1 ) h2 ) ( setf ( e g1 ) h1 ) 
  ( setf ( w h1 ) g1 ) ( setf ( nw h1 ) g2 ) ( setf ( n h1 ) h2 ) 

                                             ( setf ( n a2 ) a3 ) ( setf ( ne a2 ) b3 ) ( setf ( e a2 ) b2 )                       ( setf ( s a2 ) a1 ) ( setf ( se a2 ) b1 )
  ( setf ( w b2 ) a2 ) ( setf ( nw b2 ) a3 ) ( setf ( n b2 ) b3 ) ( setf ( ne b2 ) c3 ) ( setf ( e b2 ) c2 ) ( setf ( sw b2 ) a1 ) ( setf ( s b2 ) b1 ) ( setf ( se b2 ) c1 )
  ( setf ( w c2 ) b2 ) ( setf ( nw c2 ) b3 ) ( setf ( n c2 ) c3 ) ( setf ( ne c2 ) d3 ) ( setf ( e c2 ) d2 ) ( setf ( sw c2 ) b1 ) ( setf ( s c2 ) c1 ) ( setf ( se c2 ) d1 )
  ( setf ( w d2 ) c2 ) ( setf ( nw d2 ) c3 ) ( setf ( n d2 ) d3 ) ( setf ( ne d2 ) e3 ) ( setf ( e d2 ) e2 ) ( setf ( sw d2 ) c1 ) ( setf ( s d2 ) d1 ) ( setf ( se d2 ) e1 )
  ( setf ( w e2 ) d2 ) ( setf ( nw e2 ) d3 ) ( setf ( n e2 ) e3 ) ( setf ( ne e2 ) f3 ) ( setf ( e e2 ) f2 ) ( setf ( sw e2 ) d1 ) ( setf ( s e2 ) e1 ) ( setf ( se e2 ) f1 )
  ( setf ( w f2 ) e2 ) ( setf ( nw f2 ) e3 ) ( setf ( n f2 ) f3 ) ( setf ( ne f2 ) g3 ) ( setf ( e f2 ) g2 ) ( setf ( sw f2 ) e1 ) ( setf ( s f2 ) f1 ) ( setf ( se f2 ) g1 )
  ( setf ( w g2 ) f2 ) ( setf ( nw g2 ) f3 ) ( setf ( n g2 ) g3 ) ( setf ( ne g2 ) h3 ) ( setf ( e g2 ) h2 ) ( setf ( sw g2 ) f1 ) ( setf ( s g2 ) g1 ) ( setf ( se g2 ) h1 )
  ( setf ( w h2 ) g2 ) ( setf ( nw h2 ) g3 ) ( setf ( n h2 ) h3 )                                            ( setf ( sw h2 ) g1 ) ( setf ( s h2 ) h1 )


                                             ( setf ( n a3 ) a4 ) ( setf ( ne a3 ) b4 ) ( setf ( e a3 ) b3 )                       ( setf ( s a3 ) a2 ) ( setf ( se a3 ) b2 )
  ( setf ( w b3 ) a3 ) ( setf ( nw b3 ) a4 ) ( setf ( n b3 ) b4 ) ( setf ( ne b3 ) c4 ) ( setf ( e b3 ) c3 ) ( setf ( sw b3 ) a2 ) ( setf ( s b3 ) b2 ) ( setf ( se b3 ) c2 )
  ( setf ( w c3 ) b3 ) ( setf ( nw c3 ) b4 ) ( setf ( n c3 ) c4 ) ( setf ( ne c3 ) d4 ) ( setf ( e c3 ) d3 ) ( setf ( sw c3 ) b2 ) ( setf ( s c3 ) c2 ) ( setf ( se c3 ) d2 )
  ( setf ( w d3 ) c3 ) ( setf ( nw d3 ) c4 ) ( setf ( n d3 ) d4 ) ( setf ( ne d3 ) e4 ) ( setf ( e d3 ) e3 ) ( setf ( sw d3 ) c2 ) ( setf ( s d3 ) d2 ) ( setf ( se d3 ) e2 )
  ( setf ( w e3 ) d3 ) ( setf ( nw e3 ) d4 ) ( setf ( n e3 ) e4 ) ( setf ( ne e3 ) f4 ) ( setf ( e e3 ) f3 ) ( setf ( sw e3 ) d2 ) ( setf ( s e3 ) e2 ) ( setf ( se e3 ) f2 )
  ( setf ( w f3 ) e3 ) ( setf ( nw f3 ) e4 ) ( setf ( n f3 ) f4 ) ( setf ( ne f3 ) g4 ) ( setf ( e f3 ) g3 ) ( setf ( sw f3 ) e2 ) ( setf ( s f3 ) f2 ) ( setf ( se f3 ) g2 )
  ( setf ( w g3 ) f3 ) ( setf ( nw g3 ) f4 ) ( setf ( n g3 ) g4 ) ( setf ( ne g3 ) h4 ) ( setf ( e g3 ) h3 ) ( setf ( sw g3 ) f2 ) ( setf ( s g3 ) g2 ) ( setf ( se g3 ) h2 )
  ( setf ( w h3 ) g3 ) ( setf ( nw h3 ) g4 ) ( setf ( n h3 ) h4 )                                            ( setf ( sw h3 ) g2 ) ( setf ( s h3 ) h2 )


                                             ( setf ( n a4 ) a5 ) ( setf ( ne a4 ) b5 ) ( setf ( e a4 ) b4 )                       ( setf ( s a4 ) a3 ) ( setf ( se a4 ) b3 )
  ( setf ( w b4 ) a4 ) ( setf ( nw b4 ) a5 ) ( setf ( n b4 ) b5 ) ( setf ( ne b4 ) c5 ) ( setf ( e b4 ) c4 ) ( setf ( sw b4 ) a3 ) ( setf ( s b4 ) b3 ) ( setf ( se b4 ) c3 )
  ( setf ( w c4 ) b4 ) ( setf ( nw c4 ) b5 ) ( setf ( n c4 ) c5 ) ( setf ( ne c4 ) d5 ) ( setf ( e c4 ) d4 ) ( setf ( sw c4 ) b3 ) ( setf ( s c4 ) c3 ) ( setf ( se c4 ) d3 )
  ( setf ( w d4 ) c4 ) ( setf ( nw d4 ) c5 ) ( setf ( n d4 ) d5 ) ( setf ( ne d4 ) e5 ) ( setf ( e d4 ) e4 ) ( setf ( sw d4 ) c3 ) ( setf ( s d4 ) d3 ) ( setf ( se d4 ) e3 )
  ( setf ( w e4 ) d4 ) ( setf ( nw e4 ) d5 ) ( setf ( n e4 ) e5 ) ( setf ( ne e4 ) f5 ) ( setf ( e e4 ) f4 ) ( setf ( sw e4 ) d3 ) ( setf ( s e4 ) e3 ) ( setf ( se e4 ) f3 )
  ( setf ( w f4 ) e4 ) ( setf ( nw f4 ) e5 ) ( setf ( n f4 ) f5 ) ( setf ( ne f4 ) g5 ) ( setf ( e f4 ) g4 ) ( setf ( sw f4 ) e3 ) ( setf ( s f4 ) f3 ) ( setf ( se f4 ) g3 )
  ( setf ( w g4 ) f4 ) ( setf ( nw g4 ) f5 ) ( setf ( n g4 ) g5 ) ( setf ( ne g4 ) h5 ) ( setf ( e g4 ) h4 ) ( setf ( sw g4 ) f3 ) ( setf ( s g4 ) g3 ) ( setf ( se g4 ) h3 )
  ( setf ( w h4 ) g4 ) ( setf ( nw h4 ) g5 ) ( setf ( n h4 ) h5 )                                            ( setf ( sw h4 ) g3 ) ( setf ( s h4 ) h3 )


                                             ( setf ( n a5 ) a6 ) ( setf ( ne a5 ) b6 ) ( setf ( e a5 ) b5 )                       ( setf ( s a5 ) a4 ) ( setf ( se a5 ) b4 )
  ( setf ( w b5 ) a5 ) ( setf ( nw b5 ) a6 ) ( setf ( n b5 ) b6 ) ( setf ( ne b5 ) c6 ) ( setf ( e b5 ) c5 ) ( setf ( sw b5 ) a4 ) ( setf ( s b5 ) b4 ) ( setf ( se b5 ) c4 )
  ( setf ( w c5 ) b5 ) ( setf ( nw c5 ) b6 ) ( setf ( n c5 ) c6 ) ( setf ( ne c5 ) d6 ) ( setf ( e c5 ) d5 ) ( setf ( sw c5 ) b4 ) ( setf ( s c5 ) c4 ) ( setf ( se c5 ) d4 )
  ( setf ( w d5 ) c5 ) ( setf ( nw d5 ) c6 ) ( setf ( n d5 ) d6 ) ( setf ( ne d5 ) e6 ) ( setf ( e d5 ) e5 ) ( setf ( sw d5 ) c4 ) ( setf ( s d5 ) d4 ) ( setf ( se d5 ) e4 )
  ( setf ( w e5 ) d5 ) ( setf ( nw e5 ) d6 ) ( setf ( n e5 ) e6 ) ( setf ( ne e5 ) f6 ) ( setf ( e e5 ) f5 ) ( setf ( sw e5 ) d4 ) ( setf ( s e5 ) e4 ) ( setf ( se e5 ) f4 )
  ( setf ( w f5 ) e5 ) ( setf ( nw f5 ) e6 ) ( setf ( n f5 ) f6 ) ( setf ( ne f5 ) g6 ) ( setf ( e f5 ) g5 ) ( setf ( sw f5 ) e4 ) ( setf ( s f5 ) f4 ) ( setf ( se f5 ) g4 )
  ( setf ( w g5 ) f5 ) ( setf ( nw g5 ) f6 ) ( setf ( n g5 ) g6 ) ( setf ( ne g5 ) h6 ) ( setf ( e g5 ) h5 ) ( setf ( sw g5 ) f4 ) ( setf ( s g5 ) g4 ) ( setf ( se g5 ) h4 )
  ( setf ( w h5 ) g5 ) ( setf ( nw h5 ) g6 ) ( setf ( n h5 ) h6 )                                            ( setf ( sw h5 ) g4 ) ( setf ( s h5 ) h4 )
  

                                             ( setf ( n a6 ) a7 ) ( setf ( ne a6 ) b7 ) ( setf ( e a6 ) b6 )                       ( setf ( s a6 ) a5 ) ( setf ( se a6 ) b5 )
  ( setf ( w b6 ) a6 ) ( setf ( nw b6 ) a7 ) ( setf ( n b6 ) b7 ) ( setf ( ne b6 ) c7 ) ( setf ( e b6 ) c6 ) ( setf ( sw b6 ) a5 ) ( setf ( s b6 ) b5 ) ( setf ( se b6 ) c5 )
  ( setf ( w c6 ) b6 ) ( setf ( nw c6 ) b7 ) ( setf ( n c6 ) c7 ) ( setf ( ne c6 ) d7 ) ( setf ( e c6 ) d6 ) ( setf ( sw c6 ) b5 ) ( setf ( s c6 ) c5 ) ( setf ( se c6 ) d5 )
  ( setf ( w d6 ) c6 ) ( setf ( nw d6 ) c7 ) ( setf ( n d6 ) d7 ) ( setf ( ne d6 ) e7 ) ( setf ( e d6 ) e6 ) ( setf ( sw d6 ) c5 ) ( setf ( s d6 ) d5 ) ( setf ( se d6 ) e5 )
  ( setf ( w e6 ) d6 ) ( setf ( nw e6 ) d7 ) ( setf ( n e6 ) e7 ) ( setf ( ne e6 ) f7 ) ( setf ( e e6 ) f6 ) ( setf ( sw e6 ) d5 ) ( setf ( s e6 ) e5 ) ( setf ( se e6 ) f5 )
  ( setf ( w f6 ) e6 ) ( setf ( nw f6 ) e7 ) ( setf ( n f6 ) f7 ) ( setf ( ne f6 ) g7 ) ( setf ( e f6 ) g6 ) ( setf ( sw f6 ) e5 ) ( setf ( s f6 ) f5 ) ( setf ( se f6 ) g5 )
  ( setf ( w g6 ) f6 ) ( setf ( nw g6 ) f7 ) ( setf ( n g6 ) g7 ) ( setf ( ne g6 ) h7 ) ( setf ( e g6 ) h6 ) ( setf ( sw g6 ) f5 ) ( setf ( s g6 ) g5 ) ( setf ( se g6 ) h5 )
  ( setf ( w h6 ) g6 ) ( setf ( nw h6 ) g7 ) ( setf ( n h6 ) h7 )                                            ( setf ( sw h6 ) g5 ) ( setf ( s h6 ) h5 )
  

                                             ( setf ( n a7 ) a8 ) ( setf ( ne a7 ) b8 ) ( setf ( e a7 ) b7 )                       ( setf ( s a7 ) a6 ) ( setf ( se a7 ) b6 )
  ( setf ( w b7 ) a7 ) ( setf ( nw b7 ) c8 ) ( setf ( n b7 ) b8 ) ( setf ( ne b7 ) c8 ) ( setf ( e b7 ) c7 ) ( setf ( sw b7 ) a6 ) ( setf ( s b7 ) b6 ) ( setf ( se b7 ) c6 )
  ( setf ( w c7 ) b7 ) ( setf ( nw c7 ) b8 ) ( setf ( n c7 ) c8 ) ( setf ( ne c7 ) d8 ) ( setf ( e c7 ) d7 ) ( setf ( sw c7 ) b6 ) ( setf ( s c7 ) c6 ) ( setf ( se c7 ) d6 )
  ( setf ( w d7 ) c7 ) ( setf ( nw d7 ) c8 ) ( setf ( n d7 ) d8 ) ( setf ( ne d7 ) e8 ) ( setf ( e d7 ) e7 ) ( setf ( sw d7 ) c6 ) ( setf ( s d7 ) d6 ) ( setf ( se d7 ) e6 )
  ( setf ( w e7 ) d7 ) ( setf ( nw e7 ) d8 ) ( setf ( n e7 ) e8 ) ( setf ( ne e7 ) f8 ) ( setf ( e e7 ) f7 ) ( setf ( sw e7 ) d6 ) ( setf ( s e7 ) e6 ) ( setf ( se e7 ) f6 )
  ( setf ( w f7 ) e7 ) ( setf ( nw f7 ) e8 ) ( setf ( n f7 ) f8 ) ( setf ( ne f7 ) g8 ) ( setf ( e f7 ) g7 ) ( setf ( sw f7 ) e6 ) ( setf ( s f7 ) f6 ) ( setf ( se f7 ) g6 )
  ( setf ( w g7 ) f7 ) ( setf ( nw g7 ) f8 ) ( setf ( n g7 ) g8 ) ( setf ( ne g7 ) h8 ) ( setf ( e g7 ) h7 ) ( setf ( sw g7 ) f6 ) ( setf ( s g7 ) g6 ) ( setf ( se g7 ) h6 )
  ( setf ( w h7 ) g7 ) ( setf ( nw h7 ) g8 ) ( setf ( n h7 ) h8 )                                            ( setf ( sw h7 ) g6 ) ( setf ( s h7 ) h6 )
  

                       ( setf ( e a8 ) b8 )                       ( setf ( s a8 ) a7 ) ( setf ( se a8 ) b7 )
  ( setf ( w b8 ) a8 ) ( setf ( e b8 ) c8 ) ( setf ( sw b8 ) a7 ) ( setf ( s b8 ) b7 ) ( setf ( se b8 ) c7 )
  ( setf ( w c8 ) b8 ) ( setf ( e c8 ) d8 ) ( setf ( sw c8 ) b7 ) ( setf ( s c8 ) c7 ) ( setf ( se c8 ) d7 )
  ( setf ( w d8 ) c8 ) ( setf ( e d8 ) e8 ) ( setf ( sw d8 ) c7 ) ( setf ( s d8 ) d7 ) ( setf ( se d8 ) e7 )
  ( setf ( w e8 ) d8 ) ( setf ( e e8 ) f8 ) ( setf ( sw e8 ) d7 ) ( setf ( s e8 ) e7 ) ( setf ( se e8 ) f7 )
  ( setf ( w f8 ) e8 ) ( setf ( e f8 ) g8 ) ( setf ( sw f8 ) e7 ) ( setf ( s f8 ) f7 ) ( setf ( se f8 ) g7 )
  ( setf ( w g8 ) f8 ) ( setf ( e g8 ) h8 ) ( setf ( sw g8 ) f7 ) ( setf ( s g8 ) g7 ) ( setf ( se g8 ) h7 )
  ( setf ( w h8 ) g8 )                      ( setf ( sw h8 ) g7 ) ( setf ( s h8 ) h7 )
  
)



(defun get-rank-moves (n)
  (cond
    ((member n rank1) ( remove n rank1))
    ((member n rank2) ( remove n rank2))
    ((member n rank3) ( remove n rank3))
    ((member n rank4) ( remove n rank4))
    ((member n rank5) ( remove n rank5))
    ((member n rank6) ( remove n rank6))
    ((member n rank7) ( remove n rank7))
    ((member n rank8) ( remove n rank8))
    )
  )

(defun get-file-moves (n)
  (cond
    ((member n fileA) ( remove n fileA ) ) 
    ((member n fileB) ( remove n fileB ) )
    ((member n fileC) ( remove n fileC ) )
    ((member n fileD) ( remove n fileD ) )
    ((member n fileE) ( remove n fileE ) )
    ((member n fileF) ( remove n fileF ) )
    ((member n fileG) ( remove n fileG ) )
    ((member n fileH) ( remove n fileH ) )
    )
  )


(defun get-diagonal (n)
  (cond
    ((member n d1) di1)
    ((member n d2) di2)
    ((member n d3) di3)
    ((member n d4) di4)
    ((member n d5) di5)
    ((member n d6) di6)
    ((member n d7) di7)
    ((member n d8) di8)
    ((member n d9) di9)
    ((member n d10) di10)
    ((member n d11) di11)
    ((member n d12) di12)
    ((member n d13) di13)
    )
  )

(defun get-antidiagonal (n)
  (cond
    ((member n ad1) ad1)
    ((member n ad2) ad2)
    ((member n ad3) ad3)
    ((member n ad4) ad4)
    ((member n ad5) ad5)
    ((member n ad6) ad6)
    ((member n ad7) ad7)
    ((member n ad8) ad8)
    ((member n ad9) ad9)
    ((member n ad10) ad10)
    ((member n ad11) ad11)
    ((member n ad12) ad12)
    ((member n ad13) d13)
  )
) 


;; This file is going to contain the move methods for the pieces

( defun square-in-list-p ( sq lst )
  ( if ( member sq lst )
      t
      nil
  )
)

(defun all-elements-in-list-p (list1 list2)
  ( every ( lambda ( element ) ( square-in-list-p element list2 ) ) list1 )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the rook piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  
( defmethod unoccupied-north-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
    do ( let ( ( next-north ( n sq ) ) )
         ( cond
           ( ( null next-north ) ( return ( reverse unoccupied-squares ) ) )
           ( ( null ( occupier next-north ) )
             ( push next-north unoccupied-squares )
             ( setf sq next-north ) 
		   )
           ( ( not ( eq ( color piece ) ( color ( occupier next-north ) ) ) )
             ( push next-north unoccupied-squares )
             ( return ( reverse unoccupied-squares ) ) )
           ( t ( return ( reverse unoccupied-squares ) ) ) 
	     ) 
	  )
  )
)


( defmethod unoccupied-south-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-south ( s sq ) ) )
           ( cond
             ( ( null next-south ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-south ) )
              ( push next-south unoccupied-squares )
              ( setf sq next-south ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-south ) ) ) )
               ( push next-south unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)


( defmethod unoccupied-east-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-east ( e sq ) ) )
           ( cond
             ( ( null next-east ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-east ) )
              ( push next-east unoccupied-squares )
              ( setf sq next-east ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-east ) ) ) )
               ( push next-east unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)

( defmethod unoccupied-west-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-west ( w sq ) ) )
           ( cond
             ( ( null next-west ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-west ) )
              ( push next-west unoccupied-squares )
              ( setf sq next-west ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-west ) ) ) )
               ( push next-west unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)

( defmethod possible-moves-rook ( ( rook piece ) &aux curr-square )
  ( setf curr-square ( cs rook ) )
  ( append (unoccupied-north-squares curr-square rook)
           ( unoccupied-east-squares curr-square rook ) 
           ( unoccupied-south-squares curr-square rook ) 
           ( unoccupied-west-squares curr-square  rook )
  )
)
 


( defmethod legal-move-rook ( ( rook piece ) ( dest-square square ) )
  ( if 
	( square-in-list-p dest-square ( possible-moves-rook rook ) )
	t
  )  
)

( defmethod pick-square-rook ( ( rook rook ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-rook rook ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
    )
)


( defmethod random-move-rook ( ( rook rook ) &aux dest-square )
	( setf dest-square ( pick-square-rook rook ) )
	( move-rook rook dest-square )
)


( defmethod move-rook ( ( rook rook ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs rook ) )
  ( if ( legal-move-rook rook dest-square )
    ( progn
		( setf ( occupier curr-square ) nil )
		( setf ( occupier dest-square ) rook )
		( setf ( cs rook ) dest-square )
	)
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the bishop piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod unoccupied-se-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-se ( se sq ) ) )
           ( cond
             ( ( null next-se ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-se ) )
              ( push next-se unoccupied-squares )
              ( setf sq next-se ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-se ) ) ) )
               ( push next-se unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)

( defmethod unoccupied-sw-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-sw ( sw sq ) ) )
           ( cond
             ( ( null next-sw ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-sw ) )
              ( push next-sw unoccupied-squares )
              ( setf sq next-sw ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-sw ) ) ) )
               ( push next-sw unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)

( defmethod unoccupied-ne-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-ne ( ne sq ) ) )
           ( cond
             ( ( null next-ne ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-ne ) )
              ( push next-ne unoccupied-squares )
              ( setf sq next-ne ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-ne ) ) ) )
               ( push next-ne unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)

( defmethod unoccupied-nw-squares ( ( sq square ) ( piece piece ) )
  ( loop with unoccupied-squares = nil
     do ( let ( ( next-nw ( nw sq ) ) )
           ( cond
             ( ( null next-nw ) ( return ( reverse unoccupied-squares ) ) )
             ( ( null ( occupier next-nw ) )
              ( push next-nw unoccupied-squares )
              ( setf sq next-nw ) )
             ( ( not ( eq ( color piece ) ( color ( occupier next-nw ) ) ) )
               ( push next-nw unoccupied-squares )
               ( return ( reverse unoccupied-squares ) ) 
	         )
               ( t ( return ( reverse unoccupied-squares ) ) )
			 ) 
		)
  )
)


( defmethod possible-moves-bishop ( ( bishop piece ) &aux curr-square )
  ( setf curr-square ( cs bishop ) )
  ( append ( unoccupied-nw-squares curr-square bishop )
           ( unoccupied-ne-squares curr-square bishop ) 
           ( unoccupied-sw-squares curr-square bishop ) 
           ( unoccupied-se-squares curr-square bishop )
  )
)




( defmethod legal-move-bishop ( ( bishop piece ) ( dest-square square ) )
  ( if 
	( square-in-list-p dest-square ( possible-moves-bishop bishop ) )
	t
  )  
)

( defmethod pick-square-bishop ( ( bishop bishop ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-bishop bishop ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
	)
)


( defmethod random-move-bishop ( ( bishop bishop ) &aux dest-square )
	( setf dest-square ( pick-square-bishop bishop ) )
	( move-bishop bishop dest-square )
)

( defmethod move-bishop ( ( bishop bishop ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs bishop ) )
  ( if ( legal-move-bishop bishop dest-square ) 
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) bishop )
	  ( setf ( cs bishop ) dest-square )
	)
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the queen piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod possible-moves-queen ( ( queen queen ) )
  ( append ( possible-moves-bishop queen )
           ( possible-moves-rook queen )
  )
)

( defmethod legal-move-queen ( ( queen queen ) ( dest-square square ) )
  ( or 
	( legal-move-bishop queen dest-square ) 
	( legal-move-rook queen dest-square )
  )
)

( defmethod pick-square-queen ( ( queen queen ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-queen queen ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
	)
)


( defmethod random-move-queen ( ( queen queen ) &aux dest-square )
	( setf dest-square ( pick-square-queen queen ) )
	( move-queen queen dest-square )
)


( defmethod move-queen ( ( queen queen ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs queen ) )
  ( if ( legal-move-queen queen dest-square )
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) queen )
	  ( setf ( cs queen ) dest-square )
	)
  )
)  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the king piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod possible-moves-king ( ( king king ) &aux curr-square valid-squares )
  ( setf curr-square ( cs king ) )
  ( setf valid-squares '() )
  ( progn
    ( dolist ( direction '( n ne e se s sw w nw ) )
      ( let ( ( next-square (funcall direction curr-square)))
        ( when ( and next-square
                   ( or ( null (occupier next-square ) )
                        ( not ( equal ( color ( occupier next-square ) ) ( color king ) ) ) 
					) 
				)
          ( push next-square valid-squares )
		)
	  )
	)
    valid-squares
  )
)


( defmethod pick-square-king ( ( king king ) )
  ( nth ( random ( length ( possible-moves-king king ) ) ) ( possible-moves-king king ) )
)

( defmethod pick-square-king ( ( king king ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-king king ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
	)
)



( defmethod legal-move-king ( ( king king ) ( dest-square square ) )
  ( if 
	( square-in-list-p dest-square ( possible-moves-king king ) )
	t
  )  
)

( defmethod move-king ( ( king king ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs king ) )
  ( if ( legal-move-king king dest-square )
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) king )
	  ( setf ( cs king ) dest-square )
	)
  )
)

( defmethod random-move-king ( ( king king ) &aux dest-square )
	( setf dest-square ( pick-square-king king ) )
	( move-king king dest-square )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the knight piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod get-nne ( ( knight knight ) &aux curr-square n nn nne )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( n curr-square ) ) )
    ( setf n ( n curr-square ) )
    ( setf nn ( n n ) )
    ( when ( not ( null nn ) )
      ( setf nne ( e nn ) )
    )
  nne 
  ) 
)


( defmethod get-nee ( ( knight knight ) &aux curr-square n ne nee )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( n curr-square ) ) )
    ( setf n ( n curr-square ) )
    ( setf ne ( e n ) )
    ( when ( not ( null ne ) )
      ( setf nee ( e ne ) )
    )
  nee 
  ) 
)


( defmethod get-nnw ( ( knight knight ) &aux curr-square n nn nnw )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( n curr-square ) ) )
    ( setf n ( n curr-square ) )
    ( setf nn ( n n ) )
    ( when ( not ( null nn ) )
      ( setf nnw ( w nn ) )
    )
  nnw 
  ) 
)


( defmethod get-nww ( ( knight knight ) &aux curr-square n nw nww )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( n curr-square ) ) )
    ( setf n ( n curr-square ) )
    ( setf nw ( w n ) )
	( when ( not ( null nw ) )
      ( setf nww ( w nw ) )
    )
  nww 
  ) 
)

( defmethod get-sse ( ( knight knight ) &aux curr-square s ss sse )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( s curr-square ) ) )
    ( setf s ( s curr-square ) )
    ( setf ss ( s s ) )
	( when ( not ( null ss ) )
      ( setf sse ( e ss ) )
	)
  sse 
  ) 
)

( defmethod get-see ( ( knight knight ) &aux curr-square s se see )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( s curr-square ) ) )
    ( setf s ( s curr-square ) )
    ( setf se ( e s ) )
	( when see ( not ( null se ) )
      ( setf see ( e se ) )
	)
  see 
  ) 
)

( defmethod get-ssw ( ( knight knight ) &aux curr-square s ss ssw )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( s curr-square ) ) )
    ( setf s ( s curr-square ) )
    ( setf ss ( s s ) )
	( when ( not ( null ss ) )
      ( setf ssw ( w ss ) )
	)
  ssw 
  ) 
)

( defmethod get-sww ( ( knight knight ) &aux curr-square s sw sww )
  ( setf curr-square ( cs knight ) )
  ( when ( not ( null ( s curr-square ) ) )
    ( setf s ( s curr-square ) )
    ( setf sw ( w s ) )
	( when ( not ( null sw ) )
      ( setf sww ( w sw ) )
    )
  sww 
  ) 
)

( defmethod valid-destination-p ( ( knight knight ) ( dest-square square ) )
  ( or ( null ( occupier dest-square ) )
       ( not ( equal ( color ( occupier dest-square ) ) ( color knight ) ) )
  ) 
)


( defmethod possible-moves-knight ( ( knight knight ) &aux curr-square possible-moves nne nee nnw nww sse see sww ssw )
  ( setf curr-square ( cs knight ) )
  ( setf possible-moves '() )

  ( setf nne ( get-nne knight ) ) 
  ( if ( and nne ( valid-destination-p knight nne ) )
      ( push nne possible-moves ) )
	  
  ( setf nnw ( get-nnw knight ) ) 
  ( if ( and nnw ( valid-destination-p knight nnw ) )
      ( push nnw possible-moves ) )
	  
  ( setf nww ( get-nww knight ) ) 
  ( if ( and nww ( valid-destination-p knight nww ) )
      ( push nww possible-moves ) )

  ( setf nee ( get-nee knight ) ) 
  ( if ( and nee ( valid-destination-p knight nee ) )
      ( push nee possible-moves ) )
	  
  ( setf ssw ( get-ssw knight ) ) 
  ( if ( and ssw ( valid-destination-p knight ssw ) )
      ( push ssw possible-moves ) )

  ( setf sse ( get-sse knight ) ) 
  ( if ( and sse ( valid-destination-p knight sse ) )
      ( push sse possible-moves ) )
	  
  ( setf sww ( get-sww knight ) ) 
  ( if ( and sww ( valid-destination-p knight sww ) )
      ( push sww possible-moves ) )

  ( setf see ( get-see knight ) ) 
  ( if ( and see ( valid-destination-p knight see ) )
      ( push see possible-moves ) )
  
  possible-moves
)


( defmethod pick-square-knight ( ( knight knight ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-knight knight ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
	)
)


( defmethod random-move-knight ( ( knight knight ) &aux dest-square )
	( setf dest-square ( pick-square-knight knight ) )
	( move-knight knight dest-square )
)




( defmethod legal-move-knight ( ( knight knight ) ( dest-square square ) )
  ( if 
	( square-in-list-p dest-square ( possible-moves-knight knight ) )
	t
  )  
)

( defmethod move-knight ( ( knight knight ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs knight ) )
  ( if ( legal-move-knight knight dest-square )
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) knight )
	  ( setf ( cs knight ) dest-square )
	)
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Functions to do with the pawn piece
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod possible-moves-wpawn ( ( pawn pawn ) &aux curr-square possible-moves rank )
  ( setf curr-square ( cs pawn ) )
  ( setf rank ( rank curr-square ) )
  ( setf possible-moves '() )
  ( if ( and ( not ( null ( n curr-square ) ) )
             ( null ( occupier ( n curr-square ) ) )
       )
       ( push ( n curr-square ) possible-moves )
  )
  ( if ( and ( = rank 1 )
             ( null ( occupier ( n ( n curr-square ) ) ) )
       )
       ( push ( n ( n curr-square ) ) possible-moves ) 
  )
  ( if ( and ( not ( null ( ne curr-square ) ) )
             ( occupier ( ne curr-square ) )
             ( not ( equal ( color pawn ) ( color ( occupier ( ne curr-square ) ) ) ) )
       )
       ( push ( ne curr-square ) possible-moves )
  )
  ( if ( and ( not ( null ( nw curr-square ) ) )
             ( occupier ( nw curr-square ) )
             ( not ( equal ( color pawn ) ( color ( occupier ( nw curr-square ) ) ) ) )
       )
       ( push ( nw curr-square ) possible-moves )
  )
  possible-moves
)




( defmethod possible-moves-bpawn ( ( pawn pawn ) &aux curr-square possible-moves rank )
  ( setf curr-square ( cs pawn ) )
  ( setf rank ( rank curr-square ) )
  ( setf possible-moves '() )
  ( if ( and ( not ( null ( s curr-square ) ) )
             ( null ( occupier ( s curr-square ) ) )
       )
       ( push ( s curr-square ) possible-moves )
  )
  ( if ( and ( = rank 6 )
             ( null ( occupier ( s ( s curr-square ) ) ) )
       )
       ( push ( s ( s curr-square ) ) possible-moves ) 
  )
  ( if ( and ( not ( null ( se curr-square ) ) )
             ( occupier ( se curr-square ) )
             ( not ( equal ( color pawn ) ( color ( occupier ( se curr-square ) ) ) ) )
       )
       ( push ( se curr-square ) possible-moves )
  )
  ( if ( and ( not ( null ( sw curr-square ) ) )
             ( occupier ( sw curr-square ) )
             ( not ( equal ( color pawn ) ( color ( occupier ( sw curr-square ) ) ) ) )
       )
       ( push ( sw curr-square ) possible-moves )
  )
  possible-moves
)


( defmethod possible-moves-pawn ( ( pawn pawn ) ) 
  ( cond 
    ( ( eq ( color pawn ) 'b ) 
	  ( possible-moves-bpawn pawn )
	) 
	( ( eq ( color pawn ) 'w )
	  ( possible-moves-wpawn pawn )
	)
  )
)

( defmethod pick-square-pawn ( ( pawn pawn ) &aux possible-moves)
  ( setf possible-moves ( possible-moves-pawn pawn ) )
    (if ( > ( length possible-moves ) 0 )
        ( nth ( random ( length possible-moves ) ) possible-moves )
        nil
	)
)



( defmethod random-move-pawn ( ( pawn pawn ) &aux dest-square )
	( setf dest-square ( pick-square-pawn pawn ) )
	( move-pawn pawn dest-square )
)
 
( defmethod legal-move-wpawn ( ( pawn pawn ) ( dest-square square ) )
  ( if 
	( square-in-list-p dest-square ( possible-moves-wpawn pawn ) )
	t
  )
)


( defmethod legal-move-bpawn ( ( pawn pawn ) ( dest-square square ) &aux curr-square )
  ( if 
	( square-in-list-p dest-square ( possible-moves-bpawn pawn ) )
	t
  )
)


( defmethod legal-move-pawn ( ( pawn pawn ) ( dest-square square ) )
  ( cond 
    ( ( eq ( color pawn ) 'b ) 
	  ( legal-move-bpawn pawn dest-square )
	) 
	( ( eq ( color pawn ) 'w )
	  ( legal-move-wpawn pawn dest-square )
	)
  )
)


 
( defmethod move-wpawn ( ( pawn pawn ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs pawn ) )
  ( if (legal-move-pawn pawn dest-square )
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) pawn )
	  ( setf ( cs pawn ) dest-square )
	)
  )
)

( defmethod move-bpawn ( ( pawn pawn ) ( dest-square square ) &aux curr-square )
  ( setf curr-square ( cs pawn ) )
  ( if (legal-move-pawn pawn dest-square )
    ( progn
	  ( setf ( occupier curr-square ) nil )
	  ( setf ( occupier dest-square ) pawn )
	  ( setf ( cs pawn ) dest-square )
	)
  )
)
 
 
( defmethod move-pawn ( ( pawn pawn ) ( dest-square square ) )
  ( cond 
    ( ( eq ( color pawn ) 'b ) 
	  ( move-bpawn pawn dest-square )
	) 
	( ( eq ( color pawn ) 'w )
	  ( move-wpawn pawn dest-square )
	)
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( defmethod possible-moves ( ( piece piece ) )
  ( cond 
    ( ( eq ( type piece ) 'pawn ) ( possible-moves-pawn piece ) )
    ( ( eq ( type piece ) 'queen ) ( possible-moves-queen piece ) )
    ( ( eq ( type piece ) 'king ) ( possible-moves-king piece ) )
    ( ( eq ( type piece ) 'rook ) ( possible-moves-rook piece ) )
    ( ( eq ( type piece ) 'knight ) ( possible-moves-knight piece ) )
    ( ( eq ( type piece ) 'bishop ) ( possible-moves-bishop piece ) )
  )
)

( defmethod legal-move ( ( piece piece ) (dest-square square ) )
  ( cond 
    ( ( eq ( type piece ) 'pawn ) ( legal-move-pawn piece dest-square ) )
    ( ( eq ( type piece ) 'queen ) ( legal-move-queen piece dest-square ) )
    ( ( eq ( type piece ) 'king ) ( legal-move-king piece dest-square ) )
    ( ( eq ( type piece ) 'rook ) ( legal-move-rook piece dest-square ) )
    ( ( eq ( type piece ) 'knight ) ( legal-move-knight piece dest-square ) )
    ( ( eq ( type piece ) 'bishop ) ( legal-move-bishop piece dest-square ) )
  )
 )

( defmethod move-piece ( ( piece piece ) ( dest-square square ) &aux color )
  ( setf color ( color piece ) )
  ( if ( not ( null ( occupier dest-square ) ) )
    ( remove ( occupier ( oppo-pieces-of-color color ) ) )
  )
  ( cond 
    ( ( eq ( type piece ) 'pawn ) ( move-pawn piece dest-square ) )
    ( ( eq ( type piece ) 'queen ) ( move-queen piece dest-square ) )
    ( ( eq ( type piece ) 'king ) ( move-king piece dest-square ) )
    ( ( eq ( type piece ) 'rook ) ( move-rook piece dest-square ) )
    ( ( eq ( type piece ) 'knight ) ( move-knight piece dest-square ) )
    ( ( eq ( type piece ) 'bishop ) ( move-bishop piece dest-square ) )
  )
)

( defmethod move-piece ( ( piece piece ) ( dest-square square ) )
  ( if ( legal-move piece dest-square )
      ( progn
        ( setf ( occupier dest-square ) piece )
        ( setf ( occupier ( cs piece ) ) nil )
        ( setf ( cs piece ) dest-square )
        t ) ; Return t to indicate a successful move
      nil ) ; Return nil to indicate an unsuccessful move
)


( defun oppo-pieces-of-color ( color ) 
  ( cond 
    ( ( eq color 'b ) *white-pieces* )
	( ( eq color 'w ) *black-pieces* )
  )
)

( defun oppo-color ( color )
  ( cond 
    ( ( eq color 'w ) 'b )
	( ( eq color 'b ) 'w )
  )
)

( defmethod remove-bpiece ( ( piece piece ) ) 
  ( setf *black-pieces* ( remove  piece *black-pieces*) )
)

( defmethod remove-wpiece ( ( piece piece ) ) 
  ( setf *white-pieces* ( remove  piece *white-pieces*) )
)

( defmethod remove-piece( ( piece piece ) &aux color ) 
  ( setf color ( color piece ) )
  ( cond 
    ( ( eq color 'w ) ( remove-wpiece piece ) )
	( ( eq color 'b ) ( remove-bpiece piece ) )
  )
)


( defmethod move ( ( curr-square square ) ( dest-square square ) &aux color )
  ( setf color ( color ( occupier curr-square ) ) )
  ( if ( occupier dest-square )
       ( remove-piece ( occupier dest-square ) ) 
  )	   
  ( if ( legal-move ( occupier curr-square ) dest-square )
       ( move-piece ( occupier curr-square ) dest-square ) 		
	  ( format t "Invalid Move Chosen")
  )
)


( defun random-move ( move-pairs &aux curr-square dest square selected ) 
  ( setf selected ( nth ( random ( length move-pairs ) ) move-pairs ) )
  ( setf curr-square ( car selected ) )
  ( setf dest-square ( car ( cdr selected ) ) )
  ( move curr-square dest-square )
)

( defmethod get-move-pair-list ( ( piece piece ) &aux curr-square poss-dests )
  ( setf curr-square ( cs piece ) )
  ( setf poss-dests ( possible-moves piece ) )
  ( mapcar ( lambda ( dest ) ( list curr-square dest ) ) poss-dests )
)

( defun get-all-move-pair-list ( pieces )
  ( loop for piece in pieces
        append ( get-move-pair-list piece ) )
)

( defun r () (load "main.lsp") )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;-----------------------;;;;
;;;;  RANDOM MOVE METHODS  ;;;;
;;;;-----------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defun random-black-piece ()
  ( nth ( random ( length *black-pieces* ) ) *black-pieces* )
)

( defun random-black-move ()
  ( random-move ( get-all-color-moves 'b ) )
) 

( defun random-white-move ()
  ( random-move ( get-all-color-moves 'w ) )
) 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;-------------------------------;;;;
;;;;  MATERIAL SCORE MOVE METHODS  ;;;;
;;;;-------------------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defun compute-wscore ( temp-pieces &aux score )
  ( setf score 0 ) 
  ( dolist ( wpiece temp-pieces )
    ( if ( not ( typep wpiece 'king ) )
      ( setf score ( + score ( val wpiece ) ) )
    )
  )
	score
)

( defun compute-bscore ( temp-pieces &aux score )
  ( setf score 0 ) 
  ( dolist ( bpiece temp-pieces )
    ( if ( not ( typep bpiece 'king ) )
      ( setf score ( + score ( val bpiece ) ) )
    )
  )
	score
)

( defun compute-score ( color temp-pieces )
  ( cond  
    ( ( eq color 'b ) ( compute-bscore temp-pieces ) )
    ( ( eq color 'w ) ( compute-wscore temp-pieces ) )
  )
)

( defun moves-with-lowest-score (color &aux temp-pieces  best-moves opposite-color-moves opposite-color all-move-pairs min-score source destination occupier-source occupier-destination score)
 ( setf opposite-color ( oppo-color color ) )
 ( setf opposite-color-moves ( oppo-pieces-of-color color ) )
 ( setf all-move-pairs ( get-all-move-pair-list opposite-color-moves ) )
 ( setf min-score 100000 ) 
 ( setf best-moves all-move-pairs )
    ( dolist ( move-pair all-move-pairs )
      ( setf source ( car move-pair ) )
      ( setf destination ( car ( cdr move-pair ) ) )
      ( setf occupier-source ( occupier source ) )
      ( setf occupier-destination ( occupier destination ) )  
	  ( if ( not ( null occupier-destination ) )
        ( progn
		  ( if ( eq ( type occupier-destination ) 'king )
	        ( progn 
		      ( setf best-moves '() )
		      ( push move-pair best-moves )
		      ( return )
	 	    )
	      )
          ( setf temp-pieces ( remove occupier-destination ( pieces-of-color color )) )
		  ( setf ( occupier destination ) occupier-source )		  
          ( setf ( cs occupier-source ) destination )
          ( setf ( occupier source ) nil )
	      ( setf score ( compute-score color temp-pieces ) )
	      ( if ( = score min-score ) 
		    ( push move-pair best-moves )
	      )	  
	     ( if ( < score min-score )
	       ( progn 
		     ( setf min-score score )
      	     ( setf best-moves '() )
		     ( push move-pair best-moves )
		   )
	     )
        )
	  )
         ( setf ( occupier source ) occupier-source )
	     ( setf ( cs occupier-source ) source )
	     ( setf ( occupier destination ) occupier-destination )
		 
		 
	)
	best-moves
)

( defun material-move ( move-pairs &aux curr-square dest square selected ) 
  ( setf selected ( nth ( random ( length move-pairs ) ) move-pairs ) )
  ( setf curr-square ( car selected ) )
  ( setf dest-square ( car ( cdr selected ) ) )
  ( move curr-square dest-square )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;--------------------------;;;;
;;;;  LOCATION SCORE METHODS  ;;;;
;;;;--------------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

( defmethod pawn-lscore ( ( square square ) ( pawn pawn ) )
  ( cond 
    ( ( eq ( color pawn ) 'b ) ( aref *bpawn-table* ( rank square ) ( file square ) ) ) 
    ( ( eq ( color pawn ) 'w ) ( aref *wpawn-table* ( rank square ) ( file square ) ) ) 
  )
)

( defmethod king-lscore ( ( square square ) ( king king ) &aux score )
  ( cond 
    ( ( eq ( color king ) 'b ) ( aref *bking-table* ( rank square ) ( file square ) ) ) 
    ( ( eq ( color king ) 'w ) ( aref *wking-table* ( rank square ) ( file square ) ) ) 
  )
)

( defmethod rook-lscore ( ( square square ) ( rook rook ) )
  ( cond 
    ( ( eq ( color rook ) 'b ) ( aref *brook-table* ( rank square ) ( file square ) ) ) 
    ( ( eq ( color rook ) 'w ) ( aref *wrook-table* ( rank square ) ( file square ) ) ) 
  )
)

( defmethod bishop-lscore ( ( square square ) ( bishop bishop ) )
  ( cond 
    ( ( eq ( color bishop ) 'b ) ( aref *bbishop-table* ( rank square ) ( file square ) ) ) 
    ( ( eq ( color bishop ) 'w ) ( aref *wbishop-table* ( rank square ) ( file square ) ) ) 
  )
)

( defmethod queen-lscore ( ( square square ) ( queen queen ) ) 
  ( aref *queen-table* ( rank square ) ( file square ) ) 
)

( defmethod knight-lscore ( ( square square ) ( knight knight ) ) 
  ( aref *knight-table* ( rank square ) ( file square ) ) 
)


( defun compute-location-score ( temp-pieces &aux score )
  ( setf score 0 )
  ( dolist ( piece temp-pieces )
    ( cond 
	  ( ( eq ( type piece ) 'pawn ) ( setf score ( + score ( pawn-lscore ( cs piece ) piece ) ) ) )
      ( ( eq ( type piece ) 'queen ) ( setf score ( + score ( queen-lscore ( cs piece ) piece ) ) ) )
      ( ( eq ( type piece ) 'king ) ( setf score ( + score ( king-lscore ( cs piece ) piece ) ) ) )
      ( ( eq ( type piece ) 'rook ) ( setf score ( + score ( rook-lscore ( cs piece ) piece ) ) ) )
      ( ( eq ( type piece ) 'knight ) ( setf score ( + score ( knight-lscore ( cs piece ) piece ) ) ) )
      ( ( eq ( type piece ) 'bishop ) ( setf score ( + score ( bishop-lscore ( cs piece ) piece ) ) ) )
    )
  )
	score
)

( defun highest-location-score ( color &aux temp-pieces  best-moves pieces opposite-color all-move-pairs max-score source destination occupier-source occupier-destination score )
 ( setf pieces( pieces-of-color color ) )
 ( setf all-move-pairs ( get-all-move-pair-list pieces ) )
 ( setf max-score -10000 ) 
 ( setf best-moves all-move-pairs )
    ( dolist ( move-pair all-move-pairs )
      ( setf source ( car move-pair ) )
      ( setf destination ( car ( cdr move-pair ) ) )
      ( setf occupier-source ( occupier source ) )
      ( setf occupier-destination ( occupier destination ) ) 
      ( setf temp-pieces ( remove occupier-destination ( pieces-of-color color )) )
	  ( setf ( occupier destination ) occupier-source )		  
      ( setf ( cs occupier-source ) destination )
      ( setf ( occupier source ) nil )
	  ( setf score ( compute-location-score temp-pieces ) )
;	  ( format t "Score: ~A~%" score )
	  ( if ( = score max-score ) 
	    ( push move-pair best-moves )
	  )	  
	  ( if ( > score max-score )
	    ( progn 
          ( setf max-score score )
    	  ( setf best-moves '() )
	      ( push move-pair best-moves )
		)
	  )
	  ( setf ( occupier source ) occupier-source )
	  ( setf ( cs occupier-source ) source )
	  ( setf ( occupier destination ) occupier-destination )
  
	)
	best-moves
)

( defun location-move ( move-pairs &aux curr-square dest square selected ) 
  ( setf selected ( nth ( random ( length move-pairs ) ) move-pairs ) )
  ( setf curr-square ( car selected ) )
  ( setf dest-square ( car ( cdr selected ) ) )
  ( move curr-square dest-square )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;--------------------;;;;
;;;;  END GAME METHODS  ;;;;
;;;;--------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Check if the black king has been taken ;; 
( defun bking-in-playp ()
  ( square-in-list-p bking *black-pieces* )
)

;; Check if the white king has been taken ;;
( defun wking-in-playp ()
  ( square-in-list-p wking *white-pieces* )
)


;; Check if either king has been taken ;;
( defun game-overp ()
  ( cond 
    ( ( and ( bking-in-playp ) ( wking-in-playp ) )
  	  nil 
	)
    ( ( bking-in-playp ) 'b )
    ( ( wking-in-playp ) 'w )
    ( t nil )
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;----------------------;;;;
;;;;  PLAY TURN METHODS   ;;;;
;;;;----------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; HUMAN PLAYER METHODS ;;;;

;; Play a human player turn ;;
( defun play-turn--h ( color &aux curr-square csr csf dest-square dsr dsf ) 
   ( format t "It is the ~A player's turn~%" color )
   ( format t "Enter start square: " )
   ( setf curr-square ( parse-square ( string-trim " " (read-line))))
   ( setf csr ( car curr-square ) )
   ( setf csf ( car ( cdr curr-square ) ) )
   ( format t "Enter end square: " )
   ( setf dest-square (parse-square (string-trim " " (read-line))))
   ( setf dsr ( car dest-square ) )
   ( setf dsf ( car ( cdr dest-square ) ) )
   ( setf curr-square ( aref ( board *gameboard* ) csf csr ) ) 
   ( setf dest-square ( aref ( board *gameboard* ) dsf dsr ) )
   ( move curr-square dest-square )
)


;;;; RANDOM PLAYER METHODS ;;;;

;; Plays a random black turn ;;
( defun play-turn--rb () 
  ( random-black-move )
)


;; Plays a random white turn ;;
( defun play-turn--rw ()
  ( random-white-move )
)


;; Plays a turn for a random player of the given color ;;
( defun play-turn--r ( color )
  ( cond 
    ( ( eq color 'w )
	  ( play-turn--rw )
	)
	( ( eq color 'b )
	  ( play-turn--rb )
	)
  )
)


;;;; MATERIAL SCORE PLAYER ;;;;
( defun play-turn--m ( color &aux best-moves )
  ( setf best-moves ( moves-with-lowest-score (oppo-color color ) ) )
  ( material-move best-moves )
)

;;;; LOCATION SCORE PLAYER ;;;;
( defun play-turn--l ( color &aux best-moves )
  ( setf best-moves ( highest-location-score color ) ) 
  ( location-move best-moves )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;----------------------------------;;;;
;;;;  HUMAN VS AI PLAY GAME METHODS   ;;;;
;;;;----------------------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;  HUMAN PLAYER VS HUMAN PLAYER  ;;
( defun play-game--hh ( &aux color )
  ( new-game )
  ( display-board *gameboard*)
  ( setf color 'w )
  ( play-turn--h color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
			 ( d )
             ( play-turn--h color )
		   )
  )
  ( format t "GAME OVER~%PLAYER ~A WINS~%" ( game-overp ) )
)


;;  HUMAN PLAYER VS RANDOM PLAYER  ;;
( defun play-game--hr ()
  (new-game )
  ( display-board *gameboard*)
  ( loop while ( null ( game-overp ) ) 
    do ( progn
	     ( d )
         ( play-turn--h 'w )
         ( when ( null ( game-overp ) ) 
  		   ( play-turn--rb ) 
		 ) 
	   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( format t "GAME OVER~%PLAYER HUMAN PLAYER WINS~%" ) 
    ( format t "GAME OVER~%PLAYER RANDOM PLAYER WINS~%" )
  ) 
)




( defun play-n-turns ( n &aux color )
  ( new-game )
  ( display-board *gameboard* )
  ( setf color 'w )
  ( play-turn--r color )
  ( loop while ( > n 0 )
        do ( progn
             ( setf color ( oppo-color color ) )
             ( play-turn--r color ) 
			 ( setf n ( - n 1 ) )
		   ) 
  )
)


;;   HUMAN PLAYER VS MATERIAL PLAYER ;;
( defun play-game--hm ()
  (new-game )
  ( display-board *gameboard*)
  ( loop while ( null ( game-overp ) ) 
    do ( progn
	     ( d ) 
         ( play-turn--h 'w )
         ( when ( null ( game-overp ) ) 
  		   ( play-turn--m 'b ) 
		 ) 
	   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( format t "GAME OVER~%PLAYER HUMAN PLAYER WINS~%" ) 
    ( format t "GAME OVER~%PLAYER MATERIAL PLAYER WINS~%" )
  )
)

;;   HUMAN PLAYER VS LOCATION PLAYER ;;
( defun play-game--hl ()
  ( new-game )
  ( display-board *gameboard*)
  ( loop while ( null ( game-overp ) ) 
    do ( progn
	     ( d ) 
         ( play-turn--h 'w )
         ( when ( null ( game-overp ) ) 
  		   ( play-turn--l 'b ) 
		 ) 
	   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( format t "GAME OVER~%PLAYER HUMAN PLAYER WINS~%" ) 
    ( format t "GAME OVER~%PLAYER MATERIAL PLAYER WINS~%" )
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;-------------------------------;;;;
;;;;  AI vs AI PLAY GAME METHODS   ;;;;
;;;;-------------------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;  RANDOM PLAYER VS RANDOM PLAYER  ;;
( defun play-game--rr ( &aux color turns )
  ( new-game )
  ( display-board *gameboard* )
  ( setf turns 1 )
  ( setf color 'w )
  ( play-turn--r color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
			 ( incf turns )
             ( play-turn--r color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER 1 WINS~%" )
	  'a
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER 2 WINS~%" )
	  'r
	)
  )
)


;;  MATERIAL PLAYER VS MATERIAL PLAYER  ;;
( defun play-game--mm ( &aux color )
  ( new-game )
  ( display-board *gameboard* )
  ( setf color 'w )
  ( play-turn--m color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
             ( play-turn--m color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER MATERIAL PLAYER 1 WINS~%" )
	  'm
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER MATERIAL PLAYER 2 WINS~%" )
	  'a
	)
  )
)



;;  MATERIAL PLAYER VS RANDOM PLAYER  ;;
( defun play-game--mr ( &aux color )
  ( new-game )
  ( setf color 'w )
  ( play-turn--m color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
             ( play-turn--r color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER MATERIAL PLAYER WINS~%" )
	  'm
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER WINS~%" )
	  'r
	)
  )
)


;;  LOCATION PLAYER VS LOCATION PLAYER  ;;
( defun play-game--rr ( &aux color turns )
  ( new-game )
  ( display-board *gameboard* )
  ( setf turns 1 )
  ( setf color 'w )
  ( play-turn--l color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
			 ( incf turns )
             ( play-turn--l color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER 1 WINS~%" )
	  'a
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER 2 WINS~%" )
	  'r
	)
  )
)


;;  LOCATION PLAYER VS RANDOM PLAYER  ;;
( defun play-game--lr ( &aux color )
  ( new-game )
  ( setf color 'w )
  ( play-turn--l color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
             ( play-turn--r color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER MATERIAL PLAYER WINS~%" )
	  'l
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER WINS~%" )
	  'r
	)
  )
)

;;  MATERIAL PLAYER VS LOCATION PLAYER  ;;
( defun play-game--ml ( &aux color )
  ( new-game )
  ( setf color 'w )
  ( play-turn--l color )
  ( loop while ( null ( game-overp ) )
        do ( progn
             ( setf color ( oppo-color color ) )
             ( play-turn--r color ) 
		   ) 
  )
  ( if ( eq 'w ( game-overp ) )
    ( progn 
      ;( format t "GAME OVER~%PLAYER MATERIAL PLAYER WINS~%" )
	  'm
	)
	( progn 
      ;( format t "GAME OVER~%PLAYER RANDOM PLAYER WINS~%" )
	  'l
	)
  )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;------------------;;;;
;;;;  STATS METHODS   ;;;;
;;;;------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

( defun play-mr-games ( n &aux material-wins random-wins result )
  ( setf material-wins 0 )
  ( setf random-wins 0 )
  ( loop repeat n
        do ( progn
             ( setf result ( play-game--mr ) )
             ( cond ( ( eq result 'm ) ( incf material-wins ) )
                    ( ( eq result 'r ) ( incf random-wins ) )
			 )
		   )
  )
  ( format t "Material Player wins: ~A times~%" material-wins )
  ( format t "Random Player wins: ~A times~%" random-wins )
  ( list location-wins random-wins )  
)

( defun play-ml-games ( n &aux material-wins random-wins result )
  ( setf material-wins 0 )
  ( setf location-wins 0 )
  ( loop repeat n
        do ( progn
             ( setf result ( play-game--ml ) )
             ( cond ( ( eq result 'm ) ( incf material-wins ) )
                    ( ( eq result 'l ) ( incf location-wins ) )
			 )
		   )
  )
  ( format t "Material Player wins: ~A times~%" material-wins )
  ( format t "Loction Player wins: ~A times~%" location-wins )
  ( list location-wins random-wins )  
)

( defun play-lr-games ( n &aux material-wins random-wins result )
  ( setf location-wins 0 )
  ( setf random-wins 0 )
  ( loop repeat n
        do ( progn
             ( setf result ( play-game--lr ) )
             ( cond ( ( eq result 'l ) ( incf location-wins ) )
                    ( ( eq result 'r ) ( incf random-wins ) )
			 )
		   )
  )
  ( format t "Location Player wins: ~A times~%" location-wins )
  ( format t "Random Player wins: ~A times~%" random-wins )
  ( list location-wins random-wins )  
)

;; Method for all AI players to play each other 1000 times ;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;-------------------;;;;
;;;;  HELPER METHODS   ;;;;
;;;;-------------------;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Create a new game ;;
( defun new-game ()
  ( make-gameboard )
  ( make-wpieces )
  ( make-bpieces )
)


;; Combines 2 lists ;;
( defun combine ( lists )
  ( reduce #'append lists )
)

;; Get all the pieces of a certain color ;;
( defun pieces-of-color ( color ) 
  ( cond 
    ( ( eq color 'w ) *white-pieces* )
	( ( eq color 'b ) *black-pieces* )
  )
)

;; Get the pieces of the opposite color
( defun oppo-pieces-of-color ( color ) 
  ( cond 
    ( ( eq color 'b ) *white-pieces* )
	( ( eq color 'w ) *black-pieces* )
  )
)

;; Get all the moves of a color ;;
( defun get-all-color-moves ( color &aux pieces) 
  ( setf pieces ( pieces-of-color color ) )
  ( combine ( remove nil ( mapcar #'get-move-pair-list pieces ) ) ) 
)

;; Get all the moves of the opposite color ;;
(defun get-oppo-color-moves (color)
  (cond 
    ( ( eq color 'w ) ( get-all-color-moves 'b ) )
	( ( eq color 'b ) ( get-all-color-moves 'w ) )
  )
)

;; Get the opposite color ;;
( defun oppo-color ( color )
  ( cond 
    ( ( eq color 'w ) 'b )
	( ( eq color 'b ) 'w )
  )
)

;; Get the king of a given color ;;
( defun get-king ( color )
  ( cond 
    ( ( eq color 'w ) wking )
	( ( eq color 'b ) bking )
  )
)


( defun parse-square ( square-string )
  ( list 
    ( - ( char-code ( aref square-string 0 ) ) ( char-code #\a ) )
    ( 1- ( parse-integer ( subseq square-string 1 ) ) )
  )
)

;; Creates a new game for tests ;;
( defun testgame ()
  ( new-game )
  ( d )
)

;; less typing display method ;;
( defun d () 
  ( display-board *gameboard* )
)
