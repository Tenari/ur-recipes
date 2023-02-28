|%
+$  card  card:agent:gall
+$  versioned-state
  $%  state-0
  ==
+$  state-0
  $:  [%0 =recipies =comments =ratings =favs =ingredients]
  ==
::
:: tables
::
+$  recipies  (map rid recipie)     :: recipies you have created
+$  comments  (map cid comment)     :: comments on your recipies
+$  ratings   (map rate-id rating)  :: ratings on your recipies
+$  favs      (list rid)            :: just a personal list of your favorite recipies
+$  ingredients  (map cord ingredient) :: for filling out nutrition information, if you care about that. unique by name of the ingredient
                                    :: this is just a personal db, but would be cool to be able to import entries from others
::
:: id types
::
+$  rid   [=ship num=@ud]     :: recipie id
+$  cid   [=rid num=@ud]      :: comment id
+$  rate-id   [=rid =ship]    :: rating id (one rating per recipie per ship)
::
:: enums
::
+$  time-unit  ?(%mins %hrs)
+$  quantity-unit  ?(%g %ml %oz %lb %l %gal %cup %tsp %tbsp %whole %pint %gal)
::
:: core data types
::
+$  recipie  [=rid title=@t prep=@rs prep-unit=time-unit cook=@rs cook-unit=time-unit servings=@ud ingredients=(list r-ing) directions=(list cord) images=(list cord) links=(list cord) created-at=@da updated-at=@da]
+$  r-ing  [amt=@rs unit=quantity-unit name=@t optional=?]


:: name and meta-data about a kind of thing you *could* actually do as a `lift`
+$  exercise   [id=ex-id name=@t mode=exercise-mode equ=equipment-type img=@t description=@t demonstration=@t]
+$  exercises  (list exercise)
+$  detail
  $%  [%text @t]
      [%date @da]
      [%amount @rs]
  ==
:: a lift is a record of an exercise you did during a workout
+$  lift-set
  $?  [%reps reps=@ud weight=@rs rir=@ud =weight-unit note=@t]
      [%hold weight=(unit @rs) =weight-unit duration=@dr note=@t]
      [%dist weight=(unit @rs) =weight-unit distance=@rs =distance-unit note=@t]
  ==
+$  lift      [id=ex-id sets=(list lift-set)]
+$  workout   [lifts=(list lift) start=@da end=@da]
+$  history   (list workout)
+$  action
  $%  [%start-workout target=@p]
      [%end-workout target=@p]
      [%add-lift =ex-id]
      [%add-set index=@ud =lift-set] :: index is the lift index within the lifts.workout list
::      [%edit-lift target=@p =lift]
::      [%remove-lift target=@p]
::      [%add-exercise target=@p]
::      [%remove-exercise target=@p]
  ==
--
