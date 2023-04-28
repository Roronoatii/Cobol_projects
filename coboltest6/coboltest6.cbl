      *While
       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltest6.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.September 29th 2022
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Ind PIC 9(1) VALUE 0.


       PROCEDURE DIVISION. 
           PERFORM OutPutData WITH TEST AFTER UNTIL Ind > 5
               GO TO ForLoop.

           
           OutPutData.
               DISPLAY Ind.
               ADD 1 TO Ind.
           
           ForLoop.
               PERFORM OutPutData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
               STOP RUN.

           OutPutData2.
               DISPLAY Ind.



       
       