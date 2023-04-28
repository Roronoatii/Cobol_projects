      *projet
       IDENTIFICATION DIVISION.
       PROGRAM-ID. projet1.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.October 1st 2022
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 KeyPressed PIC X.

       SCREEN SECTION.
       01 1stScreen.
           02 LINE 1 VALUE "------------------------------" &
               "---------------".
           02 LINE 2 VALUE "/                             " &
               "              /".
           02 LINE 3 VALUE "/               Customers List:         " & 
               "    /".
           02 LINE 4 VALUE "/                             " &
               "              /".    
           02 LINE 5 VALUE "/                             " &
               "              /".    
           02 LINE 6 VALUE "/                             " &
               "              /".    
           02 LINE 7 COLUMN 1 VALUE "/ Appuyer sur une touche pour " &
               "continuer...  /".
           02 LINE 7 COLUMN 43 PIC X TO KeyPressed.
           02 LINE 8 VALUE "/                             " &
               "              /".
           02 LINE 9 VALUE "/                             " &
               "              /".
           02 LINE 10 VALUE "/                             " &
               "              /".
           02 LINE 11 VALUE "------------------------------" &
               "---------------".
       
       01 ClearScreen.
           02 BLANK SCREEN.
       PROCEDURE DIVISION.
           

          
           ACCEPT 1stScreen.

           DISPLAY ClearScreen.


           
           
           
           

       


       STOP RUN.
       