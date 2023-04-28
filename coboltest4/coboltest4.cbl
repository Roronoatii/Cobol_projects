      *Paragraph
       IDENTIFICATION DIVISION.
       PROGRAM-ID. cobol_test4.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.September 29th 2022
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.


       PROCEDURE DIVISION. 
           SubOne.
               DISPLAY "In Paragraph 1"
               PERFORM SubTwo
               DISPLAY "Returned to Paragraph 1"
               PERFORM SubFour 2 TIMES.
               
               STOP RUN.
           SubThree.
               DISPLAY "In Paragraph 3".

           SubTwo.
               DISPLAY "In Paragraph 2"
               PERFORM SubThree
               DISPLAY "Returned to Paragraph 2".
           
           SubFour.
               DISPLAY "Repeat".
           
     
       