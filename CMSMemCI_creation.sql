U S E   [ m a s t e r ]  
 G O  
 C R E A T E   D A T A B A S E   [ C M S M e m C I ]  
   C O N T A I N M E N T   =   N O N E  
   O N     P R I M A R Y    
 (   N A M E   =   N ' C M S M e m C I _ d a t a ' ,   F I L E N A M E   =   N ' G : \ D a t a \ C M S M e m C I C I _ d a t a . m d f '   ,   S I Z E   =   1 3 1 0 7 2 K B   ,   M A X S I Z E   =   U N L I M I T E D ,   F I L E G R O W T H   =   6 5 5 3 6 K B   ) ,    
   F I L E G R O U P   [ C M S M e m C I _ I n M e m ]   C O N T A I N S   M E M O R Y _ O P T I M I Z E D _ D A T A     D E F A U L T  
 (   N A M E   =   N ' C M S M e m C I _ I n M e m 1 ' ,   F I L E N A M E   =   N ' G : \ D a t a \ C M S M e m C I _ I n M e m 1 '   ,   M A X S I Z E   =   U N L I M I T E D ) ,  
 (   N A M E   =   N ' C M S M e m C I _ I n M e m 2 ' ,   F I L E N A M E   =   N ' H : \ D a t a \ C M S M e m C I _ I n M e m 2 '   ,   M A X S I Z E   =   U N L I M I T E D )  
   L O G   O N    
 (   N A M E   =   N ' C M S M e m C I _ l o g ' ,   F I L E N A M E   =   N ' L : \ L o g s \ C M S M e m C I _ l o g . l d f '   ,   S I Z E   =   1 3 1 0 7 2 K B   ,   M A X S I Z E   =   2 0 4 8 G B   ,   F I L E G R O W T H   =   6 5 5 3 6 K B   )  
 G O    
 A L T E R   D A T A B A S E   [ C M S M e m C I ]   S E T   A L L O W _ S N A P S H O T _ I S O L A T I O N   O N    
 G O  
 A L T E R   D A T A B A S E   [ C M S M e m C I ]   S E T   R E A D _ C O M M I T T E D _ S N A P S H O T   O N    
 G O  
 U S E   [ C M S M e m C I ]  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ O r d e r ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 7   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
  
 C R E A T E   T A B L E   [ d b o ] . [ O r d e r ]  
 (  
 	 [ O r d e r I D ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L   P R I M A R Y   K E Y   N O N C L U S T E R E D ,  
 	 [ P e r s o n I D ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ O r d e r D T ]   [ d a t e t i m e ]   N O T   N U L L ,  
 	 [ S h i p D T ]   [ d a t e t i m e ]   N U L L ,  
 	 [ S a l e s R e p I D ]   [ i n t ]   N O T   N U L L ,  
 	 [ P r o d u c t C o s t ]   [ n u m e r i c ] ( 1 8 ,   2 )   N U L L ,  
 	 [ S h i p p i n g C o s t ]   [ n u m e r i c ] ( 1 0 ,   2 )   N U L L ,  
 	 [ T a x C o s t ]   [ n u m e r i c ] ( 1 0 ,   2 )   N U L L ,  
 	 [ O r d e r C o s t ]   [ n u m e r i c ] ( 1 8 ,   2 )   N U L L ,  
 	 I N D E X   P K _ O r d e r _ C C I   C L U S T E R E D   C O L U M N S T O R E  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
 G O  
  
  
  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ P e r s o n ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ P e r s o n ]  
 (  
 	 [ P e r s o n I D ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ F i r s t N a m e ]   [ n v a r c h a r ] ( 5 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 	 [ L a s t N a m e ]   [ n v a r c h a r ] ( 5 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 	 [ C r e a t e d D T ]   [ d a t e t i m e ]   N O T   N U L L ,  
  
   P R I M A R Y   K E Y   N O N C L U S T E R E D   H A S H    
 (  
 	 [ P e r s o n I D ]  
 ) W I T H   (   B U C K E T _ C O U N T   =   1 6 7 7 7 2 1 6 )  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ S a l e s R e p ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ S a l e s R e p ]  
 (  
 	 [ S a l e s R e p I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ R e p N a m e ]   [ n v a r c h a r ] ( 1 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 	 [ S a l e s T e r r i t o r y I D ]   [ i n t ]   N O T   N U L L ,  
  
 I N D E X   [ I X _ S a l e s R e p _ S a l e s T e r r i t o r y I D ]   N O N C L U S T E R E D    
 (  
 	 [ S a l e s T e r r i t o r y I D ]   A S C  
 ) ,  
   P R I M A R Y   K E Y   N O N C L U S T E R E D   H A S H    
 (  
 	 [ S a l e s R e p I D ]  
 ) W I T H   (   B U C K E T _ C O U N T   =   1 6 3 8 4 )  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ S a l e s T e r r i t o r y ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ S a l e s T e r r i t o r y ]  
 (  
 	 [ S a l e s T e r r i t o r y I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ T e r r i t o r y N a m e ]   [ n v a r c h a r ] ( 5 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
  
   P R I M A R Y   K E Y   N O N C L U S T E R E D   H A S H    
 (  
 	 [ S a l e s T e r r i t o r y I D ]  
 ) W I T H   (   B U C K E T _ C O U N T   =   1 6 3 8 4 )  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ O r d e r L i n e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ O r d e r L i n e ]  
 (  
 	 [ O r d e r L i n e I D ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L   P R I M A R Y   K E Y   N O N C L U S T E R E D ,  
 	 [ O r d e r I D ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ P r o d u c t I D ]   [ b i g i n t ]   N O T   N U L L ,  
 	 [ Q u a n t i t y O r d e r e d ]   [ i n t ]   N O T   N U L L ,  
 	 [ U n i t P r i c e ]   [ n u m e r i c ] ( 1 0 ,   2 )   N O T   N U L L ,  
 	 I N D E X   P K _ O r d e r L i n e _ C C I   C L U S T E R E D   C O L U M N S T O R E  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
 G O  
  
  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ P r o d u c t _ b y _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ P r o d u c t _ b y _ D a t e ]   (  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 S E L E C T  
 	 l . P r o d u c t I D ,  
 	 S U M ( l . Q u a n t i t y O r d e r e d )   A S   S o l d C o u n t ,  
 	 S U M ( l . U n i t P r i c e )   A S   S o l d V a l u e  
 F R O M  
 	 d b o . [ O r d e r ]   o  
 	 I N N E R   J O I N   d b o . O r d e r L i n e   l    
 	 	 O N   o . O r d e r I D   =   l . O r d e r I D  
 	 I N N E R   J O I N   d b o . P e r s o n   p    
 	 	 O N   p . P e r s o n I D   =   o . P e r s o n I D  
 	 I N N E R   J O I N   d b o . S a l e s R e p   r    
 	 	 O N   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 I N N E R   J O I N   d b o . S a l e s T e r r i t o r y   t    
 	 	 O N   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 W H E R E  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 A N D   o . O r d e r D T   < =   @ E n d D T  
 G R O U P   B Y  
 	 l . P r o d u c t I D  
 O R D E R   B Y  
 	 S o l d V a l u e   D E S C  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ P r o d u c t _ b y _ T e r r i t o r y _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ P r o d u c t _ b y _ T e r r i t o r y _ D a t e ]   (  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 S E L E C T  
 	 l . P r o d u c t I D ,  
 	 t . T e r r i t o r y N a m e ,  
 	 s u m ( l . Q u a n t i t y O r d e r e d )   A S   S o l d C o u n t ,  
 	 s u m ( l . U n i t P r i c e )   A S   S o l d V a l u e  
 F R O M  
 	 d b o . [ O r d e r ]   o  
 	 I N N E R   J O I N   d b o . O r d e r L i n e   l   O N   o . O r d e r I D   =   l . O r d e r I D  
 	 I N N E R   J O I N   d b o . P e r s o n   p   O N   p . P e r s o n I D   =   o . P e r s o n I D  
 	 I N N E R   J O I N   d b o . S a l e s R e p   r   O N   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 I N N E R   J O I N   d b o . S a l e s T e r r i t o r y   t   O N   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 W H E R E  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 A N D   o . O r d e r D T   < =   @ E n d D T  
 G R O U P   B Y  
 	 l . P r o d u c t I D ,  
 	 t . T e r r i t o r y N a m e  
 O R D E R   B Y    
 	 t . T e r r i t o r y N a m e   A S C ,   S o l d V a l u e   D E S C  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ P r o d u c t _ S h i p _ D e l a y s _ b y _ A g e _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ P r o d u c t _ S h i p _ D e l a y s _ b y _ A g e _ D a t e ]   (  
 	 @ M i n D a y s D e l a y e d   I N T   =   7 ,  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 S E L E C T  
 	 c o u n t ( o . O r d e r I D )   A S   N u m O r d e r s I m p a c t e d ,  
 	 d a t e d i f f ( d d ,   o . O r d e r D T ,   o . S h i p D T )   A S   S h i p p i n g D e l a y D a y s  
 F R O M  
 	 d b o . [ O r d e r ]   o  
 	 I N N E R   J O I N   d b o . O r d e r L i n e   l   O N   o . O r d e r I D   =   l . O r d e r I D  
 	 I N N E R   J O I N   d b o . P e r s o n   p   O N   p . P e r s o n I D   =   o . P e r s o n I D  
 	 I N N E R   J O I N   d b o . S a l e s R e p   r   O N   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 I N N E R   J O I N   d b o . S a l e s T e r r i t o r y   t   O N   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 W H E R E  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 A N D   o . O r d e r D T   < =   @ E n d D T  
 G R O U P   B Y  
 	 d a t e d i f f ( d d ,   o . O r d e r D T ,   o . S h i p D T )  
 H A V I N G  
 	 d a t e d i f f ( d d ,   o . O r d e r D T ,   o . S h i p D T )   > =   @ M i n D a y s D e l a y e d  
 O R D E R   B Y    
 	 S h i p p i n g D e l a y D a y s   D E S C  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ P r o d u c t _ S h i p _ D e l a y s _ b y _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ P r o d u c t _ S h i p _ D e l a y s _ b y _ D a t e ]   (  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 S E L E C T  
 	 c o u n t ( o . O r d e r I D )   A S   N u m O r d e r s I m p a c t e d ,  
 	 d a t e d i f f ( d d ,   o . O r d e r D T ,   o . S h i p D T )   A S   S h i p p i n g D e l a y D a y s  
 F R O M  
 	 d b o . [ O r d e r ]   o  
 	 I N N E R   J O I N   d b o . O r d e r L i n e   l   O N   o . O r d e r I D   =   l . O r d e r I D  
 	 I N N E R   J O I N   d b o . P e r s o n   p   O N   p . P e r s o n I D   =   o . P e r s o n I D  
 	 I N N E R   J O I N   d b o . S a l e s R e p   r   O N   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 I N N E R   J O I N   d b o . S a l e s T e r r i t o r y   t   O N   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 W H E R E  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 A N D   o . O r d e r D T   < =   @ E n d D T  
 G R O U P   B Y  
 	 d a t e d i f f ( d d ,   o . O r d e r D T ,   o . S h i p D T )  
 O R D E R   B Y  
 	 S h i p p i n g D e l a y D a y s   D E S C  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S a l e s _ B y _ T e r r i t o r y _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ S a l e s _ B y _ T e r r i t o r y _ D a t e ]   (  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 S E L E C T  
 	 t . S a l e s T e r r i t o r y I D ,    
 	 t . T e r r i t o r y N a m e ,  
 	 S U M ( o . O r d e r C o s t )   a s   T o t a l O r d e r V a l u e ,  
 	 C O U N T ( o . O r d e r I D )   a s   O r d e r C o u n t  
 F R O M  
 	 d b o . [ O r d e r ]   o  
 	 I N N E R   J O I N   d b o . P e r s o n   p   O N   p . P e r s o n I D   =   o . P e r s o n I D  
 	 I N N E R   J O I N   d b o . S a l e s R e p   r   O N   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 I N N E R   J O I N   d b o . S a l e s T e r r i t o r y   t   O N   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 W H E R E  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 A N D   o . O r d e r D T   < =   @ E n d D T  
 G R O U P   B Y  
 	 t . S a l e s T e r r i t o r y I D ,    
 	 t . T e r r i t o r y N a m e  
 O R D E R   B Y    
 	 t . T e r r i t o r y N a m e   A S C  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S a l e s _ R e p _ R e a s s i g n ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ S a l e s _ R e p _ R e a s s i g n ]   (  
 	 @ O l d S a l e s R e p I D   I N T ,  
 	 @ N e w S a l e s R e p I D   I N T  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 U P D A T E   d b o . [ O r d e r ]  
 	 S E T   S a l e s R e p I D   =   @ N e w S a l e s R e p I D  
 	 W H E R E   S a l e s R e p I D   =   @ O l d S a l e s R e p I D  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     S t o r e d P r o c e d u r e   [ d b o ] . [ S a l e s _ B y _ T e r r i t o r y _ R e p _ D a t e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E       P R O C   [ d b o ] . [ S a l e s _ B y _ T e r r i t o r y _ R e p _ D a t e ]   (  
 	 @ S t a r t D T   D A T E T I M E ,  
 	 @ E n d D T   D A T E T I M E  
 )    
 W I T H   N A T I V E _ C O M P I L A T I O N ,   S C H E M A B I N D I N G ,   E X E C U T E   A S   O W N E R  
 A S  
  
 B E G I N   A T O M I C   W I T H   (  
 	 T R A N S A C T I O N   I S O L A T I O N   L E V E L   =   S N A P S H O T ,    
 	 L A N G U A G E   =   N ' u s _ e n g l i s h ' )  
  
 s e l e c t  
 	 t . S a l e s T e r r i t o r y I D ,    
 	 t . T e r r i t o r y N a m e ,  
 	 r . S a l e s R e p I D ,  
 	 s u m ( o . O r d e r C o s t )   a s   T o t a l O r d e r V a l u e ,  
 	 c o u n t ( o . O r d e r I D )   a s   O r d e r C o u n t  
 f r o m  
 	 d b o . [ O r d e r ]   o  
 	 j o i n   d b o . P e r s o n   p   o n   p . P e r s o n I D   =   o . P e r s o n I D  
 	 j o i n   d b o . S a l e s R e p   r   o n   r . S a l e s R e p I D   =   o . S a l e s R e p I D  
 	 j o i n   d b o . S a l e s T e r r i t o r y   t   o n   t . S a l e s T e r r i t o r y I D   =   r . S a l e s T e r r i t o r y I D  
 w h e r e  
 	 o . O r d e r D T   > =   @ S t a r t D T  
 	 a n d   o . O r d e r D T   < =   @ E n d D T  
 g r o u p   b y  
 	 t . S a l e s T e r r i t o r y I D ,    
 	 t . T e r r i t o r y N a m e ,  
 	 r . S a l e s R e p I D  
 o r d e r   b y    
 	 t . T e r r i t o r y N a m e   a s c ,   T o t a l O r d e r V a l u e   d e s c  
 	  
 E N D ;  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ P r o d u c t ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 8   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ P r o d u c t ]  
 (  
 	 [ P r o d u c t I D ]   [ b i g i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ P r o d u c t N a m e ]   [ n v a r c h a r ] ( 5 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 	 [ U n i t P r i c e ]   [ n u m e r i c ] ( 1 2 ,   2 )   N O T   N U L L ,  
 	 [ P r o d u c t T y p e I D ]   [ i n t ]   N O T   N U L L ,  
  
 I N D E X   [ I X _ P r o d u c t _ P r o d u c t T y p e I D ]   N O N C L U S T E R E D    
 (  
 	 [ P r o d u c t T y p e I D ]   A S C  
 ) ,  
   P R I M A R Y   K E Y   N O N C L U S T E R E D   H A S H    
 (  
 	 [ P r o d u c t I D ]  
 ) W I T H   (   B U C K E T _ C O U N T   =   1 6 7 7 7 2 1 6 )  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
  
 G O  
 / * * * * * *   O b j e c t :     T a b l e   [ d b o ] . [ P r o d u c t T y p e ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 9   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
 C R E A T E   T A B L E   [ d b o ] . [ P r o d u c t T y p e ]  
 (  
 	 [ P r o d u c t T y p e I D ]   [ i n t ]   I D E N T I T Y ( 1 , 1 )   N O T   N U L L ,  
 	 [ T y p e N a m e ]   [ n v a r c h a r ] ( 5 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
  
   P R I M A R Y   K E Y   N O N C L U S T E R E D   H A S H    
 (  
 	 [ P r o d u c t T y p e I D ]  
 ) W I T H   (   B U C K E T _ C O U N T   =   1 6 3 8 4 )  
 ) W I T H   (   M E M O R Y _ O P T I M I Z E D   =   O N   ,   D U R A B I L I T Y   =   S C H E M A _ A N D _ D A T A   )  
  
 G O  
 / * * * * * *   O b j e c t :     V i e w   [ d b o ] . [ R a n d V i e w ]         S c r i p t   D a t e :   1 1 / 2 6 / 2 0 1 6   6 : 3 0 : 1 9   P M   * * * * * * /  
 S E T   A N S I _ N U L L S   O N  
 G O  
 S E T   Q U O T E D _ I D E N T I F I E R   O N  
 G O  
  
 C R E A T E   V I E W   [ d b o ] . [ R a n d V i e w ]  
 A S  
 S E L E C T   R A N D ( )   R a n d N u m b e r  
  
  
 G O  
 U S E   [ m a s t e r ]  
 G O  
 A L T E R   D A T A B A S E   [ C M S M e m C I ]   S E T     R E A D _ W R I T E    
 G O  
 