      *DecimalArithmetic
       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltest8.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.September 30th 2022
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Price PIC 9(4)V99.
       01 TaxRate PIC V999 VALUE .075.
       01 FullPrice PIC 9(4)V99.
       01 NoZero PIC ZZZZ.ZZ.
       PROCEDURE DIVISION. 
           DISPLAY "Enter the Price : " WITH NO ADVANCING  
           ACCEPT Price
           COMPUTE FullPrice ROUNDED = Price + (Price * TaxRate)
           MOVE FullPrice TO NoZero
           DISPLAY "Price + Tax : " NoZero "$".



       STOP RUN.
       