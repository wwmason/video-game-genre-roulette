;; There are lists of video game genres on wikipedia:
;;     [0] https://en.wikipedia.org/wiki/Video_game_genre
;;     [1] https://en.wikipedia.org/wiki/List_of_video_game_genres
;;
;; Those are nice, in theory, but I think we'll let practicality
;; win out and just use the list of genres from the Steam store.
;; I've done some light editing in places to split
;; sub-genres that I don't think quite belong together.
;;
;; The first entry in each sublist below is the main genre and the
;; remaining entries in each sublist are the sub-genres
;; e.g. action is a genre and hack-n-slash is a sub-genre of action
(defparameter *genres*
  (list
   (list 'action 'arcade 'rhythm 'fighting 'first-person-shooter 'hack-n-slash 'platformer 'runner 'third-person-shooter 'shmup)
   (list 'adventure 'casual 'hidden-object 'metroidvania 'puzzle 'story-rich 'visual-novel)
   (list 'role-playing-game 'action 'adventure 'jrpg 'party-based 'rogue-like 'strategy 'turn-based)
   (list 'simulation 'building-n-automation 'dating 'farming-n-crafting 'hobby-n-job 'life-n-immersive 'sandbox-n-physics 'space-n-flight)
   (list 'strategy 'card-n-board 'city-n-settlement 'grand-n-4x 'military 'real-time 'tower-defense 'turn-based)
   (list 'sports-n-racing 'fishing-n-hunting 'individual 'racing 'racing-sim 'sports-sim 'team)
   ))

(defun get-random-genre-branch ()
  (nth (random (list-length *genres*)) *genres*)
  )

(defun get-random-genre ()
  (defparameter tmp-genre-branch (get-random-genre-branch))
  (defparameter tmp-genre (car tmp-genre-branch))
  (defparameter tmp-sub-genres (cdr tmp-genre-branch))
  (defparameter tmp-sub-genre (nth (random (list-length tmp-sub-genres)) tmp-sub-genres))
  (list tmp-genre tmp-sub-genre)
  )

(defun pretty-print (genre-subgenre &optional (bool-print-subgenre t))
  (if bool-print-subgenre
      (format t "~A : ~A ~%" (first genre-subgenre) (second genre-subgenre))
      (format t "~A ~%" (first genre-subgenre))
      )
  )

(defun roulette (&optional (num-draws 1))
  (defparameter genres '())
  (loop repeat num-draws
	do (push (get-random-genre) genres))
  genres)

(defun pretty-print-list (genres &optional (incl-sub-genres))
  (loop
    for genre in genres
    do (if incl-sub-genres
	   (pretty-print genre t)
	   (pretty-print genre nil))))

